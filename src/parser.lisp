(in-package #:pos-in-cl)

(defun parse (str token)
  (let ((token (position token str)))
    (if token (values
               (subseq str 0 token)
               (subseq str (1+ token) (length str))) str)))
