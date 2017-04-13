;;;; test.list

(in-package #:idelchik)

(defparameter p1  (make-instance 'parametrised :pressure (* 20. 101325.) :tempreche (+ 273.0 480.0)))
(defparameter g1  (make-instance 'gas :name "Воздух"))

(defparameter tr1 (make-instance 'truba :name "T-EE-EF" :diameter 0.070 :length 2.500 :vertexes '("EE" "EF")))
(defparameter ug1 (make-instance 'ugolnik :name "T-EE-EF" :diameter 0.070 :radius (ugolnik-radius 0.075) :vertexes '("EE" "EF")))
(defparameter pr1 (make-instance 'perehod :name "P1" :diameter_1 (ugolnik-in-dia 0.053) :diameter_2 (ugolnik-in-dia 0.075) :len 0.050 :vertexes '("AL" "AM")))
(defparameter mr1 (make-instance 'metallorukav  :name "MR4"       :diameter 0.050 :length 0.400  :vertexes '("AK" "AL")))

(defparameter w1 20.0)
(defparameter w-1 -20.0)

(defun test_01 ()
  (values "(ρ  p1 g1 )"           (ρ  p1 g1 )
	  "(Re pr1 p1 g1 20)"     (Re pr1 p1 g1 20)
	  "(Re ug1 p1 g1 w1)"	  (Re ug1 p1 g1 w1)
	  "(ζ  ug1 p1 g1 w1)" 	  (ζ  ug1 p1 g1 w1)
	  "(ζ  ug1 p1 g1 w-1)" 	  (ζ  ug1 p1 g1 w-1)
	  "(Δ  ug1 p1 g1 w1)" 	  (Δ  ug1 p1 g1 w1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	  "(Re tr1 p1 g1 w1)" 	  (Re tr1 p1 g1 w1)
	  "(λ  tr1 p1 g1 w1)" 	  (λ  tr1 p1 g1 w1)
	  "(Δ  tr1 p1 g1 w1)" 	  (Δ  tr1 p1 g1 w1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
          "(Re mr1 p1 g1 w1)"	  (Re mr1 p1 g1 w1)
          "(λ  mr1 p1 g1 w1)"	  (λ  mr1 p1 g1 w1)
 	  "(Δ  tr1 p1 g1 w1)" 	  (Δ  mr1 p1 g1 w1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
          "(Re pr1 p1 g1 w1)"	  (Re pr1 p1 g1 w1)q
	  "(ζ  pr1 p1 g1 w1)" 	  (ζ  pr1 p1 g1 w1)
	  "(ζ  pr1 p1 g1 w-1)"	  (ζ  pr1 p1 g1 w-1)
	  "(Δ  pr1 p1 g1 w1)"	  (Δ  pr1 p1 g1 w1)
	  "(Δ  pr1 p1 g1 w-1)" 	  (Δ  pr1 p1 g1 w-1)))

;;;;(test_01)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *ДТ70-g1* '((10000.0 500.0) (10700.0 500.0) (11000.0 300.0) (15000.0 300.0)))

(defparameter *ГД90Л2.1-g1* '((6000.0 600.0) (7900.0 600.0) (8000.0 470.0) (10000.0 470.0)))

(defparameter *k-g1*   '((-45.0 1.45) (-15.0 1.2) (15.0 1.0) (30.0 0.9) (45.0 0.86)))

(mapcar #'(lambda (el) (list el (math:appr_table el *g90-g1*)))
	'(8950.0 8720.0 8560.0 8410.0 8230. 8040.0 7790.0 7500. 5840.0))

(defparameter *t-min* 293.0)

(defparameter *t-max* 333.0)

(defparameter *Б90038049-g1-min* 130.8d-6
  "Минимальная эквивалентная площадь первого канала 16-ти ГУ Б90038049, м2")

(defparameter *Б90038049-g1-max* 144.8d-6)
  "Максимальная эквивалентная площадь первого канала 16-ти ГУ Б90038049, м2")

(defparameter *Б90038049-g2-min* 239.2d-6
  "Минимальная эквивалентная площадь второго канала 16-ти ГУ Б90038049, м2")

(defparameter *Б90038049-g2-max* 264.4d-6
  "Максимальная эквивалентная площадь второго канала 16-ти ГУ Б90038049, м2")

(defparameter *Т70038018-g1-min* 52.55d-6
  "Минимальная эквивалентная площадь первого канала 10-ти ГУ Т70038018, м2")

(defparameter *Т70038018-g1-max* 59.55d-6
  "Максимальная эквивалентная площадь первого канала 10-ти ГУ Т70038018, м2")

(defparameter *Т70038018-g2-min* 224.8d-6
  "Минимальная эквивалентная площадь второго канала 10-ти ГУ Т70038018, м2")

(defparameter *Т70038018-g2-max* 247.6d-6
  "Максимальная эквивалентная площадь второго канала 10-ти ГУ Т70038018, м2")

(require :recoder)

(let ((t-in *t-max*)
      (ar *g2-min*))
  (mapcar #'(lambda (el)
	      (* 0.001 0.001
		 (pressure 
		  (param_in-by-Mass-flow-rate
		   (make-instance 'forsunka :area ar)
;;;;		   (/ (first el) 3600.0)
		   (/ (second el) 3600.0)
		   (make-instance 'parametrised  :tempreche t-in)
		   (make-instance 'parametrised :pressure (* (third el) 9.8065 10000.0 ))
		   (make-instance 'gas :name "Метан"))
		  )))
	  (recoder:transpose '((422.499999	422.499999	422.499999	422.499999	422.499999	422.499999	422.499999	465	270		331.999998	331.999998	331.999998	331.999998	331.999998	331.999998	331.999998	331.999998	290		300	300	300	300	300	300	300	295		279.999999	279.999999	279.999999	279.999999	279.999999	279.999999	279.999999	300		258	258	258	258	258	258	258)
			       (1602.500001	1327.500001	982.500001	622.500001	622.500001	487.500001	277.500001	0	0		1748.000002	1473.000002	1123.000002	828.000002	828.000002	618.000002	398.000002	158.000002	0		1530	1175	905	905	670	445	200	0		1565.000001	1210.000001	955.000001	955.000001	700.000001	475.000001	225.000001	0		1252	1052	1052	752	522	267	52)
			       (19.0217	17.2563	14.8798	12.125	11.349	10.3014	8.5845	6.3729	4.3262		18.0614	16.4221	14.1911	12.125	11.349	9.8843	8.2547	6.1498	4.1807		16.1214	13.9583	12.125	11.349	9.7388	8.1383	6.0625	4.1322		15.9468	13.7934	12.125	11.349	9.6418	8.0704	6.014	4.1031		13.386	12.125	11.349	9.4478	7.9152	5.9073	4.0449)))))



