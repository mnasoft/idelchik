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
          "(Re pr1 p1 g1 w1)"	  (Re pr1 p1 g1 w1)
	  "(ζ  pr1 p1 g1 w1)" 	  (ζ  pr1 p1 g1 w1)
	  "(ζ  pr1 p1 g1 w-1)"	  (ζ  pr1 p1 g1 w-1)
	  "(Δ  pr1 p1 g1 w1)"	  (Δ  pr1 p1 g1 w1)
	  "(Δ  pr1 p1 g1 w-1)" 	  (Δ  pr1 p1 g1 w-1)))

;;;;(test_01)
