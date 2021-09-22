<%
Session.Timeout=1

if session("fName")="" then 
  set conn=Server.CreateObject("ADODB.Connection")
  conn.Provider="Microsoft.Jet.OLEDB.4.0"
  conn.Open "C:\inetpub\wwwroot\Restaurant\restaurant.mdb"
  set rs=Server.CreateObject("ADODB.recordset")
  id=request.Cookies("id")
  sql = "select fName from registration where id=" & id & ""
  rs.open sql, conn
  Session("fName")=rs("fName")
  rs.close
  conn.close     
end if
%>