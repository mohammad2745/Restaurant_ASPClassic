<%
Session.Abandon()
Response.Cookies("id")=""
Response.Redirect "login.asp"
%>