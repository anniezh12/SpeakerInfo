$(document).ready(function(){
// following function will operate when user submits new topic properties
$("#previous").on("click",function(e){
  var formdata = $(this).serialize();
  //I need to find which index number is this current record bacause Id alone will not work for it
  // eg some one deleted a record so the next or previous by adding 1 in its id wont work
  // First I have to grab all the topics into an array finding current topic id and finding its index number
  //var allTopicsArray = Topic.all
 e.preventDefault();

// $.ajax({
//   type: "GET",
//   url: "/topics/next",
//   dataType: "JSON",
//    data: formdata,
//
});
});
