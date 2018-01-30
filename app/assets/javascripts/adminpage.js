$(document).ready(function(){
  attachListeners();
});

function attachListeners(){


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
