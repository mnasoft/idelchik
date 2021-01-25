;;;; method-out.lisp

(in-package #:idelchik)

(defmethod out ((x <rib>))
  (format T "~A->~A;~%" (<rib>-v1 x) (<rib>-v2 x)))

(defmethod out ((x <named>))
  (format T "~A" (<named>-name x)))

(defmethod out ((x truba))
  (format nil "name=\"~A\", diameter=~A[m], len=~A[m] (~A ~A)~%"
	  (name x)
	  (diameter x)
	  (len x)
	  (nth 0 (vertexes x))
	  (nth 1 (vertexes x))))

(defmethod out ((x ugolnik))
  (format T "name=\"~A\"~%" (<named>-name x))
  (format T "diameter=~A~%" (diameter x))
  (format T "radius=~A~%" (radius x))
  (format T "alfa=~A~%" (alfa x)))


(defmethod out ((x perehod))
  (format T "name=\"~A\"~%" (<named>-name x))
  (format T "prev=\"~A\"~%" (linked-prev x))
  (format T "next=\"~A\"~%" (linked-next x))		  
  (format T "diameter_in=~A~%" (perehod-diameter_in x))
  (format T "diameter_out=~A~%" (perehod-diameter_out x))
  (format T "length=~A~%" (perehod-length x)))

(defmethod out ((p <param>))
  (format nil "p=~A[Pa], T=~A[K]" (pressure p)(tempreche p)))

(defmethod out ((g <gas>))
  (format nil "газ=~A" (name g)))
