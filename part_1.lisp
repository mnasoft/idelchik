;;;; part_1.lisp

(in-package #:idelchik)

(defparameter part_1_doc
  "Общие сведения и элементы аэродинамики и гидравлики напорных систем")

(defmethod G-1-80_81((Area number)
		     (p_in  parametrised)
		     (p_out parametrised)
		     (g gas))
  "I v3 p41
Пример использования:
(G-1-80_81 30e-6
	   (make-instance 'parametrised :tempreche 288.15 :pressure 2e5)
	   (make-instance 'parametrised :tempreche 288.15 :pressure 1.06e5)
	   (make-instance 'gas :name \"Воздух\")
	   )
"
  (let* ((k (k g))
	 (ρ_in (ρ p_in g))
	 (pr_in (pressure p_in))
	 (pr_out (pressure p_out))
	 (p_out/in (/ pr_out pr_in))
	 (2k (* 2 k))
	 (2/k (/ 2 k))
	 (k-1 (- k 1))
	 (k+1 (+ k 1))
	 (k+1/k (/ k+1 k))
	 (p_out/in_kr (expt (/ 2 k+1) (/ k k-1)))
	 (G (* Area
	       (sqrt
		(* (/ 2k k-1)
		   ρ_in
		   pr_in
		   (-
		    (expt p_out/in 2/k)
		    (expt p_out/in k+1/k))))))
	 (G_kr
	  (* Area
	     (expt (/ 2 k+1) (/ k-1))
	     (sqrt (* (/ 2k k+1)
		      ρ_in
		      pr_in)))))
    (cond
      ((>= p_out/in p_out/in_kr)
       (values G "кг/с" "Массовый расход докритическая область"
	       (format nil "(p_out/in=~S)>=(p_out/in_kr~S) G_kr=~S" p_out/in p_out/in_kr G_kr)))
      ((< p_out/in p_out/in_kr)
       (values G_kr "кг/с" "Массовый расход сверхкритическая область"
	       (format nil "(p_out/in=~S)<(p_out/in_kr~S) G=~S" p_out/in p_out/in_kr G))))))

(defmethod Area-1-80_81((Mass-flow-rate number)
			(p_in  parametrised)
			(p_out parametrised)
			(g gas))
  "I v3 p41
Пример использования:
(Area-1-80_81 0.014284128
	   (make-instance 'parametrised :tempreche 288.15 :pressure 2e5)
	   (make-instance 'parametrised :tempreche 288.15 :pressure 1.06e5)
	   (make-instance 'gas :name \"Воздух\")
	   )
"
  (let* ((k (k g))
	 (ρ_in (ρ p_in g))
	 (pr_in (pressure p_in))
	 (pr_out (pressure p_out))
	 (p_out/in (/ pr_out pr_in))
	 (2k (* 2 k))
	 (2/k (/ 2 k))
	 (k-1 (- k 1))
	 (k+1 (+ k 1))
	 (k+1/k (/ k+1 k))
	 (p_out/in_kr (expt (/ 2 k+1) (/ k k-1)))
	 (Area (/ Mass-flow-rate
		  (sqrt
		   (* (/ 2k k-1)
		      ρ_in
		      pr_in
		      (-
		       (expt p_out/in 2/k)
		       (expt p_out/in k+1/k))))))
	 (Area_kr
	  (/ Mass-flow-rate
	     (expt (/ 2 k+1) (/ k-1))
	     (sqrt (* (/ 2k k+1)
		      ρ_in
		      pr_in)))))
    (cond
      ((>= p_out/in p_out/in_kr)
       (values Area "м2" "Площадь (докритическая область)"
	       (format nil "(p_out/in=~S)>=(p_out/in_kr~S) Area_kr=~S" p_out/in p_out/in_kr Area_kr)))
      ((< p_out/in p_out/in_kr)
       (values Area_kr "м2" "Площадь (сверхкритическая область)"
	       (format nil "(p_out/in=~S)<(p_out/in_kr~S) Area=~S" p_out/in p_out/in_kr Area))))))

(defmethod mass-flow-rate((f forsunka) (p_in  parametrised) (p_out parametrised) (g gas))
  "Массовый расход через насадок
Пример использования:
(mass-flow-rate
 (make-instance 'forsunka :area 30e-6)
 (make-instance 'parametrised :tempreche 288.15 :pressure 2e5)
 (make-instance 'parametrised :tempreche 288.15 :pressure 1.06e5)
 (make-instance 'gas :name \"Воздух\"))
"
  (G-1-80_81 (area f) p_in p_out g))

(defmethod area-by-Mass-flow-rate((f forsunka) (Mass-flow-rate number) (p_in  parametrised) (p_out parametrised) (g gas))
  "Определят и устанавливает площадь для форсунки f такую,
чтобы через нее проходил 
массовый расход Mass-flow-rate [кг/с]
газа g 
при пререпаде на форсунке определяемом давлениями из параметров 
p_in и p_out
при температуре на входе (из параметра p_in).
Пример использования:
(area-by-Mass-flow-rate
 (make-instance 'forsunka)
 0.014284128
 (make-instance 'parametrised :tempreche 288.15 :pressure 2e5)
 (make-instance 'parametrised :tempreche 288.15 :pressure 1.06e5)
 (make-instance 'gas :name \"Воздух\"))
"
  (setf (area f)(Area-1-80_81 Mass-flow-rate p_in p_out g))
  f)

;;;;(remove-method #'mass-flow-rate
;;;;(find-method #'mass-flow-rate '() (mapcar #'find-class '(forsunka parametrised parametrised gas)) nil)
;;;;)


;;;;(defparameter f1 (make-instance 'forsunka :area 30e-6))


;;;;(mass-flow-rate
;;;; (make-instance 'forsunka :area 30e-6)
;;;; (make-instance 'parametrised :tempreche 288.15 :pressure 2e5)
;;;; (make-instance 'parametrised :tempreche 288.15 :pressure 1.06e5)
;;;; (make-instance 'gas :name "Воздух"))

;;;;(Area-1-80_81 0.014284128
;;;;	   (make-instance 'parametrised :tempreche 288.15 :pressure 2e5)
;;;;	   (make-instance 'parametrised :tempreche 288.15 :pressure 1.06e5)
;;;;	   (make-instance 'gas :name "Воздух")
;;;;	   )


