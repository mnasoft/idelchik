;;;;class_methods.lisp

(in-package #:idelchik)

(defgeneric μ (gas))
(defmethod μ ((g gas))
  "Возвращает молекулярную массу газа [kg/mol]
Пример использования
(let ((g1 (make-instance 'gas :name \"Водород\")))
  (μ g1))"
  (values (varghaftik:μ :gas_name (name g))"[kg/mol]" "Молекулярная масса газа" (format nil "~S" g)))

(defgeneric k (gas))
(defmethod k ((g gas))
  "Возвращает показатель адиабаты газа [1]"
  (values (varghaftik:k :gas_name (name g))"[1]" "Показатель адиабаты" (format nil "~S" g)))

(defgeneric ρ (parametrised gas))
(defmethod ρ ((p parametrised) (g gas))
  "Возвращает плотность газа [kg/m^3]
Пример использования:
(let 
    ((p1 (make-instance 'parametrised :pressure 101325. :tempreche (+ 273.0 0.0)))
     (g1 (make-instance 'gas :name \"Воздух\")))
  (ρ p1 g1))"
  (values (/ (* (pressure p) (μ g) ) (* varghaftik:Rμ (tempreche p)))
	  "[kg/m^3]" "Плотность газа"
	  (format nil "~S" g)
	  (format nil "~S" p)))

(defgeneric η(parametrised gas))
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
	  (format nil "~S" g)
	  (format nil "~S" p)))

(defgeneric ν (parametrised gas))
(defmethod ν ((p parametrised) (g gas))
  "Возвращает коэффициент кинематической вязкости газа [m^2/s]
Пример использования:
(let 
    ((p1 (make-instance 'parametrised :pressure 101325. :tempreche (+ 273.0 0.0)))
     (g1 (make-instance 'gas :name \"Воздух\")))
  (ν p1 g1))"
  (values
   (/ (η p g) (ρ p g))
   "[m^2/s]"
   (format nil "Коэффициент кинематической вязкости газа ~S ~S" (format nil "~S" g) (format nil "~S" p))))
