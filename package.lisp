;;;; package.lisp

(defpackage #:idelchik
  (:use #:cl #:half-div #:areas) 
  ;;(:import-from)
  (:export *part_01_doc* *part_02_doc* *part_03_doc* *part_04_doc*
	   *part_05_doc* *part_06_doc* *part_07_doc* *part_08_doc*
	   *part_09_doc* *part_10_doc* *part_11_doc* *part_12_doc*)
  (:export named gas parametrised vertex rib gidro-rib  element truba zabornik  metallorukav  perehod
	   forsunka  ugolnik vyxod vxod  troynik  teploobmennik  resiver  kompressor  valve  valve-obr)
  (:export make-rib-name make-gidro-rib)
  (:export forsunka-area)

  (:export μ   ; - Возвращает молекулярную массу газа
	   k   ; - Возвращает коэффициент адиабаты газа
	   ρ   ; - Возвращает плоотность газа
	   η   ; - Возвращает коэффициент динамической вязкости газа
	   ν   ; - Возвращает коэффициент кинематической вязкости газа
	   mass-flow-rate	; - массовый расход газа через насадок
	   area-by-Mass-flow-rate ; - площадь насадка по массовому расходу
	   param_in-by-Mass-flow-rate	; - давление перед насадком
	   )

  (:export pressure tempreche)
  (:export table_aproximate ;; - аппроксимация табличных значений
	   ) 
  )

;;;;(declaim (optimize (space 0) (compilation-speed 0)  (speed 0) (safety 3) (debug 3)))
