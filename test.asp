<%
Response.Cookies("firstname")=request.form("fname") 'Create a cookies

fName = Request.Cookies("firstname") 'Assign a cookies to variable
Response.Write("First Name: " &fName) 'Show cookies in Web
response.write("<br/>")
%>

 -----------------------------------------
<%
  Response.Cookies("firstname")="Alex"
  Response.Cookies("user")("firstname")="John"
  Response.Cookies("user")("lastname")="Smith"
  Response.Cookies("user")("country")="Norway"
  Response.Cookies("user")("age")="25"
%>

<!DOCTYPE html>
<html>
<body>

<%
dim x,y
for each x in Request.Cookies
  response.write("<p>")
  if Request.Cookies(x).HasKeys then
    for each y in Request.Cookies(x)
      response.write(x & ":" & y & "=" & Request.Cookies(x)(y))
      response.write("<br>")
    next
  else
    Response.Write(x & "=" & Request.Cookies(x) & "<br>")
  end if
  response.write "</p>"
next
%>

</body>
</html>

