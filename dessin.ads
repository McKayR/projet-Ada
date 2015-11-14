with svg ; use svg ;

package dessin is
	type Direction is (Haut, Droite, Bas, Gauche) ;
	type Orientation is (Interieur, Exterieur) ;
	procedure boite(epaisseur, longueur, largeur, longueurQueues, hauteurExt, hauteurInt : Natural ) ;
	procedure demi_boite(x,y,epaisseur, longueur, largeur, longueurQueues, hauteur : Natural) ;
	procedure dessus(x,y,epaisseur, longueur, largeur, longueurQueues : Natural) ;
	procedure petite_face(x,y, epaisseur, largeur, hauteur, longueurQueues : Natural) ;
	procedure grande_face(x,y, epaisseur, longueur, hauteur, longueurQueues : Natural) ;
	function nombre_queues(distance, epaisseur, longueurQueues : Natural) return Natural;
	procedure encoches(x0, y0 : Float ; longueur, hauteur, nombre : Natural ; bord : Direction);
	procedure queues(x0, y0 : Float ; longueur, hauteur, nombre : Natural ; bord : Direction);
	procedure creneaux(x0, y0 : Float ; longueur, hauteur, nombre : Natural ; bord : Direction; sens : Orientation);
	
end dessin ;
