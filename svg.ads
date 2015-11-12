with Ada.Strings.Bounded ; use Ada.strings.Bounded ;
with Ada.Text_IO ; use Ada.Text_IO ;
with Ada.Integer_Text_IO ; use Ada.Integer_Text_IO ;
with Ada.Strings.Unbounded.Text_IO ; use Ada.Strings.Unbounded.Text_IO ;
package svg is
	package StrB is new Ada.strings.Bounded.Generic_Bounded_Length(Max => 256) ; use StrB ;
	procedure open_file(nomFichier : StrB.Bounded_String) ;
	--Ouvre le fichier pour y écrire.
	procedure start(width, height : Natural) ;
	--Crée l'entête svg d'une image de taille witdh x height
	--Requiert witdh et height positifs
	procedure stop ;
	--Ferme la balise svg
	procedure close_file ;
	--Ferme le fichier
	procedure begin_polygon(x, y : Natural) ;
	--Commence a écrire un polygone
	procedure end_polygon ;
	--Finit le polygone
	procedure add_point(x, y : Natural) ;
	--Ajoute un point au polygone courant

end svg;
