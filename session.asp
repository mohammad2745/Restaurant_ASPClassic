<%
  set ObjData = new c_Data
%>
<%
Session.Timeout=1

if Session("fName")="" then 
  ObjData.OpenConnection "prjSultan", strErr

  id=Request.Cookies("id")
  SQL = "select fName from registration where id=" & id & ""
  rs = ObjData.RetrieveData(SQL, strErr)
  fName = rs(0,0)
  Session("fName")=fName
  ObjData.CloseConnection
end if
%>