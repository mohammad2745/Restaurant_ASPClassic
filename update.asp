<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update</title>
</head>
<body>

    <%
    set conn=Server.CreateObject("ADODB.Connection")
    conn.Provider="Microsoft.Jet.OLEDB.4.0"
    conn.Open "C:\inetpub\wwwroot\Restaurant\restaurant.mdb"

    id = Request.QueryString("id")

    sql="UPDATE restaurant SET "
    sql=sql & "rName='" & Request.Form("restaurantName") & "',"
    sql=sql & "rEmail='" & Request.Form("restaurantEmail") & "',"
    sql=sql & "rPhone='" & Request.Form("restaurantPhone") & "',"
    sql=sql & "rStaff='" & Request.Form("members") & "',"
    sql=sql & "rDescription='" & Request.Form("description") & "',"
    sql=sql & "rDate='" & Request.Form("date") & "'"
    sql=sql & " WHERE ID=" & id & ""
    on error resume next
    conn.Execute sql

    ' Response.Write sql
    ' Response.end
    

    v = Split(Request.Form("menu"),", ")
    

    sql1="DELETE * FROM menu"
    sql1=sql1 & " WHERE ResID=" & id & ""
    on error resume next
    conn.Execute sql1

    for each x in v
        sql2="INSERT INTO menu (resMenu,ResID)"
        sql2=sql2 & " VALUES "
        sql2=sql2 & "('" & x & "',"
        sql2=sql2 & "" & id & ")"
        on error resume next
        conn.Execute sql2
    next

    
    'response.end()
    
    if err<>0 then
        response.write("No update permissions!")
    else
        Response.Redirect "viewRestaurant.asp"
    end if
    conn.close
    %>
   
</body>
</html>