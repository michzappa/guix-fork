;;; GNU Guix --- Functional package management for GNU
;;; Copyright © 2013, 2014, 2015, 2023 Andreas Enge <andreas@enge.fr>
;;; Copyright © 2015 Sou Bunnbu <iyzsong@gmail.com>
;;; Copyright © 2015, 2018, 2019, 2020, 2021, 2023 Ludovic Courtès <ludo@gnu.org>
;;; Copyright © 2015, 2016, 2017, 2018, 2019 Efraim Flashner <efraim@flashner.co.il>
;;; Copyright © 2016, 2017 Nikita <nikita@n0.is>
;;; Copyright © 2016 Thomas Danckaert <post@thomasdanckaert.be>
;;; Copyright © 2017, 2018, 2019, 2023 Ricardo Wurmus <rekado@elephly.net>
;;; Copyright © 2017 Quiliro <quiliro@fsfla.org>
;;; Copyright © 2017, 2018, 2020, 2021 Tobias Geerinckx-Rice <me@tobias.gr>
;;; Copyright © 2018, 2020, 2022 Nicolas Goaziou <mail@nicolasgoaziou.fr>
;;; Copyright © 2018 Hartmut Goebel <h.goebel@crazy-compilers.com>
;;; Copyright © 2018 Eric Bavier <bavier@member.fsf.org>
;;; Copyright © 2019, 2020, 2022 Marius Bakke <marius@gnu.org>
;;; Copyright © 2018 John Soo <jsoo1@asu.edu>
;;; Copyright © 2020 Mike Rosset <mike.rosset@gmail.com>
;;; Copyright © 2020 Jakub Kądziołka <kuba@kadziolka.net>
;;; Copyright © 2020 Kei Kebreau <kkebreau@posteo.net>
;;; Copyright © 2020 TomZ <tomz@freedommail.ch>
;;; Copyright © 2020 Jonathan Brielmaier <jonathan.brielmaier@web.de>
;;; Copyright © 2020 Michael Rohleder <mike@rohleder.de>
;;; Copyright © 2020, 2021, 2022, 2023 Maxim Cournoyer <maxim.cournoyer@gmail.com>
;;; Copyright © 2021, 2022 Brendan Tildesley <mail@brendan.scot>
;;; Copyright © 2021, 2022, 2023 Guillaume Le Vaillant <glv@posteo.net>
;;; Copyright © 2021 Nicolò Balzarotti <nicolo@nixo.xyz>
;;; Copyright © 2022 Foo Chuan Wei <chuanwei.foo@hotmail.com>
;;; Copyright © 2022 Zhu Zihao <all_but_last@163.com>
;;; Copyright © 2022 Petr Hodina <phodina@protonmail.com>
;;; Copyright © 2022 Yash Tiwari <yasht@mailbox.org>
;;; Copyright © 2023 Sharlatan Hellseher <sharlatanus@gmail.com>
;;; Copyright © 2022 Zheng Junjie <873216071@qq.com>
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

(define-module (gnu packages qt)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system cmake)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system trivial)
  #:use-module (guix build-system python)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system qt)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix deprecation)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bison)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cmake)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages cups)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages databases)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages enchant)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages flex)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gdb)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gperf)
  #:use-module (gnu packages graphics)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages image)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages libevent)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages llvm)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages markup)
  #:use-module (gnu packages networking)
  #:use-module (gnu packages ninja)
  #:use-module (gnu packages node)
  #:use-module (gnu packages nss)
  #:use-module (gnu packages pciutils)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages protobuf)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages regex)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages sdl)
  #:use-module (gnu packages serialization)
  #:use-module (gnu packages sqlite)
  #:use-module (gnu packages telephony)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages valgrind)
  #:use-module (gnu packages video)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages xml)
  #:use-module (ice-9 match)
  #:use-module (srfi srfi-1))

(define-public qcoro-qt5
  (package
    (name "qcoro-qt5")
    (version "0.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/danvratil/qcoro")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0pk5ybk6zv7m0wnkl6m3m8sjybmfk6wcn22mmgj942hrc3yrdzci"))))
    (build-system qt-build-system)
    (arguments
     (list #:configure-flags
           #~(list "-DUSE_QT_VERSION=5")))
    (native-inputs (list dbus))         ;for tests
    (inputs (list qtbase-5 qtdeclarative-5 qtwebsockets-5))
    (home-page "https://qcoro.dvratil.cz/")
    (synopsis "C++ Coroutine Library for Qt5")
    (description "QCoro is a C++ library that provide set of tools to make use
of C++20 coroutines in connection with certain asynchronous Qt actions.")
    (license license:expat)))

(define-public qite
  (let ((commit "75fb3b6bbd5c6a5a8fc35e08a6efbfb588ed546a")
        (revision "74"))
    (package
      (name "qite")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url "https://github.com/Ri0n/qite")
           (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "0jmmgy9pvk9hwwph1nwy7hxhczy8drhl4ymhnjjn6yx7bckssvsq"))))
      (build-system qt-build-system)
      (arguments
       `(#:tests? #f                    ; no target
         #:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'chdir
             (lambda _
               (chdir "libqite"))))))
      (inputs
       (list qtbase-5 qtmultimedia-5))
      (home-page "https://github.com/Ri0n/qite/")
      (synopsis "Qt Interactive Text Elements")
      (description "Qite manages interactive elements on QTextEdit.")
      (license license:asl2.0))))

(define-public qt5ct
  (package
    (name "qt5ct")
    (version "1.5")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append "mirror://sourceforge/qt5ct/qt5ct-" version ".tar.bz2"))
       (sha256
        (base32 "14742vs32m98nbfb5mad0i8ciff5f45gfcb5v03p4hh2dvhhqgfn"))))
    (build-system qt-build-system)
    (arguments
     (list
      #:tests? #f                      ; No target
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'patch
            (lambda _
              (substitute* '("src/qt5ct-qtplugin/CMakeLists.txt"
                             "src/qt5ct-style/CMakeLists.txt")
                (("\\$\\{PLUGINDIR\\}")
                 (string-append #$output "/lib/qt5/plugins"))))))))
    (native-inputs
     (list qttools-5))
    (inputs
     (list qtsvg-5))
    (synopsis "Qt5 Configuration Tool")
    (description "Qt5CT is a program that allows users to configure Qt5
settings (such as icons, themes, and fonts) in desktop environments or
window managers, that don't provide Qt integration by themselves.")
    (home-page "https://qt5ct.sourceforge.io/")
    (license license:bsd-2)))

(define-public kvantum
  (package
    (name "kvantum")
    (version "1.0.7")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://github.com/tsujan/Kvantum/releases/download/V"
                    version "/Kvantum-" version ".tar.xz"))
              (sha256
               (base32
                "0zwxswbgd3wc7al3fhrl5qc0fmmb6mkygywjh1spbqpl7s8jw5s3"))))
    (build-system qt-build-system)
    (arguments
     (list
      #:tests? #f                       ;no tests
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'chdir
            (lambda _
              (chdir "Kvantum")))
          (add-after 'chdir 'patch-style-dir
            (lambda _
              (substitute* "style/CMakeLists.txt"
                (("\\$\\{KVANTUM_STYLE_DIR\\}")
                 (string-append #$output
                                "/lib/qt5/plugins/styles"))))))))
    (native-inputs (list qttools-5))
    (inputs (list
             kwindowsystem
             libx11
             libxext
             qtbase-5
             qtsvg-5
             qtx11extras))
    (synopsis "SVG-based theme engine for Qt")
    (description
     "Kvantum is an SVG-based theme engine for Qt,
tuned to KDE and LXQt, with an emphasis on elegance, usability and
practicality.")
    (home-page "https://github.com/tsujan/Kvantum")
    (license license:gpl3+)))

(define-public materialdecoration
  (let ((commit "6a5de23f2e5162fbee39d16f938473ff970a2ec0")
        (revision "9"))
    (package
      (name "materialdecoration")
      (version
       (git-version "1.1.0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url "https://github.com/lirios/materialdecoration.git")
           (commit commit)))
         (file-name
          (git-file-name name version))
         (sha256
          (base32 "1zdrcb39fhhmn76w8anv1dnspz26pdl6izmj1mlm02aza4y8ffp4"))
         (modules '((guix build utils)
                    (ice-9 ftw)
                    (srfi srfi-1)))
         (snippet
          `(begin
             (delete-file-recursively "cmake/3rdparty")))))
      (build-system qt-build-system)
      (arguments
       `(#:tests? #f                    ; No target
         #:configure-flags
         ,#~(list
             (string-append "-DCMAKE_CXX_FLAGS=-I"
                            #$(this-package-input "qtbase")
                            "/include/qt5/QtXkbCommonSupport/"
                            #$(package-version qtbase-5)))))
      (native-inputs
       (list cmake-shared extra-cmake-modules pkg-config))
      (inputs
       (list qtbase-5
             qtwayland-5
             wayland
             libxkbcommon))
      (synopsis "Material Decoration for Qt")
      (description "MaterialDecoration is a client-side decoration for Qt
applications on Wayland.")
      (home-page "https://github.com/lirios/materialdecoration")
      (license license:lgpl3+))))

(define-public grantlee
  (package
    (name "grantlee")
    (version "5.3.1")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
              (url "https://github.com/steveire/grantlee")
              (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
         (base32 "1ipnkdi8wgv519mvwa5zxlz20wipbypyfixjv2qdfd9vl1pznwvs"))
        (patches (search-patches "grantlee-fix-i586-precision.patch"))))
    (native-inputs
     ;; Optional: lcov and cccc, both are for code coverage
     (list doxygen))
    (inputs
     (list qtbase-5 qtdeclarative-5 qtscript))
    (build-system cmake-build-system)
    (arguments
     (list #:phases #~(modify-phases %standard-phases
                        (add-before 'check 'check-setup
                          (lambda _
                            ;; make Qt render "offscreen", required for tests
                            (setenv "QT_QPA_PLATFORM" "offscreen"))))))
    (home-page "https://github.com/steveire/grantlee")
    (synopsis "Libraries for text templating with Qt")
    (description "Grantlee Templates can be used for theming and generation of
other text such as code.  The syntax uses the syntax of the Django template
system, and the core design of Django is reused in Grantlee.")
    (license license:lgpl2.1+)))

(define (qt-url component version)
  "Return a mirror URL for the Qt5 COMPONENT at VERSION."
  ;; We can't use a mirror:// scheme because these URLs are not exact copies:
  ;; the layout differs between them.
  (let ((x (match (version-major version)
             ("5" "-everywhere-opensource-src-")
             ;; Version 6 and later dropped 'opensource' from the archive
             ;; names.
             (_ "-everywhere-src-"))))
    (string-append "mirror://qt/qt/"
                   (version-major+minor version) "/" version
                   "/submodules/" component x version ".tar.xz")))

(define-public qtbase-5
  (package
    (name "qtbase")
    (version "5.15.10")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "1fcg3kx5akvj0kqxd99h5lv3kv4pw2cj0makmpvhpw90inqnrl60"))
              ;; Use TZDIR to avoid depending on package "tzdata".
              (patches (search-patches "qtbase-use-TZDIR.patch"
                                       "qtbase-moc-ignore-gcc-macro.patch"
                                       "qtbase-absolute-runpath.patch"))
              (modules '((guix build utils)))
              (snippet
               ;; corelib uses bundled harfbuzz, md4, md5, sha3
               '(begin
                  (with-directory-excursion "src/3rdparty"
                    (for-each delete-file-recursively
                              (list "double-conversion" "freetype" "harfbuzz-ng"
                                    "libpng" "libjpeg" "pcre2" "sqlite" "xcb"
                                    "zlib")))))))
    (build-system gnu-build-system)
    (outputs '("out" "debug"))
    (propagated-inputs
     (list mesa
           ;; Use which the package, not the function
           (@ (gnu packages base) which)))
    (inputs
     (list alsa-lib
           cups
           dbus
           double-conversion
           eudev
           expat
           fontconfig
           freetype
           glib
           gtk+               ;for GTK theme support
           harfbuzz
           icu4c
           libinput-minimal
           libjpeg-turbo
           libmng
           libpng
           libx11
           libxcomposite
           libxcursor
           libxfixes
           libxi
           libxinerama
           libxkbcommon
           libxml2
           libxrandr
           libxrender
           libxslt
           libxtst
           mtdev
           `(,mariadb "dev")
           nss
           openssl
           pcre2
           postgresql
           pulseaudio
           sqlite
           unixodbc
           xcb-util
           xcb-util-image
           xcb-util-keysyms
           xcb-util-renderutil
           xcb-util-wm
           xdg-utils
           zlib))
    (native-inputs
     (list bison
           flex
           gperf
           perl
           pkg-config
           python
           vulkan-headers
           ruby-2.7))
    (arguments
     `(#:configure-flags
       (let ((out (assoc-ref %outputs "out")))
         (list "-verbose"
               "-prefix" out
               "-docdir" (string-append out "/share/doc/qt5")
               "-headerdir" (string-append out "/include/qt5")
               "-archdatadir" (string-append out "/lib/qt5")
               "-datadir" (string-append out "/share/qt5")
               "-examplesdir" (string-append
                               out "/share/doc/qt5/examples")
               "-opensource"
               "-confirm-license"

               ;; Later stripped into the :debug output.
               "-force-debug-info"

               ;; These features require higher versions of Linux than the
               ;; minimum version of the glibc.  See
               ;; src/corelib/global/minimum-linux_p.h.  By disabling these
               ;; features Qt5 applications can be used on the oldest
               ;; kernels that the glibc supports, including the RHEL6
               ;; (2.6.32) and RHEL7 (3.10) kernels.
               "-no-feature-getentropy" ; requires Linux 3.17
               "-no-feature-renameat2"  ; requires Linux 3.16

               ;; Do not build examples; if desired, these could go
               ;; into a separate output, but for the time being, we
               ;; prefer to save the space and build time.
               "-no-compile-examples"
               ;; Most "-system-..." are automatic, but some use
               ;; the bundled copy by default.
               "-system-sqlite"
               "-system-harfbuzz"
               "-system-pcre"
               ;; explicitly link with openssl instead of dlopening it
               "-openssl-linked"
               ;; explicitly link with dbus instead of dlopening it
               "-dbus-linked"
               ;; don't use the precompiled headers
               "-no-pch"
               ;; drop special machine instructions that do not have
               ;; runtime detection
               ,@(if (string-prefix? "x86_64"
                                     (or (%current-target-system)
                                         (%current-system)))
                     '()
                     '("-no-sse2"))
               "-no-mips_dsp"
               "-no-mips_dspr2"))
       #:phases
       (modify-phases %standard-phases
         (add-after 'configure 'patch-bin-sh
           (lambda _
             (substitute* '("config.status"
                            "configure"
                            "mkspecs/features/qt_functions.prf"
                            "qmake/library/qmakebuiltins.cpp")
               (("/bin/sh") (which "sh")))))
         (add-after 'configure 'patch-xdg-open
           (lambda _
             (substitute* '("src/platformsupport/services/genericunix/qgenericunixservices.cpp")
               (("^.*const char \\*browsers.*$" all)
                (string-append "*browser = QStringLiteral(\""
                               (which "xdg-open")
                               "\"); return true; \n" all)))))
         (replace 'configure
           ;; Overridden to not pass "--enable-fast-install", which makes the
           ;; configure process fail.
           (lambda* (#:key outputs configure-flags #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (substitute* "configure"
                 (("/bin/pwd") (which "pwd")))
               (substitute* "src/corelib/global/global.pri"
                 (("/bin/ls") (which "ls")))
               ;; The configuration files for other Qt5 packages are searched
               ;; through a call to "find_package" in Qt5Config.cmake, which
               ;; disables the use of CMAKE_PREFIX_PATH via the parameter
               ;; "NO_DEFAULT_PATH". Re-enable it so that the different
               ;; components can be installed in different places.
               (substitute* (find-files "." ".*\\.cmake")
                 (("NO_DEFAULT_PATH") ""))
               (format #t "build directory: ~s~%" (getcwd))
               (format #t "configure flags: ~s~%" configure-flags)
               (apply invoke "./configure" configure-flags))))
         (add-after 'install 'patch-mkspecs
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (archdata (string-append out "/lib/qt5"))
                    (mkspecs (string-append archdata "/mkspecs"))
                    (qt_config.prf (string-append
                                    mkspecs "/features/qt_config.prf")))
               ;; For each Qt module, let `qmake' uses search paths in the
               ;; module directory instead of all in QT_INSTALL_PREFIX.
               (substitute* qt_config.prf
                 (("\\$\\$\\[QT_INSTALL_HEADERS\\]")
                  "$$clean_path($$replace(dir, mkspecs/modules, ../../include/qt5))")
                 (("\\$\\$\\[QT_INSTALL_LIBS\\]")
                  "$$clean_path($$replace(dir, mkspecs/modules, ../../lib))")
                 (("\\$\\$\\[QT_HOST_LIBS\\]")
                  "$$clean_path($$replace(dir, mkspecs/modules, ../../lib))")
                 (("\\$\\$\\[QT_INSTALL_BINS\\]")
                  "$$clean_path($$replace(dir, mkspecs/modules, ../../bin))"))

               ;; Searches Qt tools in the current PATH instead of QT_HOST_BINS.
               (substitute* (string-append mkspecs "/features/qt_functions.prf")
                 (("cmd = \\$\\$\\[QT_HOST_BINS\\]/\\$\\$2")
                  "cmd = $$system(which $${2}.pl 2>/dev/null || which $${2})"))

               ;; Resolve qmake spec files within qtbase by absolute paths.
               (substitute*
                   (map (lambda (file)
                          (string-append mkspecs "/features/" file))
                        '("device_config.prf" "moc.prf" "qt_build_config.prf"
                          "qt_config.prf" "winrt/package_manifest.prf"))
                 (("\\$\\$\\[QT_HOST_DATA/get\\]") archdata)
                 (("\\$\\$\\[QT_HOST_DATA/src\\]") archdata)))))
         (add-after 'patch-mkspecs 'patch-prl-files
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               ;; Insert absolute references to the qtbase libraries because
               ;; QT_INSTALL_LIBS does not always resolve correctly, depending
               ;; on context.  See <https://bugs.gnu.org/38405>
               (substitute* (find-files (string-append out "/lib") "\\.prl$")
                 (("\\$\\$\\[QT_INSTALL_LIBS\\]")
                  (string-append out "/lib"))))))
         (add-after 'unpack 'patch-paths
           ;; Use the absolute paths for dynamically loaded libs, otherwise
           ;; the lib will be searched in LD_LIBRARY_PATH which typically is
           ;; not set in guix.
           (lambda* (#:key inputs #:allow-other-keys)
             ;; libresolve
             (let ((glibc (assoc-ref inputs ,(if (%current-target-system)
                                                 "cross-libc" "libc"))))
               (substitute* '("src/network/kernel/qdnslookup_unix.cpp"
                              "src/network/kernel/qhostinfo_unix.cpp")
                 (("^\\s*(lib.setFileName\\(QLatin1String\\(\")(resolv\"\\)\\);)" _ a b)
                  (string-append a glibc "/lib/lib" b))))
             ;; libGL
             (substitute* "src/plugins/platforms/xcb/gl_integrations/xcb_glx/qglxintegration.cpp"
               (("^\\s*(QLibrary lib\\(QLatin1String\\(\")(GL\"\\)\\);)" _ a b)
                (string-append a (assoc-ref inputs "mesa") "/lib/lib" b)))
             ;; libXcursor
             (substitute* "src/plugins/platforms/xcb/qxcbcursor.cpp"
               (("^\\s*(QLibrary xcursorLib\\(QLatin1String\\(\")(Xcursor\"\\), 1\\);)" _ a b)
                (string-append a (assoc-ref inputs "libxcursor") "/lib/lib" b))
               (("^\\s*(xcursorLib.setFileName\\(QLatin1String\\(\")(Xcursor\"\\)\\);)" _ a b)
                (string-append a (assoc-ref inputs "libxcursor") "/lib/lib" b))))))))
    (native-search-paths
     (list (search-path-specification
            (variable "QMAKEPATH")
            (files '("lib/qt5")))
           (search-path-specification
            (variable "QML2_IMPORT_PATH")
            (files '("lib/qt5/qml")))
           (search-path-specification
            (variable "QT_PLUGIN_PATH")
            (files '("lib/qt5/plugins")))
           (search-path-specification
            (variable "XDG_DATA_DIRS")
            (files '("share")))
           (search-path-specification
            (variable "XDG_CONFIG_DIRS")
            (files '("etc/xdg")))))
    (home-page "https://www.qt.io/")
    (synopsis "Cross-platform GUI library")
    (description "Qt is a cross-platform application and UI framework for
developers using C++ or QML, a CSS & JavaScript like language.")
    (license (list license:lgpl2.1 license:lgpl3))))

(define-public qtbase
  (package
    (inherit qtbase-5)
    (name "qtbase")
    (version "6.5.2")
    (source (origin
              (inherit (package-source qtbase-5))
              (uri (qt-url name version))
              (sha256
               (base32
                "0s8jwzdcv97dfy8n3jjm8zzvllv380l73mwdva7rs2nqnhlwgd1x"))
              (modules '((guix build utils)))
              (snippet
               ;; corelib uses bundled harfbuzz, md4, md5, sha3
               '(with-directory-excursion "src/3rdparty"
                  (for-each delete-file-recursively
                            ;; The bundled pcre2 copy is kept, as its headers
                            ;; are required by some internal bootstrap target
                            ;; used for the tools.
                            (list "double-conversion" "freetype" "harfbuzz-ng"
                                  "libpng" "libjpeg" "sqlite" "xcb" "zlib"))))
              (patches (search-patches "qtbase-use-TZDIR.patch"
                                       "qtbase-moc-ignore-gcc-macro.patch"
                                       "qtbase-absolute-runpath.patch"
                                       "qtbase-qmake-use-libname.patch"))))
    (build-system cmake-build-system)
    (arguments
     (substitute-keyword-arguments (package-arguments qtbase-5)
       ((#:configure-flags _ ''())
        `(let ((out (assoc-ref %outputs "out")))
           (list "-DQT_BUILD_TESTS=ON"
                 (string-append "-DINSTALL_ARCHDATADIR=" out "/lib/qt6")
                 (string-append "-DINSTALL_DATADIR=" out "/share/qt6")
                 (string-append "-DINSTALL_DOCDIR=" out "/share/doc/qt6")
                 (string-append "-DINSTALL_MKSPECSDIR=" out "/lib/qt6/mkspecs")
                 (string-append "-DINSTALL_EXAMPLESDIR=" out
                                "/share/doc/qt6/examples")
                 (string-append "-DINSTALL_INCLUDEDIR=" out "/include/qt6")

                 ;; Do not embed an absolute reference to compilers, to reduce
                 ;; the closure size.
                 "-DQT_EMBED_TOOLCHAIN_COMPILER=OFF"

                 ;; Link with DBus and OpenSSL so they don't get dlopen'ed.
                 "-DINPUT_dbus=linked"
                 "-DINPUT_openssl=linked"
                 ;; These features require higher versions of Linux than the
                 ;; minimum version of the glibc.  See
                 ;; src/corelib/global/minimum-linux_p.h.  By disabling these
                 ;; features Qt applications can be used on the oldest kernels
                 ;; that the glibc supports, including the RHEL6 (2.6.32) and
                 ;; RHEL7 (3.10) kernels.
                 "-DFEATURE_getentropy=OFF" ; requires Linux 3.17
                 "-DFEATURE_renameat2=OFF"  ; requires Linux 3.16
                 ;; Most system libraries are used by default, except in some
                 ;; cases such as for those below.
                 "-DFEATURE_system_pcre2=ON"
                 "-DFEATURE_system_sqlite=ON"
                 "-DFEATURE_system_xcb_xinput=ON"
                 ;; Don't use the precompiled headers.
                 "-DBUILD_WITH_PCH=OFF"
                 ;; Drop special machine instructions that do not have runtime
                 ;; detection.
                 ,@(if (string-prefix? "x86_64"
                                       (or (%current-target-system)
                                           (%current-system)))
                       '()              ;implicitly enabled
                       '("-DFEATURE_sse2=OFF"
                         "-DFEATURE_sse3=OFF"
                         "-DFEATURE_ssse3=OFF"
                         "-DFEATURE_sse4_1=OFF"
                         "-DFEATURE_sse4_2=OFF"))
                 "-DFEATURE_mips_dsp=OFF"
                 "-DFEATURE_mips_dspr2=OFF")))
       ((#:phases phases)
        #~(modify-phases #$phases
            (add-after 'unpack 'honor-CMAKE_PREFIX_PATH
              (lambda _
                ;; The configuration files for other Qt packages are searched
                ;; through a call to "find_package" in Qt5Config.cmake, which
                ;; disables the use of CMAKE_PREFIX_PATH via the parameter
                ;; "NO_DEFAULT_PATH".  Re-enable it so that the different
                ;; components can be installed in different places.
                (substitute* (find-files "." "\\.cmake(\\.in)?$")
                  (("\\bNO_DEFAULT_PATH\\b") ""))
                ;; Because Qt goes against the grain of CMake and set
                ;; NO_DEFAULT_PATH, it needs to invent yet another variable
                ;; to do what CMAKE_PREFIX_PATH could have done:
                ;; QT_ADDITIONAL_PACKAGES_PREFIX_PATH.  Since we patch out
                ;; the NO_DEFAULT_PATH, we can set the default value of
                ;; QT_ADDITIONAL_PACKAGES_PREFIX_PATH to that of
                ;; CMAKE_PREFIX_PATH to ensure tools such as
                ;; 'qmlimportscanner' from qtdeclarative work out of the
                ;; box.
                (substitute* "cmake/QtConfig.cmake.in"
                  (("(set\\(QT_ADDITIONAL_PACKAGES_PREFIX_PATH )\"\"" _ head)
                   (string-append head "\"$ENV{CMAKE_PREFIX_PATH}\"")))))
            (delete 'patch-bin-sh)
            (delete 'patch-xdg-open)
            (add-after 'patch-paths 'patch-more-paths
              (lambda* (#:key inputs #:allow-other-keys)
                (substitute* (find-files "bin" "\\.in$")
                  (("/bin/pwd")
                   (search-input-file inputs "bin/pwd"))
                  ;; Do not keep a reference to cmake-minimal; it is looked
                  ;; from PATH anyway.
                  (("original_cmake_path=\"@CMAKE_COMMAND@\"")
                   "original_cmake_path=\"\""))
                (substitute* "src/gui/platform/unix/qgenericunixservices.cpp"
                  (("\"xdg-open\"")
                   (format #f "~s" (search-input-file inputs "bin/xdg-open"))))
                (substitute* '("mkspecs/features/qt_functions.prf"
                               "qmake/library/qmakebuiltins.cpp")
                  (("/bin/sh")
                   (search-input-file inputs "bin/bash")))
                (substitute* "src/corelib/CMakeLists.txt"
                  (("/bin/ls")
                   (search-input-file inputs "bin/ls")))))
            (add-after 'patch-source-shebangs 'do-not-capture-python
              (lambda _
                (substitute* '("mkspecs/features/uikit/devices.py"
                               "util/testrunner/qt-testrunner.py")
                  (((which "python3"))
                   "/usr/bin/env python3"))))
            (replace 'configure
              (assoc-ref %standard-phases 'configure))
            (delete 'check)             ;move after patch-prl-files
            (add-after 'patch-prl-files 'check
              (lambda* (#:key tests? parallel-tests? #:allow-other-keys)
                (when tests?
                  ;; The tests expect to find the modules provided by this
                  ;; package; extend the environment variables needed to do so.
                  (setenv "CMAKE_PREFIX_PATH"
                          (string-append #$output
                                         ":" (getenv "CMAKE_PREFIX_PATH")))
                  (setenv "QMAKEPATH" (string-append #$output "/lib/qt6"))
                  ;; It is necessary to augment LIBRARY_PATH with that of the
                  ;; freshly installed qtbase because of the
                  ;; 'qtbase-qmake-use-libname.patch' patch.
                  (setenv "LIBRARY_PATH" (string-append #$output "/lib:"
                                                        (getenv "LIBRARY_PATH")))
                  (setenv "QML2_IMPORT_PATH"
                          (string-append #$output "/lib/qt6/qml"))
                  (setenv "QT_PLUGIN_PATH"
                          (string-append #$output "/lib/qt6/plugins"))
                  (setenv "QT_QPA_PLATFORM" "offscreen")
                  ;; Skip tests known to fail on GNU/Linux, in a CI context or
                  ;; due to bitness (see: https://code.qt.io/cgit/qt/qtbase.git
                  ;; /tree/src/testlib/qtestblacklist.cpp).
                  (setenv "QTEST_ENVIRONMENT" "linux ci 32bit")
                  (setenv "HOME" "/tmp") ;some tests require a writable HOME
                  (invoke
                   "xvfb-run" "ctest" "--output-on-failure"
                   "-j" (if parallel-tests?
                            (number->string (parallel-job-count))
                            "1")
                   "-E"                 ;disable problematic tests
                   (string-append
                    "("
                    (string-join
                     (list
                      ;; The 'tst_moc' test fails with "'fi.exists()' returned FALSE".
                      "tst_moc"

                      ;; The 'tst_qdate' test fails because the current time
                      ;; is reported as an invalid date (see:
                      ;; https://bugreports.qt.io/browse/QTBUG-116017).
                      "tst_qdate"

                      ;; The qgraphicsview and qopenglwidget tests fail with a
                      ;; segfault for unknown reasons (see:
                      ;; https://bugreports.qt.io/browse/QTBUG-116018).
                      "tst_qgraphicsview"
                      "tst_qopenglwidget"

                      ;; The 'test_rcc' test fails on a comparison:
                      ;; <<<<<< actual
                      ;; 0x0,0x0,0x0,0x0,0x0,0x0,0x3,0xe8,
                      ;; ======
                      ;; 0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,
                      ;; >>>>>> expected
                      "tst_rcc"
                      ;; The 'tst_qtemporarydir' and 'tst_qtemporaryfile'
                      ;; tests depend on '/home' not being writable.
                      "tst_qtemporarydir"
                      "tst_qtemporaryfile"
                      ;; The 'tst_qdir' compares two directories which are
                      ;; unexpectedly different when inside the build
                      ;; container.
                      "tst_qdir"
                      ;; This checks the last modified time of '/', and fails
                      ;; because Epoch 0 is considered to be invalid.
                      "tst_qresourceengine"
                      ;; The 'tst_qfilesystemwatcher' installs a watcher on
                      ;; '/home', which doesn't exist in the build container.
                      "tst_qfilesystemwatcher"
                      ;; Not all of the tested formats are supported by our
                      ;; build of openssl; 871 passed, 122 failed.
                      "tst_qsslkey"
                      ;; The 'mockplugins' test fail following error: "Unknown
                      ;; platform linux-g++", and the other plugin tests
                      ;; depend on it.
                      "mockplugins"
                      "test_plugin_flavor.*"
                      ;; The 'test_import_plugins' fails with "Could NOT find
                      ;; Qt6MockPlugins1".
                      "test_import_plugins"
                      ;; The 'tst_QTimeZone::systemZone' validates the
                      ;; currently set timezone and fails.
                      "tst_qtimezone"
                      ;; The 'tst_qdatetime' fails with:
                      ;; FAIL!  : tst_QDateTime::offsetFromUtc() Compared values are not the same
                      ;; Actual   (dt5.offsetFromUtc()): 0
                      ;; Expected (46800)              : 46800
                      "tst_qdatetime"
                      ;; The tst_QObjectRace::destroyRace is flaky (see:
                      ;; https://bugreports.qt.io/browse/QTBUG-103489).
                      "tst_qobjectrace"
                      ;; The 'tst_QSettings::fromFile' assumes the data
                      ;; location to be relative to the root directory and
                      ;; fails.
                      "tst_qsettings"
                      ;; The 'tst_qaddpreroutine',
                      ;; 'test_generating_cpp_exports' and
                      ;; 'test_static_resources' tests fail with: "Unknown
                      ;; platform linux-g++.
                      "tst_qaddpreroutine"
                      "test_generating_cpp_exports"
                      "test_static_resources"
                      ;; The 'tst_qfile' fails since there is no /home in the
                      ;; build container.
                      "tst_qfile"
                      ;; The 'tst_QGlyphRun::mixedScripts' test fails with:
                      ;; Actual   (glyphRuns.size()): 1
                      ;; Expected (2)               : 2
                      "tst_qglyphrun"
                      ;; The 'tst_qx11info' test fails with "Internal error:
                      ;; QPA plugin doesn't implement generatePeekerId",
                      ;; likely requires a real display.
                      "tst_qx11info"
                      ;; The 'tst_qgraphicswidget' test fails because "This
                      ;; plugin does not support propagateSizeHints".
                      "tst_qgraphicswidget"
                      ;; The 'tst_qdnslookup' test requires networking.
                      "tst_qdnslookup"
                      ;; The 'tst_qcompleter' and 'tst_QFiledialog::completer'
                      ;; attempt to complete paths they assume exist, such as
                      ;; "/home", "/etc" or "/root" and fail.
                      "tst_qcompleter"
                      "tst_qfiledialog"
                      ;; This test is susceptible to the 600 ms timeout used:
                      "tst_qpauseanimation") "|") ")")))))
            (replace 'patch-mkspecs
              (lambda* (#:key outputs #:allow-other-keys)
                (let* ((archdata (search-input-directory outputs "lib/qt6"))
                       (mkspecs (search-input-directory outputs
                                                        "lib/qt6/mkspecs"))
                       (qt_config.prf
                        (search-input-file
                         outputs "lib/qt6/mkspecs/features/qt_config.prf"))
                       (qt_functions.prf
                        (search-input-file
                         outputs "lib/qt6/mkspecs/features/qt_functions.prf")))
                  ;; For each Qt module, let `qmake' uses search paths in the
                  ;; module directory instead of all in QT_INSTALL_PREFIX.
                  (substitute* qt_config.prf
                    (("\\$\\$\\[QT_INSTALL_HEADERS\\]")
                     "$$clean_path($$replace(dir, mkspecs/modules, ../../include/qt6))")
                    (("\\$\\$\\[QT_INSTALL_LIBS\\]")
                     "$$clean_path($$replace(dir, mkspecs/modules, ../../lib))")
                    (("\\$\\$\\[QT_HOST_LIBS\\]")
                     "$$clean_path($$replace(dir, mkspecs/modules, ../../lib))")
                    (("\\$\\$\\[QT_INSTALL_BINS\\]")
                     "$$clean_path($$replace(dir, mkspecs/modules, ../../bin))"))

                  ;; Searches Qt tools in the current PATH instead of QT_HOST_BINS.
                  (substitute* qt_functions.prf
                    (("cmd = \\$\\$\\[QT_HOST_BINS\\]/\\$\\$2")
                     "cmd = $$system(which $${2}.pl 2>/dev/null || which $${2})"))

                  ;; Resolve qmake spec files within qtbase by absolute paths.
                  (substitute*
                      (map (lambda (file)
                             (search-input-file
                              outputs
                              (string-append "lib/qt6/mkspecs/features/" file)))
                           '("device_config.prf" "moc.prf" "qt_config.prf"))
                    (("\\$\\$\\[QT_HOST_DATA/get\\]") archdata)
                    (("\\$\\$\\[QT_HOST_DATA/src\\]") archdata)))))))))
    (native-inputs
     (modify-inputs (package-native-inputs qtbase-5)
       (prepend wayland-protocols
                xvfb-run)))
    (inputs
     (modify-inputs (package-inputs qtbase-5)
       (prepend at-spi2-core
                bash-minimal
                coreutils-minimal
                md4c
                libice
                libsm
                libxcb
                libxext
                xcb-util-cursor
                `(,zstd "lib"))))
    (native-search-paths
     (list (search-path-specification
            (variable "QMAKEPATH")
            (files '("lib/qt6")))
           (search-path-specification
            (variable "QML2_IMPORT_PATH")
            (files '("lib/qt6/qml")))
           (search-path-specification
            (variable "QT_PLUGIN_PATH")
            (files '("lib/qt6/plugins")))
           (search-path-specification
            (variable "XDG_DATA_DIRS")
            (files '("share")))
           (search-path-specification
            (variable "XDG_CONFIG_DIRS")
            (files '("etc/xdg")))))))

(define-public qt3d-5
  (package
    (inherit qtbase-5)
    (name "qt3d")
    (version "5.15.10")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "0pwcjm0xxa4f3sg634bv2n61jmn852yr0y6qjvyp8dcvic90cp12"))))
    (propagated-inputs `())
    (native-inputs (list perl))
    (inputs (list mesa qtbase-5 vulkan-headers zlib))
    (arguments
     (list #:phases #~(modify-phases %standard-phases
                        (add-before 'configure 'configure-qmake
                          (lambda* (#:key inputs outputs #:allow-other-keys)
                            (let* ((tmpdir (string-append (getenv "TMPDIR")))
                                   (qmake (string-append tmpdir "/qmake"))
                                   (qt.conf (string-append tmpdir "/qt.conf")))
                              (symlink (which "qmake") qmake)
                              (setenv "PATH"
                                      (string-append tmpdir ":"
                                                     (getenv "PATH")))
                              (with-output-to-file qt.conf
                                (lambda ()
                                  (format #t "[Paths]
Prefix=~a
ArchData=lib/qt5
Data=share/qt5
Documentation=share/doc/qt5
Headers=include/qt5
Libraries=lib
LibraryExecutables=lib/qt5/libexec
Binaries=bin
Tests=tests
Plugins=lib/qt5/plugins
Imports=lib/qt5/imports
Qml2Imports=lib/qt5/qml
Translations=share/qt5/translations
Settings=etc/xdg
Examples=share/doc/qt5/examples
HostPrefix=~a
HostData=lib/qt5
HostBinaries=bin
HostLibraries=lib

[EffectiveSourcePaths]
HostPrefix=~a
HostData=lib/qt5"
                                          #$output #$output #$(this-package-input
                                                               "qtbase")))))))
                        (replace 'configure
                          (lambda* (#:key inputs outputs #:allow-other-keys)
                            (invoke "qmake"
                                    "QT_BUILD_PARTS = libs tools tests")))
                        (add-before 'check 'set-display
                          (lambda _
                            (setenv "QT_QPA_PLATFORM" "offscreen"))))))
    (synopsis "Qt module for 3D")
    (description "The Qt3d module provides classes for displaying 3D.")))

(define-public qt5compat
  (package
    (name "qt5compat")
    (version "6.5.2")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "1i4izabbmf1dayzlj1miz7hsm4cy0qb7i72pwyl2fp05w8pf9axr"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags #~(list "-DQT_BUILD_TESTS=ON")
      #:phases #~(modify-phases %standard-phases
                   (add-after 'install 'delete-installed-tests
                     (lambda _
                       (delete-file-recursively
                        (string-append #$output "/tests")))))))
    (native-inputs (list perl))
    (inputs (list icu4c libxkbcommon qtbase qtdeclarative qtshadertools))
    (home-page (package-home-page qtbase))
    (synopsis "Legacy Qt 5 APIs ported to Qt 6")
    (description "The @code{qt5compat} package includes application
programming interfaces (APIs) from Qt 5 that were ported to Qt 6, to ease
migration.  It provides for example the @code{GraphicalEffects} module that
came with the @{qtgraphicaleffects} Qt 5 package.")
    (license (list license:gpl2+ license:lgpl3+)))) ;dual licensed

(define-public qtsvg-5
  (package
    (inherit qtbase-5)
    (name "qtsvg")
    (version "5.15.10")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "1s2a00vqq0njwmd34pas7gmmlb9cjjq5dra1s1wpfxlabf1y64yg"))))
    (propagated-inputs `())
    (native-inputs (list perl))
    (inputs
     (list mesa qtbase-5 zlib))
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-before 'configure 'configure-qmake
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (qtbase (assoc-ref inputs "qtbase"))
                    (tmpdir (string-append (getenv "TMPDIR")))
                    (qmake (string-append tmpdir "/qmake"))
                    (qt.conf (string-append tmpdir "/qt.conf")))
               ;; Use qmake with a customized qt.conf to override install
               ;; paths to $out.
               (symlink (which "qmake") qmake)
               (setenv "PATH" (string-append tmpdir ":" (getenv "PATH")))
               (with-output-to-file qt.conf
                 (lambda ()
                   (format #t "[Paths]
Prefix=~a
ArchData=lib/qt5
Data=share/qt5
Documentation=share/doc/qt5
Headers=include/qt5
Libraries=lib
LibraryExecutables=lib/qt5/libexec
Binaries=bin
Tests=tests
Plugins=lib/qt5/plugins
Imports=lib/qt5/imports
Qml2Imports=lib/qt5/qml
Translations=share/qt5/translations
Settings=etc/xdg
Examples=share/doc/qt5/examples
HostPrefix=~a
HostData=lib/qt5
HostBinaries=bin
HostLibraries=lib

[EffectiveSourcePaths]
HostPrefix=~a
HostData=lib/qt5
" out out qtbase))))))
         (replace 'configure
           (lambda* (#:key inputs outputs #:allow-other-keys)
             ;; Valid QT_BUILD_PARTS variables are:
             ;; libs tools tests examples demos docs translations
             (invoke "qmake" "QT_BUILD_PARTS = libs tools tests")))
         (add-before 'check 'set-display
           (lambda _
             ;; make Qt render "offscreen", required for tests
             (setenv "QT_QPA_PLATFORM" "offscreen"))))))
    (synopsis "Qt module for displaying SVGs")
    (description "The QtSvg module provides classes for displaying the
 contents of SVG files.")))

(define-public qtsvg
  (package
    (name "qtsvg")
    (version "6.5.2")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "18v337lfk8krg0hff5jx6fi7gn6x3djn03x3psrhlbmgjc8crd28"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags #~(list "-DQT_BUILD_TESTS=ON")
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'check 'set-display
            (lambda _
              ;; Make Qt render "offscreen", required for tests.
              (setenv "QT_QPA_PLATFORM" "offscreen")))
          (add-after 'install 'delete-installed-tests
            (lambda _
              (delete-file-recursively (string-append #$output "/tests")))))))
    (native-inputs (list perl))
    (inputs (list libxkbcommon mesa qtbase zlib))
    (synopsis "Qt module for displaying SVGs")
    (description "The QtSvg module provides classes for displaying the
 contents of SVG files.")
    (home-page (package-home-page qtbase))
    (license (package-license qtbase))))

(define-public qtimageformats-5
  (package
    (inherit qtsvg-5)
    (name "qtimageformats")
    (version "5.15.10")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "1cniah8v8y514i68bmwgfi3xn3hzgpywcdnzrv789mk7qi48l92g"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  (delete-file-recursively "src/3rdparty")))))
    (native-inputs `())
    (inputs
     (list jasper
           libmng
           libtiff
           libwebp
           mesa
           qtbase-5
           zlib))
    (synopsis "Additional Image Format plugins for Qt")
    (description "The QtImageFormats module contains plugins for adding
support for MNG, TGA, TIFF and WBMP image formats.")))

(define-public qtimageformats
  (package
    (name "qtimageformats")
    (version "6.5.2")
    (source (origin
              (inherit (package-source qtimageformats-5))
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "0hv7mkn72126rkhy5gmjmbvzy7v17mkk3q2pkmzy99f64j4w1q5a"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'check 'set-display
            (lambda _
              ;; Make Qt render "offscreen", required for tests.
              (setenv "QT_QPA_PLATFORM" "offscreen"))))))
    (inputs
     (list jasper
           libmng
           libtiff
           libwebp
           mesa
           qtbase
           zlib))
    (synopsis "Additional Image Format plugins for Qt")
    (description "The QtImageFormats module contains plugins for adding
support for MNG, TGA, TIFF and WBMP image formats.")
    (home-page (package-home-page qtbase))
    (license (package-license qtbase))))

(define-public qtx11extras
  (package (inherit qtsvg-5)
    (name "qtx11extras")
    (version "5.15.10")
    (source (origin
             (method url-fetch)
             (uri (qt-url name version))
             (sha256
              (base32
               "1x489lw3nx28p9cggdrr9n0l49w9y1mcpni9x91sic6wpyfx3p6p"))))
    (arguments
     (substitute-keyword-arguments (package-arguments qtsvg-5)
       ((#:tests? _ #f) #f))) ; TODO: Enable the tests
    (native-inputs (list perl))
    (inputs
     (list mesa qtbase-5))
    (synopsis "Qt Extras for X11")
    (description "The QtX11Extras module includes the library to access X11
from within Qt 5.")))

(define-public qxlsx
  (package
    (name "qxlsx")
    (version "1.4.6")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/QtExcel/QXlsx")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0xbpajvwkv09h2fang200nsanv5gl1alsdd725gh9cgq4szng6gj"))
       (patches (search-patches "qxlsx-fix-include-directory.patch"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags
      #~(list "../source/QXlsx"
              "-DCMAKE_BUILD_TYPE=Release"
              (string-append "-DCMAKE_INSTALL_PREFIX=" #$output))
      #:phases
      #~(modify-phases %standard-phases
          (replace 'check
            (lambda* (#:key tests? #:allow-other-keys)
              (when tests?
                (with-directory-excursion "../source/TestExcel"
                  (invoke "qmake")
                  (invoke "make" "-j" (number->string (parallel-job-count)))
                  (invoke "./TestExcel"))))))))
     (inputs
      (list libxkbcommon qtbase vulkan-headers))
     (home-page "https://qtexcel.github.io/QXlsx/")
     (synopsis "C++ library to read/write Excel XLSX files using Qt")
     (description
      "QXlsx is a successor of QtXlsx and providies a functionality to work with Excel
XLSX document format.")
     (license license:expat)))

(define-public qxlsx-qt5
  (package/inherit qxlsx
    (name "qxlsx-qt5")
    (inputs
     (list qtbase-5))
    (synopsis "Qt5 build for the qxlsx library.")))

(define-public qtxmlpatterns
  (package (inherit qtsvg-5)
    (name "qtxmlpatterns")
    (version "5.15.10")
    (source (origin
             (method url-fetch)
             (uri (qt-url name version))
             (sha256
              (base32
               "03fss4lssi48d8gdj8inkj4qgmyzxbn7r4bm58ckbh5vl9rpamq3"))))
    (arguments
     (substitute-keyword-arguments (package-arguments qtsvg-5)
       ((#:phases phases)
        `(modify-phases ,phases
           (add-after 'unpack 'disable-network-tests
             (lambda _ (substitute* "tests/auto/auto.pro"
                         (("qxmlquery") "# qxmlquery")
                         (("xmlpatterns ") "# xmlpatterns"))))
           (add-after 'unpack 'skip-qquickxmllistmodel-test
             (lambda _ (substitute* "tests/auto/auto.pro"
                         ((".*qquickxmllistmodel.*") ""))))))))
    (native-inputs (list perl qtdeclarative-5))
    (inputs (list qtbase-5))
    (synopsis "Qt XML patterns module")
    (description "The QtXmlPatterns module is a XQuery and XPath engine for
XML and custom data models.  It contains programs such as xmlpatterns and
xmlpatternsvalidator.")))

(define-public qtdeclarative-5
  (package
    (inherit qtsvg-5)
    (name "qtdeclarative")
    (version "5.15.10")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "1x1xsdlxwpdxzrapk5q0adjwh48c6awd8nj4j51ig6y49hy4r6r3"))
              (patches (search-patches "qtdeclarative-5-disable-qmlcache.patch"))))
    (arguments
     (substitute-keyword-arguments (package-arguments qtsvg-5)
       ((#:tests? _ #f) #f)             ;TODO: Enable the tests
       ((#:phases phases)
        #~(modify-phases #$phases
            (add-after 'build 'fix-qt5core-install-prefix
              (lambda _
                ;; The Qt5Core install prefix is set to qtbase, but qmlcachegen
                ;; is provided by qtdeclarative-5.
                (substitute*
                    "lib/cmake/Qt5QuickCompiler/Qt5QuickCompilerConfig.cmake"
                  (("\\$\\{_qt5Core_install_prefix\\}") #$output))))
            (add-after 'unpack 'fix-linking-riscv64
              (lambda _
                (substitute* "src/qml/qml.pro"
                  (("DEFINES \\+= QT_NO_FOREACH")
                   (string-append
                    "isEqual(QT_ARCH, \"riscv64\"): QMAKE_LIBS += -latomic\n\n"
                    "DEFINES += QT_NO_FOREACH")))))))))
    (native-inputs
     (list perl
           pkg-config
           python
           python-wrapper
           qtsvg-5
           vulkan-headers))
    (inputs
     (list mesa qtbase-5))
    (synopsis "Qt QML module (Quick 2)")
    (description "The Qt QML module provides a framework for developing
applications and libraries with the QML language.  It defines and implements the
language and engine infrastructure, and provides an API to enable application
developers to extend the QML language with custom types and integrate QML code
with JavaScript and C++.")))

(define-public qtdeclarative
  (package
    (name "qtdeclarative")
    (version "6.5.2")
    ;; TODO: Package 'masm' and unbundle from sources.
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "06c7xfqn2a5s2m8j1bcvx3pyjqg1rgqkjvp49737gb4z9vjiz8gk"))
              (patches (search-patches "qtdeclarative-disable-qmlcache.patch"))))
    (build-system cmake-build-system)
    (arguments
     (list
      ;; The build takes 12 minutes on a Ryzen 3900X when building with Ninja,
      ;; compared to 24 minutes with Make.
      #:configure-flags #~(list "-GNinja"
                                "-DQT_BUILD_TESTS=ON")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'honor-cmake-install-rpath
            ;; The build system goes out of its way to compute a runpath it
            ;; thinks makes more sense, and fails.  Revert to the default
            ;; behavior, which is to honor CMAKE_INSTALL_RPATH.
            (lambda _
              (substitute* "src/qml/Qt6QmlMacros.cmake"
                (("set_target_properties.*PROPERTIES.*INSTALL_RPATH.*" all)
                 (string-append "# " all)))))
          (add-after 'unpack 'patch-qlibraryinfo-paths
            (lambda _
              ;; The QLibraryInfo paths are hard-coded to point to the qtbase
              ;; installation, but all the tools used in the test suite come
              ;; from this package.
              (substitute* (find-files "tests" "\\.cpp$")
                (("QLibraryInfo::path\\(QLibraryInfo::BinariesPath)")
                 (string-append "QStringLiteral(\"" #$output "/bin\")"))
                (("QLibraryInfo::path\\(QLibraryInfo::LibraryExecutablesPath)")
                 (string-append "QStringLiteral(\"" #$output
                                "/lib/qt6/libexec\")"))
                (("QLibraryInfo::path\\(QLibraryInfo::QmlImportsPath)")
                 (string-append "QStringLiteral(\"" #$output
                                "/lib/qt6/qml\")")))))
          (replace 'build
            (lambda* (#:key parallel-build? #:allow-other-keys)
              (apply invoke "cmake" "--build" "."
                     (if parallel-build?
                         `("--parallel" ,(number->string (parallel-job-count)))
                         '()))))
          (delete 'check)               ;move after the install phase
          (replace 'install
            (lambda _
              (invoke "cmake" "--install" ".")))
          (add-after 'install 'check
            (lambda* (#:key tests? parallel-tests? #:allow-other-keys)
              (when tests?
                ;; The tests expect to find the modules provided by this
                ;; package; extend the environment variables needed to do so.
                (setenv "QML2_IMPORT_PATH"
                        (string-append #$output "/lib/qt6/qml"))
                (setenv "QT_PLUGIN_PATH"
                        (string-append #$output "/lib/qt6/plugins:"
                                       (getenv "QT_PLUGIN_PATH")))
                (setenv "QT_QPA_PLATFORM" "offscreen")
                ;; Skip tests known to fail on GNU/Linux, in a CI context or
                ;; due to bitness (see: https://code.qt.io/cgit/qt/qtbase.git
                ;; /tree/src/testlib/qtestblacklist.cpp).
                (setenv "QTEST_ENVIRONMENT" "linux ci 32bit")
                (setenv "HOME" "/tmp")  ;a few tests require a writable HOME
                (invoke
                 "ctest" "--output-on-failure"
                 "-j" (if parallel-tests?
                          (number->string (parallel-job-count))
                          "1")
                 "-E"                   ;exclude some tests by regex
                 (string-append
                  "("
                  (string-join
                   (list
                    ;; This test is marked as flaky upstream (see:
                    ;; https://bugreports.qt.io/browse/QTBUG-101488).
                    "tst_qquickfiledialogimpl"
                    ;; These tests all fail because 'test_overlappingHandles'
                    ;; (see: https://bugreports.qt.io/browse/QTBUG-95750).
                    "tst_basic"
                    "tst_fusion"
                    "tst_imagine"
                    "tst_material"
                    "tst_universal"
                    ;; Fails due to using the wrong lib/qt6/qml prefix:
                    ;; "Warning: Failed to find the following builtins:
                    ;; builtins.qmltypes, jsroot.qmltypes (so will use
                    ;; qrc). Import paths used:
                    ;; /gnu/store/...-qtbase-6.3.1/lib/qt6/qml"
                    "tst_qmltc_qprocess"
                    ;; This one also causes non-determinstic failures (see:
                    ;; https://bugreports.qt.io/browse/QTBUG-101488).
                    "tst_qquickfolderdialogimpl"
                    ;; These test fail when running qmlimportscanner; perhaps
                    ;; an extra CMAKE_PREFIX_PATH location is missing to
                    ;; correctly locate the imports.
                    "empty_qmldir"
                    "qtquickcompiler"
                    "cmake_tooling_imports"
                    ;; This test seems to hangs for a long time, possibly
                    ;; waiting for a killed process, which becomes a zombie in
                    ;; the build container (perhaps solved after
                    ;; fixing/applying #30948).
                    "tst_qqmlpreview"

                    ;; These tests fail starting with 6.5.2 (see:
                    ;; https://bugreports.qt.io/browse/QTBUG-116019).  They
                    ;; appear to fail because of attempting to load QML from
                    ;; elsewhere than from QML2_IMPORT_PATH.
                    "cmake_test_common_import_path"
                    "tst_qqmlcomponent"
                    "tst_qmllint"
                    "tst_qmldomitem"
                    "tst_dom_all"
                    "tst_qmlls"
                    "tst_qmllscompletions"
                    ) "|")
                  ")")))))
          (add-after 'install 'delete-installed-tests
            (lambda _
              (delete-file-recursively (string-append #$output "/tests")))))))
    (native-inputs
     (list ninja
           perl
           pkg-config
           python
           qtshadertools
           vulkan-headers))
    (inputs
     (list at-spi2-core
           libxkbcommon
           mesa
           qtbase
           qtimageformats
           qtlanguageserver
           qtsvg))
    (home-page (package-home-page qtbase))
    (synopsis "Qt QML module (Quick 2)")
    (description "The Qt QML module provides a framework for developing
applications and libraries with the QML language.  It defines and implements
the language and engine infrastructure, and provides an API to enable
application developers to extend the QML language with custom types and
integrate QML code with JavaScript and C++.")
    (license (package-license qtbase))))

(define-public qtconnectivity
  (package
    (inherit qtsvg-5)
    (name "qtconnectivity")
    (version "5.15.10")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "1sdrw67djfr8qi5wx3qhg8asq2c6f3v3mal3sms7dp7a2l1irnrz"))))
    (native-inputs
     (list perl pkg-config qtdeclarative-5))
    (inputs
     (list bluez qtbase-5))
    (synopsis "Qt Connectivity module")
    (description "The Qt Connectivity modules provides modules for interacting
with Bluetooth and NFC.")))

(define-public qtwebsockets-5
  (package (inherit qtsvg-5)
    (name "qtwebsockets")
    (version "5.15.10")
    (source (origin
             (method url-fetch)
             (uri (qt-url name version))
             (sha256
              (base32
               "12nryr99cixwxc1mnb12sys7bp4xnm39nzq1mf2lajswkvdn559b"))))
    (arguments
     (substitute-keyword-arguments (package-arguments qtsvg-5)
       ((#:tests? _ #f) #f))) ; TODO: Enable the tests
    (native-inputs
     (list perl qtdeclarative-5))
    (inputs (list qtbase-5))
    (synopsis "Qt Web Sockets module")
    (description "WebSocket is a web-based protocol designed to enable two-way
communication between a client application and a remote host.  The Qt
WebSockets module provides C++ and QML interfaces that enable Qt applications
to act as a server that can process WebSocket requests, or a client that can
consume data received from the server, or both.")))

(define-public qtwebsockets
  (package
    (name "qtwebsockets")
    (version "6.5.2")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "0xjwifxj2ssshys6f6kjr6ri2vq1wfshxky6mcscjm7vvyqdfjr0"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags #~(list "-DQT_BUILD_TESTS=ON")
      #:phases #~(modify-phases %standard-phases
                   (delete 'check)      ;move after install
                   (add-after 'install 'prepare-for-tests
                     (lambda _
                       (setenv "QT_QPA_PLATFORM" "offscreen")
                       (setenv "QML2_IMPORT_PATH"
                               (string-append #$output "/lib/qt6/qml:"
                                              (getenv "QML2_IMPORT_PATH")))))
                   (add-after 'prepare-for-tests 'check
                     (assoc-ref %standard-phases 'check))
                   (add-after 'check 'delete-installed-tests
                     (lambda _
                       (delete-file-recursively
                        (string-append #$output "/tests")))))))
    (native-inputs (list perl))
    (inputs (list qtbase qtdeclarative))
    (synopsis "Qt Web Sockets module")
    (description "WebSocket is a web-based protocol designed to enable two-way
communication between a client application and a remote host.  The Qt
WebSockets module provides C++ and QML interfaces that enable Qt applications
to act as a server that can process WebSocket requests, or a client that can
consume data received from the server, or both.")
    (home-page (package-home-page qtbase))
    (license (package-license qtbase))))

(define-public qtsensors
  (package
    (inherit qtsvg-5)
    (name "qtsensors")
    (version "5.15.10")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "00gzb7xcifi3ib5adi7s6h5wvc6v4f48nwb4g1pm0zq9sv22lg6d"))))
    (arguments
     (substitute-keyword-arguments (package-arguments qtsvg-5)
       ((#:parallel-tests? _ #f) #f)    ; can lead to race condition
       ((#:phases phases)
        `(modify-phases ,phases
           (add-after 'unpack 'fix-tests
             (lambda _
               (substitute* "tests/auto/qsensorgestures_gestures\
/tst_sensorgestures_gestures.cpp"
                 (("2000") "5000")      ;lengthen test timeout
                 ;; This test fails.
                 (("QTest::newRow(\"twist\") << \"twist\"") ""))))))))
    (native-inputs
     (list perl qtdeclarative-5))
    (inputs (list qtbase-5))
    (synopsis "Qt Sensors module")
    (description "The Qt Sensors API provides access to sensor hardware via QML
and C++ interfaces.  The Qt Sensors API also provides a motion gesture
recognition API for devices.")))

(define-public qtmultimedia-5
  (package
    (inherit qtsvg-5)
    (name "qtmultimedia")
    (version "5.15.10")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "1di99ysjrgklx2jpsl0g0lqr9jh4l4p4a3hpi452qny6isyy01hi"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  (delete-file-recursively
                   "examples/multimedia/spectrum/3rdparty")
                  ;; We also prevent the spectrum example from being built.
                  (substitute* "examples/multimedia/multimedia.pro"
                    (("spectrum") "#"))))))
    (arguments
     (substitute-keyword-arguments (package-arguments qtsvg-5)
       ((#:phases phases)
        `(modify-phases ,phases
           (replace 'configure
             (lambda* (#:key outputs #:allow-other-keys)
               (let ((out (assoc-ref outputs "out")))
                 (invoke "qmake" "QT_BUILD_PARTS = libs tools tests"
                         (string-append "QMAKE_LFLAGS_RPATH=-Wl,-rpath,"
                                        out "/lib -Wl,-rpath,")
                         (string-append "PREFIX=" out)))))))
       ((#:tests? _ #f) #f)))           ; TODO: Enable the tests
    (native-inputs
     (list perl pkg-config python qtdeclarative-5))
    (inputs
     (list alsa-lib
           mesa
           pulseaudio
           qtbase-5
           ;; Gstreamer is needed for the mediaplayer plugin
           gstreamer
           gst-plugins-base))
    (synopsis "Qt Multimedia module")
    (description "The Qt Multimedia module provides set of APIs to play and
record media, and manage a collection of media content.  It also contains a
set of plugins for interacting with pulseaudio and GStreamer.")))

(define-public qtshadertools
  (package
    (name "qtshadertools")
    (version "6.5.2")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              ;; Note: the source bundles *patched* glslang and SPIRV-Cross
              ;; sources.
              (sha256
               (base32
                "0g8aziqhds2fkx11y4p2akmyn2p1qqf2fjxv72f9pibnhpdv0gya"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags #~(list "-DQT_BUILD_TESTS=ON")
      #:phases #~(modify-phases %standard-phases
                   (add-before 'check 'prepare-for-tests
                     (lambda _
                       (setenv "QT_QPA_PLATFORM" "offscreen"))))))
    (native-inputs (list perl))
    (inputs (list glslang libxkbcommon qtbase))
    (home-page (package-home-page qtbase))
    (synopsis "Shader pipeline API and and tools for Qt")
    (description "The @code{qtshadertools} module provides APIs and tools
supporting shader pipeline functionality as offered in Qt Quick to operate on
Vulkan, OpenGL and other main graphic APIs.")
    (license (package-license qtbase))))

(define-public qtmultimedia
  (package
    (name "qtmultimedia")
    (version "6.5.2")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "0xc9k4mlncscxqbp8q46yjd89k4jb8j0ggbi5ad874lycym013wl"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  (delete-file-recursively
                   "examples/multimedia/spectrum/3rdparty")
                  ;; We also prevent the spectrum example from being built.
                  (substitute* "examples/multimedia/multimedia.pro"
                    (("spectrum") "#"))))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags #~(list "-DQT_BUILD_TESTS=ON"
                                "-DQT_FEATURE_pulseaudio=ON")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'disable-integration-tests
            (lambda _
              ;; XXX: The tst_qaudiodecoderbackend, tst_qaudiodevice,
              ;; tst_qaudiosource, tst_qmediaplayerbackend and
              ;; tst_qcamerabackend tests fail, presumably because they
              ;; require a functional pulseaudio daemon (which requires a dbus
              ;; session bus, which requires an X11 server, and then is still
              ;; unhappy).
              (substitute* "tests/auto/CMakeLists.txt"
                (("add_subdirectory\\(integration)") ""))))
          (add-before 'check 'prepare-for-tests
            (lambda _
              (setenv "QT_QPA_PLATFORM" "offscreen")))
          (add-after 'install 'delete-installed-tests
            (lambda _
              (delete-file-recursively (string-append #$output "/tests")))))))
    (native-inputs
     (list perl
           pkg-config
           qtshadertools
           vulkan-headers))
    (inputs
     (list alsa-lib
           glib
           gstreamer
           gst-plugins-base             ;gstreamer-gl
           gst-plugins-good             ;camera support, additional plugins
           gst-libav                    ;ffmpeg plugin
           libxkbcommon
           mesa
           qtbase
           qtdeclarative
           pulseaudio))
    (home-page (package-home-page qtbase))
    (synopsis "Qt Multimedia module")
    (description "The Qt Multimedia module provides set of APIs to play and
record media, and manage a collection of media content.  It also contains a
set of plugins for interacting with pulseaudio and GStreamer.")
    (license (package-license qtbase))))

(define-public qtwayland-5
  (package
    (inherit qtsvg-5)
    (name "qtwayland")
    (version "5.15.10")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (patches (search-patches "qtwayland-dont-recreate-callbacks.patch"
                                       "qtwayland-cleanup-callbacks.patch"))
              (sha256
               (base32
                "1w9nclz1lfg5haq3m6ihils0kl2n1pqagdyh71ry1m281w8gvly8"))))
    (arguments
     (substitute-keyword-arguments (package-arguments qtsvg-5)
       ((#:phases phases)
        #~(modify-phases #$phases
            (add-after 'unpack 'disable-failing-tests
              (lambda _
                ;; FIXME: tst_seatv4::animatedCursor() fails for no good
                ;; reason and breaks these two tests.
                (substitute* "tests/auto/client/seatv4/tst_seatv4.cpp"
                  (((string-append "QVERIFY\\(!cursorSurface\\(\\)->"
                                   "m_waitingFrameCallbacks\\.empty\\(\\)\\);"))
                   "")
                  (("QTRY_COMPARE\\(bufferSpy\\.count\\(\\), 1\\);")
                   ""))))
            (add-before 'check 'set-test-environment
              (lambda _
                ;; Do not fail just because /etc/machine-id is missing.
                (setenv "DBUS_FATAL_WARNINGS" "0")))))))
    (native-inputs (list glib perl pkg-config qtdeclarative-5))
    (inputs
     (list fontconfig
           freetype
           libx11
           libxcomposite
           libxext
           libxkbcommon
           libxrender
           mesa
           mtdev
           qtbase-5
           vulkan-headers
           wayland))
    (synopsis "Qt Wayland module")
    (description "The Qt Wayland module provides the QtWayland client and
compositor libraries.")))

(define-public qtwayland
  (package
    (name "qtwayland")
    (version "6.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (qt-url name version))
       (sha256
        (base32 "16iwar19sgjvxgmbr6hmd3hsxp6ahdjwl1lra2wapl3zzf3bw81h"))))
    (build-system cmake-build-system)
    (arguments
     (list #:configure-flags #~(list "-DQT_BUILD_TESTS=ON")
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'disable-failing-tests
                 (lambda _
                   ;; FIXME: tst_seatv4::animatedCursor() fails here.
                   ;; See also: <https://bugreports.qt.io/browse/QTBUG-78317>
                   (substitute* "tests/auto/client/seatv4/tst_seatv4.cpp"
                     (((string-append
                        "QVERIFY\\(!cursorSurface\\(\\)->"
                        "m_waitingFrameCallbacks\\.empty\\(\\)\\);")) "")
                     (("QTRY_COMPARE\\(bufferSpy\\.count\\(\\), 1\\);") ""))))
               (add-before 'check 'set-test-environment
                 (lambda _
                   ;; Do not fail just because /etc/machine-id is missing.
                   (setenv "DBUS_FATAL_WARNINGS" "0")
                   ;; Make Qt render "offscreen", required for tests.
                   (setenv "QT_QPA_PLATFORM" "offscreen"))))))
    (native-inputs (list glib perl pkg-config qtdeclarative))
    (inputs
     (list fontconfig
           freetype
           libx11
           libxcomposite
           libxext
           libxkbcommon
           libxrender
           mesa
           mtdev
           qtbase
           vulkan-headers
           wayland))
    (synopsis "Qt Wayland module")
    (description "The Qt Wayland module provides the QtWayland client and
compositor libraries.")
    (home-page (package-home-page qtbase))
    (license (package-license qtbase))))

(define-public qtserialport
  (package
    (inherit qtsvg-5)
    (name "qtserialport")
    (version "5.15.10")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "1zk8y20bqibpvsxi1mqg1ry37xq55yw3m0isij4j9pc58lm4wvzw"))))
    (native-inputs (list perl))
    (inputs (list qtbase-5 eudev))
    (arguments
     (substitute-keyword-arguments (package-arguments qtsvg-5)
       ((#:phases phases)
        #~(modify-phases #$phases
            (add-after 'unpack 'patch-dlopen-paths
              (lambda* (#:key inputs #:allow-other-keys)
                (substitute* "src/serialport/qtudev_p.h"
                  ;; Use the absolute paths for dynamically loaded libs,
                  ;; otherwise the lib will be searched in LD_LIBRARY_PATH which
                  ;; typically is not set in guix.
                  (("setFileNameAndVersion\\(QStringLiteral\\(\"udev\")")
                   (format #f "setFileNameAndVersion(QStringLiteral(~s))"
                           (string-append #$(this-package-input "eudev")
                                          "/lib/libudev"))))))))))
    (synopsis "Qt Serial Port module")
    (description "The Qt Serial Port module provides the library for
interacting with serial ports from within Qt.")))

(define-public qtserialbus
  (package
    (inherit qtsvg-5)
    (name "qtserialbus")
    (version "5.15.10")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "1i7zc5nlp9by0sr6qlls89zqm84sdxl1h4mr30dbxwsvvrqkmhf9"))))
    (arguments
     (substitute-keyword-arguments (package-arguments qtsvg-5)
       ((#:phases phases '%standard-phases)
        #~(modify-phases #$phases
            (add-after 'unpack 'patch-libsocketcan-reference
              (lambda* (#:key inputs #:allow-other-keys)
                (substitute* "src/plugins/canbus/socketcan/libsocketcan.cpp"
                  (("QStringLiteral\\(\"socketcan\"\\)")
                   (format #f "QStringLiteral(~s)"
                           (search-input-file inputs
                                              "lib/libsocketcan.so"))))))))))
    (inputs (list libsocketcan qtbase-5 qtserialport))
    (synopsis "Qt Serial Bus module")
    (description "The Qt Serial Bus API provides classes and functions to
access the various industrial serial buses and protocols, such as CAN, ModBus,
and others.")))

(define-public qtwebchannel-5
  (package (inherit qtsvg-5)
    (name "qtwebchannel")
    (version "5.15.10")
    (source (origin
             (method url-fetch)
             (uri (qt-url name version))
             (sha256
              (base32
               "1rgziqprq0xvd57jfvd7ddkcddj3645ldn3xbq3n6w058bw04mz2"))))
    (native-inputs (list perl qtdeclarative-5 qtwebsockets-5))
    (inputs (list qtbase-5))
    (synopsis "Web communication library for Qt")
    (description "The Qt WebChannel module enables peer-to-peer communication
between the host (QML/C++ application) and the client (HTML/JavaScript
application).  The transport mechanism is supported out of the box by the two
popular web engines, Qt WebKit 2 and Qt WebEngine.")))

(define-public qtwebchannel
  (package
    (name "qtwebchannel")
    (version "6.5.2")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "0qwfnwva7v5f2g5is17yy66mnmc9c1yf9aagaw5qanskdvxdk261"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags #~(list "-DQT_BUILD_TESTS=ON")
      #:phases #~(modify-phases %standard-phases
                   (delete 'check)      ;move after install
                   (add-after 'install 'prepare-for-tests
                     (lambda _
                       (setenv "QT_QPA_PLATFORM" "offscreen")
                       (setenv "QML2_IMPORT_PATH"
                               (string-append #$output "/lib/qt6/qml:"
                                              (getenv "QML2_IMPORT_PATH")))))
                   (add-after 'prepare-for-tests 'check
                     (assoc-ref %standard-phases 'check))
                   (add-after 'check 'delete-installed-tests
                     (lambda _
                       (delete-file-recursively
                        (string-append #$output "/tests")))))))
    (native-inputs (list perl))
    (inputs (list qtbase qtdeclarative qtwebsockets))
    (home-page (package-home-page qtbase))
    (synopsis "Web communication library for Qt")
    (description "The Qt WebChannel module enables peer-to-peer communication
between the host (QML/C++ application) and the client (HTML/JavaScript
application).")
    (license (package-license qtbase))))

(define-public qtwebglplugin
  (package
    (inherit qtsvg-5)
    (name "qtwebglplugin")
    (version "5.15.10")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "12kcvq5y5rpivxrn0p43gdkk3yysdi7bk904jgd3wk67gl0bda8r"))))
    (arguments
     (substitute-keyword-arguments (package-arguments qtsvg-5)
       ((#:phases phases)
        #~(modify-phases #$phases
            (add-after 'unpack 'disable-network-tests
              (lambda _
                (substitute* "tests/plugins/platforms/platforms.pro"
                  (("webgl") "# webgl"))))))))
    (native-inputs '())
    (inputs (list mesa qtbase-5 qtdeclarative-5 qtwebsockets-5 zlib))
    (synopsis "QPA plugin for running applications via a browser using
streamed WebGL commands")
    (description "Qt back end that uses WebGL for rendering.  It allows Qt
applications (with some limitations) to run in a web browser that supports
WebGL.  WebGL is a JavaScript API for rendering 2D and 3D graphics within any
compatible web browser without the use of plug-ins.  The API is similar to
OpenGL ES 2.0 and can be used in HTML5 canvas elements")))

(define-public qtwebview
  (package
    (inherit qtsvg-5)
    (name "qtwebview")
    (version "5.15.10")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "00446917v1djh18lqsk1q5bhgfsfyz06q4zvna96xalwvl3ccn14"))))
    (native-inputs (list perl))
    (inputs (list qtbase-5 qtdeclarative-5))
    (synopsis "Display web content in a QML application")
    (description "Qt WebView provides a way to display web content in a QML
application without necessarily including a full web browser stack by using
native APIs where it makes sense.")))

(define-public qtlanguageserver
  (package
    (name "qtlanguageserver")
    (version "6.5.2")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "196iicwpqca2ydpca41qs6aqxxq8ycknw6lm2v00h1w3m86frdbk"))))
    (build-system cmake-build-system)
    (arguments
     (list #:phases #~(modify-phases %standard-phases
                        (add-after 'install 'delete-installed-tests
                          (lambda _
                            (delete-file-recursively
                             (string-append #$output "/tests")))))))
    (inputs (list qtbase))
    (home-page (package-home-page qtbase))
    (synopsis "Implementation of the Language Server Protocol for Qt")
    (description "This package provides an implementation of the Language
Server Protocol (LSP) for Qt.")
    (license (package-license qtbase))))

(define-public qtlocation
  (package
    (inherit qtsvg-5)
    (name "qtlocation")
    (version "5.15.10")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "0cvcpf0grwqnk6jxhrwm9xxm3dyc6lqvmb1np7fvkhkzjimx45l8"))))
    (arguments
     (substitute-keyword-arguments (package-arguments qtsvg-5)
       ((#:tests? _ #f) #f)             ; TODO: Enable the tests
       ((#:phases phases)
        #~(modify-phases #$phases
            (add-before 'check 'pre-check
              (lambda _
                (setenv "HOME" "/tmp")))))))
    (native-inputs (list perl qtdeclarative-5 qtquickcontrols-5 qtserialport))
    (inputs (list icu4c openssl qtbase-5 zlib))
    (synopsis "Qt Location and Positioning modules")
    (description "The Qt Location module provides an interface for location,
positioning and geolocation plugins.")))

(define-public qtlottie
  (package
    (name "qtlottie")
    (version "6.5.2")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "16z8fhaa40ig0cggb689zf8j3cid6fk6pmh91b8342ymy1fdqfh0"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags #~(list "-DQT_BUILD_TESTS=ON")
      #:phases
      #~(modify-phases %standard-phases
          (delete 'check)               ;move after install
          (add-after 'install 'prepare-for-tests
            (lambda _
              (setenv "QT_QPA_PLATFORM" "offscreen")
              (setenv "QML2_IMPORT_PATH"
                      (string-append #$output "/lib/qt6/qml:"
                                     (getenv "QML2_IMPORT_PATH"))))))))
    (native-inputs (list perl))
    (inputs (list libxkbcommon qtbase qtdeclarative))
    (home-page (package-home-page qtbase))
    (synopsis "QML API for rendering Bodymovin graphics and animations")
    (description "Qt Lottie Animation provides a QML API for rendering
graphics and animations that are exported in JSON format by the Bodymovin
plugin for Adobe After Effects.")
    (license (package-license qtbase))))

(define-public qttools-5
  (package
    (inherit qtsvg-5)
    (name "qttools")
    (version "5.15.10")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "1bkx2sc5hyldarc7w76ymv7dlcna3ib9r2kp67jdqcf856bnrx36"))))
    (arguments
     (substitute-keyword-arguments (package-arguments qtsvg-5)
       ((#:tests? _ #f) #f)))           ; TODO: Enable the tests
    (native-inputs (list perl qtdeclarative-5 vulkan-headers))
    (inputs (list mesa qtbase-5))
    (synopsis "Qt Tools and Designer modules")
    (description "The Qt Tools module provides a set of applications to browse
the documentation, translate applications, generate help files and other stuff
that helps in Qt development.")))

(define-public qttools
  (package
    (name "qttools")
    (version "6.5.2")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "0ha3v488vnm4pgdpyjgf859sak0z2fwmbgcyivcd93qxflign7sm"))))
    (build-system cmake-build-system)
    (arguments
     (list
      ;; The build system attempts to fetch online resources and fails when
      ;; building the test suite.
      #:configure-flags #~(list "-DQT_BUILD_TESTS=OFF")
      #:phases #~(modify-phases %standard-phases
                   (add-after 'install 'sanity-check
                     (lambda* (#:key outputs #:allow-other-keys)
                       ;; This validation exists to validate that the dynamic
                       ;; library for Clang works as intended; there was
                       ;; originally problems due to left-overs patching the
                       ;; value of BUILD_SHARED_LIBS in CLANG-FROM-LLVM that
                       ;; would cause the following error: "CommandLine Error:
                       ;; Option 'filter' registered more than once!"
                       (invoke/quiet (search-input-file outputs "bin/qdoc")
                                     "--help"))))))
    (native-inputs (list perl qtdeclarative vulkan-headers))
    ;; Use clang-15, which is built using as a single shared library, which is
    ;; what the build system of qttools expects.
    (inputs (list clang-15 libxkbcommon mesa qtbase))
    (home-page (package-home-page qtbase))
    (synopsis "Qt Tools and Designer modules")
    (description "The Qt Tools module provides a set of applications to browse
the documentation, translate applications, generate help files and other stuff
that helps in Qt development.")
    ;; GPL 3 only with Qt GPL exception 1.0 (see:
    ;; LICENSES/Qt-GPL-exception-1.0.txt).
    (license (list license:gpl3))))

(define-public qttranslations
  (package
    (name "qttranslations")
    (version "6.5.2")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "1sxy2ljn5ajvn4yjb8fx86l56viyvqh5r9hf5x67azkmgrilaz1k"))))
    (build-system cmake-build-system)
    (arguments (list #:tests? #f))
    (native-inputs (list qtbase qttools))
    (home-page (package-home-page qtbase))
    (synopsis "Qt translation catalogs")
    (description "This package contains the translations for Qt contributed by
the Qt community.")
    ;; GPL 3 only with Qt GPL exception 1.0 (see:
    ;; LICENSES/Qt-GPL-exception-1.0.txt).
    (license (list license:gpl3))))

(define-public qtscript
  (package
    (inherit qtsvg-5)
    (name "qtscript")
    (version "5.15.10")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "0fvhjsn41f6gx7bmvifxl61fdk6mg9lc6wgnwsfz2kyx0r2wsbb4"))
              (patches (search-patches "qtscript-disable-tests.patch"))))
    (native-inputs (list perl qttools-5))
    (inputs (list qtbase-5))
    (synopsis "Qt Script module")
    (description "Qt provides support for application scripting with ECMAScript.
The following guides and references cover aspects of programming with
ECMAScript and Qt.")))

(define-public qtquickcontrols-5
  (package
    (inherit qtsvg-5)
    (name "qtquickcontrols")
    (version "5.15.10")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "1szgm7d8d2lllq19iyf4ggif933bprgsgmp4wzyg0mwq21rnwsm0"))))
    (arguments
     (substitute-keyword-arguments (package-arguments qtsvg-5)
       ((#:tests? _ #f) #f)))           ; TODO: Enable the tests
    (inputs (list qtbase-5 qtdeclarative-5))
    (synopsis "Qt Quick Controls and other Quick modules")
    (description "The QtScript module provides classes for making Qt
applications scriptable.  This module provides a set of extra components that
can be used to build complete interfaces in Qt Quick.")))

(define-public qtquickcontrols2-5
  (package
    (inherit qtsvg-5)
    (name "qtquickcontrols2")
    (version "5.15.8")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "058dkj6272za47vnz3mxsmwsj85gxf6g0ski645fphk8s3jp2bk5"))))
    (arguments
     (substitute-keyword-arguments (package-arguments qtsvg-5)
       ((#:tests? _ #f) #f)))           ; TODO: Enable the tests
    (inputs (list qtbase-5 qtdeclarative-5))
    (synopsis "Qt Quick Controls 2 and other Quick 2 modules")
    (description "The Qt Quick Controls 2 module contains the Qt Labs Platform
module that provides platform integration: native dialogs, menus and menu bars,
and tray icons.  It falls back to Qt Widgets when a native implementation is
not available.")))

(define-public qtgraphicaleffects
  (package
    (inherit qtsvg-5)
    (name "qtgraphicaleffects")
    (version "5.15.8")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "0wypji8i19kjq18qd92z8kkd3fj2n0d5hgh6xiza96833afvibj9"))))
    (arguments
     (substitute-keyword-arguments (package-arguments qtsvg-5)
       ((#:tests? _ #f) #f)))           ; TODO: Enable the tests
    (inputs (list qtbase-5 qtdeclarative-5))
    (synopsis "Qt Graphical Effects module")
    (description "The Qt Graphical Effects module provides a set of QML types
for adding visually impressive and configurable effects to user interfaces.
Effects are visual items that can be added to Qt Quick user interface as UI
components.  The API consists of over 20 effects provided as separate QML
types.  The effects cover functional areas such as blending, masking, blurring,
coloring, and many more.")))

(define-public qtgamepad
  (package
    (inherit qtsvg-5)
    (name "qtgamepad")
    (version "5.15.8")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "0vgxprgk7lak209wsg2ljzfkpwgjzscpbxmj5fyvvwm2pbnpspvk"))))
    (native-inputs (list perl pkg-config))
    (inputs
     (list fontconfig
           freetype
           libxrender
           sdl2
           qtbase-5
           qtdeclarative-5))
    (synopsis "Qt Gamepad module")
    (description "The Qt Gamepad module is an add-on library that enables Qt
applications to support the use of gamepad hardware and in some cases remote
control equipment.  The module provides both QML and C++ interfaces.  The
primary target audience are embedded devices with fullscreen user interfaces,
and mobile applications targeting TV-like form factors.")))

(define-public qtscxml
  (package
    (inherit qtsvg-5)
    (name "qtscxml")
    (version "5.15.8")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "17j6npvgr8q3lyrqmvfh1n47mkhfzk18r998hcjm2w75xj46km1n"))
              (modules '((guix build utils)))
              (snippet
               '(begin
                  (delete-file-recursively "tests/3rdparty")
                  ;; the scion test refers to the bundled 3rd party test code.
                  (substitute* "tests/auto/auto.pro"
                    (("scion") "#"))))))
    (arguments (substitute-keyword-arguments (package-arguments qtsvg-5)
                 ((#:tests? _ #f) #f))) ; TODO: Enable the tests
    (inputs (list qtbase-5 qtdeclarative-5))
    (synopsis "Qt SCXML module")
    (description "The Qt SCXML module provides functionality to create state
machines from SCXML files.  This includes both dynamically creating state
machines (loading the SCXML file and instantiating states and transitions) and
generating a C++ file that has a class implementing the state machine.  It
also contains functionality to support data models and executable content.")))

(define-public qtpositioning
  (package
    (name "qtpositioning")
    (version "6.5.2")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "1yhlfs8izc054qv1krf5qv6zzjlvmz013h74fwamn74dfh1kyjbh"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:configure-flags #~(list "-DQT_BUILD_TESTS=ON")
      #:phases #~(modify-phases %standard-phases
                   (add-after 'install 'delete-installed-tests
                     (lambda _
                       (delete-file-recursively
                        (string-append #$output "/tests")))))))
    (inputs (list perl qtbase))
    (home-page (package-home-page qtbase))
    (synopsis "QML and C++ positioning information API")
    (description "The Qt Positioning API provides positioning information via
QML and C++ interfaces.  The Qt Positioning API lets you to determine a
position by using a variety of possible sources, including satellite, wifi, or
text files.  That information can then be used to, for example, determine a
position on a map.  In addition, you can use to the API to retrieve satellite
information and perform area based monitoring.")
    (license (package-license qtbase))))

(define-public qtpurchasing
  (package
    (inherit qtsvg-5)
    (name "qtpurchasing")
    (version "5.15.8")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "0bjky5ncg9yhz4a63g3jl1r5pa6i09f6g8wgzs591mhybrbmhcw8"))))
    (inputs (list qtbase-5 qtdeclarative-5))
    (synopsis "Qt Purchasing module")
    (description "The Qt Purchasing module provides and in-app API for
purchasing goods and services.")))

(define-public qtcharts
  (package
    (inherit qtsvg-5)
    (name "qtcharts")
    (version "5.15.8")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "1q11ank69l9qw3iks2svr0g2g6pzng9v8p87dpsmjs988f4ysmll"))))
    (arguments
     (substitute-keyword-arguments (package-arguments qtsvg-5)
       ((#:phases phases)
        #~(modify-phases #$phases
            (add-after 'unpack 'remove-failing-test
              (lambda _
                (substitute* "tests/auto/auto.pro"
                  (("qml") "# qml")
                  (("qml-qtquicktest") "# qml-qtquicktest"))))))))
    (inputs (list qtbase-5 qtdeclarative-5))
    (synopsis "Qt Charts module")
    (description "The Qt Charts module provides a set of easy to use chart
components.  It uses the Qt Graphics View Framework, therefore charts can be
easily integrated to modern user interfaces.  Qt Charts can be used as QWidgets,
QGraphicsWidget, or QML types. Users can easily create impressive graphs by
selecting one of the charts themes.")
    (license license:gpl3)))

(define-public qtdatavis3d
  (package
    (inherit qtsvg-5)
    (name "qtdatavis3d")
    (version "5.15.8")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "1mr2kdshahxrkjs9wlgpr59jbqvyvlax16rlnca4iq00w3v5hrdh"))))
    (arguments
     (substitute-keyword-arguments (package-arguments qtsvg-5)
       ((#:tests? _ #f) #f))) ; TODO: Enable the tests
    (inputs (list qtbase-5 qtdeclarative-5))
    (synopsis "Qt Data Visualization module")
    (description "The Qt Data Visualization module provides a way to visualize
data in 3D as bar, scatter, and surface graphs. It is especially useful for
visualizing depth maps and large quantities of rapidly changing data, such as
data received from multiple sensors. The look and feel of graphs can be
customized by using themes or by adding custom items and labels to them.")
    (license license:gpl3)))

(define-public qtnetworkauth-5
  (package (inherit qtsvg-5)
    (name "qtnetworkauth")
    (version "5.15.8")
    (source (origin
             (method url-fetch)
             (uri (qt-url name version))
             (sha256
              (base32
               "0fsmpjwkzzy3281shld7gs1gj217smb1f8ai63gdvnkp0jb2fhc5"))))
    (inputs (list qtbase-5))
    (synopsis "Qt Network Authorization module")
    (description "The Qt Network Authorization module provides an
implementation of OAuth and OAuth2 authenticathon methods for Qt.")))

(define-public qtnetworkauth
  (package
    (name "qtnetworkauth")
    (version "6.5.2")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "0g18kh3zhcfi9ni8cqbbjdc1l6jf99ijv5shcl42jk6219b4pk2f"))))
    (build-system cmake-build-system)
    (arguments (list #:configure-flags #~(list "-DQT_BUILD_TESTS=ON")))
    (native-inputs (list perl))
    (inputs (list qtbase))
    (home-page (package-home-page qtbase))
    (synopsis "Qt Network Authorization module")
    (description "The Qt Network Authorization module provides an
implementation of OAuth and OAuth2 authenticathon methods for Qt.")
    (license (package-license qtbase))))

(define-public qtremoteobjects
  (package
    (name "qtremoteobjects")
    (version "6.5.2")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "0k29sk02n54vj1w6vh6xycsjpyfqlijc13fnxh1q7wpgg4gizx60"))))
    (build-system cmake-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'check 'set-display
            (lambda _
              ;; Make Qt render "offscreen", required for tests.
              (setenv "QT_QPA_PLATFORM" "offscreen")))
          (delete 'check)               ;move after the install phase
          (add-after 'install 'check
            (assoc-ref %standard-phases 'check))
          (add-before 'check 'prepare-for-tests
            (lambda _
              (setenv "QML2_IMPORT_PATH"
                      (string-append #$output "/lib/qt6/qml:"
                                     (getenv "QML2_IMPORT_PATH"))))))))
    (native-inputs (list perl vulkan-headers))
    (inputs (list libxkbcommon qtbase qtdeclarative))
    (synopsis "Qt Remote Objects module")
    (description "The Qt Remote Objects module is an @dfn{inter-process
communication} (IPC) module developed for Qt.  The idea is to extend existing
Qt's functionalities to enable an easy exchange of information between
processes or computers.")
    (home-page (package-home-page qtbase))
    (license (package-license qtbase))))

(define-public qtspeech
  (package
    (inherit qtsvg-5)
    (name "qtspeech")
    (version "5.15.8")
    (source (origin
              (method url-fetch)
              (uri (qt-url name version))
              (sha256
               (base32
                "1q56lyj7s05sx52j5z6gcs000mni4c7mb7qyq4lfval7c06hw5p6"))))
    (arguments
     (substitute-keyword-arguments (package-arguments qtsvg-5)
       ((#:tests? _ #f) #f))) ; TODO: Enable the tests
    (inputs (list qtbase-5))
    (native-inputs (list perl qtdeclarative-5 qtmultimedia-5 qtxmlpatterns))
    (synopsis "Qt Speech module")
    (description "The Qt Speech module enables a Qt application to support
accessibility features such as text-to-speech, which is useful for end-users
who are visually challenged or cannot access the application for whatever
reason.  The most common use case where text-to-speech comes in handy is when
the end-user is driving and cannot attend the incoming messages on the phone.
In such a scenario, the messaging application can read out the incoming
message.")))

(define-public qtvirtualkeyboard-5
  (package
    (inherit qtsvg-5)
    (name "qtvirtualkeyboard")
    (version %qt-version)
    (source (origin
              (method url-fetch)
              (uri (qt-urls name version))
              (sha256
               (base32
                "1skdjh9q4m438wwl8hwx3jc5hg22dmi5pwm3vd2yksxw6ny67rd7"))))
    (arguments
     (substitute-keyword-arguments (package-arguments qtsvg-5)
       ((#:tests? _ #f) #f) ; TODO: pass 2 fail test
       ((#:phases phases)
        `(modify-phases ,phases
           (add-before 'check 'set-display
             (lambda _
               ;; Make Qt render "offscreen", required for tests.
               (setenv "QT_QPA_PLATFORM" "offscreen")
               (setenv "DISPLAY" ":1")
               (system "Xvfb +extension GLX :1 &")))
           (delete 'check)               ;move after the install phase
           (add-after 'install 'check
             (assoc-ref %standard-phases 'check))
           (add-before 'check 'prepare-for-tests
             (lambda* (#:key outputs #:allow-other-keys)
               (setenv "QML2_IMPORT_PATH"
                       (string-append (assoc-ref outputs "out")
                                      "/lib/qt5/qml:"
                                      (getenv "QML2_IMPORT_PATH")))
               (setenv "QT_PLUGIN_PATH"
                       (string-append (assoc-ref outputs "out")
                                      "/lib/qt6/plugins:"
                                      (getenv "QT_PLUGIN_PATH")))))))))
    (native-inputs (list perl xorg-server-for-tests))
    (inputs (list qtbase-5 qtdeclarative-5))
    (propagated-inputs
     (list qtquickcontrols-5 qtsvg-5))
    (synopsis "QtQuick virtual keyboard")
    (description "The Qt Speech module provides a virtual keyboard framework
that consists of a C++ backend supporting custom input methods as well as a UI
frontend implemented in QML.")))

(define-public qtspell
  (package
    (name "qtspell")
    (version "1.0.1")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/manisandro/qtspell")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "19ff6jzm699wrxrk57w3d4kl9qxgdipdikpwls9n4aqv4mw7g969"))))
    (build-system cmake-build-system)
    (arguments
     `(#:tests? #f))                    ;no test
    (native-inputs
     (list pkg-config qttools-5))
    (inputs
     (list enchant qtbase-5))
    (home-page "https://github.com/manisandro/qtspell")
    (synopsis "Spell checking for Qt text widgets")
    (description
     "QtSpell adds spell-checking functionality to Qt's text widgets,
using the Enchant spell-checking library.")
    ;; COPYING file specify GPL3, but source code files all refer to GPL2+.
    (license license:gpl2+)))

(define remove-third-party-files
  #~(begin
      (define preserved-club
        ;; Prefix exceptions with ./ for comparison with ftw.
        (map (cut string-append "./" <>)
             preserved-third-party-files))
      (define protected (make-regexp "\\.(gn|gyp)i?$"))
      (define (empty? dir)
        (equal? (scandir dir) '("." "..")))
      (define (third-party? file)
        (string-contains file "/third_party/"))
      (define (useless? file)
        (any (cute string-suffix? <> file)
             '(".zip" ".so" ".dll" ".exe" ".jar")))
      (define (parents child)
        ;; Return all parent directories of CHILD up to and including
        ;; the closest "third_party".
        (let loop ((parent (dirname child))
                   (parents '()))
          (if (string=? "third_party" (basename parent))
              (cons parent parents)
              (loop (dirname parent)
                    (cons parent parents)))))
      (define (remove-loudly file)
        (format #t "deleting ~a...~%" file)
        (force-output)
        (delete-file file))
      (define (delete-unwanted-files child stat flag base level)
        (match flag
          ((or 'regular 'symlink 'stale-symlink)
           (when (third-party? child)
             (unless (or (member child preserved-club)
                         (any (cute member <> preserved-club)
                              (parents child))
                         (regexp-exec protected child))
               (remove-loudly child)))
           (when (and (useless? child) (file-exists? child))
             (remove-loudly child))
           #t)
          ('directory-processed
           (when (empty? child)
             (rmdir child))
           #t)
          (_ #t)))

      (nftw "." delete-unwanted-files 'depth 'physical)

      ;; Assert that each preserved item is present to catch
      ;; removals.
      (for-each (lambda (third-party)
                  (unless (file-exists? third-party)
                    (error (format #f "~s does not exist!~%"
                                   third-party))))
                preserved-club)))

(define-public qtwebengine-5
  (package
    (inherit qtsvg-5)
    (name "qtwebengine")
    (version "5.15.8")
    (source
     (origin
       (method url-fetch)
       (uri (qt-url name version))
       (sha256
        (base32
         "1qv15g5anhlfsdwnjxy21vc3zxxm8149vysi774l93iab6mxqmjg"))
       (modules '((ice-9 ftw)
                  (ice-9 match)
                  (srfi srfi-1)
                  (srfi srfi-26)
                  (guix build utils)))
       (snippet
        #~(begin
            (let ((preserved-third-party-files
                   '("base/third_party/double_conversion"
                     "base/third_party/cityhash"
                     "base/third_party/cityhash_v103"
                     "base/third_party/dynamic_annotations"
                     "base/third_party/icu"
                     "base/third_party/libevent"
                     "base/third_party/nspr"
                     "base/third_party/superfasthash"
                     "base/third_party/symbolize"
                     "base/third_party/xdg_mime"
                     "base/third_party/xdg_user_dirs"
                     "net/third_party/mozilla_security_manager"
                     "net/third_party/nss"
                     "net/third_party/quiche"
                     "net/third_party/uri_template"
                     "third_party/abseil-cpp"
                     "third_party/angle"
                     "third_party/angle/src/common/third_party/base"
                     "third_party/angle/src/common/third_party/smhasher"
                     "third_party/angle/src/common/third_party/xxhash"
                     "third_party/angle/src/third_party/compiler"
                     "third_party/axe-core"
                     "third_party/blink"
                     "third_party/boringssl"
                     "third_party/boringssl/src/third_party/fiat"
                     "third_party/breakpad"
                     "third_party/brotli"
                     "third_party/catapult/common/py_vulcanize/py_vulcanize"
                     "third_party/catapult/common/py_vulcanize/third_party"
                     "third_party/catapult/third_party/beautifulsoup4"
                     "third_party/catapult/third_party/html5lib-python"
                     "third_party/catapult/third_party/polymer/components"
                     "third_party/catapult/tracing"
                     "third_party/catapult/tracing/third_party"
                     "third_party/ced"
                     "third_party/cld_3"
                     "third_party/closure_compiler"
                     "third_party/crashpad"
                     "third_party/crashpad/crashpad/third_party/lss"
                     "third_party/crashpad/crashpad/third_party/zlib"
                     "third_party/crc32c"
                     "third_party/dav1d"
                     "third_party/dawn"
                     "third_party/devtools-frontend"
                     "third_party/devtools-frontend/src/front_end/third_party"
                     "third_party/devtools-frontend/src/third_party/typescript"
                     "third_party/emoji-segmenter"
                     "third_party/ffmpeg"
                     "third_party/googletest"
                     "third_party/harfbuzz-ng/utils"
                     "third_party/hunspell"
                     "third_party/iccjpeg"
                     "third_party/icu"
                     "third_party/inspector_protocol"
                     "third_party/jinja2"
                     "third_party/jsoncpp"
                     "third_party/jstemplate"
                     "third_party/khronos"
                     "third_party/leveldatabase"
                     "third_party/libaddressinput"
                     "third_party/libavif"
                     "third_party/libgifcodec"
                     "third_party/libjingle_xmpp"
                     "third_party/libjpeg_turbo"
                     "third_party/libpng"
                     "third_party/libsrtp"
                     "third_party/libsync"
                     "third_party/libudev"
                     "third_party/libvpx"
                     "third_party/libwebm"
                     "third_party/libwebp"
                     "third_party/libxml"
                     "third_party/libxslt"
                     "third_party/libyuv"
                     "third_party/lottie"
                     "third_party/lss"
                     "third_party/mako"
                     "third_party/markupsafe"
                     "third_party/mesa_headers"
                     "third_party/metrics_proto"
                     "third_party/modp_b64"
                     "third_party/nasm"
                     "third_party/node"
                     "third_party/one_euro_filter"
                     "third_party/openh264/src/codec/api/svc"
                     "third_party/opus"
                     "third_party/ots"
                     "third_party/pdfium"
                     "third_party/pdfium/third_party/agg23"
                     "third_party/pdfium/third_party/base"
                     "third_party/pdfium/third_party/freetype"
                     "third_party/pdfium/third_party/lcms"
                     "third_party/pdfium/third_party/libopenjpeg20"
                     "third_party/pdfium/third_party/skia_shared"
                     "third_party/perfetto"
                     "third_party/pffft"
                     "third_party/ply"
                     "third_party/polymer"
                     "third_party/protobuf"
                     "third_party/protobuf/third_party/six"
                     "third_party/pyjson5"
                     "third_party/re2"
                     "third_party/rnnoise"
                     "third_party/skia"
                     "third_party/skia/include/third_party/skcms/skcms.h"
                     "third_party/skia/include/third_party/vulkan"
                     "third_party/skia/third_party/skcms"
                     "third_party/smhasher"
                     "third_party/snappy"
                     "third_party/sqlite"
                     "third_party/usb_ids"
                     "third_party/usrsctp"
                     "third_party/vulkan_memory_allocator"
                     "third_party/web-animations-js"
                     "third_party/webrtc"
                     "third_party/webrtc/common_audio/third_party/ooura/fft_size_128"
                     "third_party/webrtc/common_audio/third_party/ooura/fft_size_256"
                     "third_party/webrtc/common_audio/third_party/spl_sqrt_floor"
                     "third_party/webrtc/modules/third_party/fft"
                     "third_party/webrtc/modules/third_party/g711"
                     "third_party/webrtc/modules/third_party/g722"
                     "third_party/webrtc/rtc_base/third_party/base64"
                     "third_party/webrtc/rtc_base/third_party/sigslot"
                     "third_party/webrtc_overrides"
                     "third_party/widevine/cdm/widevine_cdm_common.h"
                     "third_party/widevine/cdm/widevine_cdm_version.h"
                     "third_party/woff2"
                     "third_party/xcbproto"
                     "third_party/zlib"
                     "url/third_party/mozilla"
                     "v8/src/third_party/utf8-decoder"
                     "v8/src/third_party/valgrind"
                     "v8/src/third_party/siphash"
                     "v8/third_party/v8/builtins"
                     "v8/third_party/inspector_protocol")))

              (with-directory-excursion "src/3rdparty"
                ;; TODO: Try removing "gn" too for future versions of qtwebengine-5.
                (delete-file-recursively "ninja")

                (with-directory-excursion "chromium"
                  ;; Delete bundled software and binaries that were not explicitly
                  ;; preserved above.
                  #$remove-third-party-files

                  ;; Use relative header locations instead of hard coded ones.
                  (substitute*
                      "base/third_party/dynamic_annotations/dynamic_annotations.c"
                    (("base/third_party/valgrind") "valgrind"))
                  (substitute* '("third_party/breakpad/breakpad/src/common\
/linux/http_upload.cc"
                                 "third_party/breakpad/breakpad/src/common/\
linux/libcurl_wrapper.h")
                    (("third_party/curl") "curl"))
                  (substitute*
                      '("components/viz/common/gpu/vulkan_context_provider.h"
                        "components/viz/common/resources/resource_format_utils.h"
                        "gpu/config/gpu_info_collector_win.cc"
                        "gpu/config/gpu_util.cc"
                        "gpu/config/vulkan_info.h")
                    (("third_party/vulkan_headers/include/")
                     ""))

                  ;; Replace Google Analytics bundle with an empty file and hope
                  ;; no one notices.
                  (mkdir-p "third_party/analytics")
                  (call-with-output-file
                      "third_party/analytics/google-analytics-bundle.js"
                    (lambda (port)
                      (const #t)))))
              ;; Do not enable support for loading the Widevine DRM plugin.
              (substitute* "src/buildtools/config/common.pri"
                (("enable_widevine=true")
                 "enable_widevine=false")))))))
    (build-system gnu-build-system)
    (native-inputs
     (list bison
           flex
           gperf
           ninja
           node
           perl
           pkg-config
           python2-six
           python-2
           ruby-2.7))
    (inputs
     (list alsa-lib
           at-spi2-core
           cups-minimal
           curl
           dbus
           ffmpeg-4
           fontconfig
           harfbuzz
           icu4c
           jsoncpp
           lcms
           libcap
           libevent
           libgcrypt
           libjpeg-turbo
           libvpx
           libwebp
           libx11
           libxcb
           libxcomposite
           libxcursor
           libxkbfile
           libxi
           libxkbcommon
           ;; FIXME: libxml2 needs to built with icu support though it links to
           ;; libxml2 configure summary still states "Checking for compatible
           ;; system libxml2... no"
           libxml2
           openh264
           libxrandr
           libxrender
           libxslt
           libxtst
           mesa
           minizip
           nss
           opus
           pciutils
           protobuf
           pulseaudio
           qtmultimedia-5
           re2
           snappy
           eudev
           valgrind
           vulkan-headers
           xcb-util))
    (propagated-inputs
     ;; Required by Qt5WebEngineCoreConfig.cmake.
     (list qtbase-5 qtdeclarative-5 qtwebchannel-5))
    (arguments
     (substitute-keyword-arguments (package-arguments qtsvg-5)
       ((#:modules modules '())
        `((guix build gnu-build-system)
          (guix build utils)
          (ice-9 textual-ports)))
       ((#:phases phases)
        #~(modify-phases #$phases
            (add-before 'configure 'substitute-source
              (lambda* (#:key inputs #:allow-other-keys)
                (with-atomic-file-replacement
                 "src/buildtools/config/linux.pri"
                 (lambda (in out)
                   (display (get-string-all in) out)
                   (display "\ngn_args += use_system_openh264=true\n" out)
                   (display "\ngn_args += link_pulseaudio = true\n" out)))
                ;; Qtwebengine is not installed into the same prefix as
                ;; qtbase.  Some qtbase QTLibraryInfo constants will not
                ;; work.  Replace with the full path to the qtwebengine-5
                ;; translations and locales in the store.
                (substitute* "src/core/web_engine_library_info.cpp"
                  (("QLibraryInfo::location\\(QLibraryInfo::TranslationsPath\\)")
                   (string-append "QLatin1String(\"" #$output
                                  "/share/qt5/translations\")"))
                  (("QLibraryInfo::location\\(QLibraryInfo::DataPath\\)")
                   (string-append "QLatin1String(\"" #$output
                                  "/share/qt5\")")))
                ;; Substitute full dynamic library path for nss.
                (substitute* "src/3rdparty/chromium/crypto/nss_util.cc"
                  (("libnssckbi.so")
                   (search-input-file inputs "lib/nss/libnssckbi.so")))
                ;; Substitute full dynamic library path for udev.
                (substitute* "src/3rdparty/chromium/device/udev_linux/udev1_loader.cc"
                  (("libudev.so.1")
                   (search-input-file inputs "lib/libudev.so.1")))))
            (add-before 'configure 'set-env
              (lambda _
                ;; Avoids potential race conditions.
                (setenv "PYTHONDONTWRITEBYTECODE" "1")
                (setenv "NINJAFLAGS"
                        (string-append "-k1" ;less verbose build output
                                       ;; Respect the '--cores' option of 'guix build'.
                                       " -j" (number->string (parallel-job-count))))))
            (replace 'configure
              (lambda _
                ;; Valid QT_BUILD_PARTS variables are:
                ;; libs tools tests examples demos docs translations
                (invoke "qmake" "QT_BUILD_PARTS = libs tools" "--"
                        "--webengine-printing-and-pdf=no"
                        "--webengine-ffmpeg=system"
                       ;; FIXME: Building qtwebengine-5 5.12.2 with
                       ;; icu4c >= 68 fails.
                       ;;"--webengine-icu=system"
                        "--webengine-pepper-plugins=no"
                        "-webengine-proprietary-codecs")))))
       ;; Tests are disabled due to "Could not find QtWebEngineProcess error"
       ;; It's possible this can be fixed by setting QTWEBENGINEPROCESS_PATH
       ;; before running tests.
       ((#:tests? _ #f) #f)))
    (native-search-paths
     (list (search-path-specification
            (file-type 'regular)
            (separator #f)
            (variable "QTWEBENGINEPROCESS_PATH")
            (files '("lib/qt5/libexec/QtWebEngineProcess")))))
    (home-page "https://wiki.qt.io/QtWebEngine")
    (synopsis "Qt WebEngine module")
    (description "The Qt5WebEngine module provides support for web applications
using the Chromium browser project.  The Chromium source code has Google services
and binaries removed, and adds modular support for using system libraries.")
    (license license:lgpl2.1+)))

(define-public qtwebengine
  (package
    (name "qtwebengine")
    (version "6.5.2")
    (source
     (origin
       (method url-fetch)
       (uri (qt-url name version))
       (sha256
        (base32
         "17qxf3asyxq6kcqqvml170n7rnzih3nr4srp9r5v80pmas5l7jg7"))
       (modules '((ice-9 ftw)
                  (ice-9 match)
                  (srfi srfi-1)
                  (srfi srfi-26)
                  (guix build utils)))
       (snippet
        #~(begin
            ;; Note: Anything under a 'third_party/' directory that needs to
            ;; be preserved must be explicitly added below, otherwise it gets
            ;; removed by the 'remove-third-party-files' code snippet included
            ;; below.  It is useful to refer to the list used by
            ;; ungoogled-chromium when upgrading, but not all of the items
            ;; present in it will need to be reported here, as Qt already
            ;; removes components its build doesn't use.
            (let ((preserved-third-party-files
                  '("base/third_party/double_conversion"
                    "base/third_party/cityhash"
                    "base/third_party/cityhash_v103"
                    "base/third_party/dynamic_annotations"
                    "base/third_party/icu"
                    "base/third_party/nspr"
                    "base/third_party/superfasthash"
                    "base/third_party/symbolize"
                    "base/third_party/xdg_mime"
                    "base/third_party/xdg_user_dirs"
                    "net/third_party/mozilla_security_manager"
                    "net/third_party/nss"
                    "net/third_party/quiche"
                    "net/third_party/uri_template"
                    "third_party/abseil-cpp"
                    "third_party/angle"
                    "third_party/angle/src/common/third_party/base"
                    "third_party/angle/src/common/third_party/smhasher"
                    "third_party/angle/src/common/third_party/xxhash"
                    "third_party/angle/src/third_party/libXNVCtrl" ;Expat
                    "third_party/angle/src/third_party/trace_event"
                    "third_party/angle/src/third_party/volk"
                    "third_party/axe-core"
                    "third_party/blink"
                    "third_party/boringssl"
                    "third_party/boringssl/src/third_party/fiat"
                    "third_party/breakpad"
                    "third_party/brotli"
                    "third_party/catapult"
                    "third_party/catapult/common/py_vulcanize/third_party/rcssmin"
                    "third_party/catapult/common/py_vulcanize/third_party/rjsmin"
                    "third_party/catapult/third_party/polymer"
                    "third_party/catapult/tracing/third_party/d3/d3.min.js"
                    "third_party/catapult/tracing/third_party/gl-matrix/dist/gl-matrix-min.js"
                    "third_party/catapult/tracing/third_party/jpeg-js/jpeg-js-decoder.js"
                    "third_party/catapult/tracing/third_party/jszip/jszip.min.js"
                    "third_party/catapult/tracing/third_party/mannwhitneyu/mannwhitneyu.js"
                    "third_party/catapult/tracing/third_party/oboe/dist"
                    "third_party/catapult/tracing/third_party/pako/pako.min.js"
                    "third_party/ced"
                    "third_party/cld_3"
                    "third_party/closure_compiler"
                    "third_party/cpuinfo" ;BSD-2
                    "third_party/crashpad"
                    "third_party/crashpad/crashpad/third_party/lss"
                    "third_party/crashpad/crashpad/third_party/zlib"
                    "third_party/crc32c"
                    "third_party/dav1d"
                    "third_party/dawn"
                    "third_party/dawn/third_party/gn/webgpu-cts"
                    "third_party/dawn/third_party/khronos"
                    "third_party/devtools-frontend"
                    "third_party/devtools-frontend/src/front_end/third_party/i18n"
                    "third_party/devtools-frontend/src/front_end/third_party/acorn"
                    "third_party/devtools-frontend/src/front_end/third_party/acorn-loose"
                    "third_party/devtools-frontend/src/front_end/third_party/\
additional_readme_paths.json"
                    "third_party/devtools-frontend/src/front_end/third_party/axe-core"
                    "third_party/devtools-frontend/src/front_end/third_party/chromium"
                    "third_party/devtools-frontend/src/front_end/third_party/codemirror"
                    "third_party/devtools-frontend/src/front_end/third_party/codemirror.next"
                    "third_party/devtools-frontend/src/front_end/third_party/diff"
                    "third_party/devtools-frontend/src/front_end/third_party/i18n"
                    "third_party/devtools-frontend/src/front_end/third_party/intl-messageformat"
                    "third_party/devtools-frontend/src/front_end/third_party/lighthouse"
                    "third_party/devtools-frontend/src/front_end/third_party/lit-html"
                    "third_party/devtools-frontend/src/front_end/third_party/marked"
                    "third_party/devtools-frontend/src/front_end/third_party/puppeteer"
                    "third_party/devtools-frontend/src/front_end/third_party/wasmparser"
                    "third_party/devtools-frontend/src/third_party/typescript"
                    "third_party/distributed_point_functions"
                    "third_party/dom_distiller_js"
                    "third_party/emoji-segmenter"
                    "third_party/fdlibm"
                    "third_party/ffmpeg/libavcodec/avcodec.h"
                    "third_party/ffmpeg/libavcodec/packet.h"
                    "third_party/ffmpeg/libavformat/avformat.h"
                    "third_party/ffmpeg/libavformat/avio.h"
                    "third_party/ffmpeg/libavutil/avutil.h"
                    "third_party/ffmpeg/libavutil/imgutils.h"
                    "third_party/ffmpeg/libavutil/log.h"
                    "third_party/ffmpeg/libavutil/mathematics.h"
                    "third_party/ffmpeg/libavutil/opt.h"
                    "third_party/fft2d"
                    "third_party/flatbuffers"
                    "third_party/freetype"
                    "third_party/gemmlowp" ;ASL2.0
                    "third_party/google_input_tools" ;ASL2.0
                    "third_party/googletest"
                    "third_party/harfbuzz-ng"
                    "third_party/highway"
                    "third_party/hunspell"
                    "third_party/iccjpeg"
                    "third_party/icu" ;TODO: make pdfium use system version
                    "third_party/inspector_protocol"
                    "third_party/ipcz" ;BSD-3
                    "third_party/jinja2"
                    "third_party/jsoncpp"
                    "third_party/jstemplate"
                    "third_party/khronos"
                    "third_party/leveldatabase"
                    "third_party/libaddressinput"
                    "third_party/libaom"
                    "third_party/libaom/source/libaom/third_party/fastfeat"
                    "third_party/libaom/source/libaom/third_party/SVT-AV1" ;BSD-3
                    "third_party/libaom/source/libaom/third_party/vector"
                    "third_party/libaom/source/libaom/third_party/x86inc"
                    "third_party/libavif"
                    "third_party/libevent"
                    "third_party/libgav1"
                    "third_party/libjingle_xmpp"
                    "third_party/libjpeg_turbo"
                    "third_party/libjxl"
                    "third_party/libpng" ;TODO: make pdfium use system version
                    "third_party/libsecret" ;LGPL2.1+
                    "third_party/libsrtp"
                    "third_party/libsync"
                    "third_party/libudev"
                    "third_party/liburlpattern"
                    "third_party/libvpx"
                    "third_party/libwebm"
                    "third_party/libwebp"
                    "third_party/libx11"
                    "third_party/libxcb-keysyms"
                    "third_party/libxml"
                    "third_party/libyuv"
                    "third_party/libzip" ;BSD-3
                    "third_party/lottie"
                    "third_party/lss"
                    "third_party/mako"
                    "third_party/markupsafe"
                    "third_party/mesa_headers"
                    "third_party/metrics_proto"
                    "third_party/minigbm" ;BSD-3
                    "third_party/modp_b64"
                    "third_party/nasm"
                    "third_party/nearby" ;ASL2.0
                    "third_party/node"
                    "third_party/omnibox_proto" ;BSD-3
                    "third_party/one_euro_filter"
                    "third_party/openscreen" ;BSD-3
                    "third_party/openscreen/src/third_party/tinycbor" ;Expat
                    "third_party/openscreen/src/third_party/mozilla" ;MPL1.1/GPL2+/LGPL2.1+, BSD-3
                    "third_party/openh264"
                    "third_party/opus/src/include/opus.h"
                    "third_party/opus/src/include/opus_custom.h"
                    "third_party/opus/src/include/opus_defines.h"
                    "third_party/opus/src/include/opus_multistream.h"
                    "third_party/opus/src/include/opus_types.h"
                    "third_party/ots"
                    "third_party/pdfium"
                    "third_party/pdfium/third_party/agg23"
                    "third_party/pdfium/third_party/base"
                    "third_party/pdfium/third_party/bigint"
                    "third_party/pdfium/third_party/freetype"
                    "third_party/pdfium/third_party/lcms"
                    "third_party/pdfium/third_party/libopenjpeg"
                    "third_party/pdfium/third_party/libpng16"
                    "third_party/pdfium/third_party/libtiff"
                    "third_party/pdfium/third_party/skia_shared"
                    "third_party/pdfium/third_party/freetype/include/pstables.h" ;FreeType
                    "third_party/perfetto"
                    "third_party/perfetto/protos/third_party/chromium"
                    "third_party/pffft"
                    "third_party/ply"
                    "third_party/polymer"
                    "third_party/private_membership" ;ASL2.0
                    "third_party/private-join-and-compute" ;ASL2.0
                    "third_party/protobuf"
                    "third_party/pthreadpool" ;BSD-2
                    "third_party/pyjson5"
                    "third_party/qcms" ;Expat
                    "third_party/re2"
                    "third_party/rnnoise"
                    "third_party/ruy" ;ASL2.0
                    "third_party/s2cellid" ;ASL2.0
                    "third_party/securemessage" ;ASL2.0
                    "third_party/shell-encryption" ;ASL2.0
                    "third_party/skia"
                    "third_party/skia/include/third_party/vulkan"
                    "third_party/skia/modules/skcms"
                    "third_party/skia/third_party/vulkanmemoryallocator"
                    "third_party/smhasher"
                    "third_party/snappy"
                    "third_party/speech-dispatcher"
                    "third_party/sqlite"
                    "third_party/swiftshader" ;ASL2.0
                    "third_party/swiftshader/third_party/llvm-10.0" ;ASL2.0, with LLVM exception
                    "third_party/swiftshader/third_party/marl" ;ASL2.0
                    "third_party/swiftshader/third_party/SPIRV-Headers" ;X11-style
                    "third_party/swiftshader/third_party/SPIRV-Tools" ;ASL2.0
                    "third_party/tensorflow-text" ;ASL2.0
                    "third_party/tflite" ;ASL2.0
                    "third_party/ukey2" ;ASL2.0
                    "third_party/usb_ids"
                    "third_party/utf" ;Expat
                    "third_party/vulkan-deps/glslang"
                    "third_party/vulkan-deps/spirv-headers"
                    "third_party/vulkan-deps/spirv-tools"
                    "third_party/vulkan-deps/vulkan-headers"
                    "third_party/vulkan-deps/vulkan-loader"
                    "third_party/vulkan-deps/vulkan-tools"
                    "third_party/vulkan-deps/vulkan-validation-layers"
                    "third_party/vulkan_memory_allocator"
                    "third_party/web-animations-js"
                    "third_party/webrtc"
                    "third_party/webrtc/common_audio/third_party/ooura"
                    "third_party/webrtc/common_audio/third_party/spl_sqrt_floor"
                    "third_party/webrtc/modules/third_party/fft"
                    "third_party/webrtc/modules/third_party/g711"
                    "third_party/webrtc/modules/third_party/g722"
                    "third_party/webrtc/rtc_base/third_party/base64"
                    "third_party/webrtc/rtc_base/third_party/sigslot"
                    "third_party/webrtc_overrides"
                    "third_party/widevine/cdm/widevine_cdm_common.h"
                    "third_party/widevine/cdm/widevine_cdm_version.h"
                    "third_party/woff2"
                    "third_party/wuffs"
                    "third_party/x11proto"
                    "third_party/xnnpack" ;BSD-3
                    "third_party/zlib" ;TODO: make pdfium use system version
                    "third_party/zxcvbn-cpp" ;Expat
                    "url/third_party/mozilla"
                    "v8/src/third_party/siphash"
                    "v8/src/third_party/utf8-decoder"
                    "v8/src/third_party/valgrind"
                    "v8/third_party/inspector_protocol"
                    "v8/third_party/v8/builtins")))

             (with-directory-excursion "src/3rdparty"
               (delete-file-recursively "ninja")

               (with-directory-excursion "chromium"
                 ;; Delete bundled software and binaries that were not
                 ;; explicitly preserved above.
                 #$remove-third-party-files

                 ;; Use relative header locations instead of hard coded ones.
                 (substitute*
                     "base/third_party/dynamic_annotations/dynamic_annotations.c"
                   (("base/third_party/valgrind") "valgrind"))
                 (substitute* "third_party/breakpad/breakpad/src/common/\
linux/libcurl_wrapper.h"
                   (("third_party/curl") "curl"))
                 (substitute*
                     '("components/viz/common/gpu/vulkan_context_provider.h"
                       "gpu/config/gpu_util.cc")
                   (("third_party/vulkan/include/")
                    ""))

                 ;; Replace Google Analytics bundle with an empty file and
                 ;; hope no one notices.
                 (mkdir-p "third_party/analytics")
                 (call-with-output-file
                     "third_party/analytics/google-analytics-bundle.js"
                   (lambda (port)
                     (const #t)))))
             ;; Do not enable support for loading the Widevine DRM plugin.
             (substitute* "src/core/CMakeLists.txt"
               (("enable_widevine=true")
                "enable_widevine=false")))))))
    (build-system cmake-build-system)
    (arguments
     (list
      ;; XXX: The test suite is not built by default; leave it off to save
      ;; some build time and resources.
      #:tests? #f
      #:configure-flags
      ;; Use the CMake ninja generator, otherwise the build fails.
      #~(list "-GNinja"
              ;; The PDF renderer plugin fails to build with errors such as
              ;; "src/3rdparty/chromium/components/pdf
              ;; /renderer/pdf_accessibility_tree.cc:1373:39:
              ;; error: use of undeclared identifier 'IDS_PDF_PAGE_INDEX'";
              ;; disable it.
              "-DQT_FEATURE_webengine_printing_and_pdf=OFF"
              "-DQT_FEATURE_webengine_pepper_plugins=OFF" ;widevine
              "-DQT_FEATURE_system_ffmpeg=ON"

              ;; Do not artificially limit codec support; video decoding is
              ;; done by ffmpeg.
              "-DQT_FEATURE_webengine_proprietary_codecs=ON"

              ;; Use system libraries where possible (see src/core/CMakeLists.txt).
              "-DQT_FEATURE_webengine_system_alsa=ON"
              "-DQT_FEATURE_webengine_system_ffmpeg=ON"
              "-DQT_FEATURE_webengine_system_freetype=ON"
              "-DQT_FEATURE_webengine_system_harfbuzz=ON"
              "-DQT_FEATURE_webengine_system_icu=ON"
              "-DQT_FEATURE_webengine_system_lcms2=ON"
              "-DQT_FEATURE_webengine_system_libevent=ON"
              "-DQT_FEATURE_webengine_system_libjpeg=ON"
              "-DQT_FEATURE_webengine_system_libpci=ON"
              "-DQT_FEATURE_webengine_system_libpng=ON"
              "-DQT_FEATURE_webengine_system_libwebp=ON"
              "-DQT_FEATURE_webengine_system_libxml=ON"
              "-DQT_FEATURE_webengine_system_libxslt=ON"
              "-DQT_FEATURE_webengine_system_minizip=ON"
              "-DQT_FEATURE_webengine_system_opus=ON"
              "-DQT_FEATURE_webengine_system_pulseaudio=ON"
              "-DQT_FEATURE_webengine_system_re2=ON"
              "-DQT_FEATURE_webengine_system_zlib=ON")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'patch-paths
            (lambda* (#:key inputs #:allow-other-keys)
              ;; Qtwebengine is not installed into the same prefix as qtbase.
              ;; Some qtbase QTLibraryInfo constants will not work.  Replace
              ;; with the full path to the qtwebengine translations and
              ;; locales in the store.
              (substitute* "src/core/web_engine_library_info.cpp"
                (("QLibraryInfo::path\\(QLibraryInfo::TranslationsPath)")
                 (string-append "QLatin1String(\"" #$output
                                "/share/qt6/translations\")"))
                (("QLibraryInfo::path\\(QLibraryInfo::DataPath)")
                 (string-append "QLatin1String(\"" #$output
                                "/share/qt6\")")))
              ;; Substitute full dynamic library path for nss.
              (substitute* "src/3rdparty/chromium/crypto/nss_util.cc"
                (("libnssckbi.so")
                 (search-input-file inputs "lib/nss/libnssckbi.so")))
              ;; Substitute full dynamic library path for udev.
              (substitute* "src/3rdparty/chromium/device/udev_linux/udev1_loader.cc"
                (("libudev.so.1")
                 (search-input-file inputs "lib/libudev.so.1")))
              ;; Patch the location of the X11 keywoard layouts.
              (substitute* "src/3rdparty/chromium/ui/events/ozone/layout/xkb\
/xkb_keyboard_layout_engine.cc"
                (("/usr/share/X11/xkb")
                 (search-input-directory inputs "share/X11/xkb")))))
          (add-before 'configure 'prepare-build-environment
            (lambda _
              ;; Avoids potential race conditions.
              (setenv "PYTHONDONTWRITEBYTECODE" "1")
              (setenv "NINJAFLAGS"
                      (string-append
                       "-k1"  ;less verbose build output
                       ;; Respect the '--cores' option of 'guix build'.
                       " -j" (number->string (parallel-job-count))))
              ;; Use Clang/LDD to help tame the memory requirements and hasten
              ;; the build.
              (setenv "AR" "llvm-ar") (setenv "NM" "llvm-nm")
              (setenv "CC" "clang") (setenv "CXX" "clang++")))
          (replace 'build
            (lambda* (#:key parallel-build? #:allow-other-keys)
              (apply invoke "cmake" "--build" "."
                     (if parallel-build?
                         `("--parallel" ,(number->string (parallel-job-count)))
                         '()))))
          (replace 'install
            (lambda _
              (invoke "cmake" "--install" "."))))))
    (native-inputs
     (modify-inputs (package-native-inputs qtwebengine-5)
       (delete "python2" "python2-six")
       (replace "node" node-lts)
       (append clang-14
               lld-as-ld-wrapper
               python-wrapper
               python-beautifulsoup4
               python-html5lib)))
    (inputs
     (modify-inputs (package-inputs qtwebengine-5)
       (replace "qtmultimedia" qtmultimedia)
       (append libxkbfile xkeyboard-config)))
    (propagated-inputs
     (modify-inputs (package-propagated-inputs qtwebengine-5)
       (replace "qtbase" qtbase)
       (replace "qtdeclarative" qtdeclarative)
       (replace "qtwebchannel" qtwebchannel)))
    (native-search-paths
     (list (search-path-specification
            (file-type 'regular)
            (separator #f)
            (variable "QTWEBENGINEPROCESS_PATH")
            (files '("lib/qt6/libexec/QtWebEngineProcess")))))
    (home-page "https://wiki.qt.io/QtWebEngine")
    (synopsis "Qt WebEngine module")
    (description "The Qt WebEngine module provides support for web
applications using the Chromium browser project.  The Chromium source code has
Google services and binaries removed, and adds modular support for using
system libraries.")
    (license license:lgpl2.1+)))

(define-public single-application-qt5
  ;; Change in function signature, nheko requires at least this commit
  (let ((commit "dc8042b5db58f36e06ba54f16f38b16c5eea9053"))
    (package
      (name "single-application-qt5")
      (version (string-append "3.2.0-" (string-take commit 7)))
      (source
       (origin
         (method git-fetch)
         (uri
          (git-reference
           (url "https://github.com/itay-grudev/SingleApplication")
           (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32
           "163aa2x2qb0h8w26si5ql833ilj427jjbdwlz1p2p8iaq6dh0vq1"))))
      (build-system cmake-build-system)
      (arguments
       `(#:tests? #f                    ; no check target
         ;; Projects can decide how to build this library.  You might need to
         ;; override this flag (QApplication, QGuiApplication or
         ;; QCoreApplication).
         #:configure-flags '("-DQAPPLICATION_CLASS=QApplication")
         #:phases
         (modify-phases %standard-phases
           ;; No install target, install things manually
           (replace 'install
             (lambda* (#:key inputs outputs source #:allow-other-keys)
               (let* ((qt (assoc-ref inputs "qtbase"))
                      (qt-version ,(version-major (package-version qtbase-5)))
                      (out (assoc-ref outputs "out")))
                 (install-file
                  "libSingleApplication.a" (string-append out "/lib"))
                 (for-each
                  (lambda (file)
                    (install-file
                     (string-append source "/" file)
                     (string-append out "/include")))
                  '("SingleApplication"
                    "singleapplication.h" "singleapplication_p.h"))))))))
      (inputs
       (list qtbase-5))
      (home-page "https://github.com/itay-grudev/SingleApplication")
      (synopsis "Replacement of QtSingleApplication for Qt5 and Qt6")
      (description
       "SingleApplication is a replacement of the QtSingleApplication for Qt5 and Qt6.

It keeps the Primary Instance of your Application and kills each subsequent
instances.  It can (if enabled) spawn secondary (non-related to the primary)
instances and can send data to the primary instance from secondary
instances.")
      (license license:expat))))

(define-public pyotherside
  (package
    (name "pyotherside")
    (version "1.6.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/thp/pyotherside")
                    (commit version)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0vwl088p8zjkh2rwmzwpz5mkjs2rfyb80018dq4r571c9vpwp2r0"))))
    (build-system qt-build-system)
    (arguments
     (list
      #:qtbase qtbase
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'fix-installation-prefix
            (lambda _
              ;; The QT_INSTALL_QML property points to the qtbase
              ;; installation prefix.
              (substitute* "src/src.pro"
                (("\\$\\$\\[QT_INSTALL_QML]")
                 (string-append #$output "/lib/qt"
                                #$(version-major (package-version qtbase))
                                "/qml")))))
          (replace 'configure
            (lambda _
              (invoke "qmake")))
          (replace 'check
            (lambda* (#:key tests? #:allow-other-keys)
              (when tests?
                (invoke "./tests/tests"))))
          (replace 'install
            ;; Specify a specific install target, otherwise the build fails
            ;; attempting to install the qtquicktests target to the qtbase
            ;; installation prefix.
            (lambda _
              (invoke "make" "sub-src-install_subtargets"))))))
    (inputs (list python qtdeclarative qtsvg))
    (home-page "https://thp.io/2011/pyotherside/")
    (synopsis "Qt plugin providing access to a Python 3 interpreter from QML")
    (description "Pyotherside is a Qt plugin providing access to a Python 3
interpreter from QML for creating asynchronous mobile and desktop UIs with
Python.")
    (license license:isc)))

(define-public pyotherside-for-qt5
  (package/inherit pyotherside
    (name "pyotherside-for-qt5")
    (arguments
     (substitute-keyword-arguments (package-arguments pyotherside)
       ((#:qtbase _ #f)
        qtbase-5)
       ((#:phases phases '%standard-phases)
        #~(modify-phases #$phases
            (replace 'fix-installation-prefix
              (lambda _
                ;; The QT_INSTALL_QML property points to the qtbase
                ;; installation prefix.
                (substitute* "src/src.pro"
                  (("\\$\\$\\[QT_INSTALL_QML]")
                   (string-append #$output "/lib/qt"
                                  #$(version-major (package-version qtbase-5))
                                  "/qml")))))))))
    (inputs (modify-inputs (package-inputs pyotherside)
              (replace "qtdeclarative" qtdeclarative-5)
              (replace "qtquickcontrols2" qtquickcontrols-5)
              (replace "qtsvg" qtsvg-5)))))

(define-public python-sip
  (package
    (name "python-sip")
    (version "6.7.7")
    (source
      (origin
        (method url-fetch)
        (uri (list (pypi-uri "sip" version)
                   (string-append "https://www.riverbankcomputing.com/static/"
                                  "Downloads/sip/" version
                                  "/sip-" version ".tar.gz")))
        (sha256
         (base32
          "1qm9q9lhfky5zvxxkssf4zdfv5k1zikji4hz80d48vdfm1pw1sfy"))
        (patches (search-patches "python-sip-include-dirs.patch"))))
    (build-system python-build-system)
    (native-inputs
     (list python-wrapper))
    (propagated-inputs
     (list python-toml python-packaging python-ply))
    (home-page "https://www.riverbankcomputing.com/software/sip/intro")
    (synopsis "Python binding creator for C and C++ libraries")
    (description
     "SIP is a tool to create Python bindings for C and C++ libraries.  It
was originally developed to create PyQt, the Python bindings for the Qt
toolkit, but can be used to create bindings for any C or C++ library.

SIP comprises a code generator and a Python module.  The code generator
processes a set of specification files and generates C or C++ code, which
is then compiled to create the bindings extension module.  The SIP Python
module provides support functions to the automatically generated code.")
    ;; There is a choice between a python like license, gpl2 and gpl3.
    ;; For compatibility with pyqt, we need gpl3.
    (license license:gpl3)))

(define-public python-sip-4
  (package
    (inherit python-sip)
    (name "python-sip")
    (version "4.19.25")
    (source
      (origin
        (method url-fetch)
        (uri (list (pypi-uri "sip" version)
                   (string-append "https://www.riverbankcomputing.com/static/"
                                  "Downloads/sip/" version
                                  "/sip-" version ".tar.gz")))
        (sha256
         (base32
          "04a23cgsnx150xq86w1z44b6vr2zyazysy9mqax0fy346zlr77dk"))))
    (build-system gnu-build-system)
    (native-inputs
     `(("python" ,python-wrapper)))
    (propagated-inputs `())
    (arguments
     `(#:tests? #f ; no check target
       #:imported-modules ((guix build python-build-system)
                           ,@%gnu-build-system-modules)
       #:modules ((srfi srfi-1)
                  ((guix build python-build-system) #:select (python-version))
                  ,@%gnu-build-system-modules)
       #:phases
       (modify-phases %standard-phases
         (replace 'configure
           (lambda* (#:key inputs outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (bin (string-append out "/bin"))
                    (include (string-append out "/include"))
                    (python (assoc-ref inputs "python"))
                    (lib (string-append out "/lib/python"
                                        (python-version python)
                                        "/site-packages")))
               (invoke "python" "configure.py"
                       "--bindir" bin
                       "--destdir" lib
                       "--incdir" include)))))))
    (license license:gpl3)))

(define-public python-pyqt
  (package
    (name "python-pyqt")
    (version "5.15.9")
    (source
      (origin
        (method url-fetch)
        ;; PyPI is the canonical distribution point of PyQt.  Older
        ;; releases are available from the web site.
        (uri (list (pypi-uri "PyQt5" version)
                   (string-append "https://www.riverbankcomputing.com/static/"
                                  "Downloads/PyQt5/" version "/PyQt5-"
                                  version ".tar.gz")))
        (file-name (string-append "PyQt5-" version ".tar.gz"))
        (sha256
         (base32
          "1h649rb1afdxskp28x524yp5kd9a97ainh9bd4mkxp4h390fhhfw"))
        (patches (search-patches "pyqt-configure.patch"))))
    (build-system pyproject-build-system)
    (native-inputs
     (list qtbase-5 ; for qmake
           python-pyqt-builder))
    (propagated-inputs
     (list python-sip python-pyqt5-sip))
    (inputs
     `(("python" ,python-wrapper)
       ("qtbase" ,qtbase-5)
       ("qtconnectivity" ,qtconnectivity)
       ("qtdeclarative-5" ,qtdeclarative-5)
       ("qtlocation" ,qtlocation)
       ("qtmultimedia-5" ,qtmultimedia-5)
       ("qtsensors" ,qtsensors)
       ("qtserialport" ,qtserialport)
       ("qtsvg-5" ,qtsvg-5)
       ("qttools-5" ,qttools-5)
       ("qtwebchannel-5" ,qtwebchannel-5)
       ("qtwebsockets-5" ,qtwebsockets-5)
       ("qtx11extras" ,qtx11extras)
       ("qtxmlpatterns" ,qtxmlpatterns)))
    (arguments
      (list
       #:tests? #f ; No tests.
       #:configure-flags
       #~`(@ ("--verbose" . "") ; Print commands run.
             ("--confirm-license" . "")
             ("--jobs" . ,(number->string (parallel-job-count))))
       #:phases
       #~(modify-phases %standard-phases
         ;; When building python-pyqtwebengine, <qprinter.h> can not be
         ;; included.  Here we substitute the full path to the header in the
         ;; store.
         (add-after 'unpack 'substitute-source
           (lambda* (#:key inputs  #:allow-other-keys)
             (let* ((qtbase (assoc-ref inputs "qtbase"))
                    (qtprinter.h (string-append "\"" qtbase "/include/qt5/QtPrintSupport/qprinter.h\"")))
               (substitute* (list "sip/QtPrintSupport/qprinter.sip"
                                  "sip/QtPrintSupport/qpyprintsupport_qlist.sip")
                 (("<qprinter.h>") qtprinter.h))))))))
    (home-page "https://www.riverbankcomputing.com/software/pyqt/intro")
    (synopsis "Python bindings for Qt")
    (description
     "PyQt is a set of Python v2 and v3 bindings for the Qt application
framework.  The bindings are implemented as a set of Python modules and
contain over 620 classes.")
    (license license:gpl3)))

(define-public python-pyqt5-sip
  (package
    (name "python-pyqt5-sip")
    (version "12.11.1")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "PyQt5_sip" version))
       (sha256
        (base32
         "0sa3vad8r7qm98k4ngimwjp87bh2f9f2vv19cnzb3vb11zdgplwp"))))
    (build-system python-build-system)
    (arguments
     `(#:tests? #f)) ;; No test code.
    (home-page "https://www.riverbankcomputing.com/software/sip/")
    (synopsis "Sip module support for PyQt5")
    (description "Sip module support for PyQt5")
    (license license:lgpl2.1+)))

(define-public python-pyqtwebengine
  (package
    (name "python-pyqtwebengine")
    (version "5.15.9")
    (source
     (origin
       (method url-fetch)
       ;; The newest releases are only available on PyPI.  Older ones
       ;; are mirrored at the upstream home page.
       (uri (list (pypi-uri "PyQtWebEngine" version)
                  (string-append "https://www.riverbankcomputing.com/static"
                                 "/Downloads/PyQtWebEngine/" version
                                 "/PyQtWebEngine-" version ".tar.gz")))
       (sha256
        (base32
         "0hdr0g0rzlhsnylhfk826pq1lw8p9dqcr8yma2wy9dgjrj6n0ixb"))))
    (build-system pyproject-build-system)
    (native-inputs
     (list python python-sip
           python-pyqt-builder
           ;; qtbase is required for qmake
           qtbase-5))
    (inputs
     `(("python" ,python-wrapper)
       ("python-sip" ,python-sip)
       ("python-pyqt" ,python-pyqt)
       ("qtbase" ,qtbase-5)
       ("qtsvg-5" ,qtsvg-5)
       ("qtdeclarative-5" ,qtdeclarative-5)
       ("qtwebchannel-5" ,qtwebchannel-5)
       ("qtwebengine-5" ,qtwebengine-5)))
     (arguments
      (list
       #:tests? #f ; No tests.
       #:configure-flags
       #~`(@ ("--verbose" . "") ; Print commands run.
             ("--jobs" . ,(number->string (parallel-job-count))))
       #:phases
       #~(modify-phases %standard-phases
           (add-after 'unpack 'set-include-dirs
             (lambda* (#:key inputs outputs #:allow-other-keys)
               (let* ((python (assoc-ref inputs "python"))
                      (python-pyqt (assoc-ref inputs "python-pyqt"))
                      (sip-include-dirs (string-append
                                         python-pyqt "/lib/python"
                                         (python-version python)
                                         "/site-packages/PyQt5/bindings")))
               (setenv "SIP_INCLUDE_DIRS" sip-include-dirs)))))))
    (home-page "https://www.riverbankcomputing.com/software/pyqtwebengine/intro")
    (synopsis "Python bindings for QtWebEngine")
    (description
     "PyQtWebEngine is a set of Python bindings for The Qt Company's Qt
WebEngine libraries.  The bindings sit on top of PyQt5 and are implemented as a
set of three modules.  Prior to v5.12 these bindings were part of PyQt
itself.")
    (license license:gpl3)))

(define-public python-pyqt-builder
  (package
   (name "python-pyqt-builder")
   (version "1.14.1")
   (source
    (origin
     (method url-fetch)
     (uri (pypi-uri "PyQt-builder" version))
     (sha256
      (base32
       "00m5piryz9l4hp5z1ncaqicsp29kj71akdh4b10432zz18q3xg43"))))
   (build-system python-build-system)
   (inputs
    (list python-sip))
   (home-page "https://www.riverbankcomputing.com/static/Docs/PyQt-builder/")
   (synopsis "PEP 517 compliant PyQt build system")
   (description "PyQt-builder is a tool for generating Python bindings for C++
libraries that use the Qt application framework.  The bindings are built on
top of the PyQt bindings for Qt.  PyQt-builder is used to build PyQt itself.")
   ;; Either version 2 or 3, but no other version. See the file
   ;; 'pyqtbuild/builder.py' in the source distribution for more information.
   (license (list license:gpl2 license:gpl3))))

(define-public python-qtpy
  (package
    (name "python-qtpy")
    (version "2.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "QtPy" version))
       (sha256
          (base32
           "051rj10lbv2ny48lz34zhclcbdxxdbk4di2mdk91m9143w91npyq"))))
    (build-system python-build-system)
    (propagated-inputs (list python-packaging))
    (arguments
     `(;; Not all supported bindings are packaged. Especially PyQt4.
       #:tests? #f))
    (home-page "https://github.com/spyder-ide/qtpy")
    (synopsis
     "Qt bindings (PyQt5, PyQt4 and PySide) and additional custom QWidgets")
    (description
     "Provides an abstraction layer on top of the various Qt bindings
(PyQt5, PyQt4 and PySide) and additional custom QWidgets.")
    (license license:expat)))

(define-public python-qt.py
  (package
    (name "python-qt.py")
    (version "1.3.7")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "Qt.py" version))
       (sha256
        (base32 "07rvfwzjl378j75j2va0c6xylwx16icxa6dycsjgjc329pgpng40"))))
    (build-system python-build-system)
    (native-inputs (list python-pyqt))
    (home-page "https://github.com/mottosso/Qt.py")
    (synopsis "Abstraction layer for Python Qt bindings")
    (description
     "This package provides an abstraction layer on top of the various Qt
bindings (PySide, PySide2, PyQt4 and PyQt5).")
    (license license:expat)))

(define-public qscintilla
  (package
    (name "qscintilla")
    (version "2.13.4")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://www.riverbankcomputing.com/static"
                                  "/Downloads/QScintilla/" version
                                  "/QScintilla_src-" version ".tar.gz"))
              (sha256
               (base32
                "11lrhybp32nz1dxns4pxxd8rbj2gshva20zan0kg85p164gjc349"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (replace 'configure
           (lambda* (#:key outputs #:allow-other-keys)
             (let ((out (assoc-ref outputs "out")))
               (chdir "src")
               (substitute* "qscintilla.pro"
                 (("\\$\\$\\[QT_INSTALL_LIBS\\]")
                  (string-append out "/lib"))
                 (("\\$\\$\\[QT_INSTALL_HEADERS\\]")
                  (string-append out "/include"))
                 (("\\$\\$\\[QT_INSTALL_TRANSLATIONS\\]")
                  (string-append out "/translations"))
                 (("\\$\\$\\[QT_INSTALL_DATA\\]")
                  (string-append out "/lib/qt$${QT_MAJOR_VERSION}"))
                 (("\\$\\$\\[QT_HOST_DATA\\]")
                 (string-append out "/lib/qt$${QT_MAJOR_VERSION}")))
               (invoke "qmake")))))))
    (native-inputs (list qtbase-5))
    (home-page "https://www.riverbankcomputing.co.uk/software/qscintilla/intro")
    (synopsis "Qt port of the Scintilla C++ editor control")
    (description "QScintilla is a port to Qt of Neil Hodgson's Scintilla C++
editor control.  QScintilla includes features especially useful when editing
and debugging source code.  These include support for syntax styling, error
indicators, code completion and call tips.")
    (license license:gpl3+)))

(define-public python-qscintilla
  (package/inherit qscintilla
    (name "python-qscintilla")
    (build-system pyproject-build-system)
    (arguments
     (list #:tests? #f
           #:configure-flags
           #~`(@ ("--qsci-include-dir" . ,(string-append
                                           #$(this-package-input "qscintilla")
                                           "/include"))
                 ("--qsci-library-dir" . ,(string-append
                                           #$(this-package-input "qscintilla")
                                           "/lib")))
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'prepare-build
                 (lambda _
                   (chdir "Python")
                   (symlink "pyproject-qt5.toml" "pyproject.toml")))
               (add-after 'unpack 'set-include-dirs
                 (lambda* (#:key inputs outputs #:allow-other-keys)
                   (let* ((python (assoc-ref inputs "python"))
                          (python-pyqt (assoc-ref inputs "python-pyqt"))
                          (sip-include-dirs (string-append
                                             python-pyqt "/lib/python"
                                             (python-version python)
                                             "/site-packages/PyQt5/bindings")))
                     (setenv "SIP_INCLUDE_DIRS" sip-include-dirs)))))))
    (native-inputs
     (list python-pyqt-builder qtbase-5))
    (inputs
     (list python-pyqt python-sip qscintilla))
    (description "QScintilla is a port to Qt of Neil Hodgson's Scintilla C++
editor control.  QScintilla includes features especially useful when editing
and debugging source code.  These include support for syntax styling, error
indicators, code completion and call tips.

This package provides the Python bindings.")))

;; PyQt only looks for modules in its own directory.  It ignores environment
;; variables such as PYTHONPATH, so we need to build a union package to make
;; it work.
(define-public python-pyqt+qscintilla
  (package/inherit python-pyqt
    (name "python-pyqt+qscintilla")
    (source #f)
    (build-system trivial-build-system)
    (arguments
     '(#:modules ((guix build union))
       #:builder (begin
                   (use-modules (ice-9 match)
                                (guix build union))
                   (match %build-inputs
                     (((names . directories) ...)
                      (union-build (assoc-ref %outputs "out")
                                   directories))))))
    (inputs
     `(("python-pyqt" ,python-pyqt)
       ("python-qscintilla" ,python-qscintilla)))
    (synopsis "Union of PyQt and the Qscintilla extension")
    (description
     "This package contains the union of PyQt and the Qscintilla extension.")))

(define-public qtkeychain
  (package
    (name "qtkeychain")
    (version "0.13.2")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/frankosterfeld/qtkeychain/")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
         (base32
          "1zk6r2vc1q48qs7mw2h47bpgrfbb9r7lf9cwq4sb1a4nls87zznk"))))
    (build-system cmake-build-system)
    (native-inputs
     (list pkg-config qttools-5))
    (inputs
     (list libsecret qtbase-5))
    (arguments
     `(#:tests? #f ; No tests included
       #:phases
       (modify-phases %standard-phases
         (add-before 'configure 'set-qt-trans-dir
           (lambda _
             (substitute* "CMakeLists.txt"
              (("\\$\\{qt_translations_dir\\}")
               "${CMAKE_INSTALL_PREFIX}/share/qt5/translations")))))))
    (home-page "https://github.com/frankosterfeld/qtkeychain")
    (synopsis "Qt API to store passwords")
    (description
      "QtKeychain is a Qt library to store passwords and other secret data
securely.  It will not store any data unencrypted unless explicitly requested.")
    (license license:bsd-3)))

(define-public qtsolutions
  (let ((commit "9568abd142d581b67b86a5f63d823a34b0612702")
        (revision "53"))
    (package
      (name "qtsolutions")
      (version (git-version "0" revision commit))
      (source
       (origin
         (method git-fetch)
         (uri (git-reference
               (url "https://github.com/qtproject/qt-solutions")
               (commit commit)))
         (file-name (git-file-name name version))
         (sha256
          (base32 "17fnmassflm3vxi0krpr6fff368jy38cby31a48rban4nqqmgx7n"))
         (modules '((guix build utils)
                    (ice-9 ftw)
                    (srfi srfi-1)))
         (snippet
          ;; Unvendor QtLockFile from QtSingleApplication.
          '(begin
             (with-directory-excursion "qtsingleapplication/src"
               (for-each delete-file
                         (find-files "." "qtlockedfile.*\\.(h|cpp)"))
                 (substitute* "qtsingleapplication.pri"
                   ;; Add include path of LockedFile.
                   (("INCLUDEPATH \\+=")
                    "INCLUDEPATH += ../../qtlockedfile/src")
                   ;; Link library of LockedFile.
                   (("LIBS \\+=")
                    "LIBS += -lQtSolutions_LockedFile"))
                 (substitute* '("qtlocalpeer.h" "qtlocalpeer.cpp")
                   (("#include \"qtlockedfile.*\\.cpp\"") "")
                   ;; Unwrap namespace added in the vendoring process.
                   (("QtLP_Private::QtLockedFile")
                    "QtLockedFile")))))))
      (build-system gnu-build-system)
      (arguments
       `(#:tests? #f                    ; No target
         #:imported-modules
         ((guix build copy-build-system)
          ,@%gnu-build-system-modules)
         #:modules
         (((guix build copy-build-system) #:prefix copy:)
          (guix build gnu-build-system)
          (guix build utils))
         #:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'patch-source
             (lambda* (#:key outputs #:allow-other-keys)
               (substitute* (find-files "." "common.pri")
                 ;; Remove unnecessary prefixes/suffixes in library names.
                 (("qt5") "qt")
                 (("-head") ""))
               ;; Disable building of examples.
               (substitute* (find-files "." "\\.pro$")
                 (("SUBDIRS\\+=examples") ""))
               ;; Fix deprecated functions.
               (substitute* "qtsoap/src/qtsoap.cpp"
                 (("toAscii") "toUtf8"))))
           (replace 'configure
             (lambda _
               (for-each (lambda (solution)
                           (with-directory-excursion solution
                             (invoke "./configure" "-library")
                             (invoke "qmake")))
                         '("qtlockedfile" "qtpropertybrowser" "qtservice"
                           "qtsingleapplication" "qtsoap"))))
           (replace 'build
             (lambda _
               (for-each (lambda (solution)
                           (with-directory-excursion solution
                             (invoke "make")))
                         '("qtlockedfile" "qtpropertybrowser" "qtservice"
                           "qtsingleapplication" "qtsoap"))))
           (replace 'install
             (lambda args
               (for-each (lambda (solution)
                           (with-directory-excursion solution
                             (apply
                              (assoc-ref copy:%standard-phases 'install)
                              #:install-plan
                              '(("src" "include" #:include-regexp ("\\.h$"))
                                ("lib" "lib"))
                              args)))
                         '("qtlockedfile" "qtpropertybrowser" "qtservice"
                           "qtsingleapplication" "qtsoap")))))))
      (inputs
       (list qtbase-5))
      (synopsis "Collection of Qt extensions")
      (description "QtSolutions is a set of components extending Qt.
@itemize
@item QtLockedFile: A class that extends QFile with advisory locking functions.
@item QtPropertyBrowser: A framework that enables the user to edit a set of
properties.
@item QtService: A helper for writing services such as Unix daemons.
@item QtSingleApplication: A component that provides support for applications
that can be only started once per user.
@item QtSoap: A component that provides basic web service support with version
1.1 of the SOAP protocol.
@end itemize\n")
      (home-page "https://doc.qt.io/archives/qq/qq09-qt-solutions.html")
      (license (list license:bsd-3
                     ;; QScriptParser and QScriptGrammar specifically allow
                     ;; redistribution under GPL3 or LGPL2.1
                     license:gpl3 license:lgpl2.1)))))

(define-public qwt
  (package
    (name "qwt")
    (version "6.1.5")
    (source
      (origin
        (method url-fetch)
        (uri
         (string-append "mirror://sourceforge/qwt/qwt/"
                        version "/qwt-" version ".tar.bz2"))
        (sha256
         (base32 "0hf0mpca248xlqn7xnzkfj8drf19gdyg5syzklvq8pibxiixwxj0"))))
  (build-system gnu-build-system)
  (inputs
   (list qtbase-5 qtsvg-5 qttools-5))
  (arguments
   `(#:phases
     (modify-phases %standard-phases
       (replace 'configure
         (lambda* (#:key outputs #:allow-other-keys)
           (let* ((out (assoc-ref outputs "out"))
                  (docdir (string-append out "/share/doc/qwt"))
                  (incdir (string-append out "/include/qwt"))
                  (pluginsdir (string-append out "/lib/qt5/plugins/designer"))
                  (featuresdir (string-append out "/lib/qt5/mkspecs/features")))
             (substitute* '("qwtconfig.pri")
               (("^(\\s*QWT_INSTALL_PREFIX)\\s*=.*" _ x)
                (format #f "~a = ~a\n" x out))
               (("^(QWT_INSTALL_DOCS)\\s*=.*" _ x)
                (format #f "~a = ~a\n" x docdir))
               (("^(QWT_INSTALL_HEADERS)\\s*=.*" _ x)
                (format #f "~a = ~a\n" x incdir))
               (("^(QWT_INSTALL_PLUGINS)\\s*=.*" _ x)
                (format #f "~a = ~a\n" x pluginsdir))
               (("^(QWT_INSTALL_FEATURES)\\s*=.*" _ x)
                (format #f "~a = ~a\n" x featuresdir)))
             (substitute* '("doc/doc.pro")
               ;; We'll install them in the 'install-man-pages' phase.
               (("^unix:doc\\.files.*") ""))
             (invoke "qmake"))))
       (add-after 'install 'install-man-pages
         (lambda* (#:key outputs #:allow-other-keys)
           (let* ((out (assoc-ref outputs "out"))
                  (man (string-append out "/share/man")))
             ;; Remove some incomplete manual pages.
             (for-each delete-file (find-files "doc/man/man3" "^_tmp.*"))
             (mkdir-p man)
             (copy-recursively "doc/man" man)))))))
  (home-page "https://qwt.sourceforge.net")
  (synopsis "Qt widgets for plots, scales, dials and other technical software
GUI components")
  (description
   "The Qwt library contains widgets and components which are primarily useful
for technical and scientific purposes.  It includes a 2-D plotting widget,
different kinds of sliders, and much more.")
  (license
   (list
    ;; The Qwt license is LGPL2.1 with some exceptions.
    (license:non-copyleft "http://qwt.sourceforge.net/qwtlicense.html")
    ;; textengines/mathml/qwt_mml_document.{cpp,h} is dual LGPL2.1/GPL3 (either).
    license:lgpl2.1 license:gpl3))))

(define-public dotherside
  (package
    (name "dotherside")
    (version "0.9.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/filcuc/DOtherSide")
              (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "13n2qb8q9jz4ihwlbs7y15lw90w9113gb1bgnb1dggpxkj64r953"))))
    (build-system cmake-build-system)
    (native-inputs
     (list qttools-5))
    (inputs
     ;; TODO: Support Qt 6 (requires qtdeclarative of Qt6).
     (list qtbase-5 qtdeclarative-5))
    (home-page "https://filcuc.github.io/DOtherSide/index.html")
    (synopsis "C language library for creating bindings for the Qt QML language")
    (description
     "DOtherSide is a C language library for creating bindings for the
QT QML language.  The following features are implementable from
a binding language:
@itemize
@item Creating custom QObject
@item Creating custom QAbstractListModels
@item Creating custom properties, signals and slots
@item Creating from QML QObject defined in the binded language
@item Creating from Singleton QML QObject defined in the binded language
@end itemize\n")
    (license license:lgpl3)))                    ;version 3 only (+ exception)

(define-public qtcolorwidgets
  (package
    (name "qtcolorwidgets")
    (version "2.2.0")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/mattia.basaglia/Qt-Color-Widgets")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1fp7sr5a56bjp2abc6ng331q0bwvk6mf2nxdga81aj6cd9afs22q"))))
    (build-system cmake-build-system)
    (arguments '(#:tests? #f))          ;there are no tests
    (native-inputs
     (list qttools-5))
    (inputs
     (list qtbase-5))
    (home-page "https://gitlab.com/mattia.basaglia/Qt-Color-Widgets")
    (synopsis "Color management widgets")
    (description "QtColorWidgets provides a Qt color dialog that is more
user-friendly than the default @code{QColorDialog} and several other
color-related widgets.")
    ;; Includes a license exception for combining with GPL2 code.
    (license license:lgpl3+)))

(define-public qcustomplot
  (package
    (name "qcustomplot")
    (version "2.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://www.qcustomplot.com/release/"
                           version "fixed" "/QCustomPlot.tar.gz"))
       (sha256
        (base32 "1324kqyj1v1f8k8d7b15gc3apwz9qxx52p86hvchg33hjdlqhskx"))))
    (native-inputs
     `(("qcustomplot-sharedlib"
        ,(origin
           (method url-fetch)
           (uri (string-append "https://www.qcustomplot.com/release/"
                               version "fixed" "/QCustomPlot-sharedlib.tar.gz"))
           (sha256
            (base32 "0vp8lpxvd1nlp4liqrlvslpqrgfn0wpiwizzdsjbj22zzb8vxikc"))))))
    (inputs
     (list qtbase-5))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'unpack-extra-files
           (lambda* (#:key inputs #:allow-other-keys)
             (invoke "tar" "-xvf" (assoc-ref inputs "qcustomplot-sharedlib"))))
         (replace 'configure
           (lambda* (#:key outputs #:allow-other-keys)
             (chdir "qcustomplot-sharedlib/sharedlib-compilation")
             (substitute* "sharedlib-compilation.pro"
               ;; Don't build debug library.
               (("debug_and_release")
                "release"))
             (invoke "qmake"
                     (string-append "DESTDIR="
                                    (assoc-ref outputs "out")
                                    "/lib"))))
         (add-after 'install 'install-header
           (lambda* (#:key outputs #:allow-other-keys)
             (install-file "../../qcustomplot.h"
                           (string-append (assoc-ref outputs "out")
                                          "/include")))))))
    (home-page "https://www.qcustomplot.com/")
    (synopsis "Qt widget for plotting and data visualization")
    (description
     "QCustomPlot is a Qt C++ widget providing 2D plots, graphs and charts.")
    (license license:gpl3+)))

;; TODO: Split shiboken2 binding generator into a dedicated output.
;; This executable requires libxml2, libxslt, clang-toolchain at runtime.
;; The libshiboken library only requires Qt and Python at runtime.
(define-public python-shiboken-2
  (package
    (name "python-shiboken-2")
    (version "5.15.8")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://download.qt.io/official_releases"
                                  "/QtForPython/pyside2/PySide2-" version
                                  "-src/pyside-setup-opensource-src-"
                                  version ".tar.xz"))
              (sha256
               (base32
                "0pbbdypwkn3vrgy8ww207fl8pqq4jv80bck9qz5v9dfyr0166hr3"))
              (patches (search-patches "python-shiboken-2-compat.patch"))))
    (build-system cmake-build-system)
    (inputs
     (list clang-toolchain
           libxml2
           libxslt
           python-wrapper
           qtbase-5
           qtxmlpatterns))
    (arguments
     (list
      #:tests? #f
      ;; FIXME: Building tests fails
      #:configure-flags #~(list "-DBUILD_TESTS=off")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'use-shiboken-dir-only
            (lambda _ (chdir "sources/shiboken2")))
          (add-before 'configure 'make-files-writable-and-update-timestamps
            (lambda _
              ;; The build scripts need to modify some files in
              ;; the read-only source directory, and also attempts
              ;; to create Zip files which fails because the Zip
              ;; format does not support timestamps before 1980.
              (let ((circa-1980 (* 10 366 24 60 60)))
                (for-each (lambda (file)
                            (make-file-writable file)
                            (utime file circa-1980 circa-1980))
                          (find-files ".")))))
          (add-before 'configure 'set-build-env
            (lambda _
              (let ((llvm #$(this-package-input "clang-toolchain")))
                (setenv "CLANG_INSTALL_DIR" llvm))))
          (add-before 'configure 'workaround-importlib-error
            (lambda _
              ;; The following hack works around the error
              ;;   "module 'importlib' has no attribute 'machinery'"
              ;; when building python-pyside-2, which depends on
              ;; this package.
              (substitute* "libshiboken/embed/signature_bootstrap.py"
                (("import importlib" all)
                 (string-append
                  all
                  "\n        import importlib.machinery as imachi"))
                (("importlib.machinery.ModuleSpec")
                 "imachi.ModuleSpec")))))))
    (home-page "https://wiki.qt.io/Qt_for_Python")
    (synopsis
     "Shiboken generates bindings for C++ libraries using CPython source code")
    (description
     "Shiboken generates bindings for C++ libraries using CPython source code")
    (license
     (list
      ;; The main code is GPL3 or LGPL3.
      ;; Examples are BSD-3.
      license:gpl3
      license:lgpl3
      license:bsd-3))))

(define-public python-shiboken-6
  (package
    (inherit python-shiboken-2)
    (name "python-shiboken-6")
    (version "6.3.2")
    (source (origin
              (method url-fetch)
              (uri (string-append "https://download.qt.io/official_releases"
                                  "/QtForPython/pyside6/PySide6-" version
                                  "-src/pyside-setup-opensource-src-"
                                  version ".tar.xz"))
              (sha256
               (base32
                "14k8lm0h45jy6cinfwh1r503pdsslw6sq0ay3f74hil9krc7k6fi"))))
    (build-system cmake-build-system)
    (inputs
     (modify-inputs (package-inputs python-shiboken-2)
       (replace "qtbase" qtbase)
       (delete "qtxmlpatterns")))
    (arguments
     (substitute-keyword-arguments (package-arguments python-shiboken-2)
       ((#:phases p)
        #~(modify-phases #$p
            (delete 'workaround-importlib-error)
            (replace 'use-shiboken-dir-only
              (lambda _ (chdir "sources/shiboken6")))))
       ((#:configure-flags flags)
        #~(cons*
           ;; The RUNPATH of shibokenmodule contains the entry in build
           ;; directory instead of install directory.
           "-DCMAKE_SKIP_RPATH=TRUE"
           (string-append "-DCMAKE_MODULE_LINKER_FLAGS=-Wl,-rpath="
                          #$output "/lib")
           #$flags))))))

(define-public python-pyside-2
  (package
    (name "python-pyside-2")
    (version (package-version python-shiboken-2))
    (source (package-source python-shiboken-2))
    (build-system cmake-build-system)
    (inputs
     (list qtbase-5
           qtdatavis3d
           qtdeclarative-5
           qtlocation
           qtmultimedia-5
           qtquickcontrols-5
           qtquickcontrols2-5
           qtscript
           qtscxml
           qtsensors
           qtspeech
           qtsvg-5
           qttools-5
           qtwebchannel-5
           qtwebengine-5
           qtwebsockets-5
           qtx11extras
           qtxmlpatterns))
    (propagated-inputs
     (list python-shiboken-2))
    (native-inputs
     (list python-wrapper))
    (arguments
     (list
      #:tests? #f
      ;; FIXME: Building tests fail.
      #:configure-flags
      #~(list "-DBUILD_TESTS=FALSE"
              (string-append "-DPYTHON_EXECUTABLE="
                             (search-input-file %build-inputs
                                                "/bin/python")))
      #:modules '((guix build cmake-build-system)
                  (guix build utils)
                  (srfi srfi-1))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'go-to-source-dir
            (lambda _ (chdir "sources/pyside2")))
          (add-after 'go-to-source-dir 'fix-qt-module-detection
            (lambda _
              ;; Activate qt module support even if it not in the same
              ;; directory as qtbase.
              (substitute* "../cmake_helpers/helpers.cmake"
                (("\\(\"\\$\\{found_basepath\\}\" GREATER \"0\"\\)")
                 "true"))
              ;; Add include directories for qt modules.
              (let ((dirs (map (lambda (path)
                                 (string-append path "/include/qt5"))
                               (list
                                #$@(map (lambda (name)
                                          (this-package-input name))
                                        '("qtdatavis3d"
                                          "qtdeclarative"
                                          "qtlocation"
                                          "qtmultimedia"
                                          "qtquickcontrols"
                                          "qtquickcontrols2"
                                          "qtscript"
                                          "qtscxml"
                                          "qtsensors"
                                          "qtspeech"
                                          "qtsvg"
                                          "qttools"
                                          "qtwebchannel"
                                          "qtwebengine"
                                          "qtwebsockets"
                                          "qtx11extras"
                                          "qtxmlpatterns"))))))
                (substitute* "cmake/Macros/PySideModules.cmake"
                  (("\\$\\{PATH_SEP\\}\\$\\{core_includes\\}" all)
                   (fold (lambda (dir paths)
                           (string-append paths "${PATH_SEP}" dir))
                         all
                         dirs)))
                (setenv "CXXFLAGS" (fold (lambda (dir paths)
                                           (string-append paths " -I" dir))
                                         ""
                                         dirs))))))))
    (home-page "https://wiki.qt.io/Qt_for_Python")
    (synopsis
     "The Qt for Python product enables the use of Qt5 APIs in Python applications")
    (description
     "The Qt for Python product enables the use of Qt5 APIs in Python
applications.  It lets Python developers utilize the full potential of Qt,
using the PySide2 module.  The PySide2 module provides access to the
individual Qt modules such as QtCore, QtGui,and so on.  Qt for Python also
comes with the Shiboken2 CPython binding code generator, which can be used to
generate Python bindings for your C or C++ code.")
    (license (list
              license:lgpl3
              ;;They state that:
              ;; this file may be used under the terms of the GNU General
              ;; Public License version 2.0 or (at your option) the GNU
              ;; General Public license version 3 or any later version
              ;; approved by the KDE Free Qt Foundation.
              ;; Thus, it is currently v2 or v3, but no "+".
              license:gpl3
              license:gpl2))))

(define-public python-pyside-6
  (package
    (inherit python-pyside-2)
    (name "python-pyside-6")
    (version (package-version python-shiboken-6))
    (source (package-source python-shiboken-6))
    ;; TODO: Add more Qt components if available.
    (inputs
     (list qtbase
           qtdeclarative
           qtmultimedia
           qtnetworkauth
           qtpositioning
           qtsvg
           qttools
           qtwebchannel
           qtwebengine
           qtwebsockets))
    (propagated-inputs
     (list python-shiboken-6))
    (native-inputs
     (list python-wrapper))
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list "-DBUILD_TESTS=FALSE"
              (string-append "-DPYTHON_EXECUTABLE="
                             (search-input-file %build-inputs
                                                "/bin/python")))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'go-to-source-dir
            (lambda _ (chdir "sources/pyside6")))
          (add-after 'go-to-source-dir 'fix-qt-module-detection
            (lambda _
              (substitute* "cmake/PySideHelpers.cmake"
                (("\\(\"\\$\\{found_basepath\\}\" GREATER \"0\"\\)")
                 "true"))
              (let ((dirs (map (lambda (path)
                                 (string-append path "/include/qt6"))
                               (list
                                #$@(map (lambda (name)
                                          (this-package-input name))
                                        '("qtdeclarative"
                                          "qtmultimedia"
                                          "qtnetworkauth"
                                          "qtpositioning"
                                          "qtsvg"
                                          "qttools"
                                          "qtwebchannel"
                                          "qtwebengine"
                                          "qtwebsockets"))))))
                (substitute* "cmake/Macros/PySideModules.cmake"
                  (("set\\(shiboken_include_dir_list " all)
                   (string-append all (string-join dirs ";") " ")))
                (setenv "CXXFLAGS"
                        (string-join
                         (map (lambda (dir)
                                (string-append "-I" dir))
                              dirs)
                         " "))))))))
    (synopsis
     "The Qt for Python product enables the use of Qt6 APIs in Python applications")
    (description
     "The Qt for Python product enables the use of Qt6 APIs in Python
applications.  It lets Python developers utilize the full potential of Qt,
using the PySide6 module.  The PySide6 module provides access to the
individual Qt modules such as QtCore, QtGui,and so on.  Qt for Python also
comes with the Shiboken6 CPython binding code generator, which can be used to
generate Python bindings for your C or C++ code.")))

(define-public python-pyside-2-tools
  (package
    (name "python-pyside-2-tools")
    (version (package-version python-shiboken-2))
    (source (package-source python-shiboken-2))
    (build-system cmake-build-system)
    (inputs
     (list python-pyside-2 python-shiboken-2 qtbase-5))
    (native-inputs
     (list python-wrapper))
    (arguments
     (list
      #:tests? #f
      #:configure-flags
      #~(list "-DBUILD_TESTS=off"
              (string-append "-DPYTHON_EXECUTABLE="
                             (search-input-file %build-inputs
                                                "/bin/python")))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'go-to-source-dir
            (lambda _ (chdir "sources/pyside2-tools"))))))
    (home-page "https://wiki.qt.io/Qt_for_Python")
    (synopsis
     "Command line tools for PySide2")
    (description
     "Python-pyside-2-tools contains lupdate, rcc and uic tools for PySide2")
    (license license:gpl2)))

(define-public libqglviewer
  (package
    (name "libqglviewer")
    (version "2.7.2")
    (source (origin
              (method url-fetch)
              (uri
               (string-append "http://libqglviewer.com/src/libQGLViewer-"
                              version ".tar.gz"))
              (sha256
               (base32
                "023w7da1fyn2z69nbkp2rndiv886zahmc5cmira79zswxjfpklp2"))))
    (build-system gnu-build-system)
    (arguments
     '(#:tests? #f                      ; no check target
       #:make-flags
       (list (string-append "PREFIX="
                            (assoc-ref %outputs "out")))
       #:phases
       (modify-phases %standard-phases
         (replace 'configure
           (lambda* (#:key make-flags #:allow-other-keys)
             (apply invoke (cons "qmake" make-flags)))))))
    (native-inputs
     (list qtbase-5 qttools-5))
    (inputs
     (list glu))
    (home-page "https://libqglviewer.com")
    (synopsis "Qt-based C++ library for the creation of OpenGL 3D viewers")
    (description
     "@code{libQGLViewer} is a C++ library based on Qt that eases the creation
of OpenGL 3D viewers.

It provides some of the typical 3D viewer functionalities, such as the
possibility to move the camera using the mouse, which lacks in most of the
other APIs.  Other features include mouse manipulated frames, interpolated
keyFrames, object selection, stereo display, screenshot saving and much more.
It can be used by OpenGL beginners as well as to create complex applications,
being fully customizable and easy to extend.")
    ;; According to LICENSE, either version 2 or version 3 of the GNU GPL may
    ;; be used.
    (license (list license:gpl2 license:gpl3))))

(define-public qhexedit
  (package
    (name "qhexedit")
    (version "0.8.9")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/Simsys/qhexedit2")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1j333kiwhbidphdx86yilkaivgl632spfh6fqx93bc80gk4is3xa"))))
    (build-system gnu-build-system)
    (arguments
     `(#:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-path
           (lambda* (#:key outputs #:allow-other-keys)
             (substitute* "src/qhexedit.pro"
               (("^unix:DESTDIR = /usr/lib")
                (string-append "unix:DESTDIR = "
                               (assoc-ref outputs "out") "/lib")))))
         (replace 'configure
           (lambda _
             (chdir "src")
             (invoke "qmake" "qhexedit.pro")))
         (add-after 'install 'install-headers
           (lambda* (#:key outputs #:allow-other-keys)
             (let* ((out (assoc-ref outputs "out"))
                    (include-dir (string-append out "/include")))
               (mkdir-p include-dir)
               (for-each (lambda (file)
                           (install-file file include-dir))
                         (find-files "." "\\.h$"))))))))
    (inputs (list qtbase-5))
    (native-inputs (list qttools-5))
    (home-page "https://simsys.github.io")
    (synopsis "Binary editor widget for Qt")
    (description
     "@code{QHexEdit} is a hex editor widget for the Qt framework.  It is a
simple editor for binary data, just like @code{QPlainTextEdit} is for text
data.")
    (license license:lgpl2.1)))

(define-public soqt
  (let ((commit-ref "fb8f655632bb9c9c60e0ff9fa69a5ba22d3ff99d")
        (revision "1"))
    (package
    (name "soqt")
    (version (git-version "1.6.0" revision commit-ref))
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/coin3d/soqt")
               (commit commit-ref)
               (recursive? #t)))
        (file-name (git-file-name name version))
        (sha256
          (base32 "16vikb3fy8rmk10sg5g0gy2c343hi3x7zccsga90ssnkzpq6m032"))))
    (build-system cmake-build-system)
    (arguments '(#:tests? #f)) ; There are no tests
    (native-inputs
      (list pkg-config cmake))
    (inputs
      (list qtbase-5 coin3D))
    (home-page "https://github.com/coin3d/soqt")
    (synopsis "Qt GUI component toolkit library for Coin")
    (description "SoQt is a Qt GUI component toolkit library for Coin.  It is
also compatible with SGI and TGS Open Inventor, and the API is based on the API
of the InventorXt GUI component toolkit.")
    (license license:bsd-3))))

(define-public libdbusmenu-qt
  (package
    (name "libdbusmenu-qt")
    (version "0.9.3+16.04.20160218-0ubuntu1")
    (source
     (origin
       (method git-fetch)
       ;; Download from github rather than launchpad because launchpad trunk
       ;; tarball hash is not deterministic.
       (uri (git-reference
             (url "https://github.com/unity8-team/libdbusmenu-qt")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0b7ii1cvmpcyl79gqal9c3va9m55h055s4hx7fpxkhhqs9463ggg"))))
    (build-system cmake-build-system)
    (arguments
     ;; XXX: Tests require a dbus session and some icons.
     '(#:tests? #f))
    (native-inputs
     (list doxygen))
    (inputs
     (list qtbase-5))
    (home-page "https://launchpad.net/libdbusmenu-qt")
    (synopsis "Qt implementation of the DBusMenu spec")
    (description "This library provides a Qt implementation of the DBusMenu
protocol.  The DBusMenu protocol makes it possible for applications to export
and import their menus over DBus.")
    (license license:lgpl2.1+)))

(define-public kdsoap
  (package
    (name "kdsoap")
    (version "2.0.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/KDAB/KDSoap/releases/download/"
                           "kdsoap-" version "/kdsoap-" version ".tar.gz"))
       (sha256
        (base32
         "1vh4rzb09kks1ilay1y60q7gf64gwzdwsca60hmx1xx69w8672fi"))))
    (build-system qt-build-system)
    (inputs `(("qtbase" ,qtbase-5)))
    (arguments
     '(#:configure-flags '("-DKDSoap_TESTS=true")
       #:phases
       (modify-phases %standard-phases
         (replace 'check
           (lambda* (#:key tests? #:allow-other-keys)
             (when tests?
               (invoke "ctest" "-E" ;; These tests try connect to the internet.
                       "(kdsoap-webcalls|kdsoap-webcalls_wsdl|kdsoap-test_calc)")))))))
    (home-page "https://www.kdab.com/development-resources/qt-tools/kd-soap/")
    (synopsis "Qt SOAP component")
    (description "KD SOAP is a tool for creating client applications for web
services using the XML based SOAP protocol and without the need for a dedicated
web server.")
    (license (list license:gpl2 license:gpl3))))

(define-public libaccounts-qt
  (package
    (name "libaccounts-qt")
    (version "1.16")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/accounts-sso/libaccounts-qt")
                    (commit (string-append "VERSION_" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1vmpjvysm0ld8dqnx8msa15hlhrkny02cqycsh4k2azrnijg0xjz"))))
    (build-system gnu-build-system)
    (arguments
     (list #:tests? #f                  ;TODO
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda _
                   (substitute* "tests/tst_libaccounts.pro"
                     (("QMAKE_RPATHDIR = \\$\\$\\{QMAKE_LIBDIR\\}")
                      (string-append "QMAKE_RPATHDIR ="
                                     #$output "/lib")))
                   (invoke "qmake"
                           (string-append "PREFIX=" #$output)
                           (string-append "LIBDIR=" #$output "/lib")))))))
    ;; * SignOnQt5 (required version >= 8.55), D-Bus service which performs
    ;; user authentication on behalf of its clients,
    ;; <https://gitlab.com/accounts-sso/signond>
    (native-inputs (list doxygen pkg-config qtbase-5 qttools-5))
    (inputs (list glib signond libaccounts-glib))
    (home-page "https://accounts-sso.gitlab.io/")
    (synopsis "Qt5 bindings for libaccounts-glib")
    (description
     "Accounts SSO is a framework for application developers who
wish to acquire, use and store web account details and credentials.  It
handles the authentication process of an account and securely stores the
credentials and service-specific settings.")
    (license license:lgpl2.1+)))

(define-public libsignon-glib
  (package
    (name "libsignon-glib")
    (version "2.1")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/accounts-sso/libsignon-glib")
                    (commit (string-append "VERSION_" version))
                    (recursive? #t)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0gnx9gqsh0hcfm1lk7w60g64mkn1iicga5f5xcy1j9a9byacsfd0"))))
    (build-system meson-build-system)
    (arguments
     (list #:tests? #f                  ;TODO: ninja: no work to do.
           #:imported-modules `((guix build python-build-system)
                                ,@%meson-build-system-modules)
           #:modules '(((guix build python-build-system)
                        #:select (python-version))
                       (guix build meson-build-system)
                       (guix build utils))
           #:configure-flags
           #~(list "-Dtests=true"
                   (string-append "-Dpy-overrides-dir="
                                  #$output "/lib/python"
                                  (python-version #$(this-package-input
                                                     "python"))
                                  "/site-packages/gi/overrides"))))
    (native-inputs (list dbus
                         dbus-test-runner
                         `(,glib "bin")
                         gobject-introspection
                         gtk-doc
                         pkg-config
                         vala))
    (inputs (list check signond python python-pygobject))
    (propagated-inputs (list glib))
    (home-page "https://accounts-sso.gitlab.io/libsignon-glib/")
    (synopsis "Single signon authentication library for GLib applications")
    (description
     "This package provides single signon authentication library for
GLib applications.")
    (license license:lgpl2.1+)))

(define-public packagekit-qt5
  (package
    (name "packagekit-qt5")
    (version "1.0.2")
    (source (origin
              (method git-fetch)
			  (uri (git-reference
			  (url "https://github.com/hughsie/PackageKit-Qt")
			  (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1d20r503msw1vix3nb6a8bmdqld7fj8k9jk33bkqsc610a2zsms6"))))
    (build-system cmake-build-system)
    (arguments '(#:tests? #f))          ;no test suite
    (native-inputs (list pkg-config))
    (inputs (list packagekit qtbase-5))
    (home-page "https://www.freedesktop.org/software/PackageKit/pk-intro.html")
    (synopsis "Qt5 bindings for PackageKit")
    (description "Provides Qt5 bindings to PackageKit which is a DBUS
abstraction layer that allows the session user to manage packages in
a secure way.")
    (license license:lgpl2.1+)))

(define-public signond
  (package
    (name "signond")
    (version "8.61")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://gitlab.com/accounts-sso/signond")
                    (commit (string-append "VERSION_" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0k6saz5spys4a4p6ws0ayrjks2gqdqvz7zfmlhdpz5axha0gbqq4"))))
    (build-system qt-build-system)
    (native-inputs (list doxygen pkg-config qtbase-5 qttools-5))
    (inputs (list dbus glib libaccounts-glib))
    (arguments
     (list #:tests? #f                  ; Figure out how to run tests
           #:phases
           #~(modify-phases %standard-phases
               (delete 'validate-runpath)
               (replace 'configure
                 (lambda _
                   (substitute* "src/signond/signond.pro"
                     (("/etc/")
                      (string-append #$output "/etc/")))
                   (substitute*
                       '("tests/extensions/extensions.pri"
                         "tests/signond-tests/mock-ac-plugin/plugin.pro"
                         "tests/signond-tests/identity-tool.pro"
                         "tests/signond-tests/mock-ac-plugin/identity-ac-helper.pro"
                         "tests/libsignon-qt-tests/libsignon-qt-tests.pro"
                         "tests/signond-tests/signond-tests.pri")
                     (("QMAKE_RPATHDIR = \\$\\$\\{QMAKE_LIBDIR\\}")
                      (string-append "QMAKE_RPATHDIR = "
                                     #$output "/lib:"
                                     #$output "/lib/signon")))
                   (invoke "qmake"
                           (string-append "PREFIX=" #$output)
                           (string-append "LIBDIR=" #$output "/lib")))))))
    (home-page "https://accounts-sso.gitlab.io/signond/index.html")
    (synopsis "Perform user authentication over D-Bus")
    (description "This package provides a D-Bus service which performs user
authentication on behalf of its clients.")
    (license license:lgpl2.1+)))

(define-public signon-plugin-oauth2
  (package
    (name "signon-plugin-oauth2")
    (version "0.25")
    (home-page "https://gitlab.com/accounts-sso/signon-plugin-oauth2")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url home-page)
                    (commit (string-append "VERSION_" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "16aslnyk8jdg03zcg97rp6qzd0gmclj14hyhliksz8jgfz1l0w7c"))))
    (build-system qt-build-system)
    (native-inputs (list doxygen pkg-config))
    (inputs (list signond))
    (arguments
     (list #:tests? #f                  ;no tests
           #:make-flags #~(list (string-append "INSTALL_ROOT=" #$output))
           #:phases
           #~(modify-phases %standard-phases
               (replace 'configure
                 (lambda _
                   (substitute* "common-project-config.pri"
                     (("-Werror")
                      ""))
                   (invoke "qmake"
                           (string-append "PREFIX=" #$output)
                           (string-append "LIBDIR=" #$output "/lib")))))))
    (synopsis "OAuth 2 plugin for signon")
    (description
     "This plugin for the Accounts-SSO SignOn daemon handles the OAuth
1.0 and 2.0 authentication protocols.")
    (license license:lgpl2.1+)))

(define-public clazy
  (package
    (name "clazy")
    (version "1.11")
    (source (origin
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/KDE/clazy")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1y0n1jknq566z1rifkgdm1yqb0mw564lp51jidfz7q9w91spijci"))))
    (build-system cmake-build-system)
    (native-inputs (list python))
    (inputs (list clang llvm))
    (home-page "https://github.com/KDE/clazy/")
    (synopsis "Qt-oriented static code analyzer")
    (description "clazy is a compiler plugin which allows @command{clang} to
understand Qt semantics.  It can emit more than fifty (50) Qt-related compiler
warnings, ranging from unneeded memory allocations to misuses of the API,
including @i{fix-its} for automatic refactoring.")
    (license license:lgpl2.0+)))

(define-public qt-creator
  (package
    (name "qt-creator")
    (version "11.0.1")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "mirror://qt/qtcreator/"
                    (version-major+minor version) "/" version
                    "/qt-creator-opensource-src-" version ".tar.gz"))
              (modules '((guix build utils)))
              (snippet '(begin
                          (for-each
                           delete-file-recursively
                           ;; Remove bundled libraries, where supported.
                           ;; TODO: package and unbundle litehtml
                           '("src/libs/3rdparty/yaml-cpp"
                             "tests/unit/unittest/3rdparty"
                             ;; Marketplace recommends nonfree extensions;
                             ;; remove it.
                             "src/plugins/marketplace"))
                          (substitute* "src/plugins/CMakeLists.txt"
                            (("add_subdirectory\\(marketplace).*") ""))
                          (substitute* "src/plugins/plugins.qbs"
                            ((".*marketplace/marketplace.qbs.*") ""))))
              (sha256
               (base32
                "0j90dv9micqsvj4r7iqd11szixr0mlpna4w5s2lnyqckjs6a0mm6"))))
    (build-system qt-build-system)
    (arguments
     (list
      #:qtbase qtbase
      #:configure-flags
      #~(list "-DWITH_DOCS=ON"
              "-DBUILD_DEVELOPER_DOCS=ON"
              "-DCMAKE_VERBOSE_MAKEFILE=ON"
              "-DWITH_TESTS=ON"
              ;; Extend the RUNPATH with lib/qtcreator, which contains
              ;; multiple shared objects.
              (string-append "-DCMAKE_SHARED_LINKER_FLAGS=-Wl,-rpath="
                             #$output "/lib/qtcreator"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'patch-paths
            (lambda* (#:key inputs #:allow-other-keys)
              (substitute* '("src/libs/utils/commandline.cpp"
                             "src/libs/utils/deviceshell.cpp")
                (("/bin/sh")
                 (search-input-file inputs "bin/sh")))
              (substitute* "src/libs/utils/process.cpp"
                (("/usr/bin/env")
                 (search-input-file inputs "bin/env")))
              (substitute* '("tests/auto/utils/process/tst_process.cpp"
                             "tests/auto/utils/commandline/tst_commandline.cpp")
                (("/bin/sh")
                 (which "sh")))))
          (add-before 'build 'build-doc
            (lambda _
              (invoke "cmake" "--build" "." "--target=docs" "-v")))
          (add-after 'build-doc 'install-doc
            (lambda _
              (invoke "cmake" "--install" "." "--prefix" #$output
                      "--component=qch_docs")
              (invoke "cmake" "--install" "." "--prefix" #$output
                      "--component=html_docs")))
          (replace 'check
            (lambda* (#:key tests? parallel-tests? #:allow-other-keys)
              (when tests?
                (invoke "xvfb-run"      ;for the 'renderpass' tests
                        "ctest" "-j" (if parallel-tests?
                                         (number->string (parallel-job-count))
                                         "1")
                        "--label-exclude" "exclude_from_precheck"
                        "-E"
                        (string-append
                         "("
                         (string-join
                          (list
                           ;; The performance data tests require external
                           ;; data.
                           "tst_perfdata"
                           ;; This test relies on counting processes, counts
                           ;; only 0 of them instead of 5 for unknown reasons
                           ;; (see:
                           ;; https://bugreports.qt.io/browse/QTCREATORBUG-29495).
                           "tst_process") "|")
                         ")")))))
          (add-after 'qt-wrap 'wrap-bin
            ;; Make a few well-integrated tools readily available.
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (wrap-program (search-input-file outputs "bin/qtcreator")
                `("PATH" suffix ,(map (lambda (c)
                                        (dirname (search-input-file inputs c)))
                                      '("bin/clang-tidy"
                                        "bin/clazy-standalone"
                                        "bin/gdb"
                                        "bin/valgrind")))))))))
    (native-inputs
     (list googletest
           pkg-config
           python
           qttools
           qttranslations
           vulkan-headers
           xvfb-run))
    (inputs
     (list bash-minimal
           coreutils-minimal
           clang
           clazy
           elfutils
           gdb
           libxkbcommon
           llvm
           qt5compat
           qtdeclarative
           qtshadertools
           qtsvg
           yaml-cpp
           valgrind
           vulkan-loader
           `(,zstd "lib")))
    (home-page "https://www.qt.io/")
    (synopsis "Integrated development environment (IDE) for Qt")
    (description "Qt Creator is an IDE tailored to the needs of Qt developers.
It includes features such as an advanced code editor, a visual debugger and a
@acronym{GUI, Graphical User Interface} designer.")
    (license license:gpl3+)))           ;with the Qt Company GPL Exception 1.0

;;;
;;; Avoid adding new packages to the end of this file. To reduce the chances
;;; of a merge conflict, place them above by existing packages with similar
;;; functionality or similar names.
;;;
