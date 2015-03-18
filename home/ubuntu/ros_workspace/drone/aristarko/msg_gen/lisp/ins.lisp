; Auto-generated. Do not edit!


(cl:in-package aristarko-msg)


;//! \htmlinclude ins.msg.html

(cl:defclass <ins> (roslisp-msg-protocol:ros-message)
  ((RPY
    :reader RPY
    :initarg :RPY
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (LLA
    :reader LLA
    :initarg :LLA
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (Vel
    :reader Vel
    :initarg :Vel
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass ins (<ins>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ins>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ins)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name aristarko-msg:<ins> is deprecated: use aristarko-msg:ins instead.")))

(cl:ensure-generic-function 'RPY-val :lambda-list '(m))
(cl:defmethod RPY-val ((m <ins>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aristarko-msg:RPY-val is deprecated.  Use aristarko-msg:RPY instead.")
  (RPY m))

(cl:ensure-generic-function 'LLA-val :lambda-list '(m))
(cl:defmethod LLA-val ((m <ins>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aristarko-msg:LLA-val is deprecated.  Use aristarko-msg:LLA instead.")
  (LLA m))

(cl:ensure-generic-function 'Vel-val :lambda-list '(m))
(cl:defmethod Vel-val ((m <ins>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aristarko-msg:Vel-val is deprecated.  Use aristarko-msg:Vel instead.")
  (Vel m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ins>) ostream)
  "Serializes a message object of type '<ins>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'RPY) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'LLA) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'Vel) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ins>) istream)
  "Deserializes a message object of type '<ins>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'RPY) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'LLA) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'Vel) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ins>)))
  "Returns string type for a message object of type '<ins>"
  "aristarko/ins")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ins)))
  "Returns string type for a message object of type 'ins"
  "aristarko/ins")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ins>)))
  "Returns md5sum for a message object of type '<ins>"
  "ce9d7721509359b6db4409d7f333bf4b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ins)))
  "Returns md5sum for a message object of type 'ins"
  "ce9d7721509359b6db4409d7f333bf4b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ins>)))
  "Returns full string definition for message of type '<ins>"
  (cl:format cl:nil "geometry_msgs/Vector3 RPY~%geometry_msgs/Vector3 LLA~%geometry_msgs/Vector3 Vel~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ins)))
  "Returns full string definition for message of type 'ins"
  (cl:format cl:nil "geometry_msgs/Vector3 RPY~%geometry_msgs/Vector3 LLA~%geometry_msgs/Vector3 Vel~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ins>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'RPY))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'LLA))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'Vel))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ins>))
  "Converts a ROS message object to a list"
  (cl:list 'ins
    (cl:cons ':RPY (RPY msg))
    (cl:cons ':LLA (LLA msg))
    (cl:cons ':Vel (Vel msg))
))
