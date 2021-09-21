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
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Phone</th>
                <th scope="col">Staffs</th>
                <th scope="col">Date</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
        <%  set conn=Server.CreateObject("ADODB.Connection")
        conn.Provider="Microsoft.Jet.OLEDB.4.0"
        conn.Open "C:\inetpub\wwwroot\Restaurant\restaurant.mdb"
        set rs=Server.CreateObject("ADODB.recordset")

        ' Form Data 
        RName = Request.Form("RName")
        RStaff = Request.Form("members")
        SDate = Request.Form("Sdate")
        EDate = Request.Form("Edate")

        ' Search Data 
        Search = ""
        ' -------Date-----------
        if SDate <> "" AND EDate <> "" then
          Search = Search & "rDate between #"& SDate &"#  and  #"& EDate &"#"

        elseif SDate <> "" AND EDate = "" then    
          Search = Search & "rDate >=  #"& SDate &"#  "

        elseif SDate = "" AND EDate <> "" then 
          Search = Search & "rDate <= #"& EDate &"#"
        end if

        ' --------Name-----------
        if RName <> "" then
          if Search <> "" Then
            Search = Search &  " and "
          End If
          Search = Search & " Instr( rName, '" & RName & "')"
        end if       

        ' ---------Staffs--------
        if RStaff <> "" then
          if Search <> "" Then
            Search = Search &  " and "
          End If
          Search = Search & " rStaff='"& RStaff &"'"
        end if 

        if Search <> "" Then
          Search = " where " & Search
        End If
        rs.open "Select id, rName, rEmail, rPhone, rStaff, rDate from restaurant "&Search&" ", conn
        ' sql = "Select id, rName, rEmail, rPhone, rStaff, rDate from restaurant "&Search&" "
        ' Response.Write sql
        ' Response.end()
        %>

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
          <%Next
          End If
          rs.close
          conn.close%>
        
      </tbody>
    </table>
  </div>
</body>
</html>