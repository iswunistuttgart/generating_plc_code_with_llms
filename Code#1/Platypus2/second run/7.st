// 118.18997240066528s
// 1

/*
 * Programm zur Berechnung der Gesamtlast und des Durchschnittswertes einer Krananlage
 *
 * Die Krananlage verf�gt �ber f�nf Lastempf�nger, die jeweils �ber einen analogen Eingang mit Werten von 0 bis 32767 angeschlossen sind. Um die Gesamtlast und den Durchschnittswert zu bestimmen, m�ssen zun�chst die einzelnen Lasten addiert und durch die Anzahl der Lastempf�nger geteilt werden. L�sung des Aufgabenst�cks mit FOR-Schleife.
 *
 * @author
 */

/*
 * Variablendeklaration und Programmcode enthalten bisher feste numerische Werte. Ziel dieses Aufgabenst�cks ist es, so viele feste numerische Werte aus der Deklaration und dem Programmcode durch Konstanten zu ersetzen.
 */

#define LAST_MAX 32767
#define LAST_MIN 0
#define NUMBER_OF_LOADS 5

/*
 * Variablendeklaration
 */
int load[NUMBER_OF_LOADS];
int total_load;
float average_value;

/*
 * Programmcode
 */
FOR i := 1 TO NUMBER_OF_LOADS DO
    load[i] = INPUT(i);
ENDFOR
total_load = SUM(load);
average_value = total_load / NUMBER_OF_LOADS;
