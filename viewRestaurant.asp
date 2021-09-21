<!DOCTYPE html>
<html>

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body id="formSet">
    <div class="container" id="searchDisplay">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <form id="formID" method="POST" action="searchView.asp">
                    <table>
                        <tr>
                            <td>
                                <label for="exampleInputname" class="form-label">Restaurant Name</label>
                                <input class="form-control me-2" type="search" placeholder="Restaurant Name" name="RName" aria-label="Search">
                            </td>
                            <td>
                                <label for="members">Total Member</label>
                                <select name="members" id="members">
                                    <option value>--</option>
                                    <option value="1-50">1-50</option>
                                    <option value="51-100">51-100</option>
                                    <option value="101-150">101-150</option>
                                    <option value="151-200">151-200</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label for="exampleInputDate" class="form-label">Start Date</label>
                                <input type="date" class="form-control" id="exampleInputDate" name="Sdate">
                            </td>
                            <td>
                                <label for="exampleInputDate" class="form-label">End Date</label>
                                <input type="date" class="form-control" id="exampleInputDate" name="Edate">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <button class="btn btn-outline-success" id="searchButton" type="submit">Search</button>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </nav>

    <!-- View Data -->
    <a class="btn btn-primary" href="welcome.asp" role="button">HOME</a>
    <a class="btn btn-primary" href="viewRestaurant.asp" role="button">View Restaurants</a>
    <table class="table">
        <thead>
            <tr>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Phone</th>
                <th scope="col">Staffs</th>
                <th scope="col">Date</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
          <%set conn=Server.CreateObject("ADODB.Connection")
            conn.Provider="Microsoft.Jet.OLEDB.4.0"
            conn.Open "C:\inetpub\wwwroot\Restaurant\restaurant.mdb"

            set rs1=Server.CreateObject("ADODB.recordset")
            ' rs1.open "select count (ID) as id from restaurant",conn
            ' sql = rs1("id")
            ' rs1.close
            ' Response.Write sql
            ' Response.end()

            set rs=Server.CreateObject("ADODB.recordset")
            rs.Open "Select id, rName, rEmail, rPhone, rStaff, rDate from restaurant", conn %>

            <%
              If Not rs.EOF Then 
                  data = rs.GetRows()
              end if

              Dim row, rows

              If IsArray(data) Then
                rows = UBound(data, 2)
                For row = 0 To rows
                  id = data(0, row)
                
            %>
                <tr style='background: none;' id="<%=(id)%>">
                    <td><%=(data(1, row))%></td>
                    <td><%=(data(2, row))%></td>
                    <td><%=(data(3, row))%></td>
                    <td><%=(data(4, row))%></td>
                    <td><%=(data(5, row))%></td>
                    <td>
                      <a href="edit.asp?id=<%Response.Write(id)%>" class="btn btn-success" >Edit</a>
                      <button id="delete" class="btn btn-danger" onClick=deleteRow(<%Response.Write(id)%>)> Delete</button>
                    </td>
                </tr>
                <%
                    Next
                End If
                rs.close
                conn.close
                %>
            
        </tbody>
    </table>
          
    </div>
</body>

<script>
    // $(document).ready(function(){
    // $('#searchButton').click(function() {
    //     $.ajax({
    //             type: "POST",
    //             url: "searchView.asp",
    //             data:  $("#formID").serialize(),
    //             cache: false,
    //             dataType: "html",
    //             success: function(response){
    //                 $('#searchDisplay').html(response.toString());
    //             },
    //             error: function(resposeText){
    //                 alert("err");
    //             },
    //         });
    //     return false;
    // });
    // });

    function deleteRow(id){
            $.ajax({
                url: "delete.asp?id=" + id,
                success: function(response){
                    $("#formSet").html(response.toString());

                }
            });
        } 
    
</script>

</html>

