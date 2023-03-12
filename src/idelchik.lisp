;;;; idelchik.lisp

(defpackage :idelchik
  (:use #:cl  ) 
  (:export lg)
  (:export *part_01_doc*
	   *part_02_doc*
	   *part_03_doc*
	   *part_04_doc*
	   *part_05_doc*
	   *part_06_doc*
	   *part_07_doc*
	   *part_08_doc*
	   *part_09_doc*
	   *part_10_doc*
	   *part_11_doc*
	   *part_12_doc*)
  (:export <named>
	   <gas>
	   <param>
	   <vertex>
	   <rib>
	   <gidro-rib>
	   <element>
	   <truba>
	   <zabornik>
           <troynik>
	   <metallorukav>
	   <perehod>
	   <ugolnik>
	   <vyxod>
	   <vxod>
	   <troynik>
	   <teploobmennik>
	   <resiver>
	   <kompressor>
	   <valve>
	   <valve-obr>
	   alfa
	   alfa_1
	   alfa_2
	   alfa_3
	   diameter
	   radius
	   diameter_1
	   diameter_2
	   diameter_3
           delta
	   )
  (:export <gas-k-mu>
           <gas-k-mu>-k
           <gas-k-mu>-mu)
  (:export make-rib-name
           make-<gidro-rib>)
  (:export name)
  (:export <forsunka>
           <forsunka>-area )

  (:export μ   ; - Возвращает молекулярную массу газа
	   k   ; - Возвращает коэффициент адиабаты газа
	   ρ   ; - Возвращает плоотность газа
	   η   ; - Возвращает коэффициент динамической вязкости газа
	   ν   ; - Возвращает коэффициент кинематической вязкости газа
	   mass-flow-rate	; - массовый расход газа через насадок
	   area-by-Mass-flow-rate ; - площадь насадка по массовому расходу
	   param_in-by-Mass-flow-rate	; - давление перед насадком
           velocity-by-param-in-out ; скорость в насадке по параметрам на входе и выходе для определенного газа
	   )
  (:export pressure
           tempreche)
  (:export table_aproximate ;; - аппроксимация табличных значений
           )
  (:export out)
  (:documentation
   "
И.Е. Идельчик д-р техн. наук nроф.
СПРАВОЧНИК
ПО ГИДРАВЛИЧЕСКИМ
СОПРОТИВЛЕНИЯМ
под редакцией канд. тех. наук М.О.Штейнберra
3-е издание
переработанное и дополненное

Предисловие к третьему изданию
Предисловие ко второму изданию
1 Общие сведения и элементы аэродинамики и гидравлики напорных систем
1-1. Общие указания
1-2. Свойства жидкостей и rазов
1-3. Режимы течения жидкости (газа)
1-4. Равновесие жидкости и газа
1-5. Уравнения движения жидкостии rаза
1-6. Гидравлические сопротивлениясетей
1-7. Распределение статическогодавления по участкам сети повышенноrо сопротивления
1-8. Обобщенные формулы сопро-тивления для гомогенных и гетерогенных систем
1-9. Истечение жидкости и газа из отверстия
1-10. Работа нагнетателя в сети
1-11. Схемы расчета rидравлического сопротивления сетей
2 Сопротивление при течении по прямым трубам и каналам 
  (коэффициенты сопротивления трения и параметры шероховатости)
2-1. Пояснения и практические peкомендации
2-2. Диаrраммы коэффициентов сопротивления трения
3 Сопротивление при теченни на входе в трубы и каналы
  (коэффициенты сопротивления входных участков)
3-1. Пояснения и практические рекомендации
З-2. Диаrраммы коэффициентов сопротивления
4  Сопротивление при течении с внезапным изменением скорости и при перетекании потока через отверстия 
  (коэффициенты сопротивления участков с внезапным расширением сечения, внезапным сужением сечения, шайб, диафраrм, проeмов и др.)
4-1. Пояснения и практические peкомендации
4-2. Диarраммы коэффициентов сопротивления
5 Сопротивление при течении с плавным измеиением скорости 
  (коэффициенты сопротивления диффузоов, конфузоров и дрyrих переходных участков)
5-1. Пояснения и практические рекомендации
5-2. диаrраммы коэффициентов сопротивления
6 Сопротивление при течении с изменением направления потока 
  (коэффициенты сопротивления изогнутых участков колен, отводов и др.)
6-1. Пояснения и практические рекомендации
6-2. Диaграммы коэффициентов сопротивления
7 Сопротивление при течении со слиянием потоков или разделением потока 
  (коэффициeнты сопротивления тройников, крестовин, распределительных коллекторов)
7-1. Пояснения и практические peкомендации
7-2. Диаrpаммы коэффициентовсопротивления
8 Сопротивление при течении через препятствия, равномерно распределенные по сечеиию каналов 
  (коэффициенты сопротивления решеток, сеток, пористых слоев, насадок и др.)
8-1. Пояснения и практические peкомендации
8-2. Диаrраммы коэффициентов сопротивления
9 Сопротивление при течении через трубопроводную арматуру и лабиринты 
  (коэффицненты сопротнвления клапаиов, задвижек, затворов, лабириинтов, компенсаторов)
9-1. Пояснения и практические peкомендации
9-2. Диаrраммы коэффициентов сопротивления
10 Сопротивление при обтекании тел потоком в трубе 
   (коэффициенты сопротивления участков с выступами, распорками, фермами и дрyгими телами)
10-1. Пояснения и практические рекомендации
10-2. Диаграммы коэффициентов сопротивления
11 Сопротивления при течении на выходе из труб и каналов 
   (коэффициенты сопротивлення выходных участков)
11-1. Пояснения и практические рекомендации
11-2. Диarраммы коэффициентов сопротивления
12 Сопротивление при течеиии через различные аппараты 
   (коэффициенты сопротивления аппаратов и дрyrих устройств)
12-1. Пояснения и практические рекомендации
12-2. Диаrpаммы коэффициентов сопротивления
Список литературы
Предметный указатель
"))

(in-package :idelchik)

(defun lg (x)
  "Функция вычисления десятичного логарифма"
  (log x 10))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; classes.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defclass <named> ()
  ((name :accessor name :initarg :name :initform "" :documentation "Имя"))
  (:documentation "Представляет поименованый объект."))

(defmethod print-object :before ((x <named>) s) (format s ""))
(defmethod print-object         ((x <named>) s) (format s "~A" (name x)))
(defmethod print-object :after  ((x <named>) s) (format s ""))

;;;;;;;;;;;;;;;;;;;;

(defclass <gas> (<named>)
  ()
  (:documentation
   " @b(Описание:) класс @b(<gas>) представляет газ. Параметр name
   задает наименование газа.

 Определены следующие газы:
@begin(list)
 @item(Воздух)
 @item(Азот)
 @item(Кислород)
 @item(Углекислый газ)
 @item(Угарный газ)
 @item(Водород)
 @item(Аммиак)
 @item(Оксид серы\(IV\))
 @item(Гелий)
 @item(Метан)
 @item(Газ природный)
 @item(Газ попутный нефтяной)
 @item(Газ природный_2010-08-20)
@end(list)
"))

(defmethod print-object :before ((gas <gas>) s) (format s " #<gas>(" ))

(defmethod print-object         ((gas <gas>) s)
  (format s "name = ~S; k = ~6A; μ = ~6A" (name gas) (k gas) (μ gas)))

(defmethod print-object :after  ((gas <gas>) s) (format s ")" ))

;;;;;;;;;;;;;;;;;;;;

(defclass <gas-k-mu> (<gas>)
  ((k  :accessor <gas-k-mu>-k  :initarg :k  :initform 1.4     :documentation "Коэффициент адиабаты")
   (mu :accessor <gas-k-mu>-mu :initarg :mu :initform 0.02895 :documentation "Молекулярная масса газа"))
  (:documentation
   "@b(Описание:) класс @b(<gas-k-mu>) представляет газ с возможностью
    задания его коэффициента адиабаты и молекулярной массы."))

(defclass <param> (<named>)
  ((pressure   :accessor pressure    :initarg :pressure  :initform 101325.0
	       :documentation "Абсолютное статическое давление [Па].")
   (tempreche  :accessor tempreche :initarg :tempreche :initform 273.15
	       :documentation "Абсолютная местная температура потока [К]"))
  (:documentation
   " @b(Описание:) класс @b(<param>) представляет параметры
   потока в данном месте сети."))

(defmethod print-object :before ((x <param>)s) (format s " #<param>( ~S[Па] ~S[К]" (pressure x) (tempreche x)))
(defmethod print-object         ((x <param>)s) (format s ""))
(defmethod print-object :after  ((x <param>)s) (format s ")"))

;;;;;;;;;;;;;;;;;;;;

(defclass <vertex> (<param>)
  ()
  (:documentation "Представляет вершину графа."))
(defmethod print-object :before ((x <vertex>)s) (format s "#<vertex>"))
(defmethod print-object         ((x <vertex>)s) 
  (format s "(pressure=~S tempreche=~S name=~S)"
	  (pressure x) (tempreche x) (name x)))

;;;;;;;;;;;;;;;;;;;;

(defclass <rib> (<named>)
  ((v1 :accessor <rib>-v1 :initarg :v1 :initform "A"
       :documentation "Первая вершина ребра.")
   (v2 :accessor <rib>-v2 :initarg :v2 :initform "B"
       :documentation "Вторая вершина ребра."))
  (:documentation "Ребро графа"))

(defmethod print-object :before ((x <rib>)s) (format s "#<rib>"))
(defmethod print-object         ((x <rib>)s) 
  (format s "(<rib>-v1=~S <rib>-v2=~S name=~S)"
	  (<rib>-v1 x) (<rib>-v2 x) (name x)))

;;;;;;;;;;;;;;;;;;;;

(defclass <gidro-rib> (<rib>)
  ((area1 :accessor <gidro-rib>-area1 :initarg :area1 :initform 1.0
       :documentation "Первая площадь ребра.")
   (area2 :accessor <gidro-rib>-area2 :initarg :area2 :initform 1.0
	  :documentation "Вторая площадь ребра.")
   (mass-flow-rate  :accessor <gidro-rib>-mass-flow-rate :initarg :v1 :initform 1.0
       :documentation "Массовый расход среды, через проходящий через ребро. 
Положительное значение массового расхода соответствует движению от вершины v1 к вершине v2,
отрицательное - движению от вершины v2 к вершине v1."))
  (:documentation "STUB"))

(defmethod print-object :before ((x <gidro-rib>)s) (format s "#<gidro-rib>"))
(defmethod print-object         ((x <gidro-rib>)s) 
  (format s "(mass-flow-rate=~S area1=~S area2=~S v1=~S v2=~S name=~S)"
	  (<gidro-rib>-mass-flow-rate x) (<gidro-rib>-area1 x) (<gidro-rib>-area1 x) (<rib>-v1 x) (<rib>-v2 x) (name x)))

(defclass <element> (<named>)
  ((num  :accessor num
	 :initarg :num
	 :initform 1.0
	 :documentation "Количество паралелных участков.")
   (vertexes :accessor vertexes
	     :initarg :vertexes
	     :initform '()
	     :documentation "Список вершин."))
  (:documentation "STUB"))

(defmethod print-object :before ((x <element>)s) (format s "#<element>"))
(defmethod print-object         ((x <element>)s) 
  (format s "(num=~S vertexes=~S name=~S )"
	  (num x) (vertexes x) (name x)))

(defclass <truba> (<element>)
  ((diameter :accessor diameter :initarg :diameter :initform 1.0
	     :documentation "Диаметр трубы [м].")
   (len      :accessor len   :initarg :length   :initform 1.0
	     :documentation "Длина  трубы  [м]." )
   (delta    :accessor delta    :initarg :delta    :initform 20d-6
	     :documentation "Абсолютная высота микронеровностей [м]. Δ=4*Ra."))
  (:documentation "STUB"))

(defmethod print-object :before ((x <truba>)s) (format s "#<truba>"))
(defmethod print-object         ((x <truba>)s) 
  (format s "(diameter=~S len=~S delta=~S num=~S vertexes=~S name=~S)"
	  (diameter x) (len x) (delta x) (num x) (vertexes x) (name x)))

(defclass <zabornik> (<element>)
  ((diameter :accessor diameter
	     :initarg :diameter
	     :initform 1.0
	     :documentation "Диаметр заборника в [м]."))
  (:documentation "STUB"))

(defmethod print-object :before ((x <zabornik>)s) (format s "#<zabornik>"))
(defmethod print-object         ((x <zabornik>)s) 
  (format s "(diameter=~S num=~S vertexes=~S name=~S)"
	  (diameter x) (num x) (vertexes x) (name x)))

(defclass <metallorukav> (<truba>)
  ((gofra_hight :accessor gofra_hight
		:initarg :gofra_hight
		:initform 0.0025
                :documentation "STUB"))
  (:documentation "STUB"))

(defmethod print-object :before ((x <metallorukav>)s) (format s "#<metallorukav>"))
(defmethod print-object         ((x <metallorukav>)s) 
  (format s "(gofra_hight=~S diameter=~S len=~S delta=~S num=~S vertexes=~S name=~S)"
	  (gofra_hight x) (diameter x) (len x) (delta x) (num x) (vertexes x) (name x)))

(defclass <perehod> (<element>)
  ((diameter_1 :accessor diameter_1  :initarg  :diameter_1 :initform 1.0
               :documentation "STUB")
   (diameter_2 :accessor diameter_2  :initarg  :diameter_2 :initform 1.0
               :documentation "STUB")
   (len        :accessor len         :initarg  :len        :initform 1.0
               :documentation "STUB")
   (delta      :accessor delta       :initarg  :delta      :initform 20d-6 
	       :documentation "Абсолютная высота микронеровностей [м]. Δ=4*Ra."))
  (:documentation "STUB"))

(defmethod print-object :before ((x <perehod>) s) (format s "#<perehod>"))
(defmethod print-object         ((x <perehod>) s) 
  (format s "(diameter_1=~S diameter_2=~S len=~S delta=~S num=~S vertexes=~S name=~S)"
	  (diameter_1 x) (diameter_2 x) (len x) (delta x) (num x) (vertexes x) (name x)))

;;;;;;;;;;;;;;;;;;;;

(defclass <forsunka> (<element>)
  ((area :accessor <forsunka>-area  :initarg  :area :initform 1.0 :documentation "STUB"))
  (:documentation "@b(Описание:) класс @b(<forsunka>) представляет 
форсунку, предназначенную для подачи газообразного топлива."))

(defmethod print-object :before ((x <forsunka>)s) (format s "#<forsunka>"))
(defmethod print-object         ((x <forsunka>)s) 
  (format s "(area=~S num=~S vertexes=~S name=~S)"
	  (<forsunka>-area x) (num x) (vertexes x) (name x)))

;;;;;;;;;;;;;;;;;;;;

(defclass <ugolnik> (<element>)
  ((diameter :accessor diameter :initarg :diameter :initform 1.0   :documentation "Диаметр трубы [м].")
   (radius   :accessor radius   :initarg :radius   :initform 1.0   :documentation "Радиус поворота по центрам угольника[м].")
   (alfa     :accessor alfa     :initarg :alfa     :initform 90.0  :documentation "Угол поворота[градусы].")
   (delta    :accessor delta    :initarg :delta    :initform 20d-6 :documentation "Абсолютная высота микронеровностей [м]. Δ=4*Ra."))
  (:documentation "STUB"))

(defmethod print-object :before ((x <ugolnik>)s) (format s "#<ugolnik>"))
(defmethod print-object         ((x <ugolnik>)s) 
  (format s "(d=~S r=~S α=~S delta=~S num=~S vertexes=~S name=~S)"
	  (diameter x) (radius x) (alfa x) (delta x) (num x) (vertexes x) (name x)))

;;;;;;;;;;;;;;;;;;;;

(defclass <vyxod> (<element>)
  ((diameter :accessor diameter :initarg :diameter :initform 1.0
	     :documentation "Диаметр трубы [м]."))
  (:documentation "STUB"))

(defmethod print-object :before ((x <vyxod>)s) (format s "#<vyxod>"))
(defmethod print-object         ((x <vyxod>)s) 
  (format s "(d=~S num=~S vertexes=~S name=~S)"
	  (diameter x) (num x) (vertexes x) (name x)))

;;;;;;;;;;;;;;;;;;;;

(defclass <vxod> (<element>)
  ((diameter :accessor diameter :initarg :diameter :initform 1.0
	     :documentation "Диаметр трубы [м]."))
  (:documentation "STUB"))

(defmethod print-object :before ((x <vxod>)s) (format s "#<vxod>"))
(defmethod print-object         ((x <vxod>)s) 
  (format s "(diameter=~S num=~S vertexes=~S name=~S)"
	  (diameter x) (num x) (vertexes x) (name x)))

;;;;;;;;;;;;;;;;;;;;

(defclass <troynik> (<element>)
  ((diameter_1    :accessor diameter_1 :initarg  :diameter_1 :initform 1.0   :documentation "STUB")
   (alfa_1        :accessor alfa_1     :initarg  :alfa_1     :initform 180.0 :documentation "STUB")
   (diameter_2    :accessor diameter_2 :initarg  :diameter_2 :initform 1.0   :documentation "STUB")
   (alfa_2        :accessor alfa_2     :initarg  :alfa_2     :initform 0.0   :documentation "STUB")
   (diameter_3    :accessor diameter_3 :initarg  :diameter_3 :initform 1.0   :documentation "STUB")
   (alfa_3        :accessor alfa_3     :initarg  :alfa_3     :initform 90.0  :documentation "STUB"))
  (:documentation "Представляет тройник. 
В его списке вершин последняя вершина - центр тройника;
первая, вторая и третья вершины соответствуют первому, второму и третьему отводам (подводам) тройника."))

(defmethod print-object :before ((x <troynik>)s) (format s "#<troynik>"))
(defmethod print-object         ((x <troynik>)s) 
  (format s "(d_1=~S d_2=~S d3=~S α_1=~S α_2=~S α_3=~S num=~S vertexes=~S name=~S)"
	  (diameter_1 x)(diameter_2 x) (diameter_3 x) (alfa_1 x) (alfa_2 x) (alfa_2 x) (num x) (vertexes x) (name x)))

(defmethod mk-rib ((x <troynik>))
  "Создаёт список рёбер тройника, основанный на списке вершин элемента."
  (let* ((v-lst (vertexes x))
	 (v1 (first  v-lst))
	 (v2 (second v-lst))
	 (v3 (third  v-lst))
	 (vc (fourth v-lst)))
;;;;    (break "BR1:(defmethod mk-rib ((x <troynik>))")
    (cond
      ((= 4 (length v-lst))
       (list
	(make-<gidro-rib> v1 vc)
	(make-<gidro-rib> v2 vc)
	(make-<gidro-rib> v3 vc)))
      (T nil))))

;;;;;;;;;;;;;;;;;;;;

(defclass <teploobmennik> (<element>)
  ()
  (:documentation "STUB"))

;;;;;;;;;;;;;;;;;;;;

(defclass <resiver> (<element>)
  ((diameter :accessor diameter :initarg :diameter :initform 1.0
	     :documentation "Диаметр трубы подвода и отвода [м]."))
  (:documentation "Диаметр трубы подвода и отвода [м]."))

;;;;;;;;;;;;;;;;;;;;

(defclass <kompressor> (<element>)
  ()
  (:documentation "STUB"))

;;;;;;;;;;;;;;;;;;;;

(defclass <valve> (<element>)
  ()
  (:documentation "STUB"))

;;;;;;;;;;;;;;;;;;;;

(defclass <valve-obr> (<element>)
  ((diameter :accessor diameter :initarg :diameter :initform 1.0
	     :documentation "Условный диаметр [м]."))
  (:documentation "STUB"))

;;;;;;;;;;;;;;;;;;;;

(defun make-rib-name (v1 v2)
  "STUB"
  (concatenate 'string  v1 "-" v2))

(defun make-<gidro-rib> (v1 v2)
  "STUB"
  (make-instance '<gidro-rib> :v1 v1 :v2 v2 :name (make-rib-name v1 v2)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;generics.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defgeneric μ (<gas>)
  (:documentation
   "Возвращает молекулярную массу газа [kg/mol]
Пример использования:
(let ((g1 (make-instance '<gas> :name \"Водород\")))
  (μ g1))"))

(defgeneric k (<gas>)
  (:documentation   "Возвращает показатель адиабаты газа [1]"))

(defgeneric ρ (<param> <gas>)
  (:documentation
   "Возвращает плотность газа [kg/m^3]
Пример использования:
(let 
    ((p1 (make-instance '<param> :pressure 101325. :tempreche (+ 273.0 0.0)))
     (g1 (make-instance '<gas> :name \"Воздух\")))
  (ρ p1 g1))"))

(defgeneric η(<param> <gas>)
  (:documentation
   "Возвращает коэффициент динамической вязкости газа [Pa*s]
Пример использования:
(let 
    ((p1 (make-instance '<param> :pressure 101325. :tempreche (+ 273.0 0.0)))
     (g1 (make-instance '<gas> :name \"Воздух\")))
  (η p1 g1))")
  )

(defgeneric ν (<param> <gas>)
  (:documentation
   "Возвращает коэффициент кинематической вязкости газа [m^2/s]
Пример использования:
(let 
    ((p1 (make-instance '<param> :pressure 101325. :tempreche (+ 273.0 0.0)))
     (g1 (make-instance '<gas> :name \"Воздух\")))
  (ν p1 g1))"))



(defgeneric mass-flow-rate (<forsunka> p_in p_out <gas>)
  (:documentation "Массовый расход через насадок
Аргументы:
<forsunka> - форсунка, определяет площадь;
MFR      - массовый расход, кг/с;
p_in     - определяет температуру перед форсункой;
p_out    - определяет давление за форсункой;
<gas>      - газ, протекающий через отверстия форсунки."))

(defgeneric area-by-Mass-flow-rate(<forsunka> MFR p_in p_out <gas>)
  (:documentation "Определят и устанавливает площадь для форсунки <forsunka> такую,
чтобы через нее проходил массовый расход MFR газа <gas> при пререпаде
на форсунке определяемом давлениями из параметров p_in и p_out при
температуре на входе (из параметра p_in).

Аргументы:
<forsunka> - форсунка, определяет площадь;
MFR      - массовый расход, кг/с;
p_in     - определяет температуру перед форсункой;
p_out    - определяет давление за форсункой;
<gas>      - газ, протекающий через отверстия форсунки."))

(defgeneric param_in-by-Mass-flow-rate (<forsunka> MFR p_in p_out <gas>)
  (:documentation
   " @b(Описание:) обобщенная функция @b(param_in-by-Mass-flow-rate)
 вычисляет давление параметра p_in, при котором через форсунку
 <forsunka> пройдет массовый расход MFR газа <gas> при давлении на выходе,
 определяемом параметром p_out.

 @b(Переменые:)
@begin(list)
 @item(<forsunka> - форсунка, определяет площадь;)
 @item(MFR - массовый расход, кг/с;)
 @item(p_in - определяет температуру перед форсункой;)
 @item(p_out - определяет давление за форсункой;)
 @item(<gas> - газ, протекающий через отверстия форсунки.)
@end(list)"
   ))



(defgeneric out (<rib>)
  (:documentation "Выполняет вывод объекта на печать"))

(defgeneric <rib>-name (<rib>  &optional stream)
  (:documentation
   " @b(Описание:) обобщенная_функция @b(<rib>-name) выполняет вывод на
 печать списка рёбер в форме пригодной для вставки в исходный код

 @b(Пример исползования:)
@begin[lang=lisp](code)
  (mapcar #'(lambda (el) (<rib>-name el)) ribs)
@end(code)"))

(defgeneric mk-rib (<element>)
  (:documentation "Создаёт список рёбер, основанный на списке вершин элемента."))



(defgeneric diameter_1 (<element>)
  (:documentation "diameter_1"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; methods.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defmethod μ ((gas <gas>))
  "@b(Описание:) функция @b(μ) возвращает молекулярную массу газа, [kg/mol].

 @b(Пример использования:)
@begin[lang=lisp](code)
 (idelchik:μ (make-instance 'idelchik:<gas> :name \"Воздух\"))
@end(code)"
  (values (varghaftik:mu :gas_name (name gas)) "[kg/mol]" "Молекулярная масса газа"))

(defmethod μ ((gas-k-mu <gas-k-mu>))
  (<gas-k-mu>-mu gas-k-mu))

(defmethod k ((gas <gas>))
  "@b(Описание:) функция @b(k) возвращает коэффициент адиабаты газа.

 @b(Пример использования:)
@begin[lang=lisp](code)
 (idelchik:k (make-instance 'idelchik:<gas> :name \"Воздух\"))
@end(code)"
  (values (varghaftik:k :gas_name (name gas))"[1]" "Показатель адиабаты" ))

(defmethod k ((gas-k-mu <gas-k-mu>))
  (<gas-k-mu>-k gas-k-mu))

(defmethod ρ ((param <param>) (gas <gas>))
  "@b(Описание:) функция @b(ρ) возвращает плотность газа, [kg/m^3].

 @b(Пример использования:)
@begin[lang=lisp](code)
 (idelchik:ρ (make-instance 'idelchik:<gas> :name \"Воздух\"))
@end(code)"
  (values (/ (* (pressure param) (μ gas) ) (* varghaftik:R-mu (tempreche param)))
	  "[kg/m^3]" "Плотность газа"))

(defmethod η((p <param>) (gas <gas>))
  "@b(Описание:) функция @b(η) возвращает коэффициент динамической вязкости газа, [Pa*s].

 @b(Пример использования:)
@begin[lang=lisp](code)
 (idelchik:ρ (make-instance 'idelchik:<gas> :name \"Воздух\"))
@end(code)"
  (values (varghaftik:n-sazerlend (tempreche p) :gas_name (name gas))
	  "[Pa*s]"
	  "Коэффициент динамической вязкости газа"))

(defmethod ν ((param <param>) (gas <gas>))
    "@b(Описание:) функция @b(ν) возвращает коэффициент кинематической вязкости газа, [m^2/s].

 @b(Пример использования:)
@begin[lang=lisp](code)
 (idelchik:ν (make-instance 'idelchik:<gas> :name \"Воздух\"))
@end(code)"
  (values (/ (η param gas) (ρ param gas))
          "[m^2/s]" "Коэффициент кинематической вязкости газа"))

(defmethod <rib>-name ((rib <rib>) &optional (stream t))
  "@b(Описание:) метод @b(<rib>-name) Выполняет вывод на печать списка рёбер в форме пригодной для вставки в исходный код
Пример исползования:
(mapcar #'(lambda (el) (<rib>-name el)) ribs)
"
  (format stream
          "(make-instance '<gidro-rib> :v1 \"~A\" :v2 \"~A\" :name \"~A-~A\")~%"
	  (<rib>-v1 rib)
	  (<rib>-v2 rib)
	  (<rib>-v1 rib)
	  (<rib>-v2 rib)))

(defmethod mk-rib ((element <element>))
  "Создаёт список рёбер, основанный на списке вершин элемента."
  (let ((v-lst (vertexes element)))
    (cond
      ((= 2 (length v-lst))
       (list (make-<gidro-rib> (first v-lst) (second v-lst))))
      (T nil))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; method-out.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defmethod out ((x <rib>))
  (format T "~A->~A;~%" (<rib>-v1 x) (<rib>-v2 x)))

(defmethod out ((x <named>))
  (format T "~A" (<named>-name x)))

(defmethod out ((x <truba>))
  (format nil "name=\"~A\", diameter=~A[m], len=~A[m] (~A ~A)~%"
	  (name x)
	  (diameter x)
	  (len x)
	  (nth 0 (vertexes x))
	  (nth 1 (vertexes x))))

(defmethod out ((x <ugolnik>))
  (format T "name=\"~A\"~%" (<named>-name x))
  (format T "diameter=~A~%" (diameter x))
  (format T "radius=~A~%" (radius x))
  (format T "alfa=~A~%" (alfa x)))

(defmethod out ((x <perehod>))
  (format T "name=\"~A\"~%" (<named>-name x))
  (format T "prev=\"~A\"~%" (linked-prev x))
  (format T "next=\"~A\"~%" (linked-next x))		  
  (format T "diameter_in=~A~%" (<perehod>-diameter_in x))
  (format T "diameter_out=~A~%" (<perehod>-diameter_out x))
  (format T "length=~A~%" (<perehod>-length x)))

(defmethod out ((p <param>))
  (format nil "p=~A[Pa], T=~A[K]" (pressure p)(tempreche p)))

(defmethod out ((g <gas>))
  (format nil "газ=~A" (name g)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; table_aproximate.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun line-approximate( XX PP0 PP1)
  "STUB"
  (multiple-value-bind (x p0 p1)
      (values XX PP0 PP1)
    (+ (second p0)
       (/ (*
	   (- x (first p0))
	   (- (second p1) (second p0)))
	  (- (first p1) (first p0))))))

(defun line-approximate-list( XX n0 n1 lst)
  "STUB"
  (line-approximate
   XX
   (nth n0 lst)
   (nth n1 lst)))

(defun table_aproximate (x lst)
  "STUB"
  (do ((len (length lst))
       (res nil)
       (i 0 (1+ i))
       )
      ((>= i len) (line-approximate-list
		   x
		   (first res)
		   (second res )
		   lst))
    (cond
      ((and (null res) (<= x (first (nth 0 lst))))
       (setf res '(0 1)))
      ((and (null res) (<= (first (nth (1- len) lst)) x))
       (setf res (list (- len 2) (- len 1))))
      ((and (null res)
	    (<= (first(nth i lst)) x)
	    (<= x (first(nth (1+ i) lst))))
       (setf res (list i (1+ i)))))))


;;;;(table_aproximate 10.25 '((1.0 1.1) (2.0 2.2) (3.0 3.3)(4.0 4.4) (5.0 5.5)))

  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; tubes.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter tubes-gib
  (list
   (cons 0.010 (+ 0.020 (/ 0.010 2)))
   (cons 0.014 (+ 0.030 (/ 0.014 2)))
   (cons 0.022 (+ 0.045 (/ 0.022 2)))
   (cons 0.028 (+ 0.070 (/ 0.028 2)))
   (cons 0.032 (+ 0.080 (/ 0.032 2)))
   (cons 0.053 (+ 0.160 (/ 0.053 2)))
   (cons 0.075 (+ 0.225 (/ 0.075 2)))))

(defun radius-giba (diameter)
  (cdr (assoc diameter tubes-gib)))

(defparameter tubes-delta
  (list
        (cons 0.010 0.001)
        (cons 0.014 0.0012)
        (cons 0.022 0.0014)
        (cons 0.028 0.0018)
	(cons 0.032 0.0018)
	(cons 0.053 0.0018)
	(cons 0.075 0.002)))

(defun <truba>-in-dia (diameter)
  (- (car (assoc diameter tubes-delta))
     (* 2.0 (cdr (assoc diameter tubes-delta)))))

(defparameter <ugolnik>-data
  '((0.032 0.026 0.002)
    (0.053 0.0415 0.002)
    (0.075 0.0525 0.002)))

(defun <ugolnik>-in-dia (diameter)
  (- (nth 0 (assoc diameter <ugolnik>-data))
     (* 2.0 (nth 2 (assoc diameter <ugolnik>-data)))))

(defun <ugolnik>-radius(diameter)
  (nth 1 (assoc diameter <ugolnik>-data)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; lambda.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defgeneric Re (element parameter gas vilosity)
  (:documentation "Возвращает число Рейнольдса"))


(defmethod Re ((tr <truba>) (p <param>) (g <gas>) (w number))
    "Возвращает число Рейнольдса для трубы круглого поперечного сечения [1]
tr - труба;
p  - параметр;
g  - газ;
w  [м/с] (-inf inf) - скорость
Пример использования:
(let
    ((p1 (make-instance '<param> :pressure 101325. :tempreche (+ 273.0 0.0)))
     (g1 (make-instance '<gas> :name \"Воздух\"))
     (tr1 (make-instance '<truba>  :name \"T-EE-EF\" :diameter (<truba>-in-dia 0.010) :length 2.500 :vertexes '(\"EE\" \"EF\")))
     (w 15.0)
     )
  (Re tr1 p1 g1 w))"
    (values (/ (* (abs w) (diameter tr)) (ν p g))
	    "[1]"
	    "Число Рейнольдса для газа"
	    (format nil "Число Рейнольдса ~S ~S ~S ~S[м/с]" (print g) (print p) (print tr) w)))


(defmethod Re ((ug <ugolnik>) (p <param>) (g <gas>) (w number))
    "Возвращает число Рейнольдса для угольника (отвода) круглого поперечного сечения [1]
ug - угольник;
p  - параметр;
g  - газ;
w  [м/с] (-inf inf) - скорость
Пример использования:
(let 
    ((p1 (make-instance '<param> :pressure 101325. :tempreche (+ 273.0 0.0)))
     (g1 (make-instance '<gas> :name \"Воздух\"))
     (ug1 (make-instance '<ugolnik> :name \"T-EE-EF\" :diameter 0.070 :vertexes '(\"EE\" \"EF\")))
     (w 15.0)
     )
  (Re ug1 p1 g1 w))
"
    (values (/ (* (abs w) (diameter ug)) (ν p g))
	    "[1]"
	    (format nil "Число Рейнольдса ~S ~S ~S ~S[м/с]" (print g) (print p) (print ug) w)))

(defmethod Re ((pr <perehod>) (p <param>) (g <gas>) (w number))
    "Возвращает значение числа Рейнольдса для перехода [1]
ug - переход;
p  - параметр;
g  - газ;
w  [м/с] (-inf inf) - скорость
 @b(Пример использования:)
@begin[lang=lisp](code)
 (let 
    ((p1 (make-instance '<param> :pressure (* 20. 101325.) :tempreche (+ 273.0 400.0)))
     (g1 (make-instance '<gas> :name \"Воздух\"))
     (pr1 (make-instance '<perehod> :name \"P1\" :diameter_1 (<ugolnik>-in-dia 0.053) :diameter_2 (<ugolnik>-in-dia 0.075) :len 0.050 :vertexes '(\"AL\" \"AM\")))
     (w 15.0)
     )
  (Re pr1 p1 g1 w))
@end(code)
"
    (values (/ (* (abs w)
		  (min (diameter_1 pr) (diameter_2 pr)))
	       (ν p g))
	    "[1]"
	    (format nil "Число Рейнольдса ~S ~S ~S ~S[м/с]" (print g) (print p) (print pr) w)))

;;;;(defmethod Re ((tr <metallorukav>) (p <param>) (g <gas>) (w number))) - определяется по формулам для трубы.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defgeneric _delta (element)
  (:documentation "Возвращает относительную шероховатость"))

(defmethod _delta ((tr <truba>) )
  (/ (delta tr)(diameter tr)))

(defmethod _delta ((mr <metallorukav>) )
  (/ (max (gofra_hight mr) (delta mr) )
     (diameter mr)))

(defmethod _delta ((ug <ugolnik>) )
  (/ (delta ug)(diameter ug)))

(defmethod _delta ((pr <perehod>))
  (/ (delta pr) (min (diameter_1 pr) (diameter_2 pr))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defgeneric λ (element parameter <gas> vilosity)
  (:documentation "Возвращает коэффициент трения"))

(defmethod λ ((tr <truba>) (p <param>) (g <gas>) (w number))
  (let* ((aRe (Re tr p g w))
	 (_d (_delta tr)))
    (cond
      ((= _d 0.0) (Idl-2-1-λ_gl aRe))
      (T (Idl-2-2-λ_ravnomer aRe _d)))))

;;;;(defmethod λ ((tr <metallorukav>) (p <param>) (g <gas>) (w number)) - определяется по формулам для трубы.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defgeneric ζ (element parameter <gas> vilocity)
  (:documentation "Возврвщает коэффициент сопротивления")
  )

(defmethod ζ ((ug <ugolnik>) (p <param>) (g <gas>) (w number))
  (let* ((R0 (radius ug))
	 (D0 (diameter ug))
	 (R0_D0 (/ R0 D0))
	 (aRe (Re ug p g w))
	 (_d (_delta ug)))
    (cond
      ((and (< R0_D0 3.0) (= _d 0.0))
       (values
	(Idl-6-1-1-ζ-277 aRe
			 (alfa ug)
			 (radius ug)
			 (diameter ug))
	"[1]"
	(format nil "Коэффициент местного сопротивления ~S ~S ~S ~S[м/с]" ug p g  w)))
      ((< R0_D0 3.0)
       (values
	(Idl-6-1-2-ζ-277 aRe
			 (alfa ug)
			 (radius ug)
			 (diameter ug) _d)
	"[1]"
	(format nil "Коэффициент местного сопротивления ~S ~S ~S ~S[м/с]" ug p g  w)))
      (T
       (values (format nil "Все погибло defmethod ζ ((ug <ugolnik>) (p <param>) (g <gas>) (w number))")
	       "[1]"
	       (format nil "Коэффициент местного сопротивления ~S ~S ~S ~S[м/с]" ug p g  w))))))

(defmethod ζ ((pr <perehod>) (p <param>) (g <gas>) (w number))
  "Здесь 
w>0 при течении среды от сечения diameter_1->diameter_2
w<0 при течении среды от сечения diameter_1<-diameter_2
"
  (cond 
    ((or (and (> w 0) (<= (diameter_2 pr) (diameter_1 pr)))
	 (and (< w 0) (<= (diameter_1 pr) (diameter_2 pr)))) ;;;; Сужение потока
					;     (break "BR1: Сужение потока~% defmethod ζ ((pr <perehod>) (p <param>) (g <gas>) (w number))")
     (values (Idl-5-23-1-ζ
	      (Re pr p g w)
	      (max (diameter_1 pr) (diameter_2 pr))
     	      (min (diameter_1 pr) (diameter_2 pr))
	      (len pr)
	      (delta pr))
	     "[1]"
	     (format nil "Коэффициент местного сопротивления конфузора ~S ~S ~S ~S[м/с]" pr p g  w)))
    ((or (and (< w 0) (<= (diameter_2 pr) (diameter_1 pr)))
	 (and (> w 0) (<= (diameter_1 pr) (diameter_2 pr)))) ;;;; Расширение потока
					;     (break "BR1: Расширение потока~% defmethod ζ ((pr <perehod>) (p <param>) (g <gas>) (w number)) ")
     (values (Idl-5-5-ζ (Re pr p g w)
			(max (diameter_1 pr) (diameter_2 pr))
			(min (diameter_1 pr) (diameter_2 pr))
			(len pr)
			(delta pr))
	     "[1]"
	     (format nil "Коэффициент местного сопротивления диффузора ~S ~S ~S ~S[м/с]" pr p g  w)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defgeneric Δ (element parameter <gas> vilocity)
  (:documentation "Возврвщает потери давления на элементе"))

(defmethod Δ ((tr <truba>) (p <param>) (g <gas>) (w number))
	   "Пример использования
(let ((p1  (make-instance '<param> :pressure (* 20. 101325.) :tempreche (+ 273.0 480.0))))
  ())
(Δ tr1 param1 <gas>1 10.0))
"
	   (form-2-2 (λ tr p g w) (len tr) (diameter tr) (ρ p g) w))

(defmethod Δ ((ug <ugolnik>) (p <param>) (g <gas>) (w number))
  "Потери давления в угольнике
(Δ u1 p1 g1 20.0)
"
  (*
   (ζ ug p g w) (ρ p g) w w 0.5))

(defmethod Δ ((pr <perehod>) (p <param>) (g <gas>) (w number))
  "Потери давления в переходе [1]
(Δ u1 p1 g1 20.0)
"
  (*
   (ζ pr p g w) (ρ p g) w w 0.5))

;;;;(defmethod Δ ((tr <metallorukav>) (p <param>) (g <gas>) (w number)) - определяется по формулам для трубы.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; part_1.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *part_01_doc*
  "Часть 1"
  "Общие сведения и элементы аэродинамики и гидравлики напорных систем")

;;;; (documentation '*part_01_doc* 'variable)

(defgeneric w-1-79 (param_in param_out gas)
  (:documentation "@b(Описание:) обобщенная функция @b(w-1-79)
возвращает скорость истечения газа из насадка.

 @b(Переменые:) 
@begin(list) 
@item(param_in  - параметры среды перед насадком;) 
@item(param_out - параметры среды, в которую истекает газ;)
@item(gas       - газ.) 
@end(list) 

Формула Сен-Венана-Венцеля (см. И.Е. Идельчик; Справочник по
гидравлическим сопротивлениям; 3-е издание, с. 41, формула 1-79."))

(defmethod w-1-79 ((p-in  <param>)
		   (p-out <param>)
                   (g     <gas>))
  (let (
        (pr-in  (pressure p-in))
        (pr-out (pressure p-out))
        (ρ-in  (ρ p-in g))
        (k     (k g)))
    (sqrt (* 2.0
             (/ k (- k 1.0))
             (/ pr-in ρ-in)
             (- 1.0
                (expt
                 (/ pr-out pr-in)
                 (/ (1- k) k)))))))

(defmethod velocity-by-param-in-out  ((p-in  <param>)
		                      (p-out <param>)
                                      (g     <gas>))
  (w-1-79 p-in p-out g))

(defgeneric G-1-80_81 (Area param_in param_out <gas>))

(defmethod G-1-80_81 ((Area number)
		      (p-in  <param>)
		      (p-out <param>)
		      (g <gas>))
  "I v3 p41
Определяет расход воздуха через сопло.
Пример использования:
(G-1-80_81 30e-6
	   (make-instance '<param> :tempreche 288.15 :pressure 2e5)
	   (make-instance '<param> :tempreche 288.15 :pressure 1.06e5)
	   (make-instance '<gas> :name \"Воздух\")
	   )
"
  (let* ((k (k g))
	 (ρ_in (ρ p-in g))
	 (pr_in (pressure p-in))
	 (pr_out (pressure p-out))
	 (p-out/in (/ pr_out pr_in))
	 (2k (* 2 k))
	 (2/k (/ 2 k))
	 (k-1 (- k 1))
	 (k+1 (+ k 1))
	 (k+1/k (/ k+1 k))
	 (p-out/in_kr (expt (/ 2 k+1) (/ k k-1)))
	 (G (* Area
	       (sqrt
		(* (/ 2k k-1)
		   ρ_in
		   pr_in
		   (-
		    (expt p-out/in 2/k)
		    (expt p-out/in k+1/k))))))
	 (G_kr
	   (* Area
	      (expt (/ 2 k+1) (/ k-1))
	      (sqrt (* (/ 2k k+1)
		       ρ_in
		       pr_in)))))
    (cond
      ((>= p-out/in p-out/in_kr)
       (values G "кг/с" "Массовый расход докритическая область"
	       (format nil "(p-out/in=~S)>=(p-out/in_kr~S) G_kr=~S" p-out/in p-out/in_kr G_kr)))
      ((< p-out/in p-out/in_kr)
       (values G_kr "кг/с" "Массовый расход сверхкритическая область"
	       (format nil "(p-out/in=~S)<(p-out/in_kr~S) G=~S" p-out/in p-out/in_kr G))))))

(defgeneric Area-1-80_81 (Mass-flow-rate p-in p-out <gas>))
  
(defmethod Area-1-80_81 ((Mass-flow-rate number)
			 (p-in  <param>)
			 (p-out <param>)
			 (g <gas>))
  "I v3 p41
Пример использования:
(Area-1-80_81 0.014284128
	   (make-instance '<param> :tempreche 288.15 :pressure 2e5)
	   (make-instance '<param> :tempreche 288.15 :pressure 1.06e5)
	   (make-instance '<gas> :name \"Воздух\")
	   )
"
  (let* ((k (k g))
	 (ρ_in (ρ p-in g))
	 (pr_in (pressure p-in))
	 (pr_out (pressure p-out))
	 (p-out/in (/ pr_out pr_in))
	 (2k (* 2 k))
	 (2/k (/ 2 k))
	 (k-1 (- k 1))
	 (k+1 (+ k 1))
	 (k+1/k (/ k+1 k))
	 (p-out/in_kr (expt (/ 2 k+1) (/ k k-1)))
	 (Area (/ Mass-flow-rate
		  (sqrt
		   (* (/ 2k k-1)
		      ρ_in
		      pr_in
		      (-
		       (expt p-out/in 2/k)
		       (expt p-out/in k+1/k))))))
	 (Area_kr
	   (/ Mass-flow-rate
	      (expt (/ 2 k+1) (/ k-1))
	      (sqrt (* (/ 2k k+1)
		       ρ_in
		       pr_in)))))
    (cond
      ((>= p-out/in p-out/in_kr)
       (values Area "м2" "Площадь (докритическая область)"
	       (format nil "(p-out/in=~S)>=(p-out/in_kr~S) Area_kr=~S" p-out/in p-out/in_kr Area_kr)))
      ((< p-out/in p-out/in_kr)
       (values Area_kr "м2" "Площадь (сверхкритическая область)"
	       (format nil "(p-out/in=~S)<(p-out/in_kr~S) Area=~S" p-out/in p-out/in_kr Area))))))

(defmethod mass-flow-rate ((f <forsunka>) (p-in <param>) (p-out <param>) (g <gas>))
  "@b(Пример использования:)
@begin[lang=lisp](code)
 (mass-flow-rate
   (make-instance '<forsunka> :area 27d-6 :name \"Форсунка\")
   (make-instance '<param> :pressure (+ 100000.0 101325.) :name \"Параметры на входе\")
   (make-instance '<param> :name \"Параметры на выходе\")
   (make-instance '<gas> :name \"Воздух\")) =>0.013291542221359807d0
@end(code)
"
  (G-1-80_81 (<forsunka>-area f) p-in p-out g))
#|
 (mass-flow-rate
   (make-instance 'idelchik:<forsunka> :area (* 6.377d-6 8.0) :name "Форсунка")
   (make-instance 'idelchik:<param> :pressure (+ 100000.0 101325.)
					 :tempreche 288.15
					 :name "Параметры на входе")
   (make-instance 'idelchik:<param> :name "Параметры на выходе")
   (make-instance 'idelchik:<gas> :name "Воздух"))

 =>0.013291542221359807d0
|#

(defmethod area-by-Mass-flow-rate ((f <forsunka>) (MFR number) (p-in  <param>) (p-out <param>) (g <gas>))
  "@b(Описание:) метод @b(area-by-Mass-flow-rate) возвращает объект типа <forsunka>,
расход газа @b(g), через которую будет равен @b(MFR) при параметрах на входе p-in и
параетрах на выходе p-out.

 @b(Переменые:)
@begin(list)
 @item(f - объект типа <forsunka>;)
 @item(MFR - массовый расход через форсунку;)
 @item(p-in - объект типа <param> параметры перед форсункой,
             (на результат влияет только температура);)
 @item(p-out - объект типа <param> параметры после форсунки
             (на результат влияет только давление);)
 @item(g - объект типа <gas>, расход которого задан.)
@end(list)

 @b(Пример использования:)
@begin[lang=lisp](code)
 (area-by-Mass-flow-rate
  (make-instance '<forsunka>)
  0.014284128
  (make-instance '<param> :tempreche 288.15 :pressure 2e5)
  (make-instance '<param> :tempreche 288.15 :pressure 1.06e5)
  (make-instance '<gas> :name \"Воздух\"))
@end(code)
"
  (setf (<forsunka>-area f)(Area-1-80_81 MFR p-in p-out g))
  f)

#|
 (defparameter *f*     (make-instance '<forsunka>))
 (defparameter *p-in*  (make-instance '<param> :tempreche 288.15 :pressure 2.0e5))
 (defparameter *p-out* (make-instance '<param> :tempreche 288.15 :pressure 1.06e5))
 (defparameter *g*     (make-instance '<gas> :name "Воздух"))
 (area-by-Mass-flow-rate *f* 0.014284128 *p-in* *p-out* *g*)
|#

(defmethod param_in-by-Mass-flow-rate ((f <forsunka>) (MFR number) (p-in <param>) (p-out <param>) (g <gas>))
  "@b(Описание:) метод @b(param_in-by-Mass-flow-rate) возвращает
параметры на входе в форсунку @b(f).

 @b(Переменые:)
@begin(list)
 @item(f - объект типа <forsunka>;)
 @item(MFR - массовый расход через форсунку;)
 @item(p-in - объект типа <param> параметры перед форсункой. На
             результат влияет только температура;)
@item(p-out - объект типа <param> параметры после форсунки. На
             результат влияет только давление;)
 @item(g - объект типа <gas>, расход которого задан.)
@end(list)

 @b(Пример использования:)
@begin[lang=lisp](code)
 (param_in-by-Mass-flow-rate
  (make-instance '<forsunka> :area 27d-6)
  0.013291542221359807d0
  (make-instance '<param> :pressure (+ 100000.0 101325.))
  (make-instance '<param>)
  (make-instance '<gas> :name \"Воздух\"))
   ; =>  #<param>( 201325.0[Па] 273.15[К])
@end(code)
"
  (let ((p-in_rez p-in))
    (setf (pressure p-in_rez) (math/half-div:h-div-lst
			       (* 1e6 (pressure p-out))
			       (pressure p-out)
			       #'(lambda(pr_in f M p-in_rez p-out g)
				   (setf (pressure p-in_rez) pr_in )
				   (- (mass-flow-rate f p-in p-out g) M))
			       0
			       (list nil f MFR p-in  p-out g)))
    p-in_rez))

#| 
 (param_in-by-Mass-flow-rate
  (make-instance '<forsunka> :area 27d-6)
  0.013291542221359807d0
  (make-instance '<param> :tempreche (+ 273.15 40))
  (make-instance '<param>)
  (make-instance '<gas> :name "Воздух"))

 (param_in-by-Mass-flow-rate
  (make-instance '<forsunka> :area 50d-6)
  0.013291542221359807d0
  (make-instance '<param> :pressure (+ 0.0 101325.))
  (make-instance '<param>)
  (make-instance '<gas> :name "Воздух"))

 => #<param>( 201325.0[Па] 273.15[К])
|# 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; part_2.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *part_02_doc*
  "Часть 2"
  "Сопротивление при течении по прямым трубам и каналам 
  (коэффициенты сопротивления трения и параметры шероховатости)")

(defparameter
    dia-2-1-b-2000-4000-data
  '((1111.0 0.032)
    (2.0e3 0.032)
    (2.5e3 0.034)
    (3.0e3 0.040)
    (4.0e3 0.040)
    (4444.0 0.040)))

(defparameter Idl-2-1-b_2000_4000-data
  '())

(defun dia-2-1-b-2000-4000(x)
  (table_aproximate x dia-2-1-b-2000-4000-data))

(defun Idl-2-1-a (Re)
  "(mapcar #'Idl-2-1-a '(10 100 500 1000 2000))
Гладкостенная труба
"
  (/ 64.0 Re))

(defun Idl-2-1-b(Re)
    "(mapcar #'Idl-2-1-b '(4e3 5e3 6e3  8e3 1e4 2e4 4e4 6e4 8e4 1e5))
"
  (/ 0.3164 (expt Re 0.25)))

(defun Idl-2-1-bv(Re)
  "(mapcar #'Idl-2-1-bv '(1e5 1e6 1e7 1e8))
"
  (/ 1.0
   (* (- (* 1.8 (lg Re)) 1.64)
      (- (* 1.8 (lg Re)) 1.64))))

(defun Idl-2-2-_d-Re-lam (_d Re lam)
  (let
      ((_delta-Re-sqrt_lambda (* _d Re (sqrt lam))))
    (cond
      ((< _delta-Re-sqrt_lambda 10.0) (values -0.80  2.0     0.0   _d Re lam))
      ((< _delta-Re-sqrt_lambda 20.0) (values 0.068  1.13   -0.87  _d Re lam))
      ((< _delta-Re-sqrt_lambda 40.0) (values 1.538  0.000  -2.0   _d Re lam))
      ((< _delta-Re-sqrt_lambda 191.2)(values 2.471 -0.588  -2.588 _d Re lam))
      (T (values 1.138 0.0 -2.0 _d Re lam)))))

(defun Idl-2-2-a1-b1-c1 (a1 b1 c1 _d Re lam)
  (/ 1.0
     (+ a1
	(* b1 (lg (* Re (sqrt lam))))
	(* c1 (lg _d)))
     (+ a1
	(* b1 (lg (* Re (sqrt lam))))
	(* c1 (lg _d)))))

(defun Idl-2-2 (Re _d)
  (do
   ( (_delta-Re-sqrt_lambda nil)
     (lam0 0.08)
     (lam1 0.008)
     (i 0 (1+ i)))
   ((< (abs (- 1.0 (/ lam1 lam0))) 0.00001) lam0)
    (setf  _delta-Re-sqrt_lambda (* _d Re (sqrt lam0))
	   lam1 (multiple-value-bind
		      (a1 b1 c1 _d1 _Re1 _lam1) (Idl-2-2-_d-Re-lam _d Re lam0)
		  (Idl-2-2-a1-b1-c1 a1 b1 c1 _d1 _Re1 _lam1))
	   lam0 (sqrt (* lam1 lam0)))))

(defun _delta_pred(Re)
  (/ ( - (* 18.0 (lg Re)) 16.4) Re))

(defun form-2-2(lam len dia ro w)
  (/ (* lam len ro w w ) (* 2.0 dia )))

(defun form-2-17 (_d)
  "(_delta_pred (form-2-17 0.001))"
  (/ 26.9 (expt _d 1.143)))

(defun form-2-18 (_d)
  (/ (- 217.0 (* 382.0 (lg _d))) _d))

(defun form-2-17_18 (_d)
  (values  (form-2-17 _d) (form-2-18 _d)))

(defun Idl-2-5_dzeta (l D0 mikro)
  "Сильфон (Idl-2-5_dzeta 0.4 0.050 0.0025)
"
  (* (/ l D0) (Idl-2-6-lambda (/ mikro D0))))


(defun Idl-2-6-lambda (delta)
  (/ 1.0 (* 2.0 2.0 (lg (/ 3.7 delta))(lg (/ 3.7 delta)))))


(defun Idl-2-1-b_2000_4000 () ;(x)
  1000.
    )

(defun Idl-2-1-λ_gl (aRe)
    "Коэффициент трения для гладкой трубы
"
  (cond
    ( (<= aRe 2.0d3)
     (values (Idl-2-1-a aRe) (format nil "Re=~A" aRe) "(Idl-2-1-a aRe)"))
    ((and (<= 2.0d3 aRe) (<= aRe 4.0d3))
     (values (dia-2-1-b-2000-4000 aRe)  (format nil "Re=~A" aRe) "(dia-2-1-b-2000-4000 aRe)"))
    ((and (<= 4.0d3 aRe) (<= aRe 100.0d3))
     (values (Idl-2-1-b aRe)  (format nil "Re=~A" aRe) "(Idl-2-1-b aRe)"))
    ((and (<= 100.0d3 aRe))
     (values (Idl-2-1-bv aRe)  (format nil "Re=~A" aRe) "(Idl-2-1-bv aRe)"))))

(defun Idl-2-2-λ_ravnomer (aRe _d)
  "Коэффициент трения для равномерно-шероховатой трубы
"
  (let* ((_d_pred (_delta_pred aRe)))
    (cond
      ((and (<= aRe (form-2-17 _d)))
       (values (Idl-2-1-λ_gl aRe)
	       (format nil "Re=~A" aRe)
	       "(Idl-2-1-λ_gl aRe)"))
      ((<= aRe (form-2-18 _d))
       (values (Idl-2-2 aRe _d)
	       (format nil "Re=~A" aRe)
	       "(Idl-2-2 aRe _d)" _d_pred))
      (T (values (Idl-2-6-lambda _d)
		 (format nil "Re=~A" aRe)
		 "(Idl-2-6-lambda _d)" _d_pred)))))

(Idl-2-1-λ_gl 4.010e4)
(Idl-2-2-λ_ravnomer 4.010e4 0.0009999995)

(form-2-17 0.000999)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; part_3.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *part_03_doc*
  "Часть 3"
  "Сопротивление при теченни на входе в трубы и каналы
  (коэффициенты сопротивления входных участков)")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; part_4.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *part_04_doc*
  "Часть 4"
  "Сопротивление при течении с внезапным изменением скорости и при перетекании потока через отверстия 
  (коэффициенты сопротивления участков с внезапным расширением сечения, внезапным сужением сечения, шайб, диафраrм, проeмов и др.)")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; part_5.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defparameter *part_05_doc*
  "Часть 5"
  "Сопротивление при течении с плавным изменением скорости 
  (коэффициенты сопротивления диффузоов, конфузоров и дрyrих переходных участков)")

(defun idl-5-5-ζ-rash (d1 d0 l)
  (let* (
	 (α_r (* 2.0 (atan (/ (- d1 d0) 2.0 l))))
	 (n   (/ (* d1 d1) (* d0 d0))))
    (* 3.2
       1.0
       (expt (tan (* α_r 0.5)) 1.25)
       (expt (- 1.0 (/ 1.0 n)) 2.0))))

(defun Idl-5-6-ζ-tr(Re d1 d0 l mikro)
  "Диффузор с доотрывным течением
Сопротивления трения
(Idl-5-6-ζ-tr 2e6 0.07 0.050 0.060 (* 0.001 0.02))
"
  (let*
      ((α_r  (* 2.0 (atan (/ (- d1 d0) 2.0 l))))
       (n    (/ (* d1 d1) (* d0 d0)))
       (_d   (/ mikro d0))
       (λ  (Idl-2-2-λ_ravnomer Re _d)))
    (/ (* λ (- 1.0 (/ 1.0 (* n n)))  ) 8.0 (sin (* 0.5 α_r)))))

(defun idl-5-5-ζ(Re D1 D0 l mikro)
  "Диффузор с доотрывным течением D1 > D0
D1    [м] - диаметр на выходе
D0    [м] - диаметр на входе
l     [м] - длина перехода
mikro [м] - абсолютеая высота микронеровностей
(idl-5-5-ζ 2e5 0.079 0.049 0.060 (* 0.001 0.02))
Потери определяются по скорости на входе
"
  (+
    (Idl-5-5-ζ-rash    D1 D0 l)
    (Idl-5-6-ζ-tr   Re D1 D0 l mikro)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun Idl-5-23-1-ζ (Re D1 D0 l mikro)
  "Конфузор D1 > D0
D1     [м] - вход   
D0     [м] - выход  [м]
l      [м] - длина  [м]
mikro  [м] - шероховатость
Потери определяются по скорости на выходе (меньший диаметр)
(Idl-5-23-1-ζ 2e5 0.079 0.049 0.060 (* 0.001 0.02)) 
"
  (let* ((α_r (* 2.0 (atan (/ (- D1 D0) 2.0 l))))
	 (n0 (/ (* D0 D0) (* D1 D1)))
	 (ζ
	  (*
	   (+
	    (* n0 n0 n0 n0 -0.0125)
	    (* n0 n0 n0 0.0224)
	    (* n0 n0 -0.00723)
	    (* n0 0.00444)
	    -0.00745
	    )
	   (+ (* α_r α_r α_r)
	      (* α_r α_r pi -2.0)
	      (* α_r -10.0)))))
    (+ ζ
       (idl-5-6-ζ-tr Re D1 D0 l mikro))))



(defun al (D1 D0 alfa)
  "Определяет длину перехода при заданных
  D1 - больший диаметр   [м]
  D0 - меньший диаметрд  [м]
  alfa - угол раскрытия [град]"
  (let ((alfa_r (* alfa (/ pi 180.0))))
    (/ (* 0.5 (- D1 D0)) (tan (* alfa_r 0.5)))))

;;;;(Idl-5-23-1-ζ 2e5 0.071 0.020 (al  0.071 0.020 60.0) 0.02e-3)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter ζд_alfa
  '(3 4 6 8 10 12 14 16 20 30 45 60 90 120 180))

(defparameter
    ζд_n2
    '((0.5e5 0.148 0.135 0.121 0.112 0.107 0.109 0.120 0.141 0.191 0.315 0.331 0.326 0.315 0.308 0.298) 
      (1.0e5 0.120 0.106 0.090 0.083 0.080 0.088 0.102 0.122 0.196 0.298 0.297 0.286 0.283 0.279 0.276) 
      (2.0e5 0.093 0.082 0.070 0.068 0.062 0.062 0.063 0.073 0.120 0.229 0.279 0.268 0.268 0.265 0.263) 
      (4.0e5 0.079 0.068 0.056 0.048 0.048 0.048 0.051 0.051 0.068 0.120 0.271 0.272 0.272 0.268 0.268)))

(defparameter
    ζд_n4
    '((0.5e5 0.197 0.180 0.165 0.151 0.157 0.174 0.197 0.225 0.298 0.461 0.606 0.680 0.643 0.630 0.615) 
      (1.0e5 0.154 0.141 0.126 0.119 0.120 0.131 0.155 0.183 0.262 0.479 0.680 0.628 0.600 0.593 0.585) 
      (2.0e5 0.120 0.112 0.101 0.096 0.096 0.107 0.120 0.146 0.180 0.360 0.548 0.586 0.585 0.580 0.567) 
      (4.0e5 0.101 0.091 0.085 0.079 0.082 0.090 0.107 0.124 0.172 0.292 0.462 0.562 0.582 0.577 0.567) 
      (6.0e5 0.101 0.091 0.085 0.089 0.080 0.107 0.135 0.169 0.240 0.382 0.506 0.560 0.582 0.577 0.567)))

(defparameter
    ζд_n6
    '((0.5e5 0.182 0.170 0.168 0.168 0.179 0.200 0.240 0.268 0.330 0.482 0.655 0.766 0.742 0.730 0.722) 
      (1.0e5 0.153 0.144 0.131 0.126 0.132 0.159 0.193 0.218 0.286 0.488 0.680 0.755 0.731 0.720 0.707) 
      (2.0e5 0.129 0.118 0.109 0.101 0.101 0.118 0.151 0.185 0.280 0.440 0.895 0.700 0.710 0.708 0.690) 
      (4.0e5 0.106 0.095 0.090 0.084 0.087 0.104 0.151 0.160 0.224 0.360 0.588 0.660 0.696 0.695 0.680) 
      (6.0e5 0.092 0.090 0.080 0.079 0.080 0.098 0.137 0.160 0.286 0.456 0.600 0.690 0.707 0.700 0.695)))

(defparameter
    ζд_n10
    '((0.5e5 0.195 0.181 0.184 0.190 0.200 0.227 0.256 0.290 0.380 0.585 0.760 0.800 0.834 0.840 0.827) 
      (1.0e5 0.160 0.156 0.155 0.156 0.162 0.184 0.212 0.240 0.332 0.572 0.812 0.800 0.820 0.820 0.815) 
      (2.0e5 0.123 0.120 0.120 0.123 0.134 0.151 0.167 0.195 0.240 0.426 0.760 0.800 0.806 0.807 0.808) 
      (4.0e5 0.100 0.097 0.097 0.100 0.106 0.128 0.160 0.195 0.254 0.407 0.605 0.735 0.804 0.805 0.809) 
      (6.0e5 0.085 0.084 0.084 0.085 0.086 0.114 0.160 0.212 0.332 0.520 0.600 0.760 0.825 0.840 0.825)))

(defparameter
    ζд_n16
    '((0.5e5 0.179 0.174 0.176 0.185 0.196 0.224 0.270 0.306 0.378 0.600 0.840 0.880 0.880 0.880 0.880) 
      (1.0e5 0.148 0.146 0.147 0.147 0.151 0.179 0.233 0.275 0.340 0.600 0.840 0.905 0.877 0.876 0.876)
      (2.0e5 0.118 0.120 0.120 0.120 0.120 0.140 0.176 0.208 0.280 0.520 0.760 0.868 0.868 0.868 0.868)
      (4.0e5 0.102 0.098 0.095 0.094 0.095 0.118 0.160 0.191 0.264 0.480 0.700 0.778 0.847 0.868 0.869)
      (6.0e5 0.094 0.085 0.084 0.085 0.094 0.118 0.160 0.212 0.342 0.560 0.720 0.790 0.853 0.874 0.886)))

(defun ζд-points (n alfa Re_ζ_lst)
  (let ((Re (mapcar #'(lambda (el) (car el)) Re_ζ_lst))
	(ζ  (mapcar #'(lambda (el) (cdr el)) Re_ζ_lst))
	(rez nil))
    (mapcar #'(lambda (el1 el2)
		(mapcar #'(lambda (ell alf) (setf rez (cons (list (lg n) (lg alf) (lg el1) (lg ell)) rez)))
			el2 alfa))
	    Re ζ)
    rez))


(defparameter ζд-points-data
  (apply #'append 
	 (mapcar #'(lambda (el)
		     (ζд-points (car el) (cadr el) (caddr el)))
		 (list (list  2 ζд_alfa ζд_n2)
		       (list  4 ζд_alfa ζд_n4)
		       (list  6 ζд_alfa ζд_n6)
		       (list 10 ζд_alfa ζд_n10)
		       (list 16 ζд_alfa ζд_n16)))))

(defparameter ζд-2-points-data
  (apply #'append 
	 (mapcar #'(lambda (el)
		     (ζд-points (car el) (cadr el) (caddr el)))
		 (list (list  2 ζд_alfa ζд_n2)))))



;;;;ζд-points-data


(defparameter kд-data
;;;; (l/D0 Re пn)  alfa        3    4    6    8    10   12   14   16   20   30   45   60   90  
  '((( 2  0.5e5 2)             1.00 1.10 1.20 1.25 1.26 1.26 1.23 1.16 1.05 1.00 1.01 1.01 1.01)
    (( 5  0.5e5 2)             1.45 1.62 1.75 1.83 1.86 1.80 1.70 1.53 1.10 1.02 1.02 1.02 1.02)
    ((10  0.5e5 2)             1.88 1.96 2.05 2.07 2.07 2.05 2.00 1.93 1.60 1.13 1.11 1.10 1.10)
    ((20  0.5e5 2)             1.68 1.83 1.96 2.00 1.99 1.93 1.85 1.74 1.45 1.03 1.01 1.01 1.01)
    (( 2 1e5 2)                1.00 1.10 1.20 1.27 1.43 1.60 1.67 1.60 1.10 0.85 0.96 1.11 1.13)
    (( 5 1e5 2)                1.63 1.83 2.00 2.11 2.20 2.19 2.11 1.88 1.20 1.00 1.13 1.15 1.15)
    ((10 1e5 2)                1.93 2.13 2.41 2.75 2.93 3.00 3.05 2.99 1.40 1.00 1.13 1.15 1.15)
    ((20 1e5 2)                1.86 2.07 2.31 2.60 2.68 2.60 2.45 2.13 1.45 1.00 1.13 1.13 1.15)
    (( 2  (3e5 4e5) 2)         1.31 1.45 1.60 1.80 2.05 2.33 2.40 2.40 2.20 1.56 1.20 1.15 1.13)
    (( 5  (3e5 4e5) 2)         1.53 1.70 1.90 2.14 2.54 2.90 3.02 3.00 2.60 1.56 1.20 1.15 1.13)
    ((10  (3e5 4e5) 2)         2.20 2.33 2.55 3.00 3.80 4.00 4.07 4.00 3.30 2.00 1.33 1.20 1.25)
    ((20  (3e5 4e5) 2)         1.91 2.07 2.25 2.46 3.20 3.70 3.83 3.73 3.03 1.56 1.20 1.15 1.13)
    (( 2 (2e5 5e5) 2)          1.18 1.33 1.50 1.67 1.95 2.20 2.31 2.13 1.60 1.27 1.14 1.13 1.11)
    (( 5 (2e5 5e5) 2)          1.15 1.75 2.05 2.30 2.60 2.70 2.80 2.58 1.85 1.33 1.15 1.14 1.11)
    ((10 (2e5 5e5) 2)          2.06 2.25 2.54 2.91 3.40 3.70 3.82 3.73 2.27 1.50 1.26 1.20 1.12)
    ((20 (2e5 5e5) 2)          1.75 1.93 2.28 2.60 3.00 3.22 3.36 3.20 2.10 1.43 1.20 1.16 1.11)
    (( 2 (6e5 6e35) 2)         1.00 1.14 1.33 1.65 1.90 2.00 2.06 1.90 1.53 1.26 1.10 1.07 1.10) 
    (( 5 (6e5 6e35) 2)         1.15 1.33 1.60 1.90 2.06 2.10 2.10 1.92 2.20 1.62 1.30 1.23 1.10) 
    ((10 (6e5 6e35) 2)         1.73 1.90 2.15 2.45 2.93 3.13 3.25 3.15 2.20 1.62 1.30 1.23 1.10) 
    ((20 (6e5 6e35) 2)         1.46 1.65 1.95 2.86 2.54 2.65 2.70 2.60 1.70 1.33 1.13 1.12 1.10)
    (( 2 0.5e5 (4 16))         1.00 1.04 1.07 1.20 1.38 1.28 1.05 1.14 1.07 1.05 1.05 1.06 1.05)
    (( 5 0.5e5 (4 16))         1.00 1.25 1.47 1.60 1.66 1.65 1.60 1.58 1.43 1.23 1.08 1.06 1.05)
    ((10 0.5e5 (4 16))         1.50 1.65 1.85 1.90 2.10 2.10 2.05 1.93 1.70 1.38 1.26 1.20 1.05)
    ((20 0.5e5 (4 16))         1.30 1.43 1.65 1.85 1.98 1.74 1.75 1.66 1.48 1.23 1.10 1.06 1.05)
    ((2  1e5 (4 16))           1.05 1.10 1.14 1.26 1.47 1.40 1.28 1.18 1.06 0.95 0.95 0.95 1.02)
    ((5  1e5 (4 16))           1.30 1.46 1.68 1.93 2.15 2.15 2.05 1.90 1.60 1.07 1.00 1.00 1.02)
    ((10 1e5 (4 16))           1.67 1.83 2.08 2.28 2.60 2.50 2.43 2.20 1.83 1.30 1.10 1.03 1.02)
    ((20 1e5 (4 16))           1.50 1.63 1.93 2.15 2.60 2.50 2.27 2.07 1.73 1.20 1.05 1.07 1.02)
    ((2  (3e5 4e5)(4 16))      1.07 1.25 1.40 1.60 2.14 2.25 2.20 2.12 1.90 1.53 1.25 1.10 1.05)
    ((5  (3e5 4e5)(4 16))      1.30 1.47 1.67 2.00 2.45 2.53 2.47 2.40 2.20 1.60 1.26 1.15 1.06)
    ((10 (3e5 4e5)(4 16))      1.90 2.05 2.30 2.70 3.38 3.30 3.13 3.00 2.65 1.80 1.30 1.15 1.06)
    ((20 (3e5 4e5)(4 16))      1.52 1.73 2.13 2.50 3.27 3.13 2.93 2.75 2.40 1.67 1.30 1.15 1.06)
    ((2  (2e5 5e5)(4 16))      1.00 1.20 1.40 1.63 2.05 2.13 2.07 1.95 1.68 1.32 1.15 1.13 1.07)
    ((5  (2e5 5e5)(4 16))      1.30 1.47 1.69 2.00 2.27 2.35 2.37 2.27 1.95 1.40 1.19 1.13 1.07)
    ((10 (2e5 5e5)(4 16))      1.80 2.00 2.25 2.60 3.30 3.20 3.00 2.80 2.40 1.53 1.26 1.20 1.07)
    ((20 (2e5 5e5)(4 16))      1.54 1.73 2.12 2.43 3.20 3.00 2.75 2.50 2.10 1.50 1.23 1.15 1.07)
    ((2  (6.0e5 6.0e35)(4 16)) 1.00 1.13 1.42 1.73 1.98 1.93 1.83 1.70 1.50 1.23 1.13 1.10 1.07)
    ((5  (6.0e5 6.0e35)(4 16)) 1.05 1.23 1.60 1.95 2.25 2.20 2.08 1.90 1.55 1.25 1.15 1.10 1.07)
    ((10 (6.0e5 6.0e35)(4 16)) 1.60 1.82 2.15 2.55 3.20 3.02 2.53 2.20 1.83 1.33 1.22 1.18 1.07)
    ((20 (6.0e5 6.0e35)(4 16)) 1.35 1.63 2.10 2.43 3.05 2.70 2.23 1.98 1.60 1.30 1.20 1.15 1.07)))


(defun ζд-5-2 (n alfa Re)
  (let ((X1 (lg n ))
	(X2 (lg alfa ))
	(X3 (lg Re)))
    (expt 10.0
	  (+
	     (* -0.950761 X1 X1 X1 X1 X1)
	     (* 0.156515 X2 X2 X2 X2 X2)
	     (* 0.0271212 X3 X3 X3 X3 X3)
	     (* 2.10449 X1 X1 X1 X1)
	     (* -0.725385 X2 X2 X2 X2)
	     (* -0.339477 X3 X3 X3 X3)
	     (* 0.101436 X1 X1 X2)
	     (* 0.0205264 X2 X2 X1)
	     (* 0.0264429 X2 X2 X3)
	     (* -0.0736903 X3 X3 X1)
	     (* -0.222286 X1 X1 X3)
	     (* -0.0141006 X3 X3 X2)
	     (* -2.32868 X1 X1)
	     (* 3.71354 X2 X2)
	     (* 16.9614 X3 X3)
	     (* 1.19515 X1 X3)
	     (* 0.287271 X2 X3)
	     (* -1.0307 X1)
	     (* -6.00984 X2)
	     (* -85.2958 X3)
	     (* 129.786 1.0)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; part_6.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defparameter *part_06_doc*
  "Часть 6"
  "Сопротивление при течении с изменением направления потока 
  (коэффициенты сопротивления изогнутых участков колен, отводов и др.)")

(defparameter Idl-6-1-1-A1-data
  '((0.000 0.0)
    (20.00 0.31)
    (30.00 0.45)   
    (45.00 0.60)
    (60.00 0.78)
    (75.00 0.90)
    (90.00 1.00)
    (110.0 1.13)
    (130.0 1.20)
    (150.0 1.28)
    (180.0 1.40)))

(defparameter Idl-6-1-1-B1-data
  '((0.444 1.18)
    (0.50 1.18)
    (0.60 0.77)
    (0.70 0.51)
    (0.80 0.37)
    (0.90 0.28)
    (1.00 0.21)
    (1.25 0.19)
    (1.50 0.17)
    (2.00 0.15)
    (4.00 0.11)
    (6.00 0.09)
    (8.00 0.07)
    (10.0 0.07)
    (20.0 0.05)
    (30.0 0.04)
    (40.0 0.03)
    (55.5 0.03)))

(defparameter Idl-6-1-kRe-data-279
 '((0.10e5 1.40 1.67 2.00)
   (0.14e5 1.33 1.58 1.89) 
   (0.20e5 1.26 1.49 1.77) 
   (0.30e5 1.19 1.40 1.64)
   (0.40e5 1.14 1.34 1.56)
   (0.60e5 1.09 1.26 1.46)
   (0.80e5 1.06 1.21 1.38)
   (1.00e5 1.04 1.19 1.30)
   (1.40e5 1.00 1.17 1.15)
   (2.00e5 1.00 1.14 1.02)
   (3.00e5 1.00 1.06 1.00)
   (4.00e5 1.00 1.00 1.0)))

(defun Idl-6-1-1-A1 (x)
  (table_aproximate x Idl-6-1-1-A1-data))

(defun Idl-6-1-1-B1 (x)
  (table_aproximate x Idl-6-1-1-B1-data))

(defun Idl-6-1-1-C1 (&optional (x 1.0)) x)

(defun Idl-6-1-1-ζm-277(delta_gradus R0_D0  &key (a0_b0 1.0))
  (*
    (Idl-6-1-1-A1 delta_gradus)
    (Idl-6-1-1-B1 R0_D0)
    (Idl-6-1-1-C1 a0_b0)))

(defun Idl-6-1-1-ζ-277 (Re delta_gradus R0 D0 &key (a0 R0) (b0 R0))
  "Поворот для гладкостенной трубы
delta_gradus - угол поворота в градусах 
R0[m] - средний радиус отвода (<ugolnik>)
D0[m] - диаметр отвода "
  (+ (Idl-6-1-1-ζm-277 delta_gradus (/ R0 D0) :a0_b0 (/ a0 b0))
     (*	0.0175 delta_gradus
	(Idl-2-1-λ_gl Re)
	(/ R0 D0))))

(defun Idl-6-1-2-k-Δ (Re R0 D0 _d)
  (values
   (cond
     ((and
       (<= (/ R0 D0) 0.55)
       (<= 3.0e3 Re) (<= Re 4.0e4)) 1.0)
     ((and
       (<= (/ R0 D0) 0.55)
       (< 4.0e4 Re))
      (cond
	((= _d 0.0) 1.0)
	((<= _d 0.001) (+ 1.0 (* 0.5e3 _d)))
	((< 0.001 _d) 1.5)))
     ((and
       (< 0.55 (/ R0 D0))
       (<= 3.0e3 Re) (<= Re 4.0e4))
      (cond
	((= _d 0.0) 1.0)
	((<= _d 0.001) 1.0)
	((< 0.001 _d) 1.0)))
     ((and
       (< 0.55 (/ R0 D0))
       (< 4.0e4 Re) (<= Re 2.0e5))
      (cond
	((= _d 0.0) 1.0)
	((<= _d 0.001) (/ (Idl-2-2-λ_ravnomer Re _d) (Idl-2-1-λ_gl Re)))
	((< 0.001 _d) 2.0)))
     ((and
       (< 0.55 (/ R0 D0))
       (< 2.0e5 Re))
      (cond
	((= _d 0.0) 1.0)
	((<= _d 0.001) (+ 1.0 (* 1.0e3 _d)))
	((< 0.001 _d) 2.0))))
   (format nil "R0=~A D0=~A Re=~A _d=~A" R0 D0 Re _d)))

(defun Idl-6-2-λk(R0 D0 Re)
  (let ( 
	(D0_2_R0 (/ D0 2 R0))
	(Re_R0_D0 (* Re (sqrt (/ D0 2 R0))))
	)
    (cond
      ((< Re_R0_D0 50) 0.0)
      ((< Re_R0_D0 600) 
       (* 
	(/ 20 (expt Re 0.65))
	(expt D0_2_R0 0.175)))
      ((< Re_R0_D0 1400) 
       (* 
	(/ 10.4 (expt Re 0.55))
	(expt D0_2_R0 0.225)))
      ((< Re_R0_D0 5000) 
       (* 
	(/ 5 (expt Re 0.45))
	(expt D0_2_R0 0.275))))))

(defun Idl-6-1-kRe_279(Re R0 D0)
  (let* ((R0D0 (/ R0 D0))
	 (lst (cond 
		((<= R0D0 0.55)
		 (mapcar #'(lambda(el) (list (first el) (second el))) Idl-6-1-kRe-data-279))
		((<= R0D0 0.7)
		 (mapcar #'(lambda(el) (list (first el) (third el))) Idl-6-1-kRe-data-279))
		((< 0.7 R0D0)
		 (mapcar #'(lambda(el) (list (first el) (fourth el))) Idl-6-1-kRe-data-279)))))
    (table_aproximate Re lst)))

(defun Idl-6-1-2-ζ-277 (Re delta_gradus R0 D0 _d &key (a0 R0) (b0 R0))
  "Поворот для шероховатой трубы при Re >= 1.0e4
delta_gradus - угол поворота в градусах
R0[m]        - средний радиус отвода (<ugolnik>)
D0[m]        - диаметр отвода
_d           - относительная шероховатость    "
  (let* ((R0_D0 (/ R0 D0))
	 (kRe (Idl-6-1-kRe_279 Re R0 D0))
	 (kΔ  (Idl-6-1-2-k-Δ   Re R0 D0 _d))
	 (ζm  (Idl-6-1-1-ζm-277 delta_gradus R0_D0 ))
	 (λ   (Idl-2-2-λ_ravnomer Re _d)))
    (values
     (+ (* kRe kΔ ζm) (* 0.0175 delta_gradus λ R0_D0))
     R0_D0 kRe kΔ ζm λ a0 b0)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; part_7.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *part_07_doc*
  "Часть 7"
  "Сопротивление при течении со слиянием потоков или разделением потока 
  (коэффициeнты сопротивления тройников, крестовин, распределительных коллекторов)")

(defun Idl-7-29-2 (k w_b w_c)
  "Тройник разделяющий
w_b скорость в боковом отводе
w_c скорость в подводе
k=0.3 для сварных тройников
"
  (+ 1.0 (* k (/ (* w_b w_b) (* w_c w_c))))
  )

(defun Idl-7-29-1 ()
  "Тройник собирающий"
  1.0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; part_8.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(in-package :idelchik)

(defparameter *part_08_doc*
  "Часть 8"
  "Сопротивление при течении через препятствия, равномерно распределенные по сечеиию каналов 
  (коэффициенты сопротивления решеток, сеток, пористых слоев, насадок и др.)")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; part_9.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *part_09_doc*
  "Часть 9"
  "Сопротивление при течении через трубопроводную арматуру и лабиринты 
  (коэффицненты сопротнвления клапаиов, задвижек, затворов, лабириинтов, компенсаторов)")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; part_10.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *part_10_doc*
  "Часть 10"
  "Сопротивление при обтекании тел потоком в трубе 
   (коэффициенты сопротивления участков с выступами, распорками, фермами и дрyгими телами)")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; part_11.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *part_11_doc*
  "Часть 11"
  "Сопротивления при течении на выходе из труб и каналов 
   (коэффициенты сопротивлення выходных участков)")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; part_12.lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *part_12_doc*
  "Часть 12"
  "Сопротивление при течеиии через различные аппараты 
   (коэффициенты сопротивления аппаратов и дрyrих устройств)")

