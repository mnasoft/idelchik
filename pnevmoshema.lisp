;;;; pnevmoshema.lisp

(in-package #:idelchik)

(defmethod out ((x rib))
  (format T "~A->~A;~%" (rib-v1 x) (rib-v2 x)))

(defmethod out ((x named))
  (format T "~A" (Named-name x)))

(defmethod out ((x truba))
  (format nil "name=\"~A\", diameter=~A[m], len=~A[m] (~A ~A)~%"
	  (name x)
	  (diameter x)
	  (len x)
	  (nth 0 (vertexes x))
	  (nth 1 (vertexes x))
	  ))


(defmethod out ((x ugolnilk))
  (format T "name=\"~A\"~%" (named-name x))
  (format T "prev=\"~A\"~%" (linked-prev x))
  (format T "next=\"~A\"~%" (linked-next x))		  
  (format T "diameter=~A~%" (truba-diameter x))
  (format T "length=~A~%" (truba-length x))
  (format T "radius=~A~%" (ugolnilk-radius x)))

(defmethod out ((x perehod))
  (format T "name=\"~A\"~%" (named-name x))
  (format T "prev=\"~A\"~%" (linked-prev x))
  (format T "next=\"~A\"~%" (linked-next x))		  
  (format T "diameter_in=~A~%" (perehod-diameter_in x))
  (format T "diameter_out=~A~%" (perehod-diameter_out x))
  (format T "length=~A~%" (perehod-length x)))

(defmethod out ((p parametrised))
  (format nil "p=~A[Pa], T=~A[K]" (pressure p)(tempreche p)))

(defmethod out ((g gas))
  (format nil "газ=~A" (name g)))

