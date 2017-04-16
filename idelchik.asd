;;;; idelchik.asd

(asdf:defsystem #:idelchik
  :description "Describe idelchik here"
  :author "Your Name <your.name@example.com>"
  :license "Specify license here"
  :depends-on (#:varghaftik #:areas #:half-div)
  :serial t
  :components ((:file "package")
               (:file "idelchik")
	       (:file "classes")
	       (:file "generics")	       
	       (:file "methods" :depends-on ("classes" "generics"))
       	       (:file "method-out" :depends-on ("classes" "generics"))
	       (:file "table_aproximate")
	       (:file "tubes")
	       (:file "part_1")
	       (:file "part_2")
	       (:file "part_3")
	       (:file "part_4")
	       (:file "part_5")
	       (:file "part_6")
	       (:file "part_7")
	       (:file "part_8")
	       (:file "part_9")
	       (:file "part_10")
	       (:file "part_11")
	       (:file "part_12")
      	       (:file "lambda")
	       (:file "elements" :depends-on ("classes" "generics" "methods" "method-out"))
      	       (:file "test" :depends-on ("methods"))))

