(use-modules
 ((guix licenses) #:prefix license:)
 (gnu packages algebra)
 (gnu packages documentation)
 (gnu packages image)
 (gnu packages maths)
 (guix build-system cmake)
 (guix download)
 (guix gexp)
 (guix git-download)
 (guix packages)
 (guix utils))

(define vcs-file?
  ;; Return true if the given file is under version control.
  (or (git-predicate (current-source-directory))
      (const #t)))

(define-public vigra-c
  (package
    (name "vigra-c")
    (version "0.0.0")
    (home-page "https://github.com/wehlutyk/vigra-c")
    (source (local-file "." "vigra-c-checkout"
                        #:recursive? #t
                        #:select? vcs-file?))
    (build-system cmake-build-system)
    (arguments
     `(#:tests? #f))                  ; No test target.
    (native-inputs
     (list doxygen))
    (inputs
     (list fftw fftwf hdf5 vigra))
    (synopsis "C interface to the VIGRA computer vision library")
    (description
     "This package provides a C interface to the VIGRA C++ computer vision
library.  It is designed primarily to ease the implementation of higher-level
language bindings to VIGRA.")
    (license license:expat)))

vigra-c
