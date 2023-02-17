
;;;; idelchik.asd

(defsystem "idelchik"
  :description "@b(Описание:) система @b(idelchik) предоставляет некоторые
формулы монографии Идельчика по расчету гидравлических сопротивлений"
  :author "Mykola Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"  
  :depends-on ("varghaftik" "areas" "math/half-div")
  :serial nil
  :components
  ((:module "src" 
    :serial nil
    :components
    ((:file "idelchik")
     (:file "elements" :depends-on ("idelchik"))
     (:file "test"     :depends-on ("idelchik"))))))


(defsystem #:idelchik/docs
  :description "@b(Описание:) система @b(idelchik/docs) для создания документации."
  :author "Mykola Matvyeyev <mnasoft@gmail.com>"
  :license "GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007 or later"  
  :depends-on ("idelchik" "mnas-package" "codex"))
