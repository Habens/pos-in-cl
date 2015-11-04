(in-package #:pos-in-cl-test)

(subtest "get cost of good with promotion"
  (is 90 (cost 10 10 (make-instance 'Discount :percent 90)))
  (is 75 (cost 10 10 (make-instance 'SecondHalfPrice))))
