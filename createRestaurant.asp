<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="restaurantFormValidation.js"></script>
</head>
    
<body>
  <div class="container">
  <h3>Create Restaurant:</h3>
    <form method="POST" action="restaurantDetails.asp" name="Res" onsubmit="return validateForm()";>

      <div class="mb-3">
        <label for="exampleInputname" class="form-label">Restaurant Name</label>
        <input type="text" class="form-control" id="exampleInputname" name="restaurantName">
      </div>

      <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Email</label>
        <input type="email" class="form-control" id="exampleInputEmail1" name="restaurantEmail" placeholder="abc@mail.com">
      </div>

      <div class="mb-3">
        <label for="exampleInputPhone" class="form-label">Phone</label>
        <input type="number" class="form-control" id="exampleInputPhone" name="restaurantPhone" >
      </div>

      <div class="mb-3">
        <label for="members">Total Member</label>
        <select name="members" id="members" >
          <option name="low" value="1-50">1-50</option>
          <option name="medium" value="51-100">51-100</option>
          <option name="semiMedium" value="101-150">101-150</option>
          <option name="high" value="151-200">151-200</option>
        </select>
      </div>

      <div class="mb-3">
        <label for="exampleInputItem" class="form-label" >Food Item</label>
        <div id="checkboxes">
          <label for="one"><input type="checkbox" id="breakfast" name="item" value="Breakfast"/>Breakfast</label>
          <label for="two"> <input type="checkbox" id="lunch" name="item" value="Lunch"/>Lunch</label> 
          <label for="three"><input type="checkbox" id="dinner" name="item" value="Dinner"/>Dinner</label>
          <label for="three"><input type="checkbox" id="snacks" name="item" value="Snacks"/>Snacks</label>
        </div>
      </div>

      <div class="mb-3">
        <label for="exampleInputDescription" class="form-label">Description</label>
        <textarea id="w3review" name="description" rows="4" cols="50" > </textarea>
      </div>

      <div class="mb-3">
        <label for="exampleInputDate" class="form-label">Date</label>
        <input type="date" class="form-control" id="exampleInputDate" name="date" >
      </div>
      
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
  </div>
</body>
</html>