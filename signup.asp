<!DOCTYPE html>
<html>

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
</head>

<body>
    <div class="container">
        <a class="btn btn-success" href="login.asp" role="button">Login</a>
        <h3>Signup</h3>
        <form method="POST" action="signupValidation.asp">
            <div class="mb-3">
                <label for="exampleInputfirstname" class="form-label">First Name</label>
                <input type="text" class="form-control" id="exampleInputfirstname" name="fName">
            </div>

            <div class="mb-3">
                <label for="exampleInputlastname" class="form-label">Last Name</label>
                <input type="text" class="form-control" id="exampleInputlastname" name="lName">
            </div>

            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Email address</label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
            </div>

            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Password</label>
                <input type="password" class="form-control" id="exampleInputPassword1" name="password">
            </div>

            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</body>

</html>