
package svg is

procedure open(width : Integer, height : Integer)
	--Cr�e l'ent�te svg d'une image de taille witdh x height
	--Requiert witdh et height positifs

procedure close()
	--Ferme la balise svg

procedure lineFromTo(X1, Y1, X2, Y2)
	--dessine une ligne rouge du point (X1,Y1) au point (X2, Y2)
	--Requiert X1, Y1, X2, Y2 > 0 et X1, X2 < width et Y1, Y2 < height

end svg;