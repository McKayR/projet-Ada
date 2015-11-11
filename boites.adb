
function boites(t : String; epaisseur : Integer; l : String; longueur : Integer; w : String; largeur : Integer; q : String; longueur_queue : Integer; h : String; hauteur_externe : Integer; b : String; hauteur_interne : Integer; f, nom_fichier : String) is
	
begin
	dessine_fond(epaisseur, longueur_queue, longueur, largeur);
	dessine_cote(epaisseur, longueur_queue, longueur, largeur);
end

procedure dessine_cote(t, q, l, w) is
	longueur_usinee : Integer;
	nb_queues_encoches : Integer;
	place_restante : Integer;
	distance_debut_encoches : Float;
begin
	--On enlève l'épaisseur en début et fin de coté'
	longueur_usinee := l-2*t;
	--On défini le nombre d'enchoches/queues à usiner'
	nb_queues_encoches := Float'Floor (longueur_usinee/q);
	
	--On garde un nombre impair de queues/encoches
	if nb_queues_encoches mod 2 = 0 then
		nb_queues_encoches = nb_queues_encoches - 1;
	end if;
	
	--Définition de la place restant après usinage (utile pour centrer les queues/encoches)
	place_restante := l-2*t-n*q;
	distance_debut_encoches := place_restante/2 + t;
	
	--On dessine le début du coté un trait de longueur distance_debut_encoches
	
	--parcours du coté : tant qu'on a pas fait le bon nombre de tailles dans le coté on boncle
	--while nbtaille < nb_queues_encoches loop
		--Appel du packqge svg pour dessiner les queues/encoches :
		--si encoche : descendre de t, avancer de q, monter de t
		--si queues : avancer de q
	--end loop
	
	
	
end