; Auto-generated. Do not edit!


(cl:in-package aristarko-msg)


;//! \htmlinclude ins_info.msg.html

(cl:defclass <ins_info> (roslisp-msg-protocol:ros-message)
  ((GPSFIX
    :reader GPSFIX
    :initarg :GPSFIX
    :type cl:fixnum
    :initform 0)
   (INSTATUS
    :reader INSTATUS
    :initarg :INSTATUS
    :type cl:fixnum
    :initform 0)
   (INSGPS
    :reader INSGPS
    :initarg :INSGPS
    :type cl:fixnum
    :initform 0))
)

(cl:defclass ins_info (<ins_info>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ins_info>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ins_info)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name aristarko-msg:<ins_info> is deprecated: use aristarko-msg:ins_info instead.")))

(cl:ensure-generic-function 'GPSFIX-val :lambda-list '(m))
(cl:defmethod GPSFIX-val ((m <ins_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aristarko-msg:GPSFIX-val is deprecated.  Use aristarko-msg:GPSFIX instead.")
  (GPSFIX m))

(cl:ensure-generic-function 'INSTATUS-val :lambda-list '(m))
(cl:defmethod INSTATUS-val ((m <ins_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aristarko-msg:INSTATUS-val is deprecated.  Use aristarko-msg:INSTATUS instead.")
  (INSTATUS m))

(cl:ensure-generic-function 'INSGPS-val :lambda-list '(m))
(cl:defmethod INSGPS-val ((m <ins_info>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aristarko-msg:INSGPS-val is deprecated.  Use aristarko-msg:INSGPS instead.")
  (INSGPS m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ins_info>) ostream)
  "Serializes a message object of type '<ins_info>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'GPSFIX)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'INSTATUS)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'INSGPS)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ins_info>) istream)
  "Deserializes a message object of type '<ins_info>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'GPSFIX)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'INSTATUS)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'INSGPS)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ins_info>)))
  "Returns string type for a message object of type '<ins_info>"
  "aristarko/ins_info")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ins_info)))
  "Returns string type for a message object of type 'ins_info"
  "aristarko/ins_info")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ins_info>)))
  "Returns md5sum for a message object of type '<ins_info>"
  "44d660226d6727b18faf15d28959495c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ins_info)))
  "Returns md5sum for a message object of type 'ins_info"
  "44d660226d6727b18faf15d28959495c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ins_info>)))
  "Returns full string definition for message of type '<ins_info>"
  (cl:format cl:nil "uint8 GPSFIX~%uint8 INSTATUS~%uint8 INSGPS~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ins_info)))
  "Returns full string definition for message of type 'ins_info"
  (cl:format cl:nil "uint8 GPSFIX~%uint8 INSTATUS~%uint8 INSGPS~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ins_info>))
  (cl:+ 0
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ins_info>))
  "Converts a ROS message object to a list"
  (cl:list 'ins_info
    (cl:cons ':GPSFIX (GPSFIX msg))
    (cl:cons ':INSTATUS (INSTATUS msg))
    (cl:cons ':INSGPS (INSGPS msg))
))
