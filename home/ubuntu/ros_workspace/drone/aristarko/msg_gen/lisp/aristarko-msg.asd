
(cl:in-package :asdf)

(defsystem "aristarko-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "ins" :depends-on ("_package_ins"))
    (:file "_package_ins" :depends-on ("_package"))
    (:file "ins_info" :depends-on ("_package_ins_info"))
    (:file "_package_ins_info" :depends-on ("_package"))
  ))