;;;; lambda.lisp

(in-package #:idelchik)

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
