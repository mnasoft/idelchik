;;;;methods.lisp

(in-package #:idelchik)

(defmethod μ ((g <gas>))
  (values (varghaftik:μ :gas_name (name g))"[kg/mol]" "Молекулярная масса газа" (format nil "~S" g)))

(defmethod k ((g <gas>))
  (values (varghaftik:k :gas_name (name g))"[1]" "Показатель адиабаты" (format nil "~S" g)))

(defmethod ρ ((p <param>) (g <gas>))
  (values (/ (* (pressure p) (μ g) ) (* varghaftik:Rμ (tempreche p)))
	  "[kg/m^3]" "Плотность газа"
	  (format nil "~S" g)
	  (format nil "~S" p)))

(defmethod η((p <param>) (g <gas>))
  (values (varghaftik:η_sazerlend (tempreche p) :<gas>_name (name g))
	  "[Pa*s]"
	  "Коэффициент динамической вязкости газа"
	  (format nil "~S" g)
	  (format nil "~S" p)))

(defmethod ν ((p <param>) (g <gas>))
  (values
   (/ (η p g) (ρ p g))
   "[m^2/s]"
   (format nil "Коэффициент кинематической вязкости газа ~S ~S" (format nil "~S" g) (format nil "~S" p))))

(defmethod <rib>-name ((x <rib>))
    "Выполняет вывод на печать списка рёбер в форме пригодной для вставки в исходный код
Пример исползования:
(mapcar #'(lambda (el) (<rib>-name el)) ribs)
"
    (format T "(make-instance '<gidro-rib> :v1 \"~A\" :v2 \"~A\" :name \"~A-~A\")~%"
	    (<rib>-v1 x)
	    (<rib>-v2 x)
	    (<rib>-v1 x)
	    (<rib>-v2 x)))

(defmethod mk-rib ((x <element>))
  "Создаёт список рёбер, основанный на списке вершин элемента."
  (let ((v-lst (vertexes x)))
    (cond
      ((= 2 (length v-lst))
       (list (make-<gidro-rib> (first v-lst) (second v-lst))))
      (T nil))))
