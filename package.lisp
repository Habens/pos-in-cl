(defpackage parser
  (:use #:cl)
  (:export :parse
           :key-value-mapping
           :line-list))

(defpackage promotion
  (:use #:cl)
  (:export :Promotion
           :Discount
           :SecondHalfPrice
           :cost))

(defpackage #:pos-in-cl
  (:use #:cl
        :parser
        :promotion))
