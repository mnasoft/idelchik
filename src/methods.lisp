;;;;methods.lisp

(in-package #:idelchik)

(defmethod μ ((gas <gas>))
  "@b(Описание:) функция @b(μ) возвращает молекулярную массу газа, [kg/mol].

 @b(Пример использования:)
@begin[lang=lisp](code)
 (idelchik:μ (make-instance 'idelchik:<gas> :name \"Воздух\"))
@end(code)"
  (values (varghaftik:μ :gas_name (name gas)) "[kg/mol]" "Молекулярная масса газа"))

(defmethod k ((gas <gas>))
  "@b(Описание:) функция @b(k) возвращает коэффициент адиабаты газа.

 @b(Пример использования:)
@begin[lang=lisp](code)
 (idelchik:k (make-instance 'idelchik:<gas> :name \"Воздух\"))
@end(code)"
  (values (varghaftik:k :gas_name (name gas))"[1]" "Показатель адиабаты" ))

(defmethod ρ ((param <param>) (gas <gas>))
  "@b(Описание:) функция @b(ρ) возвращает плотность газа, [kg/m^3].

 @b(Пример использования:)
@begin[lang=lisp](code)
 (idelchik:ρ (make-instance 'idelchik:<gas> :name \"Воздух\"))
@end(code)"
  (values (/ (* (pressure param) (μ gas) ) (* varghaftik:Rμ (tempreche param)))
	  "[kg/m^3]" "Плотность газа"))

(defmethod η((p <param>) (gas <gas>))
  "@b(Описание:) функция @b(η) возвращает коэффициент динамической вязкости газа, [Pa*s].

 @b(Пример использования:)
@begin[lang=lisp](code)
 (idelchik:ρ (make-instance 'idelchik:<gas> :name \"Воздух\"))
@end(code)"
  (values (varghaftik:η_sazerlend (tempreche p) :gas_name (name gas))
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
