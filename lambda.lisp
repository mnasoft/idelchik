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

(defmethod Re ((ug ugolnik) (p parametrised) (g gas) (w number))
  "Возвращает число Рейнольдса для трубы круглого поперечного сечения [1]
Пример использования:
(let 
    ((p1 (make-instance 'parametrised :pressure 101325. :tempreche (+ 273.0 0.0)))
     (g1 (make-instance 'gas :name \"Воздух\"))
     (tr1 (make-instance 'truba  :name \"T-EE-EF\" :diameter (truba-in-dia 0.010) :length 2.500 :vertexes '(\"EE\" \"EF\")))
     (w 15.0)
     )
  (Re tr1 p1 g1 w))"
  (values (/ (* (diameter ug) w) (ν p g))
	  "[1]"
	  "Число Рейнольдса для газа"
	  (out g)
	  (out p)))

(defmethod _delta( (tr truba) )
  (/ (delta tr)(diameter tr)))

(defmethod _delta( (ug ugolnik) )
  (/ (delta ug)(diameter ug)))

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

;;;;(defparameter tr1    (make-instance 'truba :name "T-EE-EF" :diameter 0.070 :length 2.500 :vertexes '("EE" "EF")))
;;;;(defparameter ug1    (make-instance 'ugolnik :name "T-EE-EF" :diameter 0.070 :vertexes '("EE" "EF")))
;;;;(defparameter p1 (make-instance 'parametrised :pressure (* 20. 101325.) :tempreche (+ 273.0 480.0)))
;;;;(defparameter g1 (make-instance 'gas :name "Воздух"))
;;;;(Re ug1 p1 g1 20)

;;;;(defparameter u1 (make-instance 'ugolnik :name "U-BN-BP" :diameter (ugolnik-in-dia 0.075) :radius (ugolnik-radius 0.075) :vertexes '("BN" "BP")))

(defmethod ζ ((ug ugolnik) (p parametrised) (g gas) (w number))
  (let* ((R0 (radius u1))
	 (D0 (diameter u1))
	 (R0_D0 (/ R0 D0))
	 (aRe (Re ug p g w))
	 (_d (_delta ug)))
    (cond
      ((and (< R0_D0 3.0) (= _d 0.0))
       (values (Idl-6-1-1-ζ-277 aRe (alfa ug) (radius u1) (diameter u1))
	       (format nil "R0=~S" R0)
	       (format nil "D0=~S" D0)
       	       (format nil "R0_D0=~S" R0_D0)
	       (format nil "aRe=~S" aRe)
	       (format nil "_d=~S" _d)))
      ((< R0_D0 3.0)
       (values (Idl-6-1-2-ζ-277 aRe (alfa ug) (radius u1) (diameter u1) _d)
	       (format nil "R0=~S" R0)
	       (format nil "D0=~S" D0)
       	       (format nil "R0_D0=~S" R0_D0)
	       (format nil "aRe=~S" aRe)
	       (format nil "_d=~S" _d)))
      (T
       (values (format nil "Все погибло defmethod ζ ((ug ugolnik) (p parametrised) (g gas) (w number))")
	       (format nil "R0=~S" R0)
	       (format nil "D0=~S" D0)
       	       (format nil "R0_D0=~S" R0_D0)
	       (format nil "aRe=~S" aRe)
	       (format nil "_d=~S" _d))))))

(defmethod Δ ((ug ugolnik) (p parametrised) (g gas) (w number))
    "Потери давления в угольнике
(Δ u1 p1 g1 20.0)
"
    (*
     (ζ ug p g w) (ρ p g) w w 0.5))









