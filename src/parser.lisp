(in-package :parser)

(defun parse (str token)
  (let ((token (position token str)))
    (if token (values
               (subseq str 0 token)
               (parse-integer (subseq str (1+ token) (length str)))) (values str 1))))

(defun key-value-mapping (pathname token)
  (defparameter key-value-map (make-hash-table :test 'equal))
  (with-open-file (file pathname :direction :input)
    (loop for line = (read-line file nil)
       while line do
         (multiple-value-bind (key value) (parse line token)
           (let ((old-value (gethash key key-value-map)))
             (setf (gethash key key-value-map) (if old-value (+ old-value value) value)))))
    (close file))
  key-value-map)

(defun line-list (pathname)
  (defparameter lines nil)
  (with-open-file (file pathname :direction :input)
    (loop for line = (read-line file nil)
       while line do
         (setf lines (cons line lines)))
    (close file))
  lines)
