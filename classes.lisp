;;;; classes.lisp

(in-package #:idelchik)

;;; "idelchik" goes here. Hacks and glory await!

(defclass named ()
  ((name :accessor name
         :initarg :name
	 :initform ""
	 :documentation "Имя"))
  (:documentation "Представляет поименованый объект."))

(defmethod print-object :before ((x named)s) (format s " #named(~S" (name x)))
(defmethod print-object         ((x named)s) (format s "" ))
(defmethod print-object :after  ((x named)s) (format s ")" ))

(defclass gas (named)
  ()
  (:documentation "В параметре name задается наименование газа."))

(defmethod print-object :before ((x gas)s) (format s " #gas(" ))
(defmethod print-object         ((x gas)s) (format s "" ))
(defmethod print-object :after  ((x gas)s) (format s ")" ))


(defclass parametrised (named)
  ((pressure   :accessor pressure    :initarg :pressure  :initform 101325.0
	       :documentation "Абсолютное статическое давление [Па].")
   (tempreche  :accessor tempreche :initarg :tempreche :initform 273.15
	       :documentation "Абсолютная местная температура потока [К]"))
  (:documentation "Представляет параметры потока в данном месте сети."))

(defmethod print-object :before ((x parametrised)s) (format s " #parametrised( ~S[Па] ~S[К]" (pressure x) (tempreche x)))
(defmethod print-object         ((x parametrised)s) (format s ""))
(defmethod print-object :after  ((x parametrised)s) (format s ")"))

(defclass vertex (parametrised)
  ()
  (:documentation "Представляет вершину графа."))
(defmethod print-object :before ((x vertex)s) (format s "#vertex"))
(defmethod print-object         ((x vertex)s) 
  (format s "(pressure=~S tempreche=~S name=~S)"
	  (pressure x) (tempreche x) (name x)))

(defclass rib (named)
  ((v1 :accessor rib-v1 :initarg :v1 :initform "A"
       :documentation "Первая вершина ребра.")
   (v2 :accessor rib-v2 :initarg :v2 :initform "B"
       :documentation "Вторая вершина ребра."))
  (:documentation "Ребро графа"))

(defmethod print-object :before ((x rib)s) (format s "#rib"))
(defmethod print-object         ((x rib)s) 
  (format s "(rib-v1=~S rib-v2=~S name=~S)"
	  (rib-v1 x) (rib-v2 x) (name x)))




(defclass gidro-rib (rib)
  ((area1 :accessor gidro-rib-area1 :initarg :area1 :initform 1.0
       :documentation "Первая площадь ребра.")
   (area2 :accessor gidro-rib-area2 :initarg :area2 :initform 1.0
	  :documentation "Вторая площадь ребра.")
   (mass-flow-rate  :accessor gidro-rib-mass-flow-rate :initarg :v1 :initform 1.0
       :documentation "Массовый расход среды, через проходящий через ребро. 
Положительное значение массового расхода соответствует движению от вершины v1 к вершине v2,
отрицательное - движению от вершины v2 к вершине v1.")))

(defmethod print-object :before ((x gidro-rib)s) (format s "#gidro-rib"))
(defmethod print-object         ((x gidro-rib)s) 
  (format s "(mass-flow-rate=~S area1=~S area2=~S v1=~S v2=~S name=~S)"
	  (gidro-rib-mass-flow-rate x) (gidro-rib-area1 x) (gidro-rib-area1 x) (rib-v1 x) (rib-v2 x) (name x)))



(defclass element (named)
  ((num  :accessor num
	 :initarg :num
	 :initform 1.0
	 :documentation "Количество паралелных участков.")
   (vertexes :accessor vertexes
	     :initarg :vertexes
	     :initform '()
	     :documentation "Список вершин.")))

(defmethod print-object :before ((x element)s) (format s "#element"))
(defmethod print-object         ((x element)s) 
  (format s "(num=~S vertexes=~S name=~S )"
	  (num x) (vertexes x) (name x)))



(defclass truba (element)
  ((diameter :accessor diameter :initarg :diameter :initform 1.0
	     :documentation "Диаметр трубы [м].")
   (len      :accessor len   :initarg :length   :initform 1.0
	     :documentation "Длина  трубы  [м]." )
   (delta    :accessor delta    :initarg :delta    :initform 20d-6
	     :documentation "Абсолютная высота микронеровностей [м]. Δ=4*Ra.")))

(defmethod print-object :before ((x truba)s) (format s "#truba"))
(defmethod print-object         ((x truba)s) 
  (format s "(diameter=~S len=~S delta=~S num=~S vertexes=~S name=~S)"
	  (diameter x) (len x) (delta x) (num x) (vertexes x) (name x)))

(defclass zabornik (element)
  ((diameter :accessor diameter
	     :initarg :diameter
	     :initform 1.0
	     :documentation "Диаметр заборника в [м].")))

(defmethod print-object :before ((x zabornik)s) (format s "#zabornik"))
(defmethod print-object         ((x zabornik)s) 
  (format s "(diameter=~S num=~S vertexes=~S name=~S)"
	  (diameter x) (num x) (vertexes x) (name x)))

(defclass metallorukav (truba)
  ((gofra_hight :accessor gofra_hight
		:initarg :gofra_hight
		:initform 0.0025)))
(defmethod print-object :before ((x metallorukav)s) (format s "#metallorukav"))
(defmethod print-object         ((x metallorukav)s) 
  (format s "(gofra_hight=~S diameter=~S len=~S delta=~S num=~S vertexes=~S name=~S)"
	  (gofra_hight x) (diameter x) (len x) (delta x) (num x) (vertexes x) (name x)))

(defclass perehod (element)
  ((diameter_1 :accessor diameter_1  :initarg  :diameter_1 :initform 1.0)
   (diameter_2 :accessor diameter_2  :initarg  :diameter_2 :initform 1.0)
   (len        :accessor len         :initarg  :len        :initform 1.0)
   (delta      :accessor delta       :initarg  :delta      :initform 20d-6
	       :documentation "Абсолютная высота микронеровностей [м]. Δ=4*Ra.")))

(defmethod print-object :before ((x perehod)s) (format s "#perehod"))
(defmethod print-object         ((x perehod)s) 
  (format s "(diameter_1=~S diameter_2=~S len=~S delta=~S num=~S vertexes=~S name=~S)"
	  (diameter_1 x) (diameter_2 x) (len x) (delta x) (num x) (vertexes x) (name x)))

(defclass forsunka (element)
  ((area :accessor forsunka-area  :initarg  :area :initform 1.0))
    (:documentation "Представляет форсунку для выдачи газообразного топлива."))

(defmethod print-object :before ((x forsunka)s) (format s "#forsunka"))
(defmethod print-object         ((x forsunka)s) 
  (format s "(area=~S num=~S vertexes=~S name=~S)"
	  (area x) (num x) (vertexes x) (name x)))

(defclass ugolnik (element)
  ((diameter :accessor diameter :initarg :diameter :initform 1.0   :documentation "Диаметр трубы [м].")
   (radius   :accessor radius   :initarg :radius   :initform 1.0   :documentation "Радиус поворота по центрам угольника[м].")
   (alfa     :accessor alfa     :initarg :alfa     :initform 90.0  :documentation "Угол поворота[градусы].")
   (delta    :accessor delta    :initarg :delta    :initform 20d-6 :documentation "Абсолютная высота микронеровностей [м]. Δ=4*Ra.")))

(defmethod print-object :before ((x ugolnik)s) (format s "#ugolnik"))
(defmethod print-object         ((x ugolnik)s) 
  (format s "(d=~S r=~S α=~S delta=~S num=~S vertexes=~S name=~S)"
	  (diameter x) (radius x) (alfa x) (delta x) (num x) (vertexes x) (name x)))

(defclass vyxod (element)
  ((diameter :accessor diameter :initarg :diameter :initform 1.0
	     :documentation "Диаметр трубы [м].")))

(defmethod print-object :before ((x vyxod)s) (format s "#vyxod"))
(defmethod print-object         ((x vyxod)s) 
  (format s "(d=~S num=~S vertexes=~S name=~S)"
	  (diameter x) (num x) (vertexes x) (name x)))

(defclass vxod (element)
  ((diameter :accessor diameter :initarg :diameter :initform 1.0
	     :documentation "Диаметр трубы [м].")))

(defmethod print-object :before ((x vxod)s) (format s "#vxod"))
(defmethod print-object         ((x vxod)s) 
  (format s "(diameter=~S num=~S vertexes=~S name=~S)"
	  (diameter x) (num x) (vertexes x) (name x)))

(defclass troynik (element)
  ((diameter_1    :accessor diameter_1 :initarg  :diameter_1 :initform 1.0)
   (alfa_1        :accessor alfa_1     :initarg  :alfa_1     :initform 180.0)
   (diameter_2    :accessor diameter_2 :initarg  :diameter_2 :initform 1.0)
   (alfa_2        :accessor alfa_2     :initarg  :alfa_2     :initform 0.0)
   (diameter_3    :accessor diameter_3 :initarg  :diameter_3 :initform 1.0)
   (alfa_3        :accessor alfa_3     :initarg  :alfa_3     :initform 90.0))
  (:documentation "Представляет тройник. 
В его списке вершин последняя вершина - центр тройника;
первая, вторая и третья вершины соответствуют первому, второму и третьему отводам (подводам) тройника."))

(defmethod print-object :before ((x troynik)s) (format s "#troynik"))
(defmethod print-object         ((x troynik)s) 
  (format s "(d_1=~S d_2=~S d3=~S α_1=~S α_2=~S α_3=~S num=~S vertexes=~S name=~S)"
	  (diameter_1 x)(diameter_2 x) (diameter_3 x) (alfa_1 x) (alfa_2 x) (alfa_2 x) (num x) (vertexes x) (name x)))

(defmethod mk-rib ((x troynik))
  "Создаёт список рёбер тройника, основанный на списке вершин элемента."
  (let* ((v-lst (vertexes x))
	 (v1 (first  v-lst))
	 (v2 (second v-lst))
	 (v3 (third  v-lst))
	 (vc (fourth v-lst)))
;;;;    (break "BR1:(defmethod mk-rib ((x troynik))")
    (cond
      ((= 4 (length v-lst))
       (list
	(make-gidro-rib v1 vc)
	(make-gidro-rib v2 vc)
	(make-gidro-rib v3 vc)))
      (T nil))))

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


(defun make-rib-name (v1 v2)
  (concatenate 'string  v1 "-" v2))

(defun make-gidro-rib (v1 v2)
  (make-instance 'gidro-rib :v1 v1 :v2 v2 :name (make-rib-name v1 v2)))
