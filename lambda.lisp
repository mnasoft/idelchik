;;;; lambda.lisp

(in-package #:idelchik)

(defmethod μ ((g gas))
  "Возвращает молекулярную массу газа [kg/mol]
Пример использования
(let ((g1 (make-instance 'gas :name \"Водород\")))
  (μ g1))"
  (values (varghaftik:μ :gas_name (name g))"[kg/mol]" "Молекулярная масса газа" (out g)))

(defmethod ρ ((p parametrised) (g gas))
  "Возвращает плотность газа [kg/m^3]
Пример использования:
(let 
    ((p1 (make-instance 'parametrised :pressure 101325. :tempreche (+ 273.0 0.0)))
     (g1 (make-instance 'gas :name \"Воздух\")))
  (ρ p1 g1))"
  (values (/ (* (pressure p) (μ g) ) (* varghaftik:Rμ (tempreche p)))
	  "[kg/m^3]" "Плотность газа"
	  (out g)
	  (out p)))

(defmethod η((p parametrised) (g gas))
  "Возвращает коэффициент динамической вязкости газа [Pa*s]
Пример использования:
(let 
    ((p1 (make-instance 'parametrised :pressure 101325. :tempreche (+ 273.0 0.0)))
     (g1 (make-instance 'gas :name \"Воздух\")))
  (η p1 g1))"
  (values (varghaftik:η_sazerlend (tempreche p) :gas_name (name g))
	  "[Pa*s]"
	  "Коэффициент динамической вязкости газа"
	  (out g)
	  (out p)))

(defmethod ν ((p parametrised) (g gas))
    "Возвращает коэффициент кинематической вязкости газа [m^2/s]
Пример использования:
(let 
    ((p1 (make-instance 'parametrised :pressure 101325. :tempreche (+ 273.0 0.0)))
     (g1 (make-instance 'gas :name \"Воздух\")))
  (ν p1 g1))"
  (values (/ (η p g) (ρ p g))"[m^2/s]" "Коэффициент кинематической вязкости газа" (name g)))

(defmethod Re ((tr truba) (p parametrised) (g gas) (w number))
  "Возвращает число Рейнольдса для трубы круглого поперечного сечения [1]
Пример использования:
(let 
    ((p1 (make-instance 'parametrised :pressure 101325. :tempreche (+ 273.0 0.0)))
     (g1 (make-instance 'gas :name \"Воздух\"))
     (tr1 (make-instance 'truba  :name \"T-EE-EF\" :diameter (truba-in-dia 0.010) :length 2.500 :vertexes '(\"EE\" \"EF\")))
     (w 15.0)
     )
  (Re tr1 p1 g1 w))"
  (values (/ (* (diameter tr) w) (ν p g))
	  "[1]"
	  "Число Рейнольдса для газа"
	  (out g)
	  (out p)))

(defmethod _delta( (tr truba) )
  (/ (delta tr)(diameter tr)))

(defmethod λ ((tr truba) (p parametrised) (g gas) (w number))
  (let* ((aRe (Re tr p g w))
	 (_d (_delta tr)))
    (cond
      ((= _d 0.0) (Idl-2-1-λ_gl aRe))
      (T (Idl-2-2-λ_ravnomer aR _d)))))

(defmethod Δ ((tr truba) (p parametrised) (g gas) (w number))
  "Пример использования
(Δ tr1 param1 gas1 10.0)"
  (form-2-2 (λ tr p g w) (len tr) (diameter tr) (ρ p g) w))

;;(let ((p1 (make-instance 'parametrised :pressure 101325. :tempreche (+ 273.0 0.0))) (g1 (make-instance 'gas :name "Воздух"))) (ρ p1 g1))
;;;;(defparameter tr1 (make-instance 'truba :name "T-EE-EF" :diameter 0.071 :length 2.500 :vertexes '("EE" "EF")))
;;;;(defparameter param1 (make-instance 'parametrised :pressure 101325. :tempreche (+ 273.0 0.0))) 
;;;;(defparameter gas1 (make-instance 'gas :name "Воздух"))
;;;;(defparameter gas2 (make-instance 'gas :name "Водород"))

;;;;(out tr1)
