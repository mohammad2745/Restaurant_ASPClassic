<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete</title>
</head>
<body>
    <%
    set conn=Server.CreateObject("ADODB.Connection")
    conn.Provider="Microsoft.Jet.OLEDB.4.0"
    conn.Open "C:\inetpub\wwwroot\Restaurant\restaurant.mdb"

    id = Request.QueryString("id")

    sql="DELETE FROM restaurant"
    sql=sql & " WHERE ID=" & id & ""

    'response.write sql
    'response.end()
    on error resume next
    conn.Execute sql

    sql1="DELETE FROM menu"
    sql1=sql1 & " WHERE ResID=" & id & ""
    on error resume next
    conn.Execute sql1

    if err<>0 then
        response.write("No update permissions!")
    else
        Response.Redirect "viewRestaurant.asp"
    end if
    conn.close
    %>
</body>
</html>