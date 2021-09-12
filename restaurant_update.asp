<html>
<body>

<h2>Update Record</h2>
<%
set conn=Server.CreateObject("ADODB.Connection")
conn.Provider="Microsoft.Jet.OLEDB.4.0"
conn.Open "C:\inetpub\wwwroot\Restaurant\restaurant.mdb"

cid=Request.Form("ID")

'response.write request.form()
'response.end()

if Request.form("rName")="" then

  set rs=Server.CreateObject("ADODB.Recordset")
  rs.open "SELECT * FROM restaurant WHERE 'ID='" & cid & "",conn
  %>

  <form method="post" action="restaurant_update.asp">
  <table>
  <%for each x in rs.Fields%>
  <tr>
  <td><%=x.name%></td>
  <td><input name="<%=x.name%>" value="<%=x.value%>"></td>
  <%next%>
  </tr>
  </table>
  <br><br>
  <input type="submit" value="Update record">
  <input type="submit" value="Delete record">
  </form>

<%
else
  sql="UPDATE restaurant SET "
  sql=sql & "rName='" & Request.Form("rName") & "',"
  sql=sql & "rEmail='" & Request.Form("rEmail") & "',"
  sql=sql & "rPhone='" & Request.Form("rPhone") & "',"
  sql=sql & "rStaff='" & Request.Form("rStaff") & "',"
  sql=sql & "rMenu='" & Request.Form("rMenu") & "',"
  sql=sql & "rDescription='" & Request.Form("rDescription") & "'"
  sql=sql & " WHERE ID=" & cid & ""

  'response.write sql
  'response.end()

  on error resume next
  conn.Execute sql
  if err<>0 then
    response.write("No update permissions!")
  else
    response.redirect "viewRestaurant.asp"
  end if
end if
conn.close
%>

</body>
</html>