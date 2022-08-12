;;;; part_1.lisp

(in-package #:idelchik)

(defparameter *part_01_doc*
  "Часть 1"
  "Общие сведения и элементы аэродинамики и гидравлики напорных систем")

;;;; (documentation '*part_01_doc* 'variable)

(defgeneric w-1-79 (param_in param_out gas)
  (:documentation "@b(Описание:) обобщенная функция @b(w-1-79)
возвращает скорость истечения газа из насадка.

 @b(Переменые:) 
@begin(list) 
@item(param_in  - параметры среды перед насадком;) 
@item(param_out - параметры среды, в которую истекает газ;)
@item(gas       - газ.) 
@end(list) 

Формула Сен-Венана-Венцеля (см. И.Е. Идельчик; Справочник по
гидравлическим сопротивлениям; 3-е издание, с. 41, формула 1-79."))

(defmethod w-1-79 ((p-in  <param>)
		   (p-out <param>)
                   (g     <gas>))
  (let (
        (pr-in  (pressure p-in))
        (pr-out (pressure p-out))
        (ρ-in  (ρ p-in g))
        (k     (k g)))
    (sqrt (* 2.0
             (/ k (- k 1.0))
             (/ pr-in ρ-in)
             (- 1.0
                (expt
                 (/ pr-out pr-in)
                 (/ (1- k) k)))))))

(export 'velocity-by-param-in-out)

(defmethod velocity-by-param-in-out  ((p-in  <param>)
		                      (p-out <param>)
                                      (g     <gas>))
  (w-1-79 p-in p-out g))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defgeneric G-1-80_81 (Area param_in param_out <gas>))

(defmethod G-1-80_81 ((Area number)
		      (p-in  <param>)
		      (p-out <param>)
		      (g <gas>))
  "I v3 p41
Определяет расход воздуха через сопло.
Пример использования:
(G-1-80_81 30e-6
	   (make-instance '<param> :tempreche 288.15 :pressure 2e5)
	   (make-instance '<param> :tempreche 288.15 :pressure 1.06e5)
	   (make-instance '<gas> :name \"Воздух\")
	   )
"
  (let* ((k (k g))
	 (ρ_in (ρ p-in g))
	 (pr_in (pressure p-in))
	 (pr_out (pressure p-out))
	 (p-out/in (/ pr_out pr_in))
	 (2k (* 2 k))
	 (2/k (/ 2 k))
	 (k-1 (- k 1))
	 (k+1 (+ k 1))
	 (k+1/k (/ k+1 k))
	 (p-out/in_kr (expt (/ 2 k+1) (/ k k-1)))
	 (G (* Area
	       (sqrt
		(* (/ 2k k-1)
		   ρ_in
		   pr_in
		   (-
		    (expt p-out/in 2/k)
		    (expt p-out/in k+1/k))))))
	 (G_kr
	   (* Area
	      (expt (/ 2 k+1) (/ k-1))
	      (sqrt (* (/ 2k k+1)
		       ρ_in
		       pr_in)))))
    (cond
      ((>= p-out/in p-out/in_kr)
       (values G "кг/с" "Массовый расход докритическая область"
	       (format nil "(p-out/in=~S)>=(p-out/in_kr~S) G_kr=~S" p-out/in p-out/in_kr G_kr)))
      ((< p-out/in p-out/in_kr)
       (values G_kr "кг/с" "Массовый расход сверхкритическая область"
	       (format nil "(p-out/in=~S)<(p-out/in_kr~S) G=~S" p-out/in p-out/in_kr G))))))

(defgeneric Area-1-80_81(Mass-flow-rate p-in p-out <gas>))
  
(defmethod Area-1-80_81((Mass-flow-rate number)
			(p-in  <param>)
			(p-out <param>)
			(g <gas>))
  "I v3 p41
Пример использования:
(Area-1-80_81 0.014284128
	   (make-instance '<param> :tempreche 288.15 :pressure 2e5)
	   (make-instance '<param> :tempreche 288.15 :pressure 1.06e5)
	   (make-instance '<gas> :name \"Воздух\")
	   )
"
  (let* ((k (k g))
	 (ρ_in (ρ p-in g))
	 (pr_in (pressure p-in))
	 (pr_out (pressure p-out))
	 (p-out/in (/ pr_out pr_in))
	 (2k (* 2 k))
	 (2/k (/ 2 k))
	 (k-1 (- k 1))
	 (k+1 (+ k 1))
	 (k+1/k (/ k+1 k))
	 (p-out/in_kr (expt (/ 2 k+1) (/ k k-1)))
	 (Area (/ Mass-flow-rate
		  (sqrt
		   (* (/ 2k k-1)
		      ρ_in
		      pr_in
		      (-
		       (expt p-out/in 2/k)
		       (expt p-out/in k+1/k))))))
	 (Area_kr
	  (/ Mass-flow-rate
	     (expt (/ 2 k+1) (/ k-1))
	     (sqrt (* (/ 2k k+1)
		      ρ_in
		      pr_in)))))
    (cond
      ((>= p-out/in p-out/in_kr)
       (values Area "м2" "Площадь (докритическая область)"
	       (format nil "(p-out/in=~S)>=(p-out/in_kr~S) Area_kr=~S" p-out/in p-out/in_kr Area_kr)))
      ((< p-out/in p-out/in_kr)
       (values Area_kr "м2" "Площадь (сверхкритическая область)"
	       (format nil "(p-out/in=~S)<(p-out/in_kr~S) Area=~S" p-out/in p-out/in_kr Area))))))

(defmethod mass-flow-rate((f <forsunka>) (p-in <param>) (p-out <param>) (g <gas>))
  "@b(Пример использования:)
@begin[lang=lisp](code)
 (mass-flow-rate
   (make-instance '<forsunka> :area 27d-6 :name \"Форсунка\")
   (make-instance '<param> :pressure (+ 100000.0 101325.) :name \"Параметры на входе\")
   (make-instance '<param> :name \"Параметры на выходе\")
   (make-instance '<gas> :name \"Воздух\")) =>0.013291542221359807d0
@end(code)
"
  (G-1-80_81 (<forsunka>-area f) p-in p-out g))
#|
 (mass-flow-rate
   (make-instance 'idelchik:<forsunka> :area (* 6.377d-6 8.0) :name "Форсунка")
   (make-instance 'idelchik:<param> :pressure (+ 100000.0 101325.)
					 :tempreche 288.15
					 :name "Параметры на входе")
   (make-instance 'idelchik:<param> :name "Параметры на выходе")
   (make-instance 'idelchik:<gas> :name "Воздух"))

 =>0.013291542221359807d0
|#

(defmethod area-by-Mass-flow-rate((f <forsunka>) (MFR number) (p-in  <param>) (p-out <param>) (g <gas>))
  "@b(Описание:) метод @b(area-by-Mass-flow-rate) возвращает объект типа <forsunka>,
расход газа @b(g), через которую будет равен @b(MFR) при параметрах на входе p-in и
параетрах на выходе p-out.

 @b(Переменые:)
@begin(list)
 @item(f - объект типа <forsunka>;)
 @item(MFR - массовый расход через форсунку;)
 @item(p-in - объект типа <param> параметры перед форсункой,
             (на результат влияет только температура);)
 @item(p-out - объект типа <param> параметры после форсунки
             (на результат влияет только давление);)
 @item(g - объект типа <gas>, расход которого задан.)
@end(list)

 @b(Пример использования:)
@begin[lang=lisp](code)
 (area-by-Mass-flow-rate
  (make-instance '<forsunka>)
  0.014284128
  (make-instance '<param> :tempreche 288.15 :pressure 2e5)
  (make-instance '<param> :tempreche 288.15 :pressure 1.06e5)
  (make-instance '<gas> :name \"Воздух\"))
@end(code)
"
  (setf (<forsunka>-area f)(Area-1-80_81 MFR p-in p-out g))
  f)

#|
 (defparameter *f*     (make-instance '<forsunka>))
 (defparameter *p-in*  (make-instance '<param> :tempreche 288.15 :pressure 2.0e5))
 (defparameter *p-out* (make-instance '<param> :tempreche 288.15 :pressure 1.06e5))
 (defparameter *g*     (make-instance '<gas> :name "Воздух"))
 (area-by-Mass-flow-rate *f* 0.014284128 *p-in* *p-out* *g*)
|#

(defmethod param_in-by-Mass-flow-rate ((f <forsunka>) (MFR number) (p-in <param>) (p-out <param>) (g <gas>))
  "@b(Описание:) метод @b(param_in-by-Mass-flow-rate) возвращает параметры
на входе в форсунку @b(f).

 @b(Переменые:)
@begin(list)
 @item(f - объект типа <forsunka>;)
 @item(MFR - массовый расход через форсунку;)
 @item(p-in - объект типа <param> параметры перед форсункой. На
             результат влияет только температура;)
@item(p-out - объект типа <param> параметры после форсунки. На
             результат влияет только давление;)
 @item(g - объект типа <gas>, расход которого задан.)
@end(list)

 @b(Пример использования:)
@begin[lang=lisp](code)
 (param_in-by-Mass-flow-rate
  (make-instance '<forsunka> :area 27d-6)
  0.013291542221359807d0
  (make-instance '<param> :pressure (+ 100000.0 101325.))
  (make-instance '<param>)
  (make-instance '<gas> :name \"Воздух\"))
   ; =>  #<param>( 201325.0[Па] 273.15[К])
@end(code)
"
  (let ((p-in_rez p-in))
    (setf (pressure p-in_rez) (math/half-div:h-div-lst
			       (* 1e6 (pressure p-out))
			       (pressure p-out)
			       #'(lambda(pr_in f M p-in_rez p-out g)
				   (setf (pressure p-in_rez) pr_in )
				   (- (mass-flow-rate f p-in p-out g) M))
			       0
			       (list nil f MFR p-in  p-out g)))
    p-in_rez))

#| 
 (param_in-by-Mass-flow-rate
  (make-instance '<forsunka> :area 27d-6)
  0.013291542221359807d0
  (make-instance '<param> :tempreche (+ 273.15 40))
  (make-instance '<param>)
  (make-instance '<gas> :name "Воздух"))

 (param_in-by-Mass-flow-rate
  (make-instance '<forsunka> :area 50d-6)
  0.013291542221359807d0
  (make-instance '<param> :pressure (+ 0.0 101325.))
  (make-instance '<param>)
  (make-instance '<gas> :name "Воздух"))

 => #<param>( 201325.0[Па] 273.15[К])
|# 
