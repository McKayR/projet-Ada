with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO ; use Ada.Text_IO ;
with svg ; use svg ;
with dessin ;
procedure boites is
	epaisseur, longueur, largeur, longueurQueues, hauteurExt, hauteurInt : Natural;
	nomFichier : StrB.Bounded_String ; --definit dans svg
begin
	if Argument_Count /= 14 then
		Put("Nombre d'arguments invalide") ;
	else
		for i in 1..(Argument_Count -1) loop -- Pour tous les arguments (a changer aussi)
			if Argument(i)(1) = '-' then -- On regarde si c'est le nom d'un parametre
				case Argument(i)(2) is
					when 't' =>
						epaisseur := Natural'Value(Argument(i+1)) ;
					when 'l' =>
						longueur := Natural'Value(Argument(i+1)) ;
					when 'w' =>
						largeur := Natural'Value(Argument(i+1)) ;
					when 'q' =>
						longueurQueues := Natural'Value(Argument(i+1)) ;
					when 'h' =>
						hauteurExt := Natural'Value(Argument(i+1)) ;
					when 'b' =>
						hauteurInt := Natural'Value(Argument(i+1)) ;
					when 'f' =>
						nomFichier := StrB.To_Bounded_String(Argument(i+1)) ;
					when others =>
						Put("Paramètre inconnu") ;
				end case ;
			end if ;
		end loop ;
		--TODO:ajouter test de hauteur interne
		open_file(nomFichier);
		svg.start(3 * longueur + 2*largeur + 60, 2 * Integer'max(largeur, hauteurExt) + Integer'max(largeur, hauteurInt)+ 40); -- a definir en fonction de la taille de la boite
		dessin.boite(epaisseur, longueur, largeur, longueurQueues, hauteurExt, hauteurInt) ;
		svg.stop;
		close_file ;
	end if ;
end ;

