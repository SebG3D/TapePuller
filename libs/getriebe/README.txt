                   .:                     :,                                          
,:::::::: ::`      :::                   :::                                          
,:::::::: ::`      :::                   :::                                          
.,,:::,,, ::`.:,   ... .. .:,     .:. ..`... ..`   ..   .:,    .. ::  .::,     .:,`   
   ,::    :::::::  ::, :::::::  `:::::::.,:: :::  ::: .::::::  ::::: ::::::  .::::::  
   ,::    :::::::: ::, :::::::: ::::::::.,:: :::  ::: :::,:::, ::::: ::::::, :::::::: 
   ,::    :::  ::: ::, :::  :::`::.  :::.,::  ::,`::`:::   ::: :::  `::,`   :::   ::: 
   ,::    ::.  ::: ::, ::`  :::.::    ::.,::  :::::: ::::::::: ::`   :::::: ::::::::: 
   ,::    ::.  ::: ::, ::`  :::.::    ::.,::  .::::: ::::::::: ::`    ::::::::::::::: 
   ,::    ::.  ::: ::, ::`  ::: ::: `:::.,::   ::::  :::`  ,,, ::`  .::  :::.::.  ,,, 
   ,::    ::.  ::: ::, ::`  ::: ::::::::.,::   ::::   :::::::` ::`   ::::::: :::::::. 
   ,::    ::.  ::: ::, ::`  :::  :::::::`,::    ::.    :::::`  ::`   ::::::   :::::.  
                                ::,  ,::                               ``             
                                ::::::::                                              
                                 ::::::                                               
                                  `,,`


http://www.thingiverse.com/thing:1604369
Getriebe Bibliothek für OpenSCAD / Gears Library for OpenSCAD by janssen86 is licensed under the Creative Commons - Attribution - Non-Commercial - Share Alike license.
http://creativecommons.org/licenses/by-nc-sa/3.0/

# Summary

<h3>OpenSCAD Bibliothek für Evolventen-Zahnräder, Schnecken und Zahnstangen
</h3>

Eine Bibliothek zur parametrischen Erzeugung von Stirn-, Hohl- und Kegelrädern, Schnecken und Zahnstangen sowie von Zusammensetzungen. Die deutschen Begriffe werden gemäß der Definitionen in DIN 868 verwendet.

Zu Begriffen und Geometrien, siehe auch:

Ferdinand Bodenstein und Horst Haberhauer: Maschinenelemente: Gestaltung, Berechnung, Anwendung. 13 Aufl. Springer-Verlag, Berlin 2006 - ISBN 3 540 22284 7

+++

<h3>OpenSCAD Library for Gear Racks, Involute and Worm Gears</h3>

A library for the parametric creation of gear racks, spur-, ring-, bevel- and worm gears, as well as of assemblies.

+++
+++

<h4>Parametrische Zahnstange</h4>

Erzeugt eine Zahnstange.

Das Skript passt den Eingriffswinkel im Stirnschnitt an den Schrägungswinkel an, d.h. 20° Eingriffswinkel werden zu 21,17° im Stirnschnitt bei 20° Schrägungswinkel.

<h5>Format:</h5>
zahnstange(modul, laenge, hoehe, breite, eingriffswinkel=20, schraegungswinkel=0)

<h5>Parameter:</h5>
modul = Höhe der Zahnköpfe über der Wälzgeraden
laenge = Länge der Zahnstange
hoehe = Höhe der Zahnstange bis zur Wälzgeraden
breite = Breite der Zähne
eingriffswinkel = Eingriffswinkel, Standardwert = 20° gemäß DIN 867. Sollte nicht größer als 45° sein.
schraegungswinkel = Schrägungswinkel zur Zahnstangen-Querachse; 0° = Geradverzahnung

+++

<h4>Parametric Gear Rack</h4>

Creates a gear rack.

This script adjusts the pressure angle in the transverse section to the helix angle: e.g. with a 20° helix angle, a pressure angle of 20° becomes a pressure angle of 21.17° in the transverse section.

<h5>Format:</h5>
zahnstange(modul, laenge, hoehe, breite, eingriffswinkel=20, schraegungswinkel=0)

<h5>Parameters:</h5>
modul = height of the tooth above the pitch line
laenge = length of the rack
hoehe = height from bottom to the pitch line
breite = face width
eingriffswinkel = pressure angle, standard value = 20° according to DIN 867. Should not be greater than 45°.
schraegungswinkel = bevel angle perpendicular to the rack's length; 0° = straight teeth

+++
+++

<h4>Parametrisches Stirnrad mit Evolventen-Verzahnung</h4>

Erzeugt ein Stirnrad mit Evolventenverzahnung ohne Profilverschiebung nach DIN 867 / DIN 58400. Zwei Räder kämmen, wenn sie das gleiche Modul und entgegen gesetzten Schrägungswinkel aufweisen. Der Achsabstand zweier Stirnräder A und B mit Modul m, Zahnzahlen z<sub>a</sub> und z<sub>b</sub> ist
<sup>m</sub></sup>/<sub>2</sub>·(z<sub>a</sub> + z<sub>b</sub>)

Schrägverzahnte Räder laufen ruhiger als geradverzahnte Räder. Sie erzeugen jedoch eine belastende Axialkraft, die durch die Achslager ausgeglichen werden muss. Empfehlungen für Schrägungswinkel abhängig vom Modul findet man in DIN 3978.

Das Skript passt den Eingriffswinkel im Stirnschnitt an den Schrägungswinkel an, d.h. 20° Eingriffswinkel werden zu 21,17° im Stirnschnitt bei 20° Schrägungswinkel.

<h5>Format:</h5>
stirnrad (modul, zahnzahl, breite, bohrung, eingriffswinkel=20, schraegungswinkel=0, optimiert=true)

<h5>Parameter:</h5>
modul = Höhe des Zahnkopfes über dem Teilkreis
zahnzahl = Anzahl der Radzähne
breite = Zahnbreite
bohrung = Durchmesser der Mittelbohrung
eingriffswinkel = Eingriffswinkel, Standardwert = 20° gemäß DIN 867
schraegungswinkel = Schrägungswinkel zur Rotationsachse; 0° = Geradverzahnung
optimiert = wenn wahr, Löcher zur Material-/Gewichtsersparnis bzw. Oberflächenvergößerung erzeugen, wenn Geometrie erlaubt

+++

<h4>Parametric Involute Spur Gear</h4>

Creates an involute spur gear without profile displacement following DIN 867 / DIN 58400. Two gears will mesh if their modules are the same and their helix angles opposite. The centre distance of two meshing gears A and B with module m and tooth numbers z<sub>a</sub> and z<sub>b</sub> is 
<sup>m</sub></sup>/<sub>2</sub>·(z<sub>a</sub> + z<sub>b</sub>)

Helical gears run more smoothly than gears with straight teeth. However, they also create axial loads which the bearings must be designed to contain. Recommendations for the helix angle depending on the module can be found in DIN 3978.

This script adjusts the pressure angle in the transverse section to the helix angle: e.g. with a 20° helix angle, a pressure angle of 20° becomes a pressure angle of 21.17° in the transverse section.

<h5>Format:</h5>
stirnrad (modul, zahnzahl, breite, bohrung, eingriffswinkel=20, schraegungswinkel=0, optimiert=true)

<h5>Parameters:</h5>
modul = gear module = height of the tooth above the pitch circle = 25.4 / diametrical pitch = circular pitch / π
zahnzahl = number of teeth
breite = face width
bohrung = central bore diameter
eingriffswinkel = pressure angle, standard value = 20° according to DIN 867
schraegungswinkel = helix angle to the rotation axis; 0° = straight teeth
optimiert = if true, create holes for material/weight reduction resp. surface increase, if geometry allows

+++
+++

<h4>Parametrisches Pfeilrad mit Evolventenverzahnung</h4>

Erzeugt ein Stirnrad mit Pfeilverzahnung ohne Profilverschiebung. Zwei Räder kämmen, wenn sie das gleiche Modul und entgegen gesetzten Schrägungswinkel aufweisen. Der Achsabstand zweier Stirnräder mit Modul m und Zahnzahlen z<sub>a</sub> und z<sub>b</sub> ist
<sup>m</sub></sup>/<sub>2</sub>·(z<sub>a</sub> + z<sub>b</sub>)

Pfeilverzahnte Räder laufen ruhiger als geradverzahnte Räder. Sie erzeugen, anders als schrägverzahnte Räder, keine belastende Axialkraft, die durch die Achslager ausgeglichen werden müsste.

Der Schrägungswinkel sollte zwischen zwischen 30° und 45° liegen. Empfehlungen für Schrägungswinkel abhängig vom Modul findet man in DIN 3978. 

Das Skript passt den Eingriffswinkel im Stirnschnitt an den Schrägungswinkel an, d.h. 20° Eingriffswinkel werden zu 22,80° im Stirnschnitt bei 30° Schrägungswinkel.

<h5>Format:</h5>
pfeilrad (modul, zahnzahl, breite, bohrung, eingriffswinkel=20, schraegungswinkel=0, optimiert=true)

<h5>Parameter:</h5>
modul = Höhe des Zahnkopfes über dem Teilkreis
zahnzahl = Anzahl der Radzähne
breite = Zahnbreite
bohrung = Durchmesser der Mittelbohrung
eingriffswinkel = Eingriffswinkel, Standardwert = 20° gemäß DIN 867
schraegungswinkel = Schrägungswinkel, Standardwert = 0° (Geradverzahnung)
optimiert = wenn wahr, Löcher zur Material-/Gewichtsersparnis bzw. Oberflächenvergößerung erzeugen, wenn Geometrie erlaubt

+++

<h4>Parametric Herringbone Involute Spur Gear</h4>

Creates a herringbone spur gear without profile displacement. Two gears will mesh if their modules are the same and their helix angles opposite. The centre distance of two meshing gears with module m and tooth numbers z<sub>a</sub> and z<sub>b</sub> is 
<sup>m</sub></sup>/<sub>2</sub>·(z<sub>a</sub> + z<sub>b</sub>)

Herringbone gears run more smoothly than gears with straight teeth. They also do not create torque on the axis like helical gears do.

A helix angle, if used, should be set between between 30° and 45°. Recommendations for the helix angle depending on the module can be found in DIN 3978.

This script adjusts the pressure angle in the transverse section to the helix angle: e.g. with a 30° helix angle, a pressure angle of 20° becomes a pressure angle of 22.80 in the transverse section.

<h5>Format:</h5>
pfeilrad (modul, zahnzahl, breite, bohrung, eingriffswinkel=20, schraegungswinkel=0, optimiert=true)

<h5>Parameters:</h5>
modul = gear module = height of the tooth above the pitch circle = 25.4 / diametrical pitch = circular pitch / π
zahnzahl = number of teeth
breite = face width
bohrung = central bore diameter
eingriffswinkel = pressure angle, standard value = 20° according to DIN 867
schraegungswinkel = helix angle to the rotation axis; 0° = straight teeth
optimiert = if true, create holes for material/weight reduction resp. surface increase, if geometry allows

+++
+++

<h4>Parametrische Zahnstange mit Ritzel</h4>

Erzeugt eine Zahnstange mit Ritzel.

Schrägverzahnte Räder/Zahnstangen laufen ruhiger als geradverzahnte Räder. Sie erzeugen jedoch eine belastende Axialkraft, die durch die Achslager ausgeglichen werden muss. Empfehlungen für Schrägungswinkel abhängig vom Modul findet man in DIN 3978.

Bei gegebenem Modul m und Zahnzahl des Ritzels z<sub>r</sub> beträgt der Abstand zwischen Ritzelachse und Wälzgerade der Zahnstange
<sup>m</sub></sup>/<sub>2</sub>·z<sub>r</sub>

Das Skript passt den Eingriffswinkel im Stirnschnitt an den Schrägungswinkel an, d.h. 20° Eingriffswinkel werden zu 21,17° im Stirnschnitt bei 20° Schrägungswinkel.

<h5>Format:</h5>
zahnstange_und_ritzel (modul, laenge_stange, zahnzahl_ritzel, hoehe_stange, bohrung_ritzel, breite, eingriffswinkel=20, schraegungswinkel=0, zusammen_gebaut=true, optimiert=true)

<h5>Parameter:</h5>
modul = Höhe des Zahnkopfes über der Wälzgeraden bzw. über dem Teilkreis
laenge_stange = Länge der Zahnstange
zahnzahl_ritzel = Anzahl der Radzähne
hoehe_stange = Höhe der Zahnstange bis zur Wälzgeraden
bohrung_ritzel = Durchmesser der Mittelbohrung des Ritzels
breite = Breite der Zähne
eingriffswinkel = Eingriffswinkel, Standardwert = 20° gemäß DIN 867. Sollte nicht größer als 45° sein.
schraegungswinkel = Schrägungswinkel zur Zahnstangen-Querachse bzw. zur Rotationsachse des Ritzels; 0° = Geradverzahnung
zusammen_gebaut = Komponenten zusammengebaut (wahr) für Konstruktion oder auseinander (falsch) zum 3D-Druck

+++

<h4>Parametric Gear Rack and Pinion</h4>

Creates a gear rack and pinion.

Helical gears / bevelled racks run more smoothly than gears with straight teeth. However, they also create axial loads which the bearings must be designed to contain. Recommendations for the helix angle depending on the module can be found in DIN 3978.

With a given module m and z<sub>p</sub> teeth on the pinion, the distance between the pinion's axis and the rack's pitch line is
<sup>m</sub></sup>/<sub>2</sub>·z<sub>p</sub>

This script adjusts the pressure angle in the transverse section to the helix angle: e.g. with a 20° helix angle, a pressure angle of 20° becomes a pressure angle of 21.17° in the transverse section.

<h5>Format:</h5>
zahnstange(modul, laenge, hoehe, breite, eingriffswinkel=20, schraegungswinkel=0)

<h5>Parameters:</h5>
modul = gear module = height of the tooth above the pitch line/pitch circle = 25.4 / diametrical pitch = circular pitch / π
laenge_stange = length of the rack
zahnzahl_ritzel = number of teeth on the pinion
hoehe_stange = height from bottom to the pitch line
bohrung_ritzel = central bore diameter of the pinion
breite = face width
eingriffswinkel = pressure angle, standard value = 20° according to DIN 867
schraegungswinkel = bevel angle perpendicular to the rack's length resp. helix angle to the rotation axis on the pinion; 0° = straight teeth
zusammen_gebaut = assembled (true) or disassembled for printing (false)

+++
+++

<h4>Parametrisches Hohlrad mit Evolventenverzahnung</h4>

Erzeugt ein Hohlrad mit Evolventenverzahnung ohne Profilverschiebung nach DIN 3993. Schrägverzahnte Räder laufen ruhiger als geradverzahnte Räder. Sie erzeugen jedoch eine belastende Axialkraft, die durch die Achslager ausgeglichen werden muss. Empfehlungen für Schrägungswinkel abhängig vom Modul findet man in DIN 3978.

Das Skript passt den Eingriffswinkel im Stirnschnitt an den Schrägungswinkel an, d.h. 20° Eingriffswinkel werden zu 21,17° im Stirnschnitt bei 20° Schrägungswinkel.

<h5>Format:</h5>
hohlrad(modul, zahnzahl, breite, randbreite, eingriffswinkel=20, schraegungswinkel=0)

<h5>Parameter:</h5>
modul = Höhe des Zahnkopfes über dem Teilkreis
zahnzahl = Anzahl der Radzähne
breite = Breite der Zähne
randbreite = Breite des Randes ab Fußkreis
bohrung = Durchmesser der Mittelbohrung
eingriffswinkel = Eingriffswinkel, Standardwert = 20° gemäß DIN 867
schraegungswinkel = Schrägungswinkel, Standardwert = 0° (Geradverzahnung)

+++

<h4>Parametric Involute Ring Gear</h4>

Creates a herringbone ring gear without profile displacement. Helical gears run more smoothly than gears with straight teeth. However, they also create axial loads which the bearings must be designed to contain. Recommendations for the helix angle depending on the module can be found in DIN 3978.

This script adjusts the pressure angle in the transverse section to the helix angle: e.g. with a 20° helix angle, a pressure angle of 20° becomes a pressure angle of 21.17° in the transverse section.

<h5>Format:</h5>
hohlrad(modul, zahnzahl, breite, randbreite, eingriffswinkel=20, schraegungswinkel=0)

<h5>Parameters:</h5>
modul = gear module = height of the tooth above the pitch circle = 25.4 / diametrical pitch = circular pitch / π
zahnzahl = number of teeth
breite = face width
randbreite = width of the rim around the ring gear, measured from the root circle
bohrung = central bore diameter
eingriffswinkel = pressure angle, standard value = 20° according to DIN 867
schraegungswinkel = helix angle to the rotation axis; 0° = straight teeth

+++
+++

<h4>Parametrisches Pfeil-Hohlrad mit Evolventenverzahnung</h4>

Erzeugt ein Pfeil-Hohlrad mit Evolventenverzahnung ohne Profilverschiebung nach DIN 3993. Hohl- und Strinrad kämmen, wenn sie das gleiche Modul und entgegen gesetzten Schrägungswinkel aufweisen. Pfeilverzahnte Räder laufen ruhiger als geradverzahnte Räder. Sie erzeugen, anders als schrägverzahnte Räder, keine belastende Axialkraft, die durch die Achslager ausgeglichen werden müsste.

Der Schrägungswinkel sollte zwischen zwischen 30° und 45° liegen. Empfehlungen für Schrägungswinkel abhängig vom Modul findet man in DIN 3978.  Das Skript passt den Eingriffswinkel im Stirnschnitt an den Schrägungswinkel an, d.h. 20° Eingriffswinkel werden zu 22,80° im Stirnschnitt bei 30° Schrägungswinkel.

<h5>Format:</h5>
pfeilhohlrad(modul, zahnzahl, breite, randbreite, eingriffswinkel=20, schraegungswinkel=0)

<h5>Parameter:</h5>
modul = Höhe des Zahnkopfes über dem Teilkreis
zahnzahl = Anzahl der Radzähne
breite = Face width
randbreite = Breite des Randes ab Fußkreis
bohrung = Durchmesser der Mittelbohrung
eingriffswinkel = Eingriffswinkel, Standardwert = 20° gemäß DIN 867
schraegungswinkel = Schrägungswinkel, Standardwert = 0° (Geradverzahnung)

+++

<h4>Parametric Herringbone Involute Ring Gear</h4>

Creates a herringbone ring gear without profile displacement. A ring and spur gear mesh if they have the same module and opposite helix angels. Herringbone gears run more smoothly than gear with straight teeth. They also do not create axial load like helical gears do.

A helix angle, if used, should be set between between 30° and 45°. Recommendations for the helix angle depending on the module can be found in DIN 3978. This script adjusts the pressure angle in the transverse section to the helix angle: e.g. with a 30° helix angle, a pressure angle of 20° becomes a pressure angle of 22.80° in the transverse section.

<h5>Format:</h5>
pfeilhohlrad(modul, zahnzahl, breite, randbreite, eingriffswinkel=20, schraegungswinkel=0)

<h5>Parameters:</h5>
modul = gear module = height of the tooth above the pitch circle = 25.4 / diametrical pitch = circular pitch / π
zahnzahl = number of teeth
breite = face width
randbreite = width of the rim around the ring gear, measured from the root circle
bohrung = central bore diameter
eingriffswinkel = pressure angle, standard value = 20° according to DIN 867
schraegungswinkel = helix angle to the rotation axis; 0° = straight teeth

+++
+++

<h3>Parametrisches Planetengetriebe mit Evolventen-Pfeilverzahnung</h3>

Dieses Skript berechnet sowohl das Hohlrad als auch, wenn gewünscht, die Anzahl und Geometrie der Planetenräder aus den Zahnzahlen für Sonne und Planeten. Bei Modul <i>m</i> und Zahnzahlen von Sonne <i>z<sub>s</sub></i> und Planeten <i>z<sub>p</sub></i> beträgt der Abstand der Achsen
<sup>m</sub></sup>/<sub>2</sub>·(z<sub>s</sub> + z<sub>p</sub>)

Wenn <i>m</i> das Modul ist, <i>z<sub>s</sub></i> Zahnzahl der Sonne, <i>z<sub>p</sub></i> Zahnzahl der Planeten und <i>b<sub>r</sub></i> die Randbreite, dann beträgt der Außendurchmesser m·(z<sub>s</sub>+2z<sub>p</sub>+2.333)+2b<sub>r</sub>

Der Schrägungswinkel sollte zwischen zwischen 30° und 45° liegen. Empfehlungen für Schrägungswinkel abhängig vom Modul findet man in DIN 3978.  Das Skript passt den Eingriffswinkel im Stirnschnitt an den Schrägungswinkel an, d.h. 20° Eingriffswinkel werden zu 22,80° im Stirnschnitt bei 30° Schrägungswinkel.

Wenn keine Anzahl von Planetenrädern angegeben wird (anzahl_planeten = 0), versucht das Modul, diese zu berechnen.

Um beim 3D-Druck ein Verkleben der besonders der Planetenräder mit dem Hohlrad zu vermeiden, kann das Getriebe auseinander gebaut gedruckt werden (zusammen gebaut = false). Dabei ist zu beachten, dass eine Pfeilverzahnung den Zusammenbau erschwert. Erfahrungsgemäß ist dies bei 30° noch möglich; sollte es hier jedoch zu Problemen kommen, dann ist ein geringerer Schrägungswinkel zu wählen. Natürlich kann man auch Geradverzahnung wählen (Schraegungswinkel = 0°).

Außerdem kann ein Verkleben durch ein ausreichend großes Spiel vermieden werden; ein ausreichendes Spiel vermeidet auch Probleme beim Kämmen. Das Spiel kann um so kleiner bleiben, je besser die Auflösung des 3D-Druckers ist, sollte erfahrungsgemäß 5% jedoch nicht unterschreiten.

<h5>Format:</h5>
planetengetriebe(modul, zahnzahl_sonne, zahnzahl_planet, breite, randbreite, bohrung, eingriffswinkel=20, schraegungswinkel=0, zusammen_gebaut=true, optimiert=true)

<h5>Parameter:</h5>
spiel = Spiel zwischen Zahnflanken als Bruch der Gesamtbreite (0 = kein Spiel)
modul = Höhe des Zahnkopfes über dem Teilkegel
zahnzahl_sonne = Anzahl der Zähne des Sonnenrads
zahnzahl_planet = Anzahl der Zähne eines Planetenrads
anzahl_planeten = Anzahl der Planetenräder; wenn null, versucht das script die kleinste zahl Räder zu berechnen
breite = Zahnbreite
randbreite = Breite des Randes ab Fußkreis
bohrung = Durchmesser der Mittelbohrung
eingriffswinkel = Eingriffswinkel, Standardwert = 20° gemäß DIN 867
schraegungswinkel = Schrägungswinkel (Geradverzahnung)
zusammen_gebaut = Komponenten zusammengebaut (wahr) für Konstruktion oder auseinander (falsch) zum 3D-Druck
optimiert = wenn wahr, Löcher zur Material-/Gewichtsersparnis bzw. Oberflächenvergößerung erzeugen, wenn Geometrie erlaubt

+++

<h3>Parametric Planetary Gear using Involute Tooth Geometry and Herringbone Shape</h3>

This script calculates both the ring gear as well as, if required, the number and geometry of the planetary gears from the number of teeth on the sun and planets. For a module of <i>m</i>, <i>z<sub>s</sub></i> teeth for the sun and <i>z<sub>p</sub></i> teeth for the planets, the centre distance will be
<sup>m</sub></sup>/<sub>2</sub>·(z<sub>s</sub> + z<sub>p</sub>)

If the number of planets is set to zero (anzahl_planeten = 0) then the module will try and calculate them.

For a module of  <i>m</i>, <i>z<sub>s</sub></i> teeth for the sun, <i>z<sub>p</sub></i> teeth for the planets and a rim width of <i>b<sub>r</sub></i>, the outer diameter is m·(z<sub>s</sub>+2z<sub>p</sub>+2.333)+2b<sub>r</sub>

The helix angle should be between between 30° and 45°. Recommendations for the helix angle depending on the module can be found in DIN 3978. This script adjusts the pressure angle in the transverse section to the helix angle: e.g. with a 30° helix angle, a pressure angle 20° becomes a pressure angle of 22.80° in the transverse section.

If no number of gears is given (anzahl_planeten = 0), then the script will attempt to calculate the least number of planet gears.

To avoid the gears sticking in a 3D print, particularly sticking of the planet gears to the ring gear, the gears can be printed in disassembled layout (zusammen gebaut = false). In that case, please note that herringbone teeth complicate the re-assembly. Experience shows that reassembly is still possible at 30°; however in case of reassembly problems, a lesser helix angle should be selected. Of course, one could always choose straight teeth (Schraegungswinkel = 0).

The gears can also be kept from sticking by a sufficiently large clearance ("Spiel"); a sufficient clearance also avoids meshing problems. Clearance can be left smaller if the 3D printer offers good resolution, however experience shows that it should not be less than 5%.

<h5>Format:</h5>
planetengetriebe(modul, zahnzahl_sonne, zahnzahl_planet, breite, randbreite, bohrung, eingriffswinkel=20, schraegungswinkel=0, zusammen_gebaut=true, optimiert=true)

<h5>Parameters:</h5>
spiel = clearance between teeth as a fraction of their width (0 = no clearance)
modul = gear module = height of the tooth above the pitch circle = 25.4 / diametrical pitch = circular pitch / π
zahnzahl_sonne = number of teeth on the sun gear
zahnzahl_planet = number of teeth per planet gear
anzahl_planeten = number of planet gears; if set to zero, the script will attempt to calculate the least number of planet gears
breite = face width
randbreite = width of the rim around the ring gear, measured from the root circle
bohrung = central bore diameter
eingriffswinkel = pressure angle, standard value = 20° according to DIN 867
schraegungswinkel = helix angle to the rotation axis; 0° = straight teeth
zusammen_gebaut = components assembled for construction (true) or disassembled (false) for 3D printing
optimiert = if true, create holes for material/weight reduction resp. surface increase, if geometry allows

+++
+++

<h4>Parametrisches Kegelrad mit Kugelevolventen-Verzahnung</h4>

Dieses Skript erzeugt ein Kegelrad mit Kugelevolventen-Verzahnung. Zwei Kegelräder kämmen, wenn sie das gleiche Modul und entgegen gesetzten Schrägungswinkel aufweisen. Schrägverzahnte Räder laufen ruhiger als geradverzahnte Räder. Sie erzeugen jedoch eine belastende Axialkraft, die durch die Achslager ausgeglichen werden muss. Empfehlungen für Schrägungswinkel abhängig vom Modul findet man in DIN 3978.

Das Skript passt den Eingriffswinkel im Stirnschnitt an den Schrägungswinkel an, d.h. 20° Eingriffswinkel werden zu 21,17° im Stirnschnitt bei 20° Schrägungswinkel.

<h5>Format:</h5>
kegelrad(modul, zahnzahl,  teilkegelwinkel, zahnbreite, bohrung, eingriffswinkel=20, schraegungswinkel=0)

<h5>Parameters:</h5>
modul = Höhe des Zahnkopfes über dem Teilkegel; Angabe für die Aussenseite des Kegels
zahnzahl = Anzahl der Radzähne
teilkegelwinkel = (Halb)winkel des Kegels, auf dem das jeweils andere Kegelrad abrollt
zahnbreite = Breite der Zähne von der Außenseite in Richtung Kegelspitze
bohrung = Durchmesser der Mittelbohrung
eingriffswinkel = Eingriffswinkel, Standardwert = 20° gemäß DIN 867
schraegungswinkel = Winkel der Zähne zur Mantellinie des Teilkegels, 0° = Geradverzahnung


<h4>Parametric Bevel Gear with Spherical Involute Geometry</h4>

This script creates a bevel gear with spherical involute geometry. Two gears will mesh if their modules are the same and their helix angles opposite. Helical gears run more smoothly than gears with straight teeth. However, they also create axial loads which the bearings must be designed to contain. Recommendations for the helix angle depending on the module can be found in DIN 3978.

This script adjusts the pressure angle in the transverse section to the helix angle: e.g. with a 20° helix angle, a pressure angle of 20° becomes a pressure angle of 21.17° in the transverse section.

<h5>Format:</h5>
kegelrad(modul, zahnzahl,  teilkegelwinkel, zahnbreite, bohrung, eingriffswinkel=20, schraegungswinkel=0)

<h5>Parameters:</h5>
modul = gear module = height of the gear teeth above he pitch cone = 25.4 / diametrical pitch = circular pitch / π
zahnzahl = number of teeth
teilkegelwinkel = reference cone (half-)angle
zahnbreite = width of teth from the rim in direction of the reference cone tip
bohrung = central bore diameter
eingriffswinkel = pressure angle, standard value = 20° according to DIN 867
schraegungswinkel = angle between the teeth and the reference cone envelope line, 0° = straight teeth

+++
+++

<h4>Parametrisches Pfeil-Kegelrad mit Kugelevolventen-Verzahnung</h4>

Dieses Skript erzeugt ein Pfeil-Kegelrad mit Kugelevolventen-Verzahnung. Zwei Kegelräder kämmen, wenn sie das gleiche Modul und entgegen gesetzten Schrägungswinkel aufweisen. Pfeilverzahnte Räder laufen ruhiger als geradverzahnte Räder. Sie erzeugen, anders als schrägverzahnte Räder, keine belastende Axialkraft, die durch die Achslager ausgeglichen werden müsste. Empfehlungen für Schrägungswinkel abhängig vom Modul findet man in DIN 3978.

Das Skript passt den Eingriffswinkel im Stirnschnitt an den Schrägungswinkel an, d.h. 20° Eingriffswinkel werden zu 22,80° im Stirnschnitt bei 30° Schrägungswinkel.

<h5>Format:</h5>
pfeilkegelrad(modul, zahnzahl, teilkegelwinkel, zahnbreite, bohrung, eingriffswinkel=20, schraegungswinkel=0)

<h5>Parameter:</h5>
modul = Höhe des Zahnkopfes über dem Teilkegel; Angabe für die Aussenseite des Kegels
zahnzahl = Anzahl der Radzähne
teilkegelwinkel = (Halb)winkel des Kegels, auf dem das jeweils andere Kegelrad abrollt
zahnbreite = Breite der Zähne von der Außenseite in Richtung Kegelspitze
bohrung = Durchmesser der Mittelbohrung
eingriffswinkel = Eingriffswinkel, Standardwert = 20° gemäß DIN 867
schraegungswinkel = Winkel der Zähne zur Mantellinie des Teilkegels, 0° = Geradverzahnung

+++

<h4>Parametric Herringbone Bevel Gear with Spherical Involute Geometry</h4>

This script creates a herringbone bevel gear with spherical involute teeth geometry. Two gears will mesh if their modules are the same and their helix angles opposite. Herringbone gears run more smoothly than gear with straight teeth. They also do not create axial load like helical gears do. Recommendations for the helix angle depending on the module can be found in DIN 3978.

This script adjusts the pressure angle in the transverse section to the helix angle: e.g. with a 30° helix angle, a pressure angle of 20° becomes a pressure angle of 22.80° in the transverse section.

<h5>Format:</h5>
pfeilkegelrad(modul, zahnzahl, teilkegelwinkel, zahnbreite, bohrung, eingriffswinkel=20, schraegungswinkel=0)

<h5>Parameters:</h5>
modul = gear module = height of the gear teeth above the pitch cone = 25.4 / diametrical pitch = circular pitch / π
zahnzahl = number of teeth
teilkegelwinkel = reference cone (half-)angle
zahnbreite = width of teeth from the rim in direction of the reference cone tip
bohrung = central bore diameter
eingriffswinkel = pressure angle, standard value = 20° according to DIN 867
schraegungswinkel = helix angle between the teeth and the reference cone envelope line, 0° = straight teeth

+++
+++

<h4>Parametrisches Paar von Kegelrädern</h4>

Dieses Skript berechnet ein Paar von Kegelrädern aus dem Modul sowie der Anzahl der Zähne für Rad und Ritzel. Der voreingestellte Winkel von 90° zwischen den Achsen beider Räder kann variiert werden. Es ist möglich, die Geometrie sowohl zusammengesetzt als auch zum Drucken auseinander gelegt zu berechnen.

<h5>Format:</h5>
kegelradpaar(modul, zahnzahl_rad, zahnzahl_ritzel, achsenwinkel=90, zahnbreite, bohrung, eingriffswinkel = 20, schraegungswinkel=0, zusammen_gebaut=true)

<h5>Parameter:</h5>
modul = Höhe des Zahnkopfes über dem Teilkegel; Angabe für die Aussenseite des Kegels
zahnzahl_rad = Anzahl der Radzähne am Rad
zahnzahl_ritzel = Anzahl der Radzähne am Ritzel
achsenwinkel = Winkel zwischen den Achsen von Rad und Ritzel, Standardwert = 90°
zahnbreite = Breite der Zähne von der Außenseite in Richtung Kegelspitze
bohrung_rad = Durchmesser der Mittelbohrung des Rads
bohrung_ritzel = Durchmesser der Mittelbohrungen des Ritzels
eingriffswinkel = Eingriffswinkel, Standardwert = 20° gemäß DIN 867
schraegungswinkel = Winkel der Zähne zur Mantellinie des Teilkegels, 0° = Geradverzahnung
zusammen_gebaut = Zusammen gebaut (wahr) oder zum Drucken getrennt (falsch)

+++

<h4>Parametric Pair of Bevel Gears</h4>

This script calculates both the gear and the pinion of a bevel gear pair, using the gears' module and their numbers of teeth. The preset angle of 90° between the axes of both gears can be varied. It is possible to calculate the pair both assembled for design as well as disassembled for printing.

<h5>Format:</h5>
kegelradpaar(modul, zahnzahl_rad, zahnzahl_ritzel, achsenwinkel=90, zahnbreite, bohrung, eingriffswinkel = 20, schraegungswinkel=0, zusammen_gebaut=true)

<h5>Parameters:</h5>
modul = gear module = height of the gear teeth above the pitch cone = 25.4 / diametrical pitch = circular pitch / π
zahnzahl_rad = number of teeth on the gear
zahnzahl_ritzel = number of teeth on the pinion
achsenwinkel = angle between the axes of pinion and gear, standard value = 90°
zahnbreite = width of the teeth from the rim in direction of the cone tip
bohrung_rad = central bore diameter of the gear
bohrung_ritzel = central bore diameter of the pinion
eingriffswinkel = pressure angle, standard value = 20° according to DIN 867
schraegungswinkel = helix angle between the teeth and the reference cone envelope line, 0° = straight teeth
zusammen_gebaut = assembled (true) oder disassembled for printing (false)

+++
+++

<h4>Parametrisches Paar von Pfeil-Kegelrädern</h4>

Dieses Skript berechnet ein Paar von Pfeil-Kegelrädern aus dem Modul sowie der Anzahl der Zähne für Rad und Ritzel. Der voreingestellte Winkel von 90° zwischen den Achsen beider Räder kann variiert werden. Es ist möglich, die Geometrie sowohl zusammengesetzt als auch zum Drucken auseinander gelegt zu berechnen.

<h5>Format:</h5>
pfeilkegelradpaar(modul, zahnzahl_rad, zahnzsahl_ritzel, achsenwinkel=90, zahnbreite, bohrung, eingriffswinkel = 20, schraegungswinkel=0, zusammen_gebaut=true)

<h5>Parameter:</h5>
modul = Höhe des Zahnkopfes über dem Teilkegel; Angabe für die Aussenseite des Kegels
zahnzahl_rad = Anzahl der Radzähne am Rad
zahnzahl_ritzel = Anzahl der Radzähne am Ritzel
achsenwinkel = Winkel zwischen den Achsen von Rad und Ritzel, Standardwert = 90°
zahnbreite = Breite der Zähne von der Außenseite in Richtung Kegelspitze
bohrung_rad = Durchmesser der Mittelbohrung des Rads
bohrung_ritzel = Durchmesser der Mittelbohrungen des Ritzels
eingriffswinkel = Eingriffswinkel, Standardwert = 20° gemäß DIN 867
schraegungswinkel = Winkel der Zähne zur Mantellinie des Teilkegels, 0° = Geradverzahnung
zusammen_gebaut = Zusammen gebaut (wahr) oder zum Drucken getrennt (falsch)

+++

<h4>Parametric Pair of Herringbone Bevel Gears</h4>

This script calculates both the gear and the pinion of a herringbone bevel gear pair, using the gears' module and their numbers of teeth. The preset angle of 90° between the axes of both gears can be varied. It is possible to calculate the pair both assembled for design as well as disassembled for printing.

<h5>Format:</h5>
pfeilkegelradpaar(modul, zahnzahl_rad, zahnzsahl_ritzel, achsenwinkel=90, zahnbreite, bohrung, eingriffswinkel = 20, schraegungswinkel=0, zusammen_gebaut=true)

<h5>Parameters:</h5>
modul = gear module = height of the gear teeth above the pitch cone = 25.4 / diametrical pitch = circular pitch / π
zahnzahl_rad = number of teeth on the gear
zahnzahl_ritzel = number of teeth on the pinion
achsenwinkel = angle between the axes of pinion and gear, standard value = 90°
zahnbreite = width of the teeth from the rim in direction of the cone tip
bohrung_rad = central bore diameter of the gear
bohrung_ritzel = central bore diameter of the pinion
eingriffswinkel = pressure angle, standard value = 20° according to DIN 867
schraegungswinkel = helix angle between the teeth and the reference cone envelope line, 0° = straight teeth
zusammen_gebaut = assembled (true) or disassembled for printing (false)

+++
+++

<h4>Parametrische Schnecke</h4>

Erzeugt eine zylindrische Schnecke (archimedische Spirale) nach DIN 3975. 

Der Radius r des Wälzkreises der Schnecke bei gegebenem Modul m, Gangzahl z und Steigungswinkel γ ist

r = m·z·<sup>1</sup>/<sub>2sinγ</sub> 

<h5>Format:</h5>
schnecke(modul, gangzahl, laenge, bohrung, eingriffswinkel=20, steigungswinkel=10, zusammen_gebaut=true)

<h5>Parameter:</h5>
modul = Höhe des Schneckenkopfes über dem Teilzylinder
gangzahl = Anzahl der Gänge (Zähne) der Schnecke
laenge = Länge der Schnecke
bohrung = Durchmesser der Mittelbohrung
eingriffswinkel = Eingriffswinkel, Standardwert = 20° gemäß DIN 867. Sollte nicht größer als 45° sein.
steigungswinkel = Steigungswinkel der Schnecke, entspricht 90°minus Schrägungswinkel. Positiver Steigungswinkel = rechtsdrehend.
zusammen_gebaut = Komponenten zusammengebaut (wahr) für Konstruktion oder auseinander (falsch) zum 3D-Druck

+++

<h4>Parametric Worm</h4>

Creates a cylidrical worm (archimedean spiral) following DIN 3975.

The worm's pitch circle r can be calculated out of its module m, number of threads z and lead angle γ:

r = m·z·<sup>1</sup>/<sub>2sinγ</sub> 

<h5>Format:</h5>
schnecke(modul, gangzahl, laenge, bohrung, eingriffswinkel=20, steigungswinkel=10, zusammen_gebaut=true)

<h5>Parameters:</h5>
modul = height of the thread above the pitch circle
gangzahl = number of threads
laenge = length of the worm
bohrung = central bore diameter
eingriffswinkel = pressure angle, standard value = 20° according to DIN 867
steigungswinkel = lead angle of worm. Positive lead angle = clockwise thread rotation
zusammen_gebaut = assembled (true) or disassembled for printing (false)


+++
+++


<h4> Schneckenradsatz (Schnecke und Stirnrad)</h4>

Berechnet einen Schneckenradsatz. Das Schneckenrad ist ein gewöhnliches Stirnrad ohne Globoidgeometrie.

<h5>Format:</h5>
module schneckenradsatz(modul, zahnzahl, gangzahl, breite, laenge, bohrung_schnecke, bohrung_rad, eingriffswinkel=20, steigungswinkel, optimiert=true, zusammen_gebaut=true)

<h5>Parameter:</h5>

modul = Höhe des Schneckenkopfes über dem Teilzylinder bzw. des Zahnkopfes über dem Teilkreis
zahnzahl = Anzahl der Radzähne
gangzahl = Anzahl der Gänge (Zähne) der Schnecke
breite = Zahnbreite
laenge = Länge der Schnecke
bohrung_schnecke = Durchmesser der Mittelbohrung der Schnecke
bohrung_rad = Durchmesser der Mittelbohrung des Stirnrads
eingriffswinkel = Eingriffswinkel, Standardwert = 20° gemäß DIN 867. Sollte nicht größer als 45° sein.
steigungswinkel = Steigungswinkel der Schnecke, entspricht 90°-Schrägungswinkel. Positiver Steigungswinkel = rechtsdrehend.
optimiert = wenn wahr, Löcher zur Material-/Gewichtsersparnis
zusammen_gebaut =  Komponenten zusammengebaut für Konstruktion (wahr) oder auseinander (falsch) zum 3D-Druck

+++

<h4> Worm Gear Set  (Worm and Pinion)</h4>

Creates a set of one worm gear and a pinion. The pinion is a normal spur gear without globoid geometry.

<h5>Format:</h5>
module schneckenradsatz(modul, zahnzahl, gangzahl, breite, laenge, bohrung_schnecke, bohrung_rad, eingriffswinkel=20, steigungswinkel, optimiert=true, zusammen_gebaut=true)

<h5>Parameter:</h5>

modul = gear module = and height of the gear teeth above th pitch circle / of the thread above the pitch circle
zahnzahl = number of teeth on the pinion
gangzahl = number of threads
breite = face width on the pinion
laenge = length of the worm
bohrung_schnecke = central bore diameter of the worm
bohrung_rad = central bore diameter of the pinion
eingriffswinkel = pressure angle, standard value = 20° according to DIN 867. Shouldn't be greater than 45°
steigungswinkel = lead angle of worm. Positive lead angle = clockwise thread rotation
optimiert = if true, create holes for material/weight reduction resp. surface increase, if geometry allows
zusammen_gebaut =  assembled (true) or disassembled for printing (false)


# Custom Section

![Alt text](https://cdn.thingiverse.com/assets/a4/65/f1/29/67/Planetengetriebe.gif)

![Alt text](https://cdn.thingiverse.com/assets/47/69/5d/cf/11/Zahnstange_und_ritzel1.gif)

![Alt text](https://cdn.thingiverse.com/assets/63/c6/6f/e0/56/Kegelradpaar.gif)

![Alt text](https://cdn.thingiverse.com/assets/30/56/17/81/11/Rad_und_schnecke.gif)