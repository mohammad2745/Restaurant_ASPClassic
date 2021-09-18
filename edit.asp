<!DOCTYPE html>
<html>
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
</head>

<body>
  <%set conn=Server.CreateObject("ADODB.Connection")
    conn.Provider="Microsoft.Jet.OLEDB.4.0"
    conn.Open "C:\inetpub\wwwroot\Restaurant\restaurant.mdb"

    id = Request.QueryString("id")

    set rs=Server.CreateObject("ADODB.Recordset")
    rs.open "SELECT * FROM restaurant WHERE ID=" & id,conn


    staff = rs("rStaff")
    ' Response.Write staff
    ' Response.end

    set rs1=Server.CreateObject("ADODB.Recordset")
    rs1.open "SELECT resMenu FROM menu WHERE ResID=" & id,conn
    ' menur= rs1("resMenu")
    ' Response.Write menur
    ' Response.end

    Dim s
    s = rs1.GetRows()

    Breakfast=Lunch=Dinner=Snacks=0
    For each x in s
    ' response.write x
      if x="Breakfast" Then
      Breakfast=1
      elseif x="Lunch" Then
      Lunch=1
      elseif x="Dinner" Then
      Dinner=1
      elseif x="Snacks" Then
      Snacks=1
      end if
    Next
    ' response.end

  if not rs.eof then%>

  <div class="container">
    <h3>Update Restaurant:</h3>
    <form method="POST" action="update.asp?id=<%Response.Write(id)%>">
      <div class="mb-3">
        <label for="exampleInputname" class="form-label"><b>Restaurant Name</b></label>
        <input type="text" class="form-control" id="exampleInputname" name="restaurantName" value="<%=rs("rName")%>">
      </div>

      <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label"><b>Email</b></label>
        <input type="email" class="form-control" id="exampleInputEmail1" name="restaurantEmail" value="<%=rs("rEmail")%>">
      </div>

      <div class="mb-3">
        <label for="exampleInputPhone" class="form-label"><b>Phone</b></label>
        <input type="number" class="form-control" id="exampleInputPhone" name="restaurantPhone" value="<%=rs("rPhone")%>">
      </div>

      <div class="mb-3">
        <label for="members"><b>Total Member<b/></label>
        <select name="members" id="members" required>
          <option name="low" value="1-50" <% If staff = "1-50" Then Response.Write(" selected") End if%>>1-50</option>
          <option name="medium" value="51-100" <% If staff = "51-100" Then Response.Write(" selected") End if%>>51-100</option>
          <option name="semiMedium" value="101-150" <% If staff = "101-150" Then Response.Write(" selected") End if%>>101-150</option>
          <option name="high" value="151-200" <% If staff = "151-200" Then Response.Write(" selected") End if%>>151-200</option>
        </select>
      </div>

      <div class="mb-3">
        <label for="exampleInputItem" class="form-label"><b>Food Item</b></label>
        <input type="checkbox" name="menu" value="Breakfast" <% if Breakfast=1 then %> checked="checked"<%End if%> >Breakfast
        <input type="checkbox" name="menu" value="Lunch" <% if Lunch=1 then %> checked="checked"<%End if%> >Lunch
        <input type="checkbox" name="menu" value="Dinner" <% if Dinner=1 then %> checked="checked"<%End if%> >Dinner
        <input type="checkbox" name="menu" value="Snacks" <% if Snacks=1 then %> checked="checked"<%End if%> >Snacks <br>
      </div>

      <div class="mb-3">
        <label for="exampleInputDescription" class="form-label"><b>Description</b></label>
        <input type="text" name="description" value="<%=rs("rDescription")%>"><br>
      </div>

      <div class="mb-3">
        <label for="exampleInputDate" class="form-label"><b>Date</b></label>
        <input type="date" class="form-control" id="exampleInputDate" name="date" value="<%=rs("rDate")%>">
      </div>

      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
  </div>
</body>
  <%end if
  rs1.close
  rs.close%>
</html>