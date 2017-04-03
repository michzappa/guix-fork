;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2016, 2017 Andy Patterson <ajpatter@uwaterloo.ca>
;;;
;;; This file is part of GNU Guix.
;;;
;;; GNU Guix is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3 of the License, or (at
;;; your option) any later version.
;;;
;;; GNU Guix is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with GNU Guix.  If not, see <http://www.gnu.org/licenses/>.

(define-module (guix build asdf-build-system)
  #:use-module ((guix build gnu-build-system) #:prefix gnu:)
  #:use-module (guix build utils)
  #:use-module (guix build lisp-utils)
  #:use-module (srfi srfi-1)
  #:use-module (srfi srfi-11)
  #:use-module (srfi srfi-26)
  #:use-module (ice-9 rdelim)
  #:use-module (ice-9 receive)
  #:use-module (ice-9 regex)
  #:use-module (ice-9 match)
  #:use-module (ice-9 format)
  #:use-module (ice-9 ftw)
  #:export (%standard-phases
            %standard-phases/source
            asdf-build
            asdf-build/source))

;; Commentary:
;;
;; System for building ASDF packages; creating executable programs and images
;; from them.
;;
;; Code:

(define %object-prefix "/lib")

(define (source-install-prefix lisp)
  (string-append %source-install-prefix "/" lisp "-source"))

(define %system-install-prefix
  (string-append %source-install-prefix "/systems"))

(define (output-path->package-name path)
  (package-name->name+version (strip-store-file-name path)))

(define (outputs->name outputs)
  (output-path->package-name
   (assoc-ref outputs "out")))

(define (lisp-source-directory output lisp name)
  (string-append output (source-install-prefix lisp) "/" name))

(define (source-directory output name)
  (string-append output %source-install-prefix "/source/" name))

(define (library-directory output lisp)
  (string-append output %object-prefix
                 "/" lisp))

(define (output-translation source-path
                            object-output
                            lisp)
  "Return a translation for the system's source path
to it's binary output."
  `((,source-path
     :**/ :*.*.*)
    (,(library-directory object-output lisp)
     :**/ :*.*.*)))

(define (source-asd-file output lisp name asd-file)
  (string-append (lisp-source-directory output lisp name) "/" asd-file))

(define (library-output outputs)
  "If a `lib' output exists, build things there. Otherwise use `out'."
  (or (assoc-ref outputs "lib") (assoc-ref outputs "out")))

(define (copy-files-to-output out name)
  "Copy all files from the current directory to OUT.  Create an extra link to
any system-defining files in the source to a convenient location.  This is
done before any compiling so that the compiled source locations will be
valid."
  (let ((source (getcwd))
        (target (source-directory out name))
        (system-path (string-append out %system-install-prefix)))
    (copy-recursively source target)
    (mkdir-p system-path)
    (for-each
     (lambda (file)
       (symlink file
                (string-append system-path "/" (basename file))))
     (find-files target "\\.asd$"))
    #t))

(define* (install #:key outputs #:allow-other-keys)
  "Copy and symlink all the source files."
  (copy-files-to-output (assoc-ref outputs "out") (outputs->name outputs)))

(define* (copy-source #:key outputs lisp-type #:allow-other-keys)
  "Copy the source to the library output."
  (let* ((out (library-output outputs))
         (name (remove-lisp-from-name (output-path->package-name out)
                                      lisp-type))
         (install-path (string-append out %source-install-prefix)))
    (copy-files-to-output out name)
    ;; Hide the files from asdf
    (with-directory-excursion install-path
      (rename-file "source" (string-append lisp-type "-source"))
      (delete-file-recursively "systems")))
  #t)

(define* (build #:key outputs inputs lisp-type asd-file
                #:allow-other-keys)
  "Compile the system."
  (let* ((out (library-output outputs))
         (name (remove-lisp-from-name (output-path->package-name out)
                                      lisp-type))
         (source-path (lisp-source-directory out lisp-type name))
         (translations (wrap-output-translations
                        `(,(output-translation source-path
                                               out
                                               lisp-type))))
         (asd-file (and=> asd-file
                          (cut source-asd-file out lisp-type name <>))))

    (setenv "ASDF_OUTPUT_TRANSLATIONS"
            (replace-escaped-macros (format #f "~S" translations)))

    ;; We don't need this if we have the asd file, and it can mess with the
    ;; load ordering we're trying to enforce
    (unless asd-file
      (prepend-to-source-registry (string-append source-path "//")))

    (setenv "HOME" out) ; ecl's asdf sometimes wants to create $HOME/.cache

    (parameterize ((%lisp (string-append
                           (assoc-ref inputs lisp-type) "/bin/" lisp-type)))
      (compile-system name lisp-type asd-file))

    ;; As above, ecl will sometimes create this even though it doesn't use it

    (let ((cache-directory (string-append out "/.cache")))
      (when (directory-exists? cache-directory)
        (delete-file-recursively cache-directory))))
  #t)

(define* (check #:key lisp-type tests? outputs inputs asd-file
                #:allow-other-keys)
  "Test the system."
  (let* ((name (remove-lisp-from-name (outputs->name outputs) lisp-type))
         (out (library-output outputs))
         (asd-file (and=> asd-file
                          (cut source-asd-file out lisp-type name <>))))
    (if tests?
        (parameterize ((%lisp (string-append
                               (assoc-ref inputs lisp-type) "/bin/" lisp-type)))
          (test-system name lisp-type asd-file))
        (format #t "test suite not run~%")))
  #t)

(define* (create-asd-file #:key outputs
                          inputs
                          lisp-type
                          asd-file
                          #:allow-other-keys)
  "Create a system definition file for the built system."
  (let*-values (((out) (library-output outputs))
                ((full-name version) (package-name->name+version
                                      (strip-store-file-name out)))
                ((name) (remove-lisp-from-name full-name lisp-type))
                ((new-asd-file) (string-append (library-directory out lisp-type)
                                               "/" name ".asd")))

    (make-asd-file new-asd-file
                   #:lisp lisp-type
                   #:system name
                   #:version version
                   #:inputs inputs
                   #:system-asd-file asd-file))
  #t)

(define* (symlink-asd-files #:key outputs lisp-type #:allow-other-keys)
  "Create an extra reference to the system in a convenient location."
  (let* ((out (library-output outputs)))
    (for-each
     (lambda (asd-file)
       (receive (new-asd-file asd-file-directory)
           (bundle-asd-file out asd-file lisp-type)
         (mkdir-p asd-file-directory)
         (symlink asd-file new-asd-file)
         ;; Update the source registry for future phases which might want to
         ;; use the newly compiled system.
         (prepend-to-source-registry
          (string-append asd-file-directory "/"))))

     (find-files (string-append out %object-prefix) "\\.asd$")))
  #t)

(define* (cleanup-files #:key outputs lisp-type
                        #:allow-other-keys)
  "Remove any compiled files which are not a part of the final bundle."
  (let ((out (library-output outputs)))
    (match lisp-type
      ("sbcl"
       (for-each
        (lambda (file)
          (unless (string-suffix? "--system.fasl" file)
            (delete-file file)))
        (find-files out "\\.fasl$")))
      ("ecl"
       (for-each delete-file
                 (append (find-files out "\\.fas$")
                         (find-files out "\\.o$")))))

    (with-directory-excursion (library-directory out lisp-type)
      (for-each
       (lambda (file)
         (rename-file file
                      (string-append "./" (basename file))))
       (find-files "."))
      (for-each delete-file-recursively
                (scandir "."
                         (lambda (file)
                           (and
                            (directory-exists? file)
                            (string<> "." file)
                            (string<> ".." file)))))))
  #t)

(define* (strip #:key lisp-type #:allow-other-keys #:rest args)
  ;; stripping sbcl binaries removes their entry program and extra systems
  (or (string=? lisp-type "sbcl")
      (apply (assoc-ref gnu:%standard-phases 'strip) args)))

(define %standard-phases/source
  (modify-phases gnu:%standard-phases
    (delete 'configure)
    (delete 'check)
    (delete 'build)
    (replace 'install install)))

(define %standard-phases
  (modify-phases gnu:%standard-phases
    (delete 'configure)
    (delete 'install)
    (replace 'build build)
    (add-before 'build 'copy-source copy-source)
    (replace 'check check)
    (replace 'strip strip)
    (add-after 'check 'create-asd-file create-asd-file)
    (add-after 'create-asd-file 'cleanup cleanup-files)
    (add-after 'cleanup 'create-symlinks symlink-asd-files)))

(define* (asdf-build #:key inputs
                     (phases %standard-phases)
                     #:allow-other-keys
                     #:rest args)
  (apply gnu:gnu-build
         #:inputs inputs
         #:phases phases
         args))

(define* (asdf-build/source #:key inputs
                            (phases %standard-phases/source)
                            #:allow-other-keys
                            #:rest args)
  (apply gnu:gnu-build
         #:inputs inputs
         #:phases phases
         args))

;;; asdf-build-system.scm ends here
