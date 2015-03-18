; Auto-generated. Do not edit!


(cl:in-package aristarko-srv)


;//! \htmlinclude rate_service-request.msg.html

(cl:defclass <rate_service-request> (roslisp-msg-protocol:ros-message)
  ((rate
    :reader rate
    :initarg :rate
    :type cl:integer
    :initform 0))
)

(cl:defclass rate_service-request (<rate_service-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rate_service-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rate_service-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name aristarko-srv:<rate_service-request> is deprecated: use aristarko-srv:rate_service-request instead.")))

(cl:ensure-generic-function 'rate-val :lambda-list '(m))
(cl:defmethod rate-val ((m <rate_service-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aristarko-srv:rate-val is deprecated.  Use aristarko-srv:rate instead.")
  (rate m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rate_service-request>) ostream)
  "Serializes a message object of type '<rate_service-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'rate)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'rate)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rate_service-request>) istream)
  "Deserializes a message object of type '<rate_service-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'rate)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'rate)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rate_service-request>)))
  "Returns string type for a service object of type '<rate_service-request>"
  "aristarko/rate_serviceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rate_service-request)))
  "Returns string type for a service object of type 'rate_service-request"
  "aristarko/rate_serviceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rate_service-request>)))
  "Returns md5sum for a message object of type '<rate_service-request>"
  "e2079609cc0d84210a175117b44fa8b1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rate_service-request)))
  "Returns md5sum for a message object of type 'rate_service-request"
  "e2079609cc0d84210a175117b44fa8b1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rate_service-request>)))
  "Returns full string definition for message of type '<rate_service-request>"
  (cl:format cl:nil "~%uint32 rate~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rate_service-request)))
  "Returns full string definition for message of type 'rate_service-request"
  (cl:format cl:nil "~%uint32 rate~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rate_service-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rate_service-request>))
  "Converts a ROS message object to a list"
  (cl:list 'rate_service-request
    (cl:cons ':rate (rate msg))
))
;//! \htmlinclude rate_service-response.msg.html

(cl:defclass <rate_service-response> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass rate_service-response (<rate_service-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rate_service-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rate_service-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name aristarko-srv:<rate_service-response> is deprecated: use aristarko-srv:rate_service-response instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rate_service-response>) ostream)
  "Serializes a message object of type '<rate_service-response>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rate_service-response>) istream)
  "Deserializes a message object of type '<rate_service-response>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rate_service-response>)))
  "Returns string type for a service object of type '<rate_service-response>"
  "aristarko/rate_serviceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rate_service-response)))
  "Returns string type for a service object of type 'rate_service-response"
  "aristarko/rate_serviceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rate_service-response>)))
  "Returns md5sum for a message object of type '<rate_service-response>"
  "e2079609cc0d84210a175117b44fa8b1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rate_service-response)))
  "Returns md5sum for a message object of type 'rate_service-response"
  "e2079609cc0d84210a175117b44fa8b1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rate_service-response>)))
  "Returns full string definition for message of type '<rate_service-response>"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rate_service-response)))
  "Returns full string definition for message of type 'rate_service-response"
  (cl:format cl:nil "~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rate_service-response>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rate_service-response>))
  "Converts a ROS message object to a list"
  (cl:list 'rate_service-response
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'rate_service)))
  'rate_service-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'rate_service)))
  'rate_service-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rate_service)))
  "Returns string type for a service object of type '<rate_service>"
  "aristarko/rate_service")