
function boites(t : String; epaisseur : Integer; l : String; longueur : Integer; w : String; largeur : Integer; q : String; longueur_queue : Integer; h : String; hauteur_externe : Integer; b : String; hauteur_interne : Integer; f, nom_fichier : String) is
	
begin
	dessine_fond(epaisseur, longueur_queue, longueur, largeur);
	dessine_cote(epaisseur, longueur_queue, longueur, largeur);
end