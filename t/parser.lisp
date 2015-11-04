(in-package #:pos-in-cl-test)

(subtest "parse str to values"
  (let (id num)
    (progn
      (is (multiple-value-bind (id num) (parse "ITEM000001:1" #\:) (list id num)) (list "ITEM000001" 1))
      (is (multiple-value-bind (id num) (parse "ITEM000003-2" #\-) (list id num)) (list "ITEM000003" 2))
      (is (multiple-value-bind (id num) (parse "ITEM000005" #\:) (list id num)) (list "ITEM000005" 1)))))

(subtest "key value mapping"
  (let ((key-value-map (key-value-mapping "t/resources/discount_promotion.txt" #\:)))
    (progn
      (is (gethash "ITEM000001" key-value-map) 75)
      (is (gethash "ITEM000005" key-value-map) 90))))

(subtest "line list"
  (let ((line-list (line-list "t/resources/second_half_price_promotion.txt")))
    (is (first line-list) "ITEM000003")
    (is (second line-list) "ITEM000001")))
