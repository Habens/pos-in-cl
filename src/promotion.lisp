(in-package :promotion)

(defclass Promotion () ())


;;; older version
(defgeneric cost (price number promotion)
  (:documentation "the cost generic method"))




;;; new version
;; (defgeneric cost (good number promotion)
;;   (:documentation "the cost generic method"))


;; (defclass Discount (Promotion)
;;   ((id-discount-map :initarg :id-discount-map :type map :accessor id-discount-map)))

;; (defmethod cost ((good Good) number (promotion Discount))
;;   (* price number (/ (gethash (good-id good) (id-discount-map promotion)) 100)))



;; (defclass SecondHalfPrice (Promotion) ()
;;   ((id-list :initarg id-list :type list :accessor id-list)))

;; (defmethod cost ((good Good) number (promotion SecondHalfPrice))
;;   (- (* (good-price good) number) (* (/ (good-price good) 2) (floor (/ number 2)))))






;;; older version
(defclass Discount (Promotion)
  ((percent :initarg :percent :initform 100 :type number :accessor discount-percent)))

(defmethod cost (price number (promotion Discount))
  (* price number (/ (discount-percent promotion) 100)))



(defclass SecondHalfPrice (Promotion) ())

(defmethod cost (price number (promotion SecondHalfPrice))
  (- (* price number) (* (/ price 2) (floor (/ number 2)))))
