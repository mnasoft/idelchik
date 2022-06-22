
;;;; idelchik.asd

(defsystem "idelchik"
  :description "@b(Описание:) система @b(idelchik) предоставляет некоторые
формулы монографии Идельчика по расчету гидравлических сопротивлений"
  :author "Mykola Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"  
  :depends-on ("varghaftik" "areas" "half-div")
  :serial nil
  :components
  ((:file "package")
   (:module "src" :depends-on ("package")
    :serial nil
    :components
    ((:file "idelchik")
     (:file "classes")
     (:file "generics")	       
     (:file "methods" :depends-on ("classes" "generics"))
     (:file "method-out" :depends-on ("classes" "generics"))
     (:file "table_aproximate")
     (:file "tubes")
     (:file "part_01")
     (:file "part_02")
     (:file "part_03")
     (:file "part_04")
     (:file "part_05")
     (:file "part_06")
     (:file "part_07")
     (:file "part_08")
     (:file "part_09")
     (:file "part_10")
     (:file "part_11")
     (:file "part_12")
     (:file "lambda")
     (:file "elements" :depends-on ("classes" "generics" "methods" "method-out"))
     (:file "test" :depends-on ("methods"))))))


(defsystem #:idelchik/docs
  :description "@b(Описание:) система @b(idelchik/docs) для создания документации."
  :author "Mykola Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"  
  :depends-on ("idelchik" "mnas-package" "codex"))
