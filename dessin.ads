with svg ; use svg ;

package dessin is
	procedure boite(epaisseur, longueur, largeur, longueurQueues, hauteurExt, hauteurInt : Natural ) ;
	procedure demi_boite(x,y,epaisseur, longueur, largeur, longueurQueues, hauteur : Natural) ;
	procedure dessus(x,y,epaisseur, longueur, largeur, longueurQueues : Natural) ;
	procedure petite_face(x,y, epaisseur, largeur, hauteur : Natural) ;
	procedure grande_face(x,y, epaisseur, longueur, hauteur : Natural) ;
	--procedure bord(n) -- a declarer si besoin
	
end dessin ;
