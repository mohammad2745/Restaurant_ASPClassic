<!--#include virtual="\class\c_data_batch.asp"-->
<%
set ObjData = new c_Data
ObjData.OpenConnection "prjSultan",strErr

id = Request.QueryString("id")

sql="DELETE FROM restaurant"
sql=sql & " WHERE ID=" & id & ""
ObjData.BeginTransaction strErr 
  ObjData.ExecuteQuery sql,strErr

sql1="DELETE FROM menu"
sql1=sql1 & " WHERE ResID=" & id & ""
  ObjData.ExecuteQuery sql1,strErr

If strErr = "" Then
  ObjData.CommitTransaction strErr 
Else 
  ObjData.RollbackTansaction strErr 
End if

if err<>0 then
    response.write("No update permissions!")
else
    Response.Redirect "viewRestaurant.asp"
end if
conn.close
%>