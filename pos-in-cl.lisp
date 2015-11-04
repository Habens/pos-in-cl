(in-package #:pos-in-cl)

(defparameter id-price-map (key-value-mapping "resources/id_price.txt" #\:))

(defparameter id-discount-map (key-value-mapping "resources/discount_promotion.txt" #\:))

(defparameter id-promotions-map (make-hash-table :test 'equal))
(maphash #'(lambda (id percent)
             (push (make-instance 'Discount :percent percent) (gethash id id-promotions-map)))
         id-discount-map)

(defparameter ids-of-secondHalfPrice (line-list "resources/second_half_price_promotion.txt"))
(mapcar #'(lambda (id)
            (push (make-instance 'SecondHalfPrice) (gethash id id-promotions-map)))
        ids-of-secondhalfprice)

(format t "for test ***********~%")
(maphash #'(lambda (id promotions)
             (format t "~A ~A~%" id promotions))
         id-promotions-map)
(format t "for test ***********~%")

(defun checkout (price num &optional promotions)
  (let ((sub-cost (* price num)))
    (progn
      (dolist (promotion promotions)
        (setf sub-cost (cost (/ sub-cost num) num promotion)))
      (float sub-cost))))

(defparameter id-amount-map (key-value-mapping "resources/cart.txt" #\-))

(format t "id price:~%")
(maphash #'(lambda (id price) (format t "~A : ~A~%" id price)) id-price-map)

(format t "~%id discount map:~%")
(maphash #'(lambda (k v)
             (format t "~A : ~A~%" k v)) id-discount-map)

(format t "~%id list of second half price:~%")
(mapcar #'(lambda (id) (format t "~A~%" id)) ids-of-secondHalfPrice)

(format t "~%shopping cart:~%")
(maphash #'(lambda (k v)
             (format t "~A - ~A~%" k v)) id-amount-map)

(defparameter cost 0)
(format t "Subject:~%")
(maphash #'(lambda (id amount)
             (let ((subject (checkout (gethash id id-price-map)
                                      amount
                                      (gethash id id-promotions-map))))
               (progn
                 (format t "~A -> ~A~%" id subject)
                 (setf cost (+ cost subject))))) id-amount-map)
(format t "Total: ~A~%" cost)
