<!DOCTYPE html>
<!--#include virtual="\class\c_data_batch.asp"-->
<html>
  <head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
  </head>
  
  <body>
    <%

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

    set ObjData = new c_Data
    ObjData.OpenConnection "prjSultan", strErr
    SQL = "select id,fName,email,password from registration where email='" & Email& "'"
    rs = ObjData.RetrieveData(SQL, strErr)
      ' Response.Write rs(2,0)
      ' Response.end

    if strErr <> "" then
      response.write strErr
    end if

    if rs(2,0) <> ""  then 
      IF rs(3,0) <> Password then
        response.Write "<h4> PASSWORD IS NOT VALID </h4>"
        response.end()
      else
        Response.Cookies("id")=rs(0,0)
        Session("fName")=rs(1,0)
        response.redirect "welcome.asp"
      end if
    else
      response.Write "<h4> EMAIL IS NOT VALID </h4>"
      response.end()
    end if
    %>
  </body>
</html>