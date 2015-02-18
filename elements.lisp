;;;; elements.lisp

(in-package #:idelchik)

;;; "idelchik" goes here. Hacks and glory await!

(defparameter vertexes
  (list
   (make-instance 'vertex :name "AA")   (make-instance 'vertex :name "AB")   (make-instance 'vertex :name "AC")   (make-instance 'vertex :name "AD")   (make-instance 'vertex :name "AE")
   (make-instance 'vertex :name "AF")   (make-instance 'vertex :name "AG")   (make-instance 'vertex :name "AH")   (make-instance 'vertex :name "AJ")   (make-instance 'vertex :name "AK")
   (make-instance 'vertex :name "AL")   (make-instance 'vertex :name "AM")   (make-instance 'vertex :name "AN")   (make-instance 'vertex :name "AP")   (make-instance 'vertex :name "AQ")
   (make-instance 'vertex :name "AR")   (make-instance 'vertex :name "AS")   (make-instance 'vertex :name "AT")   (make-instance 'vertex :name "AU")   (make-instance 'vertex :name "AV")
   (make-instance 'vertex :name "AW")   (make-instance 'vertex :name "AX")   (make-instance 'vertex :name "AY")   (make-instance 'vertex :name "AZ")   (make-instance 'vertex :name "BA")
   (make-instance 'vertex :name "BB")   (make-instance 'vertex :name "BC")   (make-instance 'vertex :name "BD")   (make-instance 'vertex :name "BE")   (make-instance 'vertex :name "BF")
   (make-instance 'vertex :name "BG")   (make-instance 'vertex :name "BH")   (make-instance 'vertex :name "BJ")   (make-instance 'vertex :name "BK")   (make-instance 'vertex :name "BL")
   (make-instance 'vertex :name "BM")   (make-instance 'vertex :name "BN")   (make-instance 'vertex :name "BP")   (make-instance 'vertex :name "BQ")   (make-instance 'vertex :name "BR")
   (make-instance 'vertex :name "BS")   (make-instance 'vertex :name "BT")   (make-instance 'vertex :name "BU")   (make-instance 'vertex :name "BV")   (make-instance 'vertex :name "BW")
   (make-instance 'vertex :name "BX")   (make-instance 'vertex :name "BY")   (make-instance 'vertex :name "BZ")   (make-instance 'vertex :name "CA")   (make-instance 'vertex :name "CB")
   (make-instance 'vertex :name "CC")   (make-instance 'vertex :name "CD")   (make-instance 'vertex :name "CE")   (make-instance 'vertex :name "CF")   (make-instance 'vertex :name "CG")
   (make-instance 'vertex :name "CH")   (make-instance 'vertex :name "CJ")   (make-instance 'vertex :name "CK")   (make-instance 'vertex :name "CL")   (make-instance 'vertex :name "CM")
   (make-instance 'vertex :name "CN")   (make-instance 'vertex :name "CP")   (make-instance 'vertex :name "CQ")   (make-instance 'vertex :name "CR")   (make-instance 'vertex :name "CRa")
   (make-instance 'vertex :name "CS")   (make-instance 'vertex :name "CT")   (make-instance 'vertex :name "CU")   (make-instance 'vertex :name "CV")   (make-instance 'vertex :name "CW")
   (make-instance 'vertex :name "CX")   (make-instance 'vertex :name "CY")   (make-instance 'vertex :name "CZ")   (make-instance 'vertex :name "DA")   (make-instance 'vertex :name "DB")
   (make-instance 'vertex :name "DC")   (make-instance 'vertex :name "DD")   (make-instance 'vertex :name "DE")   (make-instance 'vertex :name "DF")   (make-instance 'vertex :name "DG")
   (make-instance 'vertex :name "DH")   (make-instance 'vertex :name "DJ")   (make-instance 'vertex :name "DK")   (make-instance 'vertex :name "DL")   (make-instance 'vertex :name "DM")
   (make-instance 'vertex :name "DN")   (make-instance 'vertex :name "DP")   (make-instance 'vertex :name "DQ")   (make-instance 'vertex :name "DR")   (make-instance 'vertex :name "DS")
   (make-instance 'vertex :name "DT")   (make-instance 'vertex :name "DU")   (make-instance 'vertex :name "DV")   (make-instance 'vertex :name "DW")   (make-instance 'vertex :name "DX")
   (make-instance 'vertex :name "DY")   (make-instance 'vertex :name "DZ")   (make-instance 'vertex :name "EA")   (make-instance 'vertex :name "EB")   (make-instance 'vertex :name "EC")
   (make-instance 'vertex :name "ED")   (make-instance 'vertex :name "EE")   (make-instance 'vertex :name "EF")   (make-instance 'vertex :name "EG")   (make-instance 'vertex :name "EH")
   (make-instance 'vertex :name "EJ")   (make-instance 'vertex :name "EK")   (make-instance 'vertex :name "EL")   (make-instance 'vertex :name "EM")   (make-instance 'vertex :name "EN")
   (make-instance 'vertex :name "EP")   (make-instance 'vertex :name "EQ")   (make-instance 'vertex :name "ER")   (make-instance 'vertex :name "ES")   (make-instance 'vertex :name "ET")
   (make-instance 'vertex :name "EU")   (make-instance 'vertex :name "EV")   (make-instance 'vertex :name "ZZ")))

(defparameter ribs
  (list
   (make-instance 'gidro-rib :v1 "AA" :v2 "AB" :name "AA-AB")   (make-instance 'gidro-rib :v1 "AB" :v2 "AC" :name "AB-AC")   (make-instance 'gidro-rib :v1 "AC" :v2 "AD" :name "AC-AD")
   (make-instance 'gidro-rib :v1 "AD" :v2 "AE" :name "AD-AE")   (make-instance 'gidro-rib :v1 "AE" :v2 "AF" :name "AE-AF")   (make-instance 'gidro-rib :v1 "AF" :v2 "AG" :name "AF-AG")
   (make-instance 'gidro-rib :v1 "AG" :v2 "AH" :name "AG-AH")   (make-instance 'gidro-rib :v1 "AH" :v2 "AJ" :name "AH-AJ")   (make-instance 'gidro-rib :v1 "AJ" :v2 "AK" :name "AJ-AK")
   (make-instance 'gidro-rib :v1 "AK" :v2 "AL" :name "AK-AL")   (make-instance 'gidro-rib :v1 "AL" :v2 "AM" :name "AL-AM")   (make-instance 'gidro-rib :v1 "AM" :v2 "AN" :name "AM-AN")
   (make-instance 'gidro-rib :v1 "AN" :v2 "AP" :name "AN-AP")   (make-instance 'gidro-rib :v1 "AP" :v2 "AQ" :name "AP-AQ")   (make-instance 'gidro-rib :v1 "AQ" :v2 "AR" :name "AQ-AR")
   (make-instance 'gidro-rib :v1 "AR" :v2 "AS" :name "AR-AS")   (make-instance 'gidro-rib :v1 "AS" :v2 "AT" :name "AS-AT")   (make-instance 'gidro-rib :v1 "AT" :v2 "AU" :name "AT-AU")
   (make-instance 'gidro-rib :v1 "AU" :v2 "AV" :name "AU-AV")   (make-instance 'gidro-rib :v1 "AV" :v2 "AW" :name "AV-AW")   (make-instance 'gidro-rib :v1 "AW" :v2 "AX" :name "AW-AX")
   (make-instance 'gidro-rib :v1 "AX" :v2 "AY" :name "AX-AY")   (make-instance 'gidro-rib :v1 "AY" :v2 "AZ" :name "AY-AZ")   (make-instance 'gidro-rib :v1 "AZ" :v2 "BA" :name "AZ-BA")
   (make-instance 'gidro-rib :v1 "BA" :v2 "BB" :name "BA-BB")   (make-instance 'gidro-rib :v1 "BB" :v2 "BC" :name "BB-BC")   (make-instance 'gidro-rib :v1 "BC" :v2 "BD" :name "BC-BD")
   (make-instance 'gidro-rib :v1 "BD" :v2 "BE" :name "BD-BE")   (make-instance 'gidro-rib :v1 "BE" :v2 "BF" :name "BE-BF")   (make-instance 'gidro-rib :v1 "BF" :v2 "BG" :name "BF-BG")
   (make-instance 'gidro-rib :v1 "BG" :v2 "BH" :name "BG-BH")   (make-instance 'gidro-rib :v1 "BH" :v2 "BJ" :name "BH-BJ")   (make-instance 'gidro-rib :v1 "BJ" :v2 "BK" :name "BJ-BK")
   (make-instance 'gidro-rib :v1 "BK" :v2 "BL" :name "BK-BL")   (make-instance 'gidro-rib :v1 "BL" :v2 "BM" :name "BL-BM")   (make-instance 'gidro-rib :v1 "BM" :v2 "BN" :name "BM-BN")
   (make-instance 'gidro-rib :v1 "BN" :v2 "BP" :name "BN-BP")   (make-instance 'gidro-rib :v1 "BP" :v2 "BQ" :name "BP-BQ")   (make-instance 'gidro-rib :v1 "BQ" :v2 "AX" :name "BQ-AX")
   (make-instance 'gidro-rib :v1 "BJ" :v2 "BR" :name "BJ-BR")   (make-instance 'gidro-rib :v1 "BR" :v2 "BS" :name "BR-BS")   (make-instance 'gidro-rib :v1 "BS" :v2 "BT" :name "BS-BT")
   (make-instance 'gidro-rib :v1 "BT" :v2 "BU" :name "BT-BU")   (make-instance 'gidro-rib :v1 "BU" :v2 "BV" :name "BU-BV")   (make-instance 'gidro-rib :v1 "BV" :v2 "BW" :name "BV-BW")
   (make-instance 'gidro-rib :v1 "BW" :v2 "BX" :name "BW-BX")   (make-instance 'gidro-rib :v1 "BX" :v2 "BY" :name "BX-BY")   (make-instance 'gidro-rib :v1 "BY" :v2 "BZ" :name "BY-BZ")
   (make-instance 'gidro-rib :v1 "BZ" :v2 "CA" :name "BZ-CA")   (make-instance 'gidro-rib :v1 "CA" :v2 "CB" :name "CA-CB")   (make-instance 'gidro-rib :v1 "CB" :v2 "CC" :name "CB-CC")
   (make-instance 'gidro-rib :v1 "CC" :v2 "CD" :name "CC-CD")   (make-instance 'gidro-rib :v1 "CD" :v2 "CE" :name "CD-CE")   (make-instance 'gidro-rib :v1 "CE" :v2 "CF" :name "CE-CF")
   (make-instance 'gidro-rib :v1 "CF" :v2 "CG" :name "CF-CG")   (make-instance 'gidro-rib :v1 "CG" :v2 "CH" :name "CG-CH")   (make-instance 'gidro-rib :v1 "CH" :v2 "CJ" :name "CH-CJ")
   (make-instance 'gidro-rib :v1 "CJ" :v2 "CK" :name "CJ-CK")   (make-instance 'gidro-rib :v1 "CK" :v2 "CL" :name "CK-CL")   (make-instance 'gidro-rib :v1 "CL" :v2 "CM" :name "CL-CM")
   (make-instance 'gidro-rib :v1 "CM" :v2 "ZZ" :name "CM-ZZ")   (make-instance 'gidro-rib :v1 "BT" :v2 "CN" :name "BT-CN")   (make-instance 'gidro-rib :v1 "CN" :v2 "CP" :name "CN-CP")
   (make-instance 'gidro-rib :v1 "CP" :v2 "CQ" :name "CP-CQ")   (make-instance 'gidro-rib :v1 "CQ" :v2 "CR" :name "CQ-CR")   (make-instance 'gidro-rib :v1 "CR" :v2 "CRa" :name "CR-CRa")
   (make-instance 'gidro-rib :v1 "CRa" :v2 "CS" :name "CRa-CS")   (make-instance 'gidro-rib :v1 "CS" :v2 "CT" :name "CS-CT")   (make-instance 'gidro-rib :v1 "CT" :v2 "CU" :name "CT-CU")
   (make-instance 'gidro-rib :v1 "CU" :v2 "CV" :name "CU-CV")   (make-instance 'gidro-rib :v1 "CV" :v2 "CW" :name "CV-CW")   (make-instance 'gidro-rib :v1 "CW" :v2 "CX" :name "CW-CX")
   (make-instance 'gidro-rib :v1 "CX" :v2 "CY" :name "CX-CY")   (make-instance 'gidro-rib :v1 "CY" :v2 "CZ" :name "CY-CZ")   (make-instance 'gidro-rib :v1 "CZ" :v2 "DA" :name "CZ-DA")
   (make-instance 'gidro-rib :v1 "DA" :v2 "DB" :name "DA-DB")   (make-instance 'gidro-rib :v1 "DB" :v2 "DC" :name "DB-DC")   (make-instance 'gidro-rib :v1 "DC" :v2 "DD" :name "DC-DD")
   (make-instance 'gidro-rib :v1 "DD" :v2 "DE" :name "DD-DE")   (make-instance 'gidro-rib :v1 "DE" :v2 "DF" :name "DE-DF")   (make-instance 'gidro-rib :v1 "DF" :v2 "DG" :name "DF-DG")
   (make-instance 'gidro-rib :v1 "DG" :v2 "DH" :name "DG-DH")   (make-instance 'gidro-rib :v1 "DH" :v2 "DJ" :name "DH-DJ")   (make-instance 'gidro-rib :v1 "DJ" :v2 "DK" :name "DJ-DK")
   (make-instance 'gidro-rib :v1 "DK" :v2 "DL" :name "DK-DL")   (make-instance 'gidro-rib :v1 "DL" :v2 "DM" :name "DL-DM")   (make-instance 'gidro-rib :v1 "DM" :v2 "DN" :name "DM-DN")
   (make-instance 'gidro-rib :v1 "DN" :v2 "DP" :name "DN-DP")   (make-instance 'gidro-rib :v1 "DP" :v2 "DQ" :name "DP-DQ")   (make-instance 'gidro-rib :v1 "DQ" :v2 "DR" :name "DQ-DR")
   (make-instance 'gidro-rib :v1 "DR" :v2 "DS" :name "DR-DS")   (make-instance 'gidro-rib :v1 "DS" :v2 "DT" :name "DS-DT")   (make-instance 'gidro-rib :v1 "DT" :v2 "ZZ" :name "DT-ZZ")
   (make-instance 'gidro-rib :v1 "CRa" :v2 "DU" :name "CRa-DU")   (make-instance 'gidro-rib :v1 "DU" :v2 "DV" :name "DU-DV")   (make-instance 'gidro-rib :v1 "DV" :v2 "DW" :name "DV-DW")
   (make-instance 'gidro-rib :v1 "DW" :v2 "DX" :name "DW-DX")   (make-instance 'gidro-rib :v1 "DX" :v2 "DY" :name "DX-DY")   (make-instance 'gidro-rib :v1 "DY" :v2 "DZ" :name "DY-DZ")
   (make-instance 'gidro-rib :v1 "DZ" :v2 "EA" :name "DZ-EA")   (make-instance 'gidro-rib :v1 "EA" :v2 "EB" :name "EA-EB")   (make-instance 'gidro-rib :v1 "EB" :v2 "EC" :name "EB-EC")
   (make-instance 'gidro-rib :v1 "EC" :v2 "ED" :name "EC-ED")   (make-instance 'gidro-rib :v1 "ED" :v2 "EE" :name "ED-EE")   (make-instance 'gidro-rib :v1 "EE" :v2 "EF" :name "EE-EF")
   (make-instance 'gidro-rib :v1 "EF" :v2 "EG" :name "EF-EG")   (make-instance 'gidro-rib :v1 "EG" :v2 "EH" :name "EG-EH")   (make-instance 'gidro-rib :v1 "EH" :v2 "EJ" :name "EH-EJ")
   (make-instance 'gidro-rib :v1 "EJ" :v2 "EK" :name "EJ-EK")   (make-instance 'gidro-rib :v1 "EK" :v2 "EL" :name "EK-EL")   (make-instance 'gidro-rib :v1 "EL" :v2 "EM" :name "EL-EM")
   (make-instance 'gidro-rib :v1 "EM" :v2 "EN" :name "EM-EN")   (make-instance 'gidro-rib :v1 "EN" :v2 "EP" :name "EN-EP")   (make-instance 'gidro-rib :v1 "EP" :v2 "EQ" :name "EP-EQ")
   (make-instance 'gidro-rib :v1 "EQ" :v2 "ER" :name "EQ-ER")   (make-instance 'gidro-rib :v1 "ER" :v2 "ES" :name "ER-ES")   (make-instance 'gidro-rib :v1 "ES" :v2 "ET" :name "ES-ET")
   (make-instance 'gidro-rib :v1 "ET" :v2 "EU" :name "ET-EU")   (make-instance 'gidro-rib :v1 "EU" :v2 "EV" :name "EU-EV")   (make-instance 'gidro-rib :v1 "EV" :v2 "ZZ" :name "EV-ZZ")
   (make-instance 'gidro-rib :v1 "ZZ" :v2 "AA" :name "ZZ-AA")))

(defparameter elements
  (list
   (make-instance 'zabornik      :name "Z1"        :diameter 0.0494 :vertexes '("AA" "AB"))
   (make-instance 'truba         :name "T-AB-AC"   :diameter (truba-in-dia 0.028) :length 0.1 :vertexes '("AB" "AC"))
   (make-instance 'ugolnilk      :name "U-AC-AD"   :diameter (truba-in-dia 0.028) :radius (radius-giba 0.028) :vertexes '("AC" "AD"))
   (make-instance 'truba         :name "T-AD-AE"   :diameter (truba-in-dia 0.028) :length 0.200 :vertexes '("AD" "AE"))
   (make-instance 'vyxod         :name "VY-AE-AF"  :diameter (truba-in-dia 0.028) :vertexes '("AE" "AF"))
   (make-instance 'vxod          :name "VX-AF-AG"  :diameter (truba-in-dia 0.053) :vertexes '("AF" "AG"))
   (make-instance 'truba         :name "T-AG-AH"   :diameter (truba-in-dia 0.053) :length 0.3 :vertexes '("AG" "AH"))
   (make-instance 'ugolnilk      :name "U-AH-AJ"   :diameter (ugolnik-in-dia 0.053) :radius (ugolnik-radius 0.053) :vertexes '("AH" "AJ"))
   (make-instance 'truba         :name "T-AJ-AK"   :diameter (truba-in-dia 0.053) :length 0.150 :vertexes '("AJ" "AK"))
   (make-instance 'metallorukav  :name "MR4"       :diameter 0.050 :length 0.400  :vertexes '("AK" "AL"))
   (make-instance 'perehod       :name "P1"        :diameter_1 (ugolnik-in-dia 0.053) :diameter_2 (ugolnik-in-dia 0.075) :len 0.050 :vertexes '("AL" "AM"))
   (make-instance 'truba         :name "T-AM-AN"   :diameter (truba-in-dia 0.075) :length 0.200 :vertexes '("AM" "AN"))
   (make-instance 'ugolnilk      :name "U-AN-AP"   :diameter (ugolnik-in-dia 0.075) :radius (ugolnik-radius 0.075) :vertexes '("AN" "AP"))
   (make-instance 'truba         :name "T-AP-AQ"   :diameter (truba-in-dia 0.075) :length 0.400 :vertexes '("AP" "AQ"))
   (make-instance 'ugolnilk      :name "U-AQ-AR"   :diameter (ugolnik-in-dia 0.075) :radius (ugolnik-radius 0.075) :vertexes '("AQ" "AR"))
   (make-instance 'truba         :name "T-AR-AS"   :diameter (truba-in-dia 0.075) :length 1.200 :vertexes '("AR-AS"))
   (make-instance 'ugolnilk      :name "U-AS-AT"   :diameter (ugolnik-in-dia 0.075) :radius (ugolnik-radius 0.075) :vertexes '("AS" "AT"))
   (make-instance 'truba         :name "T-AT-AU"   :diameter (truba-in-dia 0.075) :length 1.000 :vertexes '("AT" "AU"))
   (make-instance 'ugolnilk      :name "U-AU-AV"   :diameter (ugolnik-in-dia 0.075) :radius (ugolnik-radius 0.075) :vertexes '("AU" "AV"))
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
   (make-instance 'ugolnilk      :name "U-BF-BG"   :diameter (ugolnik-in-dia 0.075) :radius (ugolnik-radius 0.075) :vertexes '("BF" "BG"))
   (make-instance 'truba         :name "T-BG-BH"   :diameter (truba-in-dia 0.075) :length 0.500 :vertexes '("BG" "BH"))
   (make-instance 'troynik	 :name "TR2" :vertexes '("BH" "BR" "BK" "BJ")
		  :diameter_1 (truba-in-dia 0.075) :alfa_1 180.0
		  :diameter_2 (truba-in-dia 0.075) :alfa_2 0.0
		  :diameter_3 (truba-in-dia 0.075) :alfa_3 90.0)
   (make-instance 'truba         :name "T-BK-BL"   :diameter (truba-in-dia 0.075) :length 2.000 :vertexes '("BK" "BL"))
   (make-instance 'valve         :name "VA1"       :vertexes '("BL" "BM"))   
   (make-instance 'truba         :name "T-BM-BN"   :diameter (truba-in-dia 0.075) :length 3.000 :vertexes '("BM" "BN"))
   (make-instance 'ugolnilk      :name "U-BN-BP"   :diameter (ugolnik-in-dia 0.075) :radius (ugolnik-radius 0.075) :vertexes '("BN" "BP"))
   (make-instance 'truba         :name "T-BP-BQ"   :diameter (truba-in-dia 0.075) :length 3.000 :vertexes '("BP" "BQ"))
   (make-instance 'truba         :name "T-BR-BS"   :diameter (truba-in-dia 0.075) :length 0.200 :vertexes '("BR" "BS"))
   (make-instance 'troynik	 :name "TR2" :vertexes '("BS" "CN" "BU" "BT")
		  :diameter_1 (truba-in-dia 0.075) :alfa_1 180.0
		  :diameter_2 (truba-in-dia 0.075) :alfa_2 0.0
		  :diameter_3 (truba-in-dia 0.032) :alfa_3 90.0)
   (make-instance 'truba         :name "T-BU-BV"   :diameter (truba-in-dia 0.032) :length 6.000 :vertexes '("BU" "BV"))
   (make-instance 'ugolnilk      :name "U-BV-BW"   :diameter (ugolnik-in-dia 0.032) :radius (radius-giba 0.032) :vertexes '("BV" "BW"))
   (make-instance 'truba         :name "T-BW-BX"   :diameter (truba-in-dia 0.032) :length 2.000 :vertexes '("BW" "BX"))
   (make-instance 'ugolnilk      :name "U-BX-BY"   :diameter (ugolnik-in-dia 0.032) :radius (radius-giba 0.032) :vertexes '("BX" "BY"))
   (make-instance 'truba         :name "T-BY-BZ"   :diameter (truba-in-dia 0.032) :length 0.500 :vertexes '("BY" "BZ"))
   (make-instance 'ugolnilk      :name "U-BZ-CA"   :diameter (ugolnik-in-dia 0.032) :radius (radius-giba 0.032) :vertexes '("BZ" "CA"))
   (make-instance 'truba         :name "T-CA-CB"   :diameter (truba-in-dia 0.032) :length 0.500 :vertexes '("CA" "CB"))
   (make-instance 'ugolnilk      :name "U-CB-CC"   :diameter (ugolnik-in-dia 0.032) :radius (radius-giba 0.032) :vertexes '("CB" "CC"))
   (make-instance 'truba         :name "T-CC-CD"   :diameter (truba-in-dia 0.032) :length 0.200 :vertexes '("CC" "CD"))
   (make-instance 'valve-obr     :name "KO2"       :diameter 0.025 :vertexes '("CD" "CE"))
   (make-instance 'truba         :name "T-CE-CF"   :diameter (truba-in-dia 0.032) :length 0.200 :vertexes '("CE" "CF"))
   (make-instance 'metallorukav  :name "MR2"       :diameter 0.030 :length 0.400  :vertexes '("CF" "CG"))
   (make-instance 'truba         :name "T-CG-CH"   :diameter (truba-in-dia 0.032) :length 0.200 :vertexes '("CG" "CH"))
   (make-instance 'ugolnilk      :name "U-CH-CJ"   :diameter (ugolnik-in-dia 0.032) :radius (radius-giba 0.032) :vertexes '("CH" "CJ"))
   (make-instance 'vyxod         :name "VY-CJ-CK"  :diameter (truba-in-dia 0.032) :vertexes '("CJ" "CK"))
   (make-instance 'vxod          :name "VX-CK-CL"  :diameter (truba-in-dia 0.014) :num 16.0 :vertexes '("CK" "CL"))
   (make-instance 'ugolnilk      :name "U-CL-CM"   :diameter (truba-in-dia 0.014) :radius (radius-giba 0.014) :alfa 180.0 :num 16.0 :vertexes '("CL" "CM"))
   (make-instance 'forsunka      :name "F2"        :area 6.422e-6 :num 16.0 :vertexes '("CM" "ZZ") )
   (make-instance 'truba         :name "T-CN-CP"   :diameter (truba-in-dia 0.075) :length 0.200 :vertexes '("CN" "CP"))
   (make-instance 'perehod       :name "P1"        :diameter_1 (truba-in-dia 0.075) :diameter_2 (truba-in-dia 0.022) :len 0.060 :vertexes '("CP" "CQ"))
   (make-instance 'truba         :name "T-CQ-CR"   :diameter (truba-in-dia 0.022) :length 0.200 :vertexes '("CQ" "CR"))
   (make-instance 'troynik	 :name "TR4" :vertexes '("CR" "CS" "DU" "CRa")
		  :diameter_1 (truba-in-dia 0.022) :alfa_1 180.0
		  :diameter_2 (truba-in-dia 0.022) :alfa_2 90.0
		  :diameter_3 (truba-in-dia 0.022) :alfa_3 -90.0)
   (make-instance 'truba         :name "T-CS-CT"   :diameter (truba-in-dia 0.022) :length 0.150 :vertexes '("CS" "CT"))
   (make-instance 'ugolnilk      :name "U-CT-CU"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("CT" "CU"))
   (make-instance 'truba         :name "T-CU-CV"   :diameter (truba-in-dia 0.022) :length 0.300 :vertexes '("CU" "CV"))
   (make-instance 'ugolnilk      :name "U-CV-CW"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("CV" "CW"))
   (make-instance 'truba         :name "T-CW-CX"   :diameter (truba-in-dia 0.022) :length 0.300 :vertexes '("CW" "CX"))
   (make-instance 'ugolnilk      :name "U-CX-CY"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("CX" "CY"))
   (make-instance 'truba         :name "T-CY-CZ"   :diameter (truba-in-dia 0.022) :length 0.600 :vertexes '("CY" "CZ"))
   (make-instance 'ugolnilk      :name "U-CZ-DA"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("CZ" "DA"))
   (make-instance 'truba         :name "T-DA-DB"   :diameter (truba-in-dia 0.022) :length 6.500 :vertexes '("DA" "DB"))
   (make-instance 'ugolnilk      :name "U-DB-DC"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("DB" "DC"))
   (make-instance 'truba         :name "T-DC-DD"   :diameter (truba-in-dia 0.022) :length 2.500 :vertexes '("DC" "DD"))
   (make-instance 'ugolnilk      :name "U-DD-DE"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("DD" "DE"))
   (make-instance 'truba         :name "T-DE-DF"   :diameter (truba-in-dia 0.022) :length 0.500 :vertexes '("DE" "DF"))
   (make-instance 'ugolnilk      :name "U-DF-DG"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("DF" "DG"))
   (make-instance 'truba         :name "T-DG-DH"   :diameter (truba-in-dia 0.022) :length 0.500 :vertexes '("DG" "DH"))
   (make-instance 'ugolnilk      :name "U-DH-DJ"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("DH" "DJ"))
   (make-instance 'truba         :name "T-DJ-DK"   :diameter (truba-in-dia 0.022) :length 0.200 :vertexes '("DJ" "DK"))
   (make-instance 'valve-obr     :name "KO1"       :diameter 0.025 :vertexes '("DK" "DL"))
   (make-instance 'truba         :name "T-DL-DM"   :diameter (truba-in-dia 0.022) :length 0.200 :vertexes '("DL" "DM"))
   (make-instance 'metallorukav  :name "MR1"       :diameter 0.020 :length 0.400  :vertexes '("DM" "DN"))
   (make-instance 'truba         :name "T-DN-DP"   :diameter (truba-in-dia 0.022) :length 0.200 :vertexes '("DN" "DP"))
   (make-instance 'ugolnilk      :name "U-DP-DQ"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("DP" "DQ"))
   (make-instance 'vyxod         :name "VY-DQ-DR"  :diameter (truba-in-dia 0.022) :vertexes '("DQ" "DR"))
   (make-instance 'vxod          :name "VX-DR-DS"  :diameter (truba-in-dia 0.010) :num 16.0 :vertexes '("DR" "DS"))
   (make-instance 'ugolnilk      :name "U-DS-DT"   :diameter (truba-in-dia 0.010) :radius (radius-giba 0.010) :alfa 180.0 :num 16.0 :vertexes '("DP" "DQ"))
   (make-instance 'forsunka      :name "F1"        :area 3.52e-6 :num 16.0 :vertexes '("DT" "ZZ"))
   (make-instance 'truba         :name "T-DU-DV"   :diameter (truba-in-dia 0.022) :length 0.150 :vertexes '("DU" "DV"))
   (make-instance 'ugolnilk      :name "U-DV-DW"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("DV" "DW"))
   (make-instance 'truba         :name "T-DW-DX"   :diameter (truba-in-dia 0.022) :length 0.300 :vertexes '("DW" "DX"))
   (make-instance 'ugolnilk      :name "U-DX-DY"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("DX" "DY"))
   (make-instance 'truba         :name "T-DY-DZ"   :diameter (truba-in-dia 0.022) :length 0.300 :vertexes '("DY" "DZ"))
   (make-instance 'ugolnilk      :name "U-DZ-EA"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("DZ" "EA"))
   (make-instance 'truba         :name "T-EA-EB"   :diameter (truba-in-dia 0.022) :length 0.600 :vertexes '("EA" "EB"))
   (make-instance 'ugolnilk      :name "U-EB-EC"   :diameter (truba-in-dia 0.022) :radius (radius-giba 0.022) :vertexes '("EB" "EC"))
   (make-instance 'truba         :name "T-EC-ECa"  :diameter (truba-in-dia 0.022) :length 0.500 :vertexes '("EC" "ECa"))
   (make-instance 'perehod       :name "P3"        :diameter_1 0.0196 :diameter_2 0.0296 :len 0.030 :vertexes '("ECa" "ECb"))
   (make-instance 'truba         :name "T-ECb-ED"  :diameter (truba-in-dia 0.032) :length 5.500 :vertexes '("ECb" "ED"))
   (make-instance 'ugolnilk      :name "U-ED-EE"   :diameter (truba-in-dia 0.032) :radius (radius-giba 0.032) :vertexes '("ED" "EE"))
   (make-instance 'truba         :name "T-EE-EF"   :diameter (truba-in-dia 0.032) :length 2.500 :vertexes '("EE" "EF"))
   (make-instance 'ugolnilk      :name "U-EF-EG"   :diameter (truba-in-dia 0.032) :radius (radius-giba 0.032) :vertexes '("EF" "EG"))
   (make-instance 'truba         :name "T-EG-EH"   :diameter (truba-in-dia 0.032) :length 0.500 :vertexes '("EG" "EH"))
   (make-instance 'ugolnilk      :name "U-EH-EJ"   :diameter (truba-in-dia 0.032) :radius (radius-giba 0.032) :vertexes '("EH" "EJ"))
   (make-instance 'truba         :name "T-EJ-EK"   :diameter (truba-in-dia 0.032) :length 0.500 :vertexes '("EJ" "EK"))
   (make-instance 'ugolnilk      :name "U-EK-EL"   :diameter (truba-in-dia 0.032) :radius (radius-giba 0.032) :vertexes '("EK" "EL"))
   (make-instance 'truba         :name "T-EL-EM"   :diameter (truba-in-dia 0.032) :length 0.200 :vertexes '("EL" "EM"))
   (make-instance 'valve-obr     :name "KO3"       :diameter 0.025 :vertexes '("EM" "EN"))
   (make-instance 'truba         :name "T-EN-EP"   :diameter (truba-in-dia 0.032) :length 0.200 :vertexes '("EN" "EP"))
   (make-instance 'metallorukav  :name "MR3"       :diameter 0.030 :length 0.400  :vertexes '("EP" "EQ"))
   (make-instance 'truba         :name "T-EQ-ER"   :diameter (truba-in-dia 0.032) :length 0.200 :vertexes '("EQ" "ER"))
   (make-instance 'ugolnilk      :name "U-ER-ES"   :diameter (truba-in-dia 0.032) :radius (radius-giba 0.032) :vertexes '("ER" "ES"))
   (make-instance 'vyxod         :name "VY-ES-ET"  :diameter (truba-in-dia 0.032) :vertexes '("ES" "ET") )
   (make-instance 'vxod          :name "VX-ET-EU"  :diameter (truba-in-dia 0.022) :num 16 :vertexes '("ES" "EU"))
   (make-instance 'ugolnilk      :name "U-EU-EV"   :diameter (truba-in-dia 0.022) :num 16 :radius (radius-giba 0.022) :alfa 180.0 :vertexes '("EU" "EV"))
   (make-instance 'forsunka      :name "F3"        :area 26.1e-6 :vertexes '("EV" "ZZ") :num 16.0)
   ))


(defmethod rib-name ((x rib))
  (format T "(make-instance 'gidro-rib :v1 \"~A\" :v2 \"~A\" :name \"~A-~A\")~%" (rib-v1 x) (rib-v2 x) (rib-v1 x) (rib-v2 x)))

;;;;(mapcar #'(lambda (el) (rib-name el)) ribs)

(defun draw-graph(r)
  (format T "digraph G {~%")
  (format T "rankdir = LR;~%")
  (mapcar #'(lambda (el) (out el)) r)
  (format T "}"))

;;;;(draw-graph ribs)

;;;;(make-instance 'truba :v1 "A" :v2 "B" :diameter 0.0494 :length 1.2 )

;;;;(mapcar #'(lambda(el) (out el) (format T "~%"))  elements)

(defmethod μ ((g gas))
  "Возвращает молекулярную массу газа [kg/mol]
Пример использования
(let ((g1 (make-instance 'gas :name \"Водород\")))
  (μ g1))"
  (values (varghaftik:μ :gas_name (name g))"[kg/mol]" "Молекулярная масса газа" (out g)))

(defmethod ρ ((p parametrised) (g gas))
  "Возвращает плотность газа [kg/m^3]
Пример использования:
(let 
    ((p1 (make-instance 'parametrised :pressure 101325. :tempreche (+ 273.0 0.0)))
     (g1 (make-instance 'gas :name \"Воздух\")))
  (ρ p1 g1))"
  (values (/ (* (pressure p) (μ g) ) (* varghaftik:Rμ (tempreche p)))
	  "[kg/m^3]" "Плотность газа"
	  (out g)
	  (out p)))

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
	  (out g)
	  (out p)))

(defmethod ν ((p parametrised) (g gas))
    "Возвращает коэффициент кинематической вязкости газа [m^2/s]
Пример использования:
(let 
    ((p1 (make-instance 'parametrised :pressure 101325. :tempreche (+ 273.0 0.0)))
     (g1 (make-instance 'gas :name \"Воздух\")))
  (ν p1 g1))"
  (values (/ (η p g) (ρ p g))"[m^2/s]" "Коэффициент кинематической вязкости газа" (name g)))

(defmethod Re ((tr truba) (p parametrised) (g gas) (w number))
  "Возвращает число Рейнольдса для трубы круглого поперечного сечения [1]
Пример использования:
(let 
    ((p1 (make-instance 'parametrised :pressure 101325. :tempreche (+ 273.0 0.0)))
     (g1 (make-instance 'gas :name \"Воздух\"))
     (tr1 (make-instance 'truba  :name \"T-EE-EF\" :diameter (truba-in-dia 0.010) :length 2.500 :vertexes '(\"EE\" \"EF\")))
     (w 15.0)
     )
  (Re tr1 p1 g1 w))"
  (values (/ (* (diameter tr) w) (ν p g))
	  "[1]"
	  "Число Рейнольдса для газа"
	  (out g)
	  (out p)))

;;(let ((p1 (make-instance 'parametrised :pressure 101325. :tempreche (+ 273.0 0.0))) (g1 (make-instance 'gas :name "Воздух"))) (ρ p1 g1))

;;;;(defparameter tr1 (make-instance 'truba :name "T-EE-EF" :diameter (truba-in-dia 0.010) :length 2.500 :vertexes '("EE" "EF")))
;;;;(defparameter param1 (make-instance 'parametrised :pressure 101325. :tempreche (+ 273.0 0.0))) 
;;;;(defparameter gas1 (make-instance 'gas :name "Воздух"))
;;;;(defparameter gas2 (make-instance 'gas :name "Водород"))
