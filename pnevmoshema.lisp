;;;; pnevmoshema.lisp

(in-package #:idelchik)

;;; "idelchik" goes here. Hacks and glory await!

(defclass named ()
  ((name :accessor name
         :initarg :name
	 :initform ""
	 :documentation "Имя"))
  (:documentation "Представляет поименованый объект."))

(defclass gas (named)
  ()
  (:documentation "В параметре name задается наименование газа."))

(defclass parametrised ()
  ((pressure   :accessor pressure    :initarg :pressure  :initform 101325.0
	       :documentation "Абсолютное статическое давление [Па].")
   (tempreche  :accessor tempreche :initarg :tempreche :initform 273.15
	       :documentation "Абсолютная местная температура потока [К]"))
  (:documentation "Представляет параметры потока в данном месте сети."))

(defclass vertex (named parametrised)
  ()
  (:documentation "Представляет вершину графа."))

(defclass rib (named)
  ((v1 :accessor rib-v1 :initarg :v1 :initform "A"
       :documentation "Первая вершина ребра.")
   (v2 :accessor rib-v2 :initarg :v2 :initform "B"
       :documentation "Вторая вершина ребра."))
  (:documentation "Ребро графа"))

(defclass gidro-rib (rib)
  ((area1 :accessor gidro-rib-area1 :initarg :area1 :initform "A"
       :documentation "Первая площадь ребра.")
   (area2 :accessor gidro-rib-area2 :initarg :area2 :initform "B"
	  :documentation "Вторая площадь ребра.")
   (mass-flow-rate  :accessor gidro-rib-mass-flow-rate :initarg :v1 :initform "A"
       :documentation "Массовый расход среды, через проходящий через ребро. 
Положительное значение массового расхода соответствует движению от вершины v1 к вершине v2,
отрицательное - движению от вершины v2 к вершине v1.")))

(defclass element (named)
  ((num  :accessor num
	 :initarg :num
	 :initform 1.0
	 :documentation "Количество паралелных участков.")
   (vertexes :accessor vertexes
	     :initarg :vertexes
	     :initform '()
	     :documentation "Список вершин.")))

(defclass truba (element)
  ((diameter :accessor diameter :initarg :diameter :initform 1.0
	     :documentation "Диаметр трубы [м].")
   (len      :accessor len   :initarg :length   :initform 1.0
	     :documentation "Длина  трубы  [м]." )
   (delta    :accessor delta    :initarg :delta    :initform 20d-6
	     :documentation "Абсолютная высота микронеровностей [м]. Δ=4*Ra.")))

(defclass zabornik (element)
  ((diameter :accessor zabornik-diameter
	     :initarg :diameter
	     :initform 1.0
	     :documentation "Диаметр заборника в [м].")))

(defclass metallorukav (truba)
   ((gofra_hight :accessor metallorukav-gofra_hight
	     :initarg :gofra_hight
	     :initform 0.0025)))

(defclass perehod (element)
     ((diameter_1 :accessor diameter_1  :initarg  :diameter_1 :initform 1.0)
      (diameter_2 :accessor diameter_2  :initarg  :diameter_2 :initform 1.0)
      (len        :accessor len         :initarg  :len        :initform 1.0)))

(defclass forsunka (element)
  ((area :accessor area  :initarg  :area :initform 1.0)))

(defclass ugolnilk (truba)
  ((radius :accessor radius
	   :initarg :radius
	   :initform 1.0)
   (alfa :accessor alfa
	 :initarg :alfa
	 :initform 90.0)))

(defclass vyxod (element)
  ((diameter :accessor diameter :initarg :diameter :initform 1.0
	     :documentation "Диаметр трубы [м].")))

(defclass vxod (element)
  ((diameter :accessor diameter :initarg :diameter :initform 1.0
	     :documentation "Диаметр трубы [м].")))

(defclass troynik (element)
  ((diameter_1    :accessor troynik-diameter_1 :initarg :diameter_1 :initform 1.0)
   (alfa_1        :accessor troynik-alfa_1     :initarg :alfa_1     :initform 180.0)
   (diameter_2 :accessor troynik-diameter_2    :initarg :diameter_2 :initform 1.0)
   (alfa_2 :accessor troynik-alfa_2            :initarg :alfa_2     :initform 0.0)
   (diameter_3 :accessor troynik-diameter_3    :initarg :diameter_3 :initform 1.0)
   (alfa_3 :accessor troynik-alfa_3            :initarg :alfa_3     :initform 90.0))
  (:documentation "Представляет тройник. 
В его списке вершин последняя вершина - центр тройника;
первая, вторая и третья вершины соответствуют первому, второму и третьему отводам (подводам) тройника."))

(defclass teploobmennik(element)
  ())

(defclass resiver(element)
  ((diameter :accessor diameter :initarg :diameter :initform 1.0
	     :documentation "Диаметр трубы подвода и отвода [м].")))

(defclass kompressor(element)
  ())

(defclass valve (element)
  ())

(defclass valve-obr (element)
  ((diameter :accessor diameter :initarg :diameter :initform 1.0
	     :documentation "Условный диаметр [м].")))


(defmethod out ((x rib))
  (format T "~A->~A;~%" (rib-v1 x) (rib-v2 x)))

(defmethod out ((x named))
  (format T "~A" (Named-name x)))

(defmethod out ((x truba))
  (format nil "name=\"~A\", diameter=~A[m], len=~A[m] (~A ~A)~%"
	  (name x)
	  (diameter x)
	  (len x)
	  (nth 0 (vertexes x))
	  (nth 1 (vertexes x))
	  ))


(defmethod out ((x ugolnilk))
  (format T "name=\"~A\"~%" (named-name x))
  (format T "prev=\"~A\"~%" (linked-prev x))
  (format T "next=\"~A\"~%" (linked-next x))		  
  (format T "diameter=~A~%" (truba-diameter x))
  (format T "length=~A~%" (truba-length x))
  (format T "radius=~A~%" (ugolnilk-radius x)))

(defmethod out ((x perehod))
  (format T "name=\"~A\"~%" (named-name x))
  (format T "prev=\"~A\"~%" (linked-prev x))
  (format T "next=\"~A\"~%" (linked-next x))		  
  (format T "diameter_in=~A~%" (perehod-diameter_in x))
  (format T "diameter_out=~A~%" (perehod-diameter_out x))
  (format T "length=~A~%" (perehod-length x)))

(defmethod out ((p parametrised))
  (format nil "p=~A[Pa], T=~A[K]" (pressure p)(tempreche p)))

(defmethod out ((g gas))
  (format nil "газ=~A" (name g)))

