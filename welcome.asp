<!DOCTYPE html>
<html>
  <head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
  </head>
  
  <body>
    <%
    set conn=Server.CreateObject("ADODB.Connection")
    conn.Provider="Microsoft.Jet.OLEDB.4.0"
    conn.Open "C:\inetpub\wwwroot\Restaurant\restaurant.mdb"

    ' Form Data 
    Email = Request.Form("email")
    password = Request.Form("password")

    set rs=Server.CreateObject("ADODB.recordset")
    if Email <> "" and password <>"" then
      sql="select email, password from registration where email='" & Email& "' and [password]='" & password & "'"
    else
      Response.write("Fill all data")
    end if

    ' Response.Write sql
    ' Response.end()

    rs.open sql, conn

    if not rs.EOF  then 
    response.redirect "viewRestaurant.asp"
    else
    response.Write "<h4> USER NAME & PASSWORD IS NOT MATCHING </h4>"
    end if
    %>
    <%
    ' <div class="container">
    '     <p>Welcome
    '         
    '         response.write(request.form("fullName"))
    '         
    '     </p>
    '     <a class="btn btn-primary" href="createRestaurant.asp" role="button">Add Restaurant</a>
    '     <a class="btn btn-primary" href="viewRestaurant.asp" role="button">View Restaurants</a>
    ' </div>
    %>
  </body>
</html>