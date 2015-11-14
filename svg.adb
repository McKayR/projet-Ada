package body svg is
	fichier : File_type ;
	procedure open_file(nomFichier : StrB.Bounded_String) is
	begin
		create(fichier, Out_File, To_String(nomFichier)) ;
	end;
	procedure close_file is
	begin
		close(fichier);
	end;

	procedure start(width, height : Natural) is
	begin
		Put(fichier,"<svg width=""");
		Put(fichier,height);
		Put(fichier,""" height =""");
		Put(fichier,width);
		Put(fichier,""">");
	end;

	procedure stop is
	begin
		Put(fichier,"</svg>");
	end;

	procedure begin_polygon(x, y : Natural) is
	begin
		xPolygon := x;
		yPolygon := y;
		Put(fichier, "<polygon points=""");
	end;

	procedure end_polygon is
	begin
		Put(fichier, """ style=""stroke:red;stroke-width:0.1"" />");
	end;

	procedure add_point(x, y : Float) is
	begin
		Put(fichier, Float'Image(Float(xPolygon) + x) & "," & Float'Image(Float(yPolygon) + y) & " ");
	end;

end svg;
