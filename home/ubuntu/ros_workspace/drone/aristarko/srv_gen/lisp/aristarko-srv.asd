
(cl:in-package :asdf)

(defsystem "aristarko-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "rate_service" :depends-on ("_package_rate_service"))
    (:file "_package_rate_service" :depends-on ("_package"))
  ))