;;;; part_1.lisp

(in-package #:idelchik)

(defparameter part_1_doc
  "Общие сведения и элементы аэродинамики и гидравлики напорных систем")

(defmethod G-1-80_81((Area number)
		     (p_in  parametrised)
		     (p_out parametrised)
		     (g gas))
  "I v3 p41"
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

(G-1-80_81 30e-6
	   (make-instance 'parametrised :tempreche 288.15 :pressure 2e5)
	   (make-instance 'parametrised :tempreche 288.15 :pressure 1.06e5)
	   (make-instance 'gas :name "Воздух")
	   )

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

;;;;(remove-method #'mass-flow-rate
;;;;(find-method #'mass-flow-rate '() (mapcar #'find-class '(forsunka parametrised parametrised gas)) nil)
;;;;)

