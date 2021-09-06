<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <p>Welcome
                <%
                response.write(request.form("fullName"))
                %>
            </p>
            <a class="btn btn-primary" href="createRestaurant.asp" role="button">Add Restaurant</a>
            <a class="btn btn-primary" href="viewRestaurant.asp" role="button">View Restaurants</a>
        </div>
    </body>
</html>