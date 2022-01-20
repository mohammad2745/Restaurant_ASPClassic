$(document).ready(function() {
    $('#searchButton').click(function() {
        $.ajax({
            type: "POST",
            url: "searchView_init.asp",
            data: $("#formID").serialize(),
            cache: false,
            dataType: "html",
            success: function(response) {
                $('#searchDisplay').html(response.toString());
            },
            error: function(resposeText) {
                alert("err");
            },
        });
        return false;
    });
});

function deleteRow(id) {
    $.ajax({
        url: "delete.asp?id=" + id,
        success: function(response) {
            $("#formSet").html(response.toString());

        }
    });
}