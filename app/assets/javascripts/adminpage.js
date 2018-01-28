$(document).ready(function(){
  attachListeners();
});

function attachListeners(){
  // following function will operate when user submits new topic properties
  $("#topicForm").on("submit", function(e){
  e.preventDefault();
// display inserted data using ajax
// data = {
     'authenticity_token': $("input[name='authenticity_token']".val()),
//     'title': $("input[name='title']".val()),
//
// }
$.ajax({
   type: "POST",
   data: $(this).serialize();
   success: function(response){
     $("#newdiv").val("");
     $("$newTopic").append(response)
   }

})


  });

// following code will operate when user enters notes
  $("#noteForm").submit(function(e){

  e.preventDefault();
    var note = $("#notes").val();
   if (note  !== "")
    {
      $("#messageDiv").append(note+"<br>");
      $("#notes").val("");

    }

   else
     {
       alert("Sorry You Have noting to Display");
     }


  });
}

// Following function will get data from the topics form on the topics/index page and
// create a new topic and append it back on the index page


function popupFunction() {
    var popup = document.getElementById("firstPopup");
    popup.classList.toggle("show");
}
