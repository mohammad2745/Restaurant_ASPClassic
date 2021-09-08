<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
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
            <%
            set conn=Server.CreateObject("ADODB.Connection")
            conn.Provider="Microsoft.Jet.OLEDB.4.0"
            conn.Open "C:\inetpub\wwwroot\Restaurant\restaurant.mdb"

            RName = Request.Form("RName")
            RStaff = Request.Form("members")
            SDate = Request.Form("Sdate")
            EDate = Request.Form("Edate")

            ' RangeValue = "Select * from restaurant where rDate between  #"& SDate &"#  and  #"& EDate &"# "
            ' Response.Write RangeValue
            ' Response.end()

            set rs=Server.CreateObject("ADODB.recordset")
            ' rs.Open "Select rName from restaurant where rName Like '*" & RName & "*'", conn
            ' rs.Open "Select * from restaurant where rStaff='" & RStaff & "'", conn
            ' rs.Open "Select * from restaurant where rDate between '" #SDate# "' and '" #SDate# "'", conn
            rs.Open "Select * from restaurant where rDate between  #"& SDate &"#  and  #"& EDate &"#", conn
            ' rs.Open "Select * from restaurant where rDate between '"& (cast(SDate as date)as StringToDate)  &"' and '"& (cast(EDate as date)as StringToDate) &"'", conn
            ' %'+RStaff+'%'
            ' RName = rs("rName") 
            ' Response.Write RName
            ' Response.end()
            %>

            <%do until rs.EOF%>

              <tr>
                <form method="post" action="restaurant_update.asp">
                <%
                for each x in rs.Fields
                  if lcase(x.name)="id" then%>
                    <td>
                    <input type="submit" name="ID" value="<%=x.value%>">
                    </td>
                  <%else%>
                    <td><%Response.Write(x.value)%></td>
                  <%end if
                next
                %>
                </form>
                <%rs.MoveNext%>
              </tr>
              
              <%loop
              rs.close
              conn.close
              %>

            </tbody>
          </table>
          
        </div>
    </body>
</html>