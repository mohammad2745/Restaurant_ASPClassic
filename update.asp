<!--#include virtual="\class\c_data_batch.asp"-->
<%
set ObjData = new c_Data
ObjData.OpenConnection "prjSultan",strErr

id = Request.QueryString("id")

sql="UPDATE restaurant SET "
sql=sql & "rName='" & Request.Form("restaurantName") & "',"
sql=sql & "rEmail='" & Request.Form("restaurantEmail") & "',"
sql=sql & "rPhone='" & Request.Form("restaurantPhone") & "',"
sql=sql & "rStaff='" & Request.Form("members") & "',"
sql=sql & "rDescription='" & Request.Form("description") & "',"
sql=sql & "rDate='" & Request.Form("date") & "'"
sql=sql & " WHERE ID=" & id & ""

ObjData.BeginTransaction strErr 
    ObjData.ExecuteQuery sql,strErr

menus = Split(Request.Form("menu"),", ")


sql1="DELETE * FROM menu"
sql1=sql1 & " WHERE ResID=" & id & ""

    ObjData.ExecuteQuery sql1,strErr

for each menu in menus
      sql2="INSERT INTO menu (resMenu,ResID)"
      sql2=sql2 & " VALUES "
      sql2=sql2 & "('" & menu & "',"
      sql2=sql2 &  id & ")"

      ObjData.ExecuteQuery sql2,strErr
    next

If strErr = "" Then
  ObjData.CommitTransaction strErr 
Else 
  ObjData.RollbackTansaction strErr 
End if


'response.end()

if err<>0 then
    response.write("No update permissions!")
else
    Response.Redirect "viewRestaurant.asp"
end if
conn.close
%>
