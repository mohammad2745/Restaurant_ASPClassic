<!-- View Data -->
<%
set conn=Server.CreateObject("ADODB.Connection")
conn.Provider="Microsoft.Jet.OLEDB.4.0"
conn.Open "C:\inetpub\wwwroot\Restaurant\restaurant.mdb"

set rs=Server.CreateObject("ADODB.recordset")
rs.Open "Select * from restaurant", conn

countfields = SELECT rName, rMenu FROM restaurant WHERE id=(SELECT max(id) FROM restaurant)
%>

<%
response.write(countfields)
%>

<%
rs.close
conn.close
%>