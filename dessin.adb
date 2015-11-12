package body dessin is
	procedure boite(epaisseur, longueur, largeur, longueurQueues, hauteurExt, hauteurInt : Natural ) is
	begin
		demi_boite(0, 0, epaisseur, longueur, largeur, longueurQueues, hauteurExt/2 );
		demi_boite(0, Integer'Max(Integer'Max(longueur, largeur),hauteurExt/2) + 10, epaisseur, longueur, largeur, longueurQueues, hauteurExt / 2 );
		demi_boite(0, 2*(Integer'Max(Integer'Max(longueur, largeur),hauteurExt/2) + 10), epaisseur, longueur, largeur, longueurQueues, hauteurInt );
	end;
	procedure demi_boite(x,y,epaisseur, longueur, largeur, longueurQueues, hauteur : Natural) is
		margeX : Natural ;
	begin
		margeX := 0 ;
		dessus(x, y, epaisseur, longueur, largeur, longueurQueues);

		margeX := margeX + Integer'Max(longueur, largeur);
		petite_face(x + margeX, y, epaisseur, largeur, hauteur);

		margeX := margeX + Integer'Max(largeur, hauteur);
		grande_face(x + margeX, y, epaisseur, longueur, hauteur);

		margeX := margeX + Integer'Max(longueur, hauteur);
		petite_face(x + margeX, y, epaisseur, largeur, hauteur);

		margeX := margeX + Integer'Max(largeur, hauteur);
		grande_face(x + margeX, y, epaisseur, longueur, hauteur);

	end;

	procedure dessus(x,y,epaisseur, longueur, largeur, longueurQueues : Natural) is
		nombreLargeur, nombrelongueur : Natural ; 
		margeLongueur, margeLargeur, posX, posY : Float ;
	begin
		nombreLargeur := (largeur - 2*epaisseur)/longueurQueues ;
		if nombreLargeur mod 2 = 0 then 
			nombreLargeur := nombreLargeur -1 ;
		end if;
		nombreLongueur := (longueur - 2*epaisseur)/longueurQueues ;
		if nombreLongueur mod 2 = 0 then 
			nombreLongueur := nombreLongueur -1 ;
		end if;
		
		margeLongueur := Float(longueur - nombreLongueur*longueurQueues)/2.0;
		margeLargeur := Float(largeur - nombreLargeur*longueurQueues) /2.0;

		begin_polygon(x,y);
		
		add_point(0.0,0.0);
		add_point(margeLongueur,0.0);

		posX := margeLongueur ;
		posY := Float(epaisseur) ;
		
		for i in 1..nombreLongueur loop
			add_point(posX, posY) ;
			posX := posX + Float(longueurQueues) ;
			add_point(posX, posY);
			if i mod 2 = 0 then
				posY := Float(epaisseur) ;
			else
				posY := 0.0 ;
			end if;
		end loop ;

		add_point(posX, posY);
		posX := Float(longueur) ;
		posY := 0.0;
		add_point(posX, posY);
		posY := posY + margeLargeur ;

		for i in 1..nombreLargeur loop
			add_point(posX, posY) ;
			posY := posY + Float(longueurQueues) ;
			add_point(posX, posY);
			if i mod 2 = 0 then
				posX := Float(longueur) ;
			else
				posX :=  Float(longueur - epaisseur);
			end if;
		end loop ;

		posY := Float(largeur) ;
		posX := Float(longueur) ;
		add_point(posX, posY) ;
		posX := posX - margeLongueur ;
		add_point(posX, posY);
		posY := Float(largeur - epaisseur) ;

		for i in 1..nombreLongueur loop
			add_point(posX, posY) ;
			posX := posX - Float(longueurQueues) ;
			add_point(posX, posY);
			if i mod 2 = 0 then
				posY := Float(largeur - epaisseur) ;
			else
				posY := Float(largeur) ;
			end if;
		end loop ;

		add_point(posX, posY);
		posX := 0.0 ;
		add_point(posX, posY) ;
		posY := posY - margeLargeur ;

		for i in 1..nombreLargeur loop
			add_point(posX, posY) ;
			posY := posY - Float(longueurQueues) ;
			add_point(posX, posY);
			if i mod 2 = 0 then
				posX := 0.0;
			else
				posX := Float(epaisseur) ;
			end if;
		end loop ;

		end_polygon ;

	end;
	procedure petite_face(x,y, epaisseur, largeur, hauteur : Natural) is 
		-- J'ai collé ton code ici	
		longueur_usinee : Integer;
		nb_queues_encoches : Integer;
		place_restante : Integer;
		distance_debut_encoches : Float;
	begin
		--On enlève l'épaisseur en début et fin de coté'
		--longueur_usinee := l-2*t;
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

	procedure grande_face(x,y, epaisseur, longueur, hauteur : Natural) is
	begin
		begin_polygon(x,y);
		--add_point() ici
		end_polygon;
	end;
end dessin ;
