<%
    ' server side validation
  RName = Request.Form("restaurantName")
  REmail =Request.Form("restaurantEmail")
  RPhone = Request.Form("restaurantPhone")
  RMember =Request.Form("members")
  RMenu =Request.Form("item")
  ' Response.Write RMenu
  ' Response.end()
  RDescription = Request.Form("description")
  RDate = Request.Form("date")

  msg = ""
  if RName="" Then
      msg = msg + "Enter Name<br>"
  end if

  set regEx = New RegExp
  regEx.Pattern = "^[-+.\w]{1,64}@[-.\w]{1,64}\.[-.\w]{2,6}$"
  isValidE = regEx.Test(REmail)
  if isValidE="False" Then
      msg = msg + "Enter a valid e-mail address<br>"
  end if

  set rgEx = New RegExp
  rgEx.Pattern = "\b[0-9]{11}\b"
  isValidP = rgEx.Test(RPhone)
  if isValidP="False" Then
      msg = msg + "Enter valid phone number<br>"
  end if
  
  if IsDate(RDate)="False" Then
      msg = msg + "Enter valid date<br>"
  end if

  if RMenu ="" Then
      msg = msg + "Enter a menu<br>"
  end if

  if RMember="" Then
      msg = msg + "Select staff number<br>"
  end if

  if RDescription="" Then
      msg = msg + "Description is empty<br>"
  end if

  if msg<>"" Then 
      response.write(msg)
      response.end
  end if
%>

<!--#include virtual="\class\c_data_batch.asp"-->
<%
  set ObjData = new c_Data

  ObjData.OpenConnection "prjSultan",strErr

  if strErr<>"" Then
    Response.Write("Error:" + strErr)
    Response.End
  End if

  ' Restaurant Data Insert 
  sql="INSERT INTO restaurant (rName,rEmail,rPhone,rStaff,rDescription,rDate) "
  sql=sql & " VALUES "
  sql=sql & "('" & RName & "',"
  sql=sql & "'" & REmail & "',"
  sql=sql & "'" & RPhone & "',"
  sql=sql & "'" & RMember & "',"
  sql=sql & "'" & RDescription & "',"
  sql=sql & "'" & RDate & "')"

  ObjData.BeginTransaction strErr 
    ObjData.ExecuteQuery sql,strErr

  ' MAX ID 
  sqlID =  "SELECT MAX(ID) as id FROM restaurant"
  strArr = ObjData.RetrieveData(sqlID,strErr)

  id = strArr(0,0)

  ' Menu Data Insert 
    menus = Split(RMenu,", ")

    for each menu in menus
      sql1="INSERT INTO menu (resMenu,ResID)"
      sql1=sql1 & " VALUES "
      sql1=sql1 & "('" & menu & "',"
      sql1=sql1 &  id & ")"

      ObjData.ExecuteQuery sql1,strErr
    next

  If strErr = "" Then
    ObjData.CommitTransaction strErr 
  Else 
    ObjData.RollbackTansaction strErr 
  End if

  if strErr<>"" Then
    Response.Write("Error:" + strErr)
    Response.End
  End if
  response.redirect "viewRestaurant.asp"

  ObjData.CloseConnection
%>