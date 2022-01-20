<!--#include virtual="\class\c_data_batch.asp"-->
<%
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

  set ObjData = new c_Data
  ObjData.OpenConnection "prjSultan", strErr
  ' Data Insert 
  sql="INSERT INTO registration (fName,lName,email,[password]) "
  sql=sql & " VALUES "
  sql=sql & "('" & Request.Form("FName") & "',"
  sql=sql & "'" & Request.Form("LName") & "',"
  sql=sql & "'" & Request.Form("Email") & "',"
  sql=sql & "'" & Request.Form("Password") & "')"

  ObjData.ExecuteQuery sql, strErr

  if strErr <> "" then
    response.write strErr
  end if
  response.redirect "login.asp"
  ObjData.CloseConnection
%>