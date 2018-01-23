$(document).ready(function(){

  attachListeners();
});

function attachListeners(){

  $("#noteForm").submit(function(e){

  e.preventDefault();
    var note = $("#notes").val();
   if (note  !== "")
    {
      message(note);
    }

   else
     {
       alert("Sorry You Have noting to Display");
     }


  });
}

function message(note)
{
$("#messageDiv").append(note);
$("#messageDiv").append("<br>")
  //var msg = "Please Insert some "+ note+ "to be added";

}
