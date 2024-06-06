(asdf:defsystem #:stumpwm-themes
  :description "Themes menu for StumpWM"
  :author "Ilshad Khabibullin <astoon.net@gmail.com>"
  :license "GPL v3"
  :version "0.0.1"
  :serial t
  :depends-on (#:stumpwm #:alexandria)
  :components ((:file "package")
               (:file "stumpwm-themes")))
