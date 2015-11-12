with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO ; use Ada.Text_IO ;
with svg ; use svg ;
procedure boites is
	epaisseur, longueur, largeur, longueurQueues, hauteurExt, hauteurInt : Natural;
	nomFichier : StrB.Bounded_String ; 

	procedure dessine_cote(t, q, l, w : Natural) is -- il va falloir faire un package, ce serait l'idéal
		longueur_usinee : Integer;
		nb_queues_encoches : Integer;
		place_restante : Integer;
		distance_debut_encoches : Float;
	begin
		--On enlève l'épaisseur en début et fin de coté'
		longueur_usinee := l-2*t;
		--On défini le nombre d'enchoches/queues à usiner'
		--nb_queues_encoches := Float'Floor (longueur_usinee/q);

		--On garde un nombre impair de queues/encoches
		if nb_queues_encoches mod 2 = 0 then
			nb_queues_encoches := nb_queues_encoches - 1;
		end if;

		--Définition de la place restant après usinage (utile pour centrer les queues/encoches)
		--place_restante := l-2*t-n*q;
		--distance_debut_encoches := place_restante/2 + t;

		--On dessine le début du coté un trait de longueur distance_debut_encoches

		--parcours du coté : tant qu'on a pas fait le bon nombre de tailles dans le coté on boncle
		--while nbtaille < nb_queues_encoches loop
		--Appel du packqge svg pour dessiner les queues/encoches :
		--si encoche : descendre de t, avancer de q, monter de t
		--si queues : avancer de q
		--end loop
	end;
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
		open_file(nomFichier);
		svg.start(640, 480);
		--dessiner ici
		svg.stop;
		close_file ;
		--dessine_fond(epaisseur, longueur_queue, longueur, largeur);
		--dessine_cote(epaisseur, longueur_queue, longueur, largeur);
	end if ;
end ;

