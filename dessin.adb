package body dessin is
	procedure boite(epaisseur, longueur, largeur, longueurQueues, hauteurExt, hauteurInt : Natural ) is
	begin
		demi_boite(10, 10, epaisseur, longueur, largeur, longueurQueues, hauteurExt/2 );
		demi_boite(10,Integer'Max(largeur,hauteurExt/2) + 20, epaisseur, longueur, largeur, longueurQueues, hauteurExt / 2 );
		demi_boite(10, 2*Integer'Max(largeur,hauteurExt/2) + 30, epaisseur, longueur - 2*epaisseur, largeur - 2*epaisseur, longueurQueues, hauteurInt );
	end;
	procedure demi_boite(x,y,epaisseur, longueur, largeur, longueurQueues, hauteur : Natural) is
		margeX : Natural ;
	begin
		margeX := 0 ;
		dessus(x, y, epaisseur, longueur, largeur, longueurQueues);

		margeX := margeX + longueur + 10;
		petite_face(x + margeX, y, epaisseur, largeur, hauteur, longueurQueues);

		margeX := margeX + largeur + 10;
		grande_face(x + margeX, y, epaisseur, longueur, hauteur, longueurQueues);

		margeX := margeX + longueur + 10;
		petite_face(x + margeX, y, epaisseur, largeur, hauteur, longueurQueues);

		margeX := margeX + largeur + 10;
		grande_face(x + margeX, y, epaisseur, longueur, hauteur, longueurQueues);

	end;
	function nombre_queues(distance, epaisseur, longueurQueues : Natural) return Natural is
		 n : Natural ;
	begin
		n := (distance - 2*epaisseur)/longueurQueues ;
		if n mod 2 = 0 then 
			n := n -1 ;
		end if;
		return n ;
	end;
	procedure creneaux(x0, y0 : Float ; longueur, hauteur, nombre : Natural ; bord : Direction ; sens : Orientation) is
	type ptr is access all Float ;
	x,y : aliased Float ;
	l, h : ptr ;
	incL, incH : Integer ;
 	coefSens : array(Orientation) of Integer := (Interieur => 1, Exterieur => -1);
	begin
		x := x0 ;
		y := y0 ;
			if bord = Haut or bord = Bas then
				l := x'access ;
				h := y'access ;
			else 
				l := y'access ;
				h := x'access ;
			end if ;
			if bord = Bas  or bord = Gauche then
				incL := -1 ;
			else
				incL := 1 ;
			end if ;
			if bord = Haut or bord = Gauche then
				incH := 1 ;
			else
				incH := -1 ;
			end if ;
		for i in 1..((nombre + 1))/2 loop
			add_point(x, y) ;
			h.all := h.all + Float(coefSens(sens)*incH*hauteur) ;
			add_point(x, y);
			l.all := l.all + Float(incL*longueur) ;
			add_point(x, y);
			h.all := h.all - Float(coefSens(sens)*incH*hauteur) ;
			add_point(x,y);
			l.all := l.all + Float(incL*longueur) ;
		end loop ;

	end;
	procedure queues(x0, y0 : Float ; longueur, hauteur, nombre : Natural ; bord : Direction) is
	begin
		creneaux(x0,y0, longueur, hauteur, nombre, bord, Exterieur) ;
	end;
	procedure encoches(x0, y0 : Float ; longueur, hauteur, nombre : Natural ; bord : Direction) is
	begin
		creneaux(x0,y0, longueur, hauteur, nombre, bord, Interieur) ;
	end;
	procedure dessus(x,y,epaisseur, longueur, largeur, longueurQueues : Natural) is
		nombreLargeur, nombrelongueur : Natural ; 
		margeLongueur, margeLargeur : Float ;
	begin
		nombreLargeur := nombre_queues(largeur, epaisseur, longueurQueues);
		nombreLongueur := nombre_queues(longueur, epaisseur, longueurQueues);
		
		margeLongueur := Float(longueur - nombreLongueur*longueurQueues)/2.0;
		margeLargeur := Float(largeur - nombreLargeur*longueurQueues) /2.0;

		margeLargeur := margeLargeur + Float(longueurQueues) ;
		if nombreLargeur > 1 then
			nombreLargeur := nombreLargeur -2 ;
		end if ;
		begin_polygon(x,y);
		
		add_point(0.0,0.0);
		encoches(margeLongueur, 0.0, longueurQueues, epaisseur, nombreLongueur, Haut);
		add_point(Float(longueur), 0.0) ;
		encoches(Float(longueur), margeLargeur , longueurQueues, epaisseur, nombreLargeur, Droite); 
		add_point(Float(longueur), Float(largeur));
		encoches(Float(longueur) - margeLongueur, Float(largeur), longueurQueues, epaisseur, nombreLongueur, Bas);
		add_point(0.0, Float(largeur));
		encoches(0.0, Float(largeur) - margeLargeur, longueurQueues, epaisseur, nombreLargeur, Gauche);
		
		end_polygon ;

	end;
	procedure petite_face(x,y, epaisseur, largeur, hauteur, longueurQueues : Natural) is 
		nombreHauteur, nombrelargeur : Natural ; 
		margeLargeur, margeHauteur : Float ;
	begin
		nombreHauteur := nombre_queues(hauteur, epaisseur, longueurQueues);
		nombreLargeur := nombre_queues(largeur, epaisseur, longueurQueues);
		
		margeLargeur := Float(largeur - nombreLargeur*longueurQueues)/2.0;
		margeHauteur := Float(hauteur - nombreHauteur*longueurQueues) /2.0;

		margeLargeur := margeLargeur + Float(longueurQueues) ;
		if nombreLargeur > 1 then
			nombreLargeur := nombreLargeur -2 ;
		end if;
		begin_polygon(x,y);
		add_point(0.0,Float(epaisseur));
		queues(margeLargeur, Float(epaisseur), longueurQueues, epaisseur, nombreLargeur, Haut);
		add_point(Float(largeur), Float(epaisseur)) ;
		encoches(Float(largeur), margeHauteur , longueurQueues, epaisseur, nombreHauteur, Droite); 
		add_point(Float(largeur), Float(hauteur));
		add_point(0.0, Float(hauteur));
		encoches(0.0, Float(hauteur) - margeHauteur, longueurQueues, epaisseur, nombreHauteur, Gauche);
		
		end_polygon ;
	end;

	procedure grande_face(x,y, epaisseur, longueur, hauteur, longueurQueues : Natural) is
		nombreHauteur, nombrelongueur : Natural ; 
		margeLongueur, margeHauteur : Float ;
	begin
		nombreHauteur := nombre_queues(hauteur, epaisseur, longueurQueues);
		nombreLongueur := nombre_queues(longueur, epaisseur, longueurQueues);
		
		margeLongueur := Float(longueur - nombreLongueur*longueurQueues)/2.0;
		margeHauteur := Float(hauteur - nombreHauteur*longueurQueues) /2.0;

		margeLongueur := margeLongueur + Float(longueurQueues) ;
		if nombreLongueur > 1 then
			nombreLongueur := nombreLongueur -2 ;
		end if;

		begin_polygon(x,y);
		add_point(Float(epaisseur),Float(epaisseur));
		queues(margeLongueur, Float(epaisseur), longueurQueues, epaisseur, nombreLongueur, Haut);
		add_point(Float(longueur - epaisseur), Float(epaisseur)) ;
		queues(Float(longueur - epaisseur), margeHauteur , longueurQueues, epaisseur, nombreHauteur, Droite); 
		add_point(Float(longueur - epaisseur), Float(hauteur));
		add_point(Float(epaisseur), Float(hauteur));
		queues(Float(epaisseur), Float(hauteur) - margeHauteur, longueurQueues, epaisseur, nombreHauteur, Gauche);
		end_polygon ;
	end;

end dessin ;
