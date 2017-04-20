;;;; package.lisp

(defpackage #:idelchik
  (:use #:cl #:half-div #:areas) 
  ;;(:use #:half-div)
  ;;(:import-from)
  (:export part_1_doc)
  (:export part_2_doc)
  (:export part_3_doc)
  (:export part_4_doc)
  (:export part_5_doc)
  (:export part_6_doc)
  (:export part_7_doc)
  (:export part_8_doc)
  (:export part_9_doc)
  (:export part_10_doc)
  (:export part_11_doc)
  (:export part_12_doc)
  (:export forsunka)
  (:export μ ;; - Возвращает молекулярную массу газа
	   k ;; - Возвращает коэффициент адиабаты газа
	   ρ ;; - Возвращает плоотность газа
	   η ;; - Возвращает коэффициент динамической вязкости газа
	   ν ;; - Возвращает коэффициент кинематической вязкости газа
	   )
  (:export named
	   )
  (:export gas
	   parametrised pressure tempreche
	   )
  (:export vertex
	   rib
	   )
  (:export gidro-rib
	   element
	   truba
	   zabornik
	   metallorukav
	   perehod
	   forsunka
	   ugolnik
	   vyxod
	   vxod
	   troynik
	   teploobmennik
	   resiver
	   kompressor
	   valve
	   valve-obr
	   )
  (:export table_aproximate ;; - аппроксимация табличных значений
	   param_in-by-mass-flow-rate
	   ) 
  )

;;;;(declaim (optimize (space 0) (compilation-speed 0)  (speed 0) (safety 3) (debug 3)))
