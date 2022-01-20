<!DOCTYPE html>
<!--#include file ="session.asp"-->
<!--#include virtual="\class\c_data_batch.asp"-->
<html>

<head>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="ajax.js"></script>
</head>

<body id="formSet">
    <div class="container" >
    <!-- NAVBAR -->
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
            <a class="nav-link " href="createRestaurant.asp" role="button">Add Restaurant</a>
          </li>
        </ul>
        <span class="navbar-text">
          <a class="btn btn-warning" href="logout.asp" role="button">Logout</a>
        </span>
      </div>
    </nav> 
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
    <!--#include file ="searchView.asp"-->
          
    </div>
</body>

<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>

<!-- Option 2: Separate Popper and Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>

</html>

