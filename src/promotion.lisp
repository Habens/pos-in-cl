(in-package :promotion)

(defclass Promotion () ())

(defgeneric cost (price number promotion)
  (:documentation "the cost generic method"))


(defclass Discount (Promotion)
  ((percent :initarg :percent :initform 100 :type number :accessor discount-percent)))

(defmethod cost (price number (promotion Discount))
  (* price number (/ (discount-percent promotion) 100)))



(defclass SecondHalfPrice (Promotion) ())

(defmethod cost (price number (promotion SecondHalfPrice))
  (- (* price number) (* (/ price 2) (floor (/ number 2)))))
