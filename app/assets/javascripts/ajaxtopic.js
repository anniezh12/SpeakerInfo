$(document).on('turbolinks:load', function(){
// following function will operate when user submits new topic properties
$("#topicForm").on("submit",function(e){
  var formdata = $(this).serialize();
  var formfields = this;
  e.preventDefault();
    $.ajax({
    type: "POST",
    url: $(this).action,
    data: formdata
  }).done(function(newTopic){
    $("#messageDiv").append("<ul><li>Title: "+newTopic.title+"</li><li>"+newTopic.description+"</li><li>"+newTopic.date_of_event+"</li><li>"+newTopic.forum+"</li></ul>A new Topic has been created successfully!. Please refresh page to see it with all other lectures on the top of the page");
         formfields.reset();

    })
  });

  })
