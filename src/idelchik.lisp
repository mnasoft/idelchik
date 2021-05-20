;;;; idelchik.lisp

(in-package #:idelchik)

"
И.Е. Идельчик д-р техн. наук nроф.
СПРАВОЧНИК
ПО ГИДРАВЛИЧЕСКИМ
СОПРОТИВЛЕНИЯМ
под редакцией канд. тех. наук М.О.Штейнберra
3-е издание
переработанное и дополненное

Предисловие к третьему изданию
Предисловие ко второму изданию
1 Общие сведения и элементы аэродинамики и гидравлики напорных систем
1-1. Общие указания
1-2. Свойства жидкостей и rазов
1-3. Режимы течения жидкости (газа)
1-4. Равновесие жидкости и газа
1-5. Уравнения движения жидкостии rаза
1-6. Гидравлические сопротивлениясетей
1-7. Распределение статическоrодавления по участкам сети повышенноrо сопротивления
1-8. Обобщенные формулы сопро-тивления для гомогенных и гетерогенных систем
1-9. Истечение жидкости и газа из отверстия
1-10. Работа нагнетателя в сети
1-11. Схемы расчета rидравлического сопротивления сетей
2 Сопротивление при течении по прямым трубам и каналам 
  (коэффициенты сопротивления трения и параметры шероховатости)
2-1. Пояснения и практические peкомендации
2-2. Диаrраммы коэффициентов сопротивления трения
3 Сопротивление при теченни на входе в трубы и каналы
  (коэффициенты сопротивления входных участков)
3-1. Пояснения и практические рекомендации
З-2. Диаrраммы коэффициентов сопротивления
4  Сопротивление при течении с внезапным изменением скорости и при перетекании потока через отверстия 
  (коэффициенты сопротивления участков с внезапным расширением сечения, внезапным сужением сечения, шайб, диафраrм, проeмов и др.)
4-1. Пояснения и практические peкомендации
4-2. Диarраммы коэффициентов сопротивления
5 Сопротивление при течении с плавным измеиением скорости 
  (коэффициенты сопротивления диффузоов, конфузоров и дрyrих переходных участков)
5-1. Пояснения и практические рекомендации
5-2. диаrраммы коэффициентов сопротивления
6 Сопротивление при течении с изменением направления потока 
  (коэффициенты сопротивления изогнутых участков колен, отводов и др.)
6-1. Пояснения и практические рекомендации
6-2. Диaграммы коэффициентов сопротивления
7 Сопротивление при течении со слиянием потоков или разделением потока 
  (коэффициeнты сопротивления тройников, крестовин, распределительных коллекторов)
7-1. Пояснения и практические peкомендации
7-2. Диаrpаммы коэффициентовсопротивления
8 Сопротивление при течении через препятствия, равномерно распределенные по сечеиию каналов 
  (коэффициенты сопротивления решеток, сеток, пористых слоев, насадок и др.)
8-1. Пояснения и практические peкомендации
8-2. Диаrраммы коэффициентов сопротивления
9 Сопротивление при течении через трубопроводную арматуру и лабиринты 
  (коэффицненты сопротнвления клапаиов, задвижек, затворов, лабириинтов, компенсаторов)
9-1. Пояснения и практические peкомендации
9-2. Диаrраммы коэффициентов сопротивления
10 Сопротивление при обтекании тел потоком в трубе 
   (коэффициенты сопротивления участков с выступами, распорками, фермами и дрyгими телами)
10-1. Пояснения и практические рекомендации
10-2. Диаграммы коэффициентов сопротивления
11 Сопротивления при течении на выходе из труб и каналов 
   (коэффициенты сопротивлення выходных участков)
11-1. Пояснения и практические рекомендации
11-2. Диarраммы коэффициентов сопротивления
12 Сопротивление при течеиии через различные аппараты 
   (коэффициенты сопротивления аппаратов и дрyrих устройств)
12-1. Пояснения и практические рекомендации
12-2. Диаrpаммы коэффициентов сопротивления
Список литературы
Предметный указатель
"

(defun lg (x)
  "Функция вычисления десятичного логарифма"
  (log x 10))











