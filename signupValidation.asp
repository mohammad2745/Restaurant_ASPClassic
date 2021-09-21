<%set conn=Server.CreateObject("ADODB.Connection")
  conn.Provider="Microsoft.Jet.OLEDB.4.0"
  conn.Open "C:\inetpub\wwwroot\Restaurant\restaurant.mdb"

  ' Form Data
  FName = Request.Form("fName")
  LName = Request.Form("lName")
  Email = Request.Form("email")
  Password = Request.Form("password")

  ' Data Validation 
  msg = ""
    if FName="" Then
        msg = msg + "Enter First Name<br>"
    end if

    if LName="" Then
        msg = msg + "Enter Last Name<br>"
    end if

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

  ' Data Insert 
  sql="INSERT INTO registration (fName,lName,email,[password]) "
  sql=sql & " VALUES "
  sql=sql & "('" & Request.Form("FName") & "',"
  sql=sql & "'" & Request.Form("LName") & "',"
  sql=sql & "'" & Request.Form("Email") & "',"
  sql=sql & "'" & Request.Form("Password") & "')"

  ' Response.Write sql
  ' Response.end()

  'on error resume next
  conn.Execute sql,recaffected

  if err<>0 then
  Response.Write("No update permissions!")
  else
  response.redirect "login.asp"
  end if
  conn.close
%>