;;;; part_5.lisp

(in-package #:idelchik)

(defparameter part_5_doc
  "Сопротивление при течении с плавным измеиением скорости 
  (коэффициенты сопротивления диффузоов, конфузоров и дрyrих переходных участков)")

(defun idl-5-5-dzeta-rash(d1 d0 l)
  (let* (
	 (alfa_r (* 2.0 (atan (/ (- d1 d0) 2.0 l))))
	 (n	   (/ (* d1 d1) (* d0 d0))))
    (* 3.2
       1.0
       (expt (tan (* alfa_r 0.5)) 1.25)
       (expt (- 1.0 (/ 1.0 n)) 2.0))))

(defun idl-5-5-dzeta( d1 d0 l mikro)
  "Диффузор
d1 - диаметр на выходе
d0 - диаметр на входе
l  - длина перехода
(idl-5-5-dzeta 0.079 0.049 0.060 (* 0.001 0.02))
Потери определяются по скорости на входе
"
  (+
    (idl-5-5-dzeta-rash d1 d0 l)
    (idl-5-6-dzeta-tr d1 d0 l mikro)))


(defun idl-5-6-dzeta-tr(d1 d0 l mikro)
  (let*
      ((alfa_r (* 2.0 (atan (/ (- d1 d0) 2.0 l))))
       (n (/ (* d1 d1) (* d0 d0)))
       (delta  (/ mikro d1))
       (lam    (idl-2-6-lambda delta)))
    (/ (* lam (- 1.0 (/ 1.0 (* n n)))  ) 8.0 (sin (* 0.5 alfa_r)))))


(defun Idl-5-23-1-dzeta	(D1 D0 l mikro)
  "Конфузор D1 - вход   [м]
            D0 - выход  [м]
            l  - длина  [м]
            mikro - шероховатость, [м]
Потери определяются по скорости на выходе
(Idl-5-23-1-dzeta 0.079 0.049 0.060 (* 0.001 0.02)) "
  (let* ((alfa_r (* 2.0 (atan (/ (- D1 D0) 2.0 l))))
	 (n0 (/ (* D0 D0) (* D1 D1)))
	 (dzeta
	  (*
	   (+
	    (* n0 n0 n0 n0 -0.0125)
	    (* n0 n0 n0 0.0224)
	    (* n0 n0 -0.00723)
	    (* n0 0.00444)
	    -0.00745
	    )
	   (+ (* alfa_r alfa_r alfa_r) (* alfa_r alfa_r pi -2.0) (* alfa_r -10.0)))))
    (+ dzeta (idl-5-6-dzeta-tr d1 d0 l mikro))))
