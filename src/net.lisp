(in-package :thoom)

(defvar *oldentertics* nil)
(defvar *ticdup* nil)

(defun try-run-tics ()
  (let (i lowtic (entertic (/ (get-time) *ticdup*)) realtics availabletics counts numplaying)))
