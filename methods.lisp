;;;;methods.lisp

(in-package #:idelchik)

(defmethod μ ((g gas))
  (values (varghaftik:μ :gas_name (name g))"[kg/mol]" "Молекулярная масса газа" (format nil "~S" g)))

(defmethod k ((g gas))
  (values (varghaftik:k :gas_name (name g))"[1]" "Показатель адиабаты" (format nil "~S" g)))

(defmethod ρ ((p parametrised) (g gas))
  (values (/ (* (pressure p) (μ g) ) (* varghaftik:Rμ (tempreche p)))
	  "[kg/m^3]" "Плотность газа"
	  (format nil "~S" g)
	  (format nil "~S" p)))

(defmethod η((p parametrised) (g gas))
  (values (varghaftik:η_sazerlend (tempreche p) :gas_name (name g))
	  "[Pa*s]"
	  "Коэффициент динамической вязкости газа"
	  (format nil "~S" g)
	  (format nil "~S" p)))

(defmethod ν ((p parametrised) (g gas))
  (values
   (/ (η p g) (ρ p g))
   "[m^2/s]"
   (format nil "Коэффициент кинематической вязкости газа ~S ~S" (format nil "~S" g) (format nil "~S" p))))
