(in-package #:pos-in-cl-test)

(plan 2)

(subtest "parse str to values"
  (is (parse "abc:def" #\:) (values "abc" "def"))
  (is (parse "abc-def" #\-) (values "abc" "def"))
  (is (parse "abc" #\:) "abc"))

(finalize)
