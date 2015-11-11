

package body svg is

procedure open(width : Integer, height : Integer) is
begin
	put("<svg width=""");
	put(height);
	put(""" height =""");
	put(width);
	put(""">");
end

procedure close() is
begin
	put("</svg>")
end

procedure lineFromTo(X1, Y1, X2, Y2) is
begin
<line x1="0" y1="0" x2="200" y2="200" style="stroke:rgb(255,0,0);stroke-width:2" />
	put("<line x1=""");
	put(X1);
	put(""" y1="" ");
	put(Y1);
	put(""" x2="" ");
	put(X2);
	put(""" y2="" ");
	put(Y2);
	put(""" style=""stroke:rgb(255,0,0);stroke-width:2""/>");
end;

end svg;