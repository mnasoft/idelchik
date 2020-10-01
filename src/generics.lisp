;;;;generics.lisp

(in-package #:idelchik)

(defgeneric μ (gas)
  (:documentation
   "Возвращает молекулярную массу газа [kg/mol]
Пример использования:
(let ((g1 (make-instance 'gas :name \"Водород\")))
  (μ g1))"))

(defgeneric k (gas)
  (:documentation   "Возвращает показатель адиабаты газа [1]"))

(defgeneric ρ (parametrised gas)
  (:documentation
   "Возвращает плотность газа [kg/m^3]
Пример использования:
(let 
    ((p1 (make-instance 'parametrised :pressure 101325. :tempreche (+ 273.0 0.0)))
     (g1 (make-instance 'gas :name \"Воздух\")))
  (ρ p1 g1))"))

(defgeneric η(parametrised gas)
  (:documentation
   "Возвращает коэффициент динамической вязкости газа [Pa*s]
Пример использования:
(let 
    ((p1 (make-instance 'parametrised :pressure 101325. :tempreche (+ 273.0 0.0)))
     (g1 (make-instance 'gas :name \"Воздух\")))
  (η p1 g1))")
  )

(defgeneric ν (parametrised gas)
  (:documentation
   "Возвращает коэффициент кинематической вязкости газа [m^2/s]
Пример использования:
(let 
    ((p1 (make-instance 'parametrised :pressure 101325. :tempreche (+ 273.0 0.0)))
     (g1 (make-instance 'gas :name \"Воздух\")))
  (ν p1 g1))"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defgeneric mass-flow-rate (forsunka p_in p_out gas)
  (:documentation "Массовый расход через насадок
Аргументы:
forsunka - форсунка, определяет площадь;
MFR      - массовый расход, кг/с;
p_in     - определяет температуру перед форсункой;
p_out    - определяет давление за форсункой;
gas      - газ, протекающий через отверстия форсунки."))

(defgeneric area-by-Mass-flow-rate(forsunka MFR p_in p_out gas)
  (:documentation "Определят и устанавливает площадь для форсунки forsunka такую, чтобы через нее проходил массовый расход MFR газа gas
при пререпаде на форсунке определяемом давлениями из параметров p_in и p_out при температуре на входе (из параметра p_in).
Аргументы:
forsunka - форсунка, определяет площадь;
MFR      - массовый расход, кг/с;
p_in     - определяет температуру перед форсункой;
p_out    - определяет давление за форсункой;
gas      - газ, протекающий через отверстия форсунки."))

(defgeneric param_in-by-Mass-flow-rate(forsunka MFR p_in p_out gas)
  (:documentation "Вычисляет давление параметра p_in при котором через форсунку forsunka пройдет массовый расход MFR газа gas 
при давлении на выходе, определяемом параметром p_out.
Аргументы:
forsunka - форсунка, определяет площадь;
MFR      - массовый расход, кг/с;
p_in     - определяет температуру перед форсункой;
p_out    - определяет давление за форсункой;
gas      - газ, протекающий через отверстия форсунки."))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defgeneric out (rib)
  (:documentation "Выполняет вывод объекта на печать"))

(defgeneric rib-name (rib)
  (:documentation "Выполняет вывод на печать списка рёбер в форме пригодной для вставки в исходный код
Пример исползования:
(mapcar #'(lambda (el) (rib-name el)) ribs)"))

(defgeneric mk-rib (element)
  (:documentation "Создаёт список рёбер, основанный на списке вершин элемента."))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defgeneric diameter_1 (element)
  (:documentation "diameter_1"))
