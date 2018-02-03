$(document).ready(function(){
// following function will operate when user submits new topic properties
$("#previous").on("click",function(e){
  var formdata = $(this).serialize();
  //I need to find which index number is this current record bacause Id alone will not work for it
  // eg some one deleted a record so the next or previous by adding 1 in its id wont work
  // First I have to grab all the topics into an array finding current topic id and finding its index number
  //var allTopicsArray = Topic.all

$.get("/topics/ajaxtopic", function(res){
  var n =res.serialize()
  alert(n);
});
});

  // alert("Hello")
  // e.preventDefault();
  //   $.ajax({
  //   type: "Get",
  //   url: '',
  //   data: formdata,
  //   dataType: "JSON"}).done(function(newTopic){
  //   $("#topicsdiv").append("<ul><li>"+ newTopic.title+"</li><li>"+newTopic.description+"</li><li>"+newTopic.date_of_event+"</li><li>"+newTopic.forum+"</li></ul>A new Topic has been created successfully!. Please refresh page to see it with all other lectures on the top of the page");
  //   })
  // });
});
