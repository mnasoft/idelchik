;;;;methods.lisp

(in-package #:idelchik)

(defmethod μ ((gas <gas>))
  (values (varghaftik:μ :gas_name (name gas)) "[kg/mol]" "Молекулярная масса газа"))

(defmethod k ((gas <gas>))
  (values (varghaftik:k :gas_name (name gas))"[1]" "Показатель адиабаты" ))

(defmethod ρ ((param <param>) (gas <gas>))
  (values (/ (* (pressure param) (μ gas) ) (* varghaftik:Rμ (tempreche param)))
	  "[kg/m^3]" "Плотность газа"))

(defmethod η((p <param>) (gas <gas>))
  (values (varghaftik:η_sazerlend (tempreche p) :gas_name (name gas))
	  "[Pa*s]"
	  "Коэффициент динамической вязкости газа"))

(defmethod ν ((param <param>) (gas <gas>))
  (values (/ (η param gas) (ρ param gas))
          "[m^2/s]" "Коэффициент кинематической вязкости газа"))

(defmethod <rib>-name ((rib <rib>))
    "Выполняет вывод на печать списка рёбер в форме пригодной для вставки в исходный код
Пример исползования:
(mapcar #'(lambda (el) (<rib>-name el)) ribs)
"
    (format T "(make-instance '<gidro-rib> :v1 \"~A\" :v2 \"~A\" :name \"~A-~A\")~%"
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
