with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO ; use Ada.Text_IO ;
with svg ; use svg ;
with dessin ;
procedure boites is
	epaisseur, longueur, largeur, longueurQueues, hauteurExt, hauteurInt : Natural;
	nomFichier : StrB.Bounded_String ; --definit dans svg
	ARGUMENTS_INVALIDE, NOMBRE_ARGUMENT : Exception ;
begin
	if Argument_Count /= 14 then
		Put("Nombre d'arguments invalide") ;
	else
		--ajouter exceptions pour -parametre inconnu -pas le bon nombre parametre -
		for i in 1..7 loop -- Pour tous les arguments (a changer aussi)
			if Argument(2*i-1)(1) = '-' then -- On regarde si c'est le nom d'un parametre

				case Argument(2*i-1)(2) is
					when 't' =>
						epaisseur := Natural'Value(Argument(2*i)) ;
					when 'l' =>
						longueur := Natural'Value(Argument(2*i)) ;
					when 'w' =>
						largeur := Natural'Value(Argument(2*i)) ;
					when 'q' =>
						longueurQueues := Natural'Value(Argument(2*i)) ;
					when 'h' =>
						hauteurExt := Natural'Value(Argument(2*i)) ;
					when 'b' =>
						hauteurInt := Natural'Value(Argument(2*i)) ;
					when 'f' =>
						nomFichier := StrB.To_Bounded_String(Argument(2*i)) ;
					when others =>
						Put("Paramètre inconnu") ;
				end case ;
			else
				raise ARGUMENTS_INVALIDE ;
			end if ;
		end loop ;
		--veirifer dimensions (hauteur, largeur, longueur > 4*epaisseur)
		open_file(nomFichier);
		svg.start(3 * longueur + 2*largeur + 60, 2 * Integer'max(largeur, hauteurExt) + Integer'max(largeur, hauteurInt)+ 40); 
		dessin.boite(epaisseur, longueur, largeur, longueurQueues, hauteurExt, hauteurInt) ;
		svg.stop;
		close_file ;
	end if ;
end ;

