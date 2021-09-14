<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
</head>

<body>
  <div class="container">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
        <form class="d-flex" method="post" action="searchView.asp">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
      </div>
    </nav>

  <!-- View Data -->
  <a class="btn btn-primary" href="welcome.asp" role="button">HOME</a>
  <a class="btn btn-primary" href="viewRestaurant.asp" role="button">View Restaurants</a>

  <table class="table">
    <thead>
      <tr>
        <th scope="col">Restaurant ID</th>
        <th scope="col">Name</th>
        <th scope="col">Email</th>
        <th scope="col">Phone</th>
        <th scope="col">Staffs</th>
        <th scope="col">Description</th>
        <th scope="col">Date</th>
      </tr>
    </thead>
    <tbody>
    <%set conn=Server.CreateObject("ADODB.Connection")
    conn.Provider="Microsoft.Jet.OLEDB.4.0"
    conn.Open "C:\inetpub\wwwroot\Restaurant\restaurant.mdb"

    RName = Request.Form("RName")

    set rs=Server.CreateObject("ADODB.recordset")
    rs.Open "Select * from restaurant where rName like '%'+RName", conn

    RName = rs("rName") 
    '   Response.Write RName
    '   Response.end()
    %>

    <%do until rs.EOF%>

      <tr>
          <form method="post" action="restaurant_update.asp">
          <%for each x in rs.Fields
          if lcase(x.name)="id" then%>
          <td>
            <input type="submit" name="ID" value="<%=x.value%>">
          </td>
          <%else%>
          <td>
            <%Response.Write(x.value)%>
          </td>
          <%end if
          next
          %>
        </form>
        <%rs.MoveNext%>
      </tr>

    <%loop
    rs.close
    conn.close%>

    </tbody>
  </table>

  </div>
</body>
</html>