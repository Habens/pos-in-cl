;;;; pos-in-cl.asd

(asdf:defsystem #:pos-in-cl
  :description "pos in cl"
  :author "Wenjie Chen <right.jie@gmail.com>"
  :license ""
  :serial t
  :components ((:file "package")
               (:file "pos-in-cl")
               (:module "src"
                       :components
                       ((:file "parser")))))

