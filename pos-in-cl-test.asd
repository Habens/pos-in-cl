
(asdf:defsystem #:pos-in-cl-test
    :description "pos-in-cl test system"
    :author "Habens Chen <your.name@example.com>"
    :license ""
    :serial t
    :depends-on (#:pos-in-cl
                 :prove)
    :components ((:file "package-test")
                 (:module "t"
                          :components
                          ((:file "parser")
                           (:file "promotion")))))

