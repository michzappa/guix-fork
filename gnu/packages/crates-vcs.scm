;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2019 Nicolas Goaziou <mail@nicolasgoaziou.fr>
;;; Copyright © 2023 Efraim Flashner <efraim@flashner.co.il>
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

(define-module (gnu packages crates-vcs)
  #:use-module (guix build-system cargo)
  #:use-module (guix download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages crates-io))

(define-public rust-git-testament-0.2
  (package
    (name "rust-git-testament")
    (version "0.2.4")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "git-testament" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1c9l10wpyz39vhb5cijvbym6gmpmw3y3nb35l2hg6w42h1ygaswq"))))
    (build-system cargo-build-system)
    (arguments
     `(#:tests? #f      ; Not all files included.
       #:cargo-inputs
       (("rust-git-testament-derive" ,rust-git-testament-derive-0.1)
        ("rust-no-std-compat" ,rust-no-std-compat-0.4))
       #:cargo-development-inputs
       (("rust-lazy-static" ,rust-lazy-static-1)
        ("rust-rand" ,rust-rand-0.8)
        ("rust-regex" ,rust-regex-1)
        ("rust-tempfile" ,rust-tempfile-3))))
    (home-page "https://github.com/kinnison/git-testament/")
    (synopsis "Record git working tree status when compiling your crate")
    (description "Record git working tree status when compiling your crate")
    (license license:bsd-3)))

(define-public rust-git-testament-derive-0.1
  (package
    (name "rust-git-testament-derive")
    (version "0.1.14")
    (source (origin
              (method url-fetch)
              (uri (crate-uri "git-testament-derive" version))
              (file-name (string-append name "-" version ".tar.gz"))
              (sha256
               (base32
                "1rlais0i47mgsmp3r5jcqry2agjfyg5s9paj6mgvfykchssjsy2a"))))
    (build-system cargo-build-system)
    (arguments
     `(#:cargo-inputs
       (("rust-log" ,rust-log-0.4)
        ("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-1)
        ("rust-time" ,rust-time-0.3))
       #:cargo-development-inputs
       (("rust-git-testament" ,rust-git-testament-0.2))))
    (home-page "https://github.com/kinnison/git-testament/")
    (synopsis "Record git working tree status when compiling your crate")
    (description
     "This package provides an inner procedural macro for git-testament.")
    (license license:bsd-3)))

(define-public rust-git-version-0.3
  (package
    (name "rust-git-version")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "git-version" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1qj1rd19v8vg094b3fj0gy6ca53v93lhrl31wg1fs7g0y61qx4cl"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-git-version-macro" ,rust-git-version-macro-0.3)
        ("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5))))
    (home-page "https://github.com/fusion-engineering/rust-git-version")
    (synopsis "Embed git information in your code at compile-time")
    (description
     "This crates compiles the git version (tag name, or hash otherwise) and
dirty state into your program.")
    (license license:bsd-2)))

(define-public rust-git-version-macro-0.3
  (package
    (name "rust-git-version-macro")
    (version "0.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (crate-uri "git-version-macro" version))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0mynlf8sfaa4xx7qff0qgnr339fbf1svgr569yip067fzm97ma9l"))))
    (build-system cargo-build-system)
    (arguments
     `(#:skip-build? #t
       #:cargo-inputs
       (("rust-proc-macro-hack" ,rust-proc-macro-hack-0.5)
        ("rust-proc-macro2" ,rust-proc-macro2-1)
        ("rust-quote" ,rust-quote-1)
        ("rust-syn" ,rust-syn-1))))
    (home-page "https://github.com/fusion-engineering/rust-git-version")
    (synopsis "Internal macro crate for git-version")
    (description
     "This is an internal macro crate for git-version.")
    (license license:bsd-2)))
