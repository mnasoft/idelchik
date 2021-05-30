;;;;generics.lisp

(in-package #:idelchik)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defgeneric mass-flow-rate (<forsunka> p_in p_out <gas>)
  (:documentation "Массовый расход через насадок
Аргументы:
<forsunka> - форсунка, определяет площадь;
MFR      - массовый расход, кг/с;
p_in     - определяет температуру перед форсункой;
p_out    - определяет давление за форсункой;
<gas>      - газ, протекающий через отверстия форсунки."))

(defgeneric area-by-Mass-flow-rate(<forsunka> MFR p_in p_out <gas>)
  (:documentation "Определят и устанавливает площадь для форсунки <forsunka> такую, чтобы через нее проходил массовый расход MFR газа <gas>
при пререпаде на форсунке определяемом давлениями из параметров p_in и p_out при температуре на входе (из параметра p_in).
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defgeneric out (<rib>)
  (:documentation "Выполняет вывод объекта на печать"))

(defgeneric <rib>-name (<rib>)
  (:documentation
   " @b(Описание:) обобщенная_функция @b(<rib>-name) выполняет вывод на
 печать списка рёбер в форме пригодной для вставки в исходный код

 @b(Пример исползования:)
@begin[lang=lisp](code)
  (mapcar #'(lambda (el) (<rib>-name el)) ribs)
@end(code)"

))

(defgeneric mk-rib (<element>)
  (:documentation "Создаёт список рёбер, основанный на списке вершин элемента."))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defgeneric diameter_1 (<element>)
  (:documentation "diameter_1"))
