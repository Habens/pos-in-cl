
(asdf:defsystem #:pos-in-cl
    :description "pos in cl"
    :author "Wenjie Chen <right.jie@gmail.com>"
    :license ""
    :serial t
    :components ((:file "package")
                 (:module "src"
                          :components
                          ((:file "parser")
                           (:file "promotion")))
                 (:file "pos-in-cl")))
