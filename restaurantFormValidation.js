function validateForm() {
    let fname = document.forms["Res"]["restaurantName"].value;
    if (fname == "") {
        alert("Name must be filled out")
        return false;
    }

    let Email = document.forms["Res"]["restaurantEmail"].value;
    var atposition = Email.indexOf("@");
    var dotposition = Email.lastIndexOf(".");
    if (atposition < 1 || dotposition < atposition + 2 || dotposition + 2 >= Email.length) {
        alert("Please enter a valid e-mail address");
        return false;
    }

    // let Phone = document.forms["Res"]["restaurantPhone"].value;
    // var phoneno = /^\d{11}$/;
    // if (Phone.match(phoneno))
    //     Phone = Phone
    // else {
    //     alert("Enter valid number");
    //     return false;
    // }

    // let DATE = document.forms["Res"]["date"].value;

    // if (isNaN(Date.parse(DATE))) {
    //     alert('Enter date');
    //     return false;
    // }


    var breakfast = document.getElementById("breakfast");
    var lunch = document.getElementById("lunch");
    var dinner = document.getElementById("dinner");
    var snacks = document.getElementById("snacks");

    if (breakfast.checked == false && lunch.checked == false && dinner.checked == false && snacks.checked == false) {
        alert("Select at least one menu")
        return false;
    }


}