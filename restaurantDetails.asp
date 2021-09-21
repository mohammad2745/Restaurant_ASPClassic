<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
</head>
<body>
  <div class="container">
    <a class="btn btn-primary" href="welcome.asp" role="button">HOME</a>
    <a class="btn btn-primary" href="viewRestaurant.asp" role="button">View Restaurants</a>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">Name</th>
          <th scope="col">Email</th>
          <th scope="col">Phone</th>
          <th scope="col">Staffs</th>
          <th scope="col">Description</th>
          <th scope="col">Date</th>
        </tr>
      </thead>
      <tbody>
        <tr>
        <%set conn=Server.CreateObject("ADODB.Connection")
        conn.Provider="Microsoft.Jet.OLEDB.4.0"
        conn.Open "C:\inetpub\wwwroot\Restaurant\restaurant.mdb"

        RName = Request.Form("restaurantName")
        REmail =Request.Form("restaurantEmail")
        RPhone = Request.Form("restaurantPhone")
        RMember =Request.Form("members")
        RDate = Request.Form("date")

        Error = ""
        if RName = "" then
          Error = Error & "Name "
        end if

        if REmail = "" then
          Error = Error & " Email"
        end if

        if RPhone = "" then
          Error = Error & " Phone No"
        end if

        if RMember = "" then
          Error = Error & " Member"
        end if

        if RDate = "" then
          Error = Error & " Date"
        end if
        
        if Error <> "" then
          Response.Write "Error: " &TError& "is not valid"
          Response.end()
        end if
      
        sql="INSERT INTO restaurant (rName,rEmail,rPhone,rStaff,rDescription,rDate) "
        sql=sql & " VALUES "
        sql=sql & "('" & Request.Form("restaurantName") & "',"
        sql=sql & "'" & Request.Form("restaurantEmail") & "',"
        sql=sql & "'" & Request.Form("restaurantPhone") & "',"
        sql=sql & "'" & Request.Form("members") & "',"
        sql=sql & "'" & Request.Form("description") & "',"
        sql=sql & "'" & Request.Form("date") & "')"

        'on error resume next
        conn.Execute sql,recaffected

        ' Data Add Menu Table
        set rs=Server.CreateObject("ADODB.recordset")
        rs.Open "SELECT MAX(ID) as id FROM restaurant", conn


        id=rs("ID")
        rs.close

        menu = Split(Request.Form("item"),",")

        for each i in menu
        sql="INSERT INTO menu (resMenu,ResID)"
        sql=sql & " VALUES "
        sql=sql & "('" & i & "',"
        sql=sql & "'" & id & "')"
        on error resume next
        conn.Execute sql,recaffected
        next

        if err<>0 then
        Response.Write("No update permissions!")
        else
        Response.Write("<h3>" & recaffected & " record added</h3>")
        end if
        conn.close
        %>
          <td><%response.write(request.form("restaurantName"))%></td>
          <td><%response.write(request.form("restaurantEmail"))%></td>
          <td><%response.write(request.form("restaurantPhone"))%></td>
          <td><%response.write(request.form("members"))%></td>
          <td><%response.write(request.form("description"))%></td>
          <td><%response.write(request.form("date"))%></td>
        </tr>
      </tbody>
    </table>
  </div>
</body>
</html>