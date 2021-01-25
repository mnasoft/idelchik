;;;; elements.lisp

(in-package #:idelchik)

;;; "idelchik" goes here. Hacks and glory await!

(defparameter elements
  (list
   (make-instance 'zabornik      :name "Z1"        :diameter 0.0494 :vertexes '("AA" "AB"))
   (make-instance 'truba         :name "T-AB-AC"   :diameter (truba-in-dia 0.028) :length 0.1 :vertexes '("AB" "AC"))
   (make-instance 'ugolnik       :name "U-AC-AD"   :diameter (truba-in-dia 0.028) :radius (radius-giba 0.028) :vertexes '("AC" "AD"))
   (make-instance 'truba         :name "T-AD-AE"   :diameter (truba-in-dia 0.028) :length 0.200 :vertexes '("AD" "AE"))
   (make-instance 'vyxod         :name "VY-AE-AF"  :diameter (truba-in-dia 0.028) :vertexes '("AE" "AF"))
   (make-instance 'vxod          :name "VX-AF-AG"  :diameter (truba-in-dia 0.053) :vertexes '("AF" "AG"))
   (make-instance 'truba         :name "T-AG-AH"   :diameter (truba-in-dia 0.053) :length 0.3 :vertexes '("AG" "AH"))
   (make-instance 'ugolnik       :name "U-AH-AJ"   :diameter (ugolnik-in-dia 0.053) :radius (ugolnik-radius 0.053) :vertexes '("AH" "AJ"))
   (make-instance 'truba         :name "T-AJ-AK"   :diameter (truba-in-dia 0.053) :length 0.150 :vertexes '("AJ" "AK"))
   (make-instance 'metallorukav  :name "MR4"       :diameter 0.050 :length 0.400  :vertexes '("AK" "AL"))
   (make-instance 'perehod       :name "P1"        :diameter_1 (ugolnik-in-dia 0.053) :diameter_2 (ugolnik-in-dia 0.075) :len 0.050 :vertexes '("AL" "AM"))
   (make-instance 'truba         :name "T-AM-AN"   :diameter (truba-in-dia 0.075) :length 0.200 :vertexes '("AM" "AN"))
   (make-instance 'ugolnik       :name "U-AN-AP"   :diameter (ugolnik-in-dia 0.075) :radius (ugolnik-radius 0.075) :vertexes '("AN" "AP"))
   (make-instance 'truba         :name "T-AP-AQ"   :diameter (truba-in-dia 0.075) :length 0.400 :vertexes '("AP" "AQ"))
   (make-instance 'ugolnik       :name "U-AQ-AR"   :diameter (ugolnik-in-dia 0.075) :radius (ugolnik-radius 0.075) :vertexes '("AQ" "AR"))
   (make-instance 'truba         :name "T-AR-AS"   :diameter (truba-in-dia 0.075) :length 1.200 :vertexes '("AR" "AS"))
   (make-instance 'ugolnik       :name "U-AS-AT"   :diameter (ugolnik-in-dia 0.075) :radius (ugolnik-radius 0.075) :vertexes '("AS" "AT"))
   (make-instance 'truba         :name "T-AT-AU"   :diameter (truba-in-dia 0.075) :length 1.000 :vertexes '("AT" "AU"))
   (make-instance 'ugolnik       :name "U-AU-AV"   :diameter (ugolnik-in-dia 0.075) :radius (ugolnik-radius 0.075) :vertexes '("AU" "AV"))
   (make-instance 'truba         :name "T-AV-AW"   :diameter (truba-in-dia 0.075) :length 0.500 :vertexes '("AV" "AW"))
   (make-instance 'troynik	 :name "TR1" :vertexes '("AW" "AY" "BQ" "AX")
		  :diameter_1 (truba-in-dia 0.075) :alfa_1 180.0
		  :diameter_2 (truba-in-dia 0.075) :alfa_2 0.0
		  :diameter_3 (truba-in-dia 0.075) :alfa_3 90.0)
   (make-instance 'truba         :name "T-AY-AZ"   :diameter (truba-in-dia 0.075) :length 0.500 :vertexes '("AY" "AZ"))
   (make-instance 'teploobmennik :name "AT1" :vertexes '("AZ" "BA"))
   (make-instance 'truba         :name "T-BA-BB"   :diameter (truba-in-dia 0.075) :length 0.500 :vertexes '("BA" "BB"))
   (make-instance 'resiver       :name "rr1" :diameter (truba-in-dia 0.075) :vertexes '("BB" "BC"))
   (make-instance 'truba         :name "T-BC-BD"   :diameter (truba-in-dia 0.075) :length 0.500 :vertexes '("BC" "BD"))
   (make-instance 'kompressor    :name "KM1" :vertexes '("BD" "BE"))
   (make-instance 'truba         :name "T-BE-BF"   :diameter (truba-in-dia 0.075) :length 0.500 :vertexes '("BE" "BF"))
   (make-instance 'ugolnik       :name "U-BF-BG"   :diameter (ugolnik-in-dia 0.075) :radius (ugolnik-radius 0.075) :vertexes '("BF" "BG"))
   (make-instance 'truba         :name "T-BG-BH"   :diameter (truba-in-dia 0.075) :length 0.500 :vertexes '("BG" "BH"))
   (make-instance 'troynik	 :name "TR2" :vertexes '("BH" "BR" "BK" "BJ")
		  :diameter_1 (truba-in-dia 0.075) :alfa_1 180.0
		  :diameter_2 (truba-in-dia 0.075) :alfa_2 0.0
		  :diameter_3 (truba-in-dia 0.075) :alfa_3 90.0)
   (make-instance 'truba         :name "T-BK-BL"   :diameter (truba-in-dia 0.075) :length 2.000 :vertexes '("BK" "BL"))
   (make-instance 'valve         :name "VA1"       :vertexes '("BL" "BM"))   
   (make-instance 'truba         :name "T-BM-BN"   :diameter (truba-in-dia 0.075) :length 3.000 :vertexes '("BM" "BN"))
   (make-instance 'ugolnik       :name "U-BN-BP"   :diameter (ugolnik-in-dia 0.075) :radius (ugolnik-radius 0.075) :vertexes '("BN" "BP"))
   (make-instance 'truba         :name "T-BP-BQ"   :diameter (truba-in-dia 0.075) :length 3.000 :vertexes '("BP" "BQ"))
   (make-instance 'truba         :name "T-BR-BS"   :diameter (truba-in-dia 0.075) :length 0.200 :vertexes '("BR" "BS"))
   (make-instance 'troynik	 :name "TR2" :vertexes '("BS" "CN" "BU" "BT")
		  :diameter_1 (truba-in-dia 0.075) :alfa_1 180.0
		  :diameter_2 (truba-in-dia 0.075) :alfa_2 0.0
		  :diameter_3 (truba-in-dia 0.032) :alfa_3 90.0)
   (make-instance 'truba         :name "T-BU-BV"   :diameter (truba-in-dia 0.032) :length 6.000 :vertexes '("BU" "BV"))
   (make-instance 'ugolnik       :name "U-BV-BW"   :diameter (ugolnik-in-dia 0.032) :radius (radius-giba 0.032) :vertexes '("BV" "BW"))
   (make-instance 'truba         :name "T-BW-BX"   :diameter (truba-in-dia 0.032) :length 2.000 :vertexes '("BW" "BX"))
   (make-instance 'ugolnik       :name "U-BX-BY"   :diameter (ugolnik-in-dia 0.032) :radius (radius-giba 0.032) :vertexes '("BX" "BY"))
   (make-instance 'truba         :name "T-BY-BZ"   :diameter (truba-in-dia 0.032) :length 0.500 :vertexes '("BY" "BZ"))
   (make-instance 'ugolnik       :name "U-BZ-CA"   :diameter (ugolnik-in-dia 0.032) :radius (radius-giba 0.032) :vertexes '("BZ" "CA"))
   (make-instance 'truba         :name "T-CA-CB"   :diameter (truba-in-dia 0.032) :length 0.500 :vertexes '("CA" "CB"))
   (make-instance 'ugolnik       :name "U-CB-CC"   :diameter (ugolnik-in-dia 0.032) :radius (radius-giba 0.032) :vertexes '("CB" "CC"))
   (make-instance 'truba         :name "T-CC-CD"   :diameter (truba-in-dia 0.032) :length 0.200 :vertexes '("CC" "CD"))
   (make-instance 'valve-obr     :name "KO2"       :diameter 0.025 :vertexes '("CD" "CE"))
   (make-instance 'truba         :name "T-CE-CF"   :diameter (truba-in-dia 0.032) :length 0.200 :vertexes '("CE" "CF"))
   (make-instance 'metallorukav  :name "MR2"       :diameter 0.030 :length 0.400  :vertexes '("CF" "CG"))
   (make-instance 'truba         :name "T-CG-CH"   :diameter (truba-in-dia 0.032) :length 0.200 :vertexes '("CG" "CH"))
   (make-instance 'ugolnik       :name "U-CH-CJ"   :diameter (ugolnik-in-dia 0.032) :radius (radius-giba 0.032) :vertexes '("CH" "CJ"))
   (make-instance 'vyxod         :name "VY-CJ-CK"  :diameter (truba-in-dia 0.032) :vertexes '("CJ" "CK"))
   (make-instance 'vxod          :name "VX-CK-CL"  :diameter (truba-in-dia 0.014) :num 16.0 :vertexes '("CK" "CL"))
   (make-instance 'ugolnik       :name "U-CL-CM"   :diameter (truba-in-dia 0.014) :radius (radius-giba 0.014) :alfa 180.0 :num 16.0 :vertexes '("CL" "CM"))
   (make-instance 'forsunka      :name "F2"        :area 6.422e-6 :num 16.0 :vertexes '("CM" "ZZ") )
   (make-instance 'truba         :name "T-CN-CP"   :diameter (truba-in-dia 0.075) :length 0.200 :vertexes '("CN" "CP"))
   (make-instance 'perehod       :name "P1"        :diameter_1 (truba-in-dia 0.075) :diameter_2 (truba-in-dia 0.022) :len 0.060 :vertexes '("CP" "CQ"))
   (make-instance 'truba         :name "T-CQ-CR"   :diameter (truba-in-dia 0.022) :length 0.200 :vertexes '("CQ" "CR"))
   (make-instance 'troynik	 :name "TR4" :vertexes '("CR" "CS" "DU" "CRa")
		  :diameter_1 (truba-in-dia 0.022) :alfa_1 180.0
		  :diameter_2 (truba-in-dia 0.022) :alfa_2 90.0
		  :diameter_3 (truba-in-dia 0.022) :alfa_3 -90.0)
   (make-instance 'truba         :name "T-CS-CT"   :diameter (truba-in-dia 0.022) :length 0.150 :vertexes '("CS" "CT"))
   (make-instance 'ugolnik       :name "U-CT-CU"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("CT" "CU"))
   (make-instance 'truba         :name "T-CU-CV"   :diameter (truba-in-dia 0.022) :length 0.300 :vertexes '("CU" "CV"))
   (make-instance 'ugolnik       :name "U-CV-CW"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("CV" "CW"))
   (make-instance 'truba         :name "T-CW-CX"   :diameter (truba-in-dia 0.022) :length 0.300 :vertexes '("CW" "CX"))
   (make-instance 'ugolnik       :name "U-CX-CY"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("CX" "CY"))
   (make-instance 'truba         :name "T-CY-CZ"   :diameter (truba-in-dia 0.022) :length 0.600 :vertexes '("CY" "CZ"))
   (make-instance 'ugolnik       :name "U-CZ-DA"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("CZ" "DA"))
   (make-instance 'truba         :name "T-DA-DB"   :diameter (truba-in-dia 0.022) :length 6.500 :vertexes '("DA" "DB"))
   (make-instance 'ugolnik       :name "U-DB-DC"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("DB" "DC"))
   (make-instance 'truba         :name "T-DC-DD"   :diameter (truba-in-dia 0.022) :length 2.500 :vertexes '("DC" "DD"))
   (make-instance 'ugolnik       :name "U-DD-DE"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("DD" "DE"))
   (make-instance 'truba         :name "T-DE-DF"   :diameter (truba-in-dia 0.022) :length 0.500 :vertexes '("DE" "DF"))
   (make-instance 'ugolnik       :name "U-DF-DG"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("DF" "DG"))
   (make-instance 'truba         :name "T-DG-DH"   :diameter (truba-in-dia 0.022) :length 0.500 :vertexes '("DG" "DH"))
   (make-instance 'ugolnik       :name "U-DH-DJ"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("DH" "DJ"))
   (make-instance 'truba         :name "T-DJ-DK"   :diameter (truba-in-dia 0.022) :length 0.200 :vertexes '("DJ" "DK"))
   (make-instance 'valve-obr     :name "KO1"       :diameter 0.025 :vertexes '("DK" "DL"))
   (make-instance 'truba         :name "T-DL-DM"   :diameter (truba-in-dia 0.022) :length 0.200 :vertexes '("DL" "DM"))
   (make-instance 'metallorukav  :name "MR1"       :diameter 0.020 :length 0.400  :vertexes '("DM" "DN"))
   (make-instance 'truba         :name "T-DN-DP"   :diameter (truba-in-dia 0.022) :length 0.200 :vertexes '("DN" "DP"))
   (make-instance 'ugolnik       :name "U-DP-DQ"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("DP" "DQ"))
   (make-instance 'vyxod         :name "VY-DQ-DR"  :diameter (truba-in-dia 0.022) :vertexes '("DQ" "DR"))
   (make-instance 'vxod          :name "VX-DR-DS"  :diameter (truba-in-dia 0.010) :num 16.0 :vertexes '("DR" "DS"))
   (make-instance 'ugolnik       :name "U-DS-DT"   :diameter (truba-in-dia 0.010) :radius (radius-giba 0.010) :alfa 180.0 :num 16.0 :vertexes '("DP" "DQ"))
   (make-instance 'forsunka      :name "F1"        :area 3.52e-6 :num 16.0 :vertexes '("DT" "ZZ"))
   (make-instance 'truba         :name "T-DU-DV"   :diameter (truba-in-dia 0.022) :length 0.150 :vertexes '("DU" "DV"))
   (make-instance 'ugolnik       :name "U-DV-DW"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("DV" "DW"))
   (make-instance 'truba         :name "T-DW-DX"   :diameter (truba-in-dia 0.022) :length 0.300 :vertexes '("DW" "DX"))
   (make-instance 'ugolnik       :name "U-DX-DY"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("DX" "DY"))
   (make-instance 'truba         :name "T-DY-DZ"   :diameter (truba-in-dia 0.022) :length 0.300 :vertexes '("DY" "DZ"))
   (make-instance 'ugolnik       :name "U-DZ-EA"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("DZ" "EA"))
   (make-instance 'truba         :name "T-EA-EB"   :diameter (truba-in-dia 0.022) :length 0.600 :vertexes '("EA" "EB"))
   (make-instance 'ugolnik       :name "U-EB-EC"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("EB" "EC"))
   (make-instance 'truba         :name "T-EC-ECa"  :diameter (truba-in-dia 0.022) :length 0.500 :vertexes '("EC" "ECa"))
   (make-instance 'perehod       :name "P3"        :diameter_1 0.0196 :diameter_2 0.0296 :len 0.030 :vertexes '("ECa" "ECb"))
   (make-instance 'truba         :name "T-ECb-ED"  :diameter (truba-in-dia 0.032) :length 5.500 :vertexes '("ECb" "ED"))
   (make-instance 'ugolnik       :name "U-ED-EE"   :diameter (truba-in-dia 0.032) :radius (radius-giba 0.032) :vertexes '("ED" "EE"))
   (make-instance 'truba         :name "T-EE-EF"   :diameter (truba-in-dia 0.032) :length 2.500 :vertexes '("EE" "EF"))
   (make-instance 'ugolnik       :name "U-EF-EG"   :diameter (truba-in-dia 0.032) :radius (radius-giba 0.032) :vertexes '("EF" "EG"))
   (make-instance 'truba         :name "T-EG-EH"   :diameter (truba-in-dia 0.032) :length 0.500 :vertexes '("EG" "EH"))
   (make-instance 'ugolnik       :name "U-EH-EJ"   :diameter (truba-in-dia 0.032) :radius (radius-giba 0.032) :vertexes '("EH" "EJ"))
   (make-instance 'truba         :name "T-EJ-EK"   :diameter (truba-in-dia 0.032) :length 0.500 :vertexes '("EJ" "EK"))
   (make-instance 'ugolnik       :name "U-EK-EL"   :diameter (truba-in-dia 0.032) :radius (radius-giba 0.032) :vertexes '("EK" "EL"))
   (make-instance 'truba         :name "T-EL-EM"   :diameter (truba-in-dia 0.032) :length 0.200 :vertexes '("EL" "EM"))
   (make-instance 'valve-obr     :name "KO3"       :diameter 0.025 :vertexes '("EM" "EN"))
   (make-instance 'truba         :name "T-EN-EP"   :diameter (truba-in-dia 0.032) :length 0.200 :vertexes '("EN" "EP"))
   (make-instance 'metallorukav  :name "MR3"       :diameter 0.030 :length 0.400  :vertexes '("EP" "EQ"))
   (make-instance 'truba         :name "T-EQ-ER"   :diameter (truba-in-dia 0.032) :length 0.200 :vertexes '("EQ" "ER"))
   (make-instance 'ugolnik       :name "U-ER-ES"   :diameter (truba-in-dia 0.032) :radius (radius-giba 0.032) :vertexes '("ER" "ES"))
   (make-instance 'vyxod         :name "VY-ES-ET"  :diameter (truba-in-dia 0.032) :vertexes '("ES" "ET") )
   (make-instance 'vxod          :name "VX-ET-EU"  :diameter (truba-in-dia 0.022) :num 16 :vertexes '("ES" "EU"))
   (make-instance 'ugolnik       :name "U-EU-EV"   :diameter (truba-in-dia 0.022) :num 16 :radius (radius-giba 0.022) :alfa 180.0 :vertexes '("EU" "EV"))
   (make-instance 'forsunka      :name "F3"        :area 26.1e-6 :vertexes '("EV" "ZZ") :num 16.0)
   ))

(defun draw-graph(r)
  "Функция для построения графа ребер.
Пример использования:
(draw-graph ribs)"
  (format T "digraph G {~%")
  (format T "rankdir = LR;~%")
  (mapcar #'(lambda (el) (out el)) r)
  (format T "}"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun mk-vert(elements)
  "Осуществляет построение списка вершин на основании списка элементов
гидравлической схемы."
  (let ((rez-v-es nil))
    (mapc
     #'(lambda (el)
	 (let ((v-es (vertexes el)))
	   (mapcar #'(lambda (el)
		       (setf rez-v-es (adjoin el rez-v-es :test #'equal)))
		   v-es)))
     elements)
    (mapcar #'(lambda (el) (make-instance '<vertex> :name el))
	    (sort rez-v-es #'string<))))

(defparameter vertexes (mk-vert elements)
  "Список вершин гидравлической схемы.")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun mk-ribs(elements)
  (let ((lst-ribs nil))
    (mapcar #'(lambda (el)
		(let ((rrr (mk-rib  el)))
		  (setf rrr nil)
		  (setf
		   lst-ribs
		   (append (mk-rib  el) lst-ribs))))
	    elements)
    lst-ribs))

;;;;(length (mk-ribs elements))

(defparameter ribs
  (mk-ribs elements)
  "Список рёбер гидравлической схемы.")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

