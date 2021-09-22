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
    Password = Request.Form("password")

    ' Data Validation 
    msg = ""
    set regEx = New RegExp
    regEx.Pattern = "^[-+.\w]{1,64}@[-.\w]{1,64}\.[-.\w]{2,6}$"
    isValidE = regEx.Test(Email)
    if isValidE="False" Then
        msg = msg + "Enter a valid e-mail address<br>"
    end if

    if Password="" Then
        msg = msg + "Enter Password<br>"
    end if

    if msg<>"" Then 
        response.write(msg)
        response.end
    end if

    set rs=Server.CreateObject("ADODB.recordset")

    ' rs.open "select email,password from registration where email='" & Email& "'", conn
    sql = "select id,fName,email,password from registration where email='" & Email& "'"
    rs.open sql, conn

    if not rs.EOF  then 
      IF rs("password") <> Password then
        response.Write "<h4> PASSWORD IS NOT VALID </h4>"
        response.end()
      else
        Response.Cookies("id")=rs("id")
        Session("fName")=rs("fName")
        response.redirect "viewRestaurant.asp"
      end if
    else
      response.Write "<h4> EMAIL IS NOT VALID </h4>"
      response.end()
    end if
    %>
  </body>
</html>