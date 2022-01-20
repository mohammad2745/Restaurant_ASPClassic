<!DOCTYPE html>
<!--#include file ="session.asp"-->
<!--#include virtual="\class\c_data_batch.asp"-->
<html>
<head>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<body>
<div class="container">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="#">Welcome <span class="sr-only"><%Response.Write(Session("fName"))%></span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="welcome.asp" role="button">HOME</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="viewRestaurant.asp" role="button">View Restaurants</a>
      </li>
    </ul>
    <span class="navbar-text">
      <a class="btn btn-warning" href="logout.asp" role="button">Logout</a>
    </span>
  </div>
</nav> 

<%
  set ObjData = new c_Data
  
  ObjData.OpenConnection "prjSultan", strErr
  id = Request.QueryString("id")

  SQL1 = "SELECT resMenu FROM menu WHERE ResID=" & id
  rs1 = ObjData.RetrieveData(SQL1, strErr)

  Breakfast=Lunch=Dinner=Snacks=0
  Dim row, rows
  If IsArray(rs1) Then
    rows = UBound(rs1, 2)
    For row = 0 To rows  
      if rs1(0,row)="Breakfast" Then
        Breakfast=1
      elseif rs1(0,row)="Lunch" Then
        Lunch=1
      elseif rs1(0,row)="Dinner" Then
        Dinner=1
      elseif rs1(0,row)="Snacks" Then
        Snacks=1
      end if
    Next
  end if

  SQL = "SELECT * FROM restaurant WHERE ID=" & id
  rs = ObjData.RetrieveData(SQL, strErr)
  staff = rs(4,0)
%>
<h3>Update Restaurant:</h3>
<form method="POST" action="update.asp?id=<%Response.Write(id)%>">
  <div class="mb-3">
    <label for="exampleInputname" class="form-label"><b>Restaurant Name</b></label>
    <input type="text" class="form-control" id="exampleInputname" name="restaurantName" value="<%=rs(1,0)%>">
  </div>

  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label"><b>Email</b></label>
    <input type="email" class="form-control" id="exampleInputEmail1" name="restaurantEmail" value="<%=rs(2,0)%>">
  </div>

  <div class="mb-3">
    <label for="exampleInputPhone" class="form-label"><b>Phone</b></label>
    <input type="number" class="form-control" id="exampleInputPhone" name="restaurantPhone" value="<%=rs(3,0)%>">
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
    <input type="text" name="description" value="<%=rs(5,0)%>"><br>
  </div>

  <div class="mb-3">
    <label for="exampleInputDate" class="form-label"><b>Date</b></label>
    <input type="text" class="form-control" id="exampleInputDate" name="date" value="<%=rs(6,0)%>">
  </div>

  <button type="submit" class="btn btn-primary">Submit</button>
</form>
  </div>
</body>
<% ObjData.CloseConnection %>
</html>