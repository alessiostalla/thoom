(in-package :thoom)

(defvar *basetime* nil)

(defun get-time ()
  (let ((t (get-internal-real-time)))
    (unless *basetime*
      (setf *basetime* t))
    (/ (* +ticrate+ (- t *basetime*)) internal-time-units-per-second)))
