$(document).on('turbolinks:load',function(){
// following function will operate when user submits new topic properties
  var currentId = $("#hidden_id").val();
  $("#previous").on("click",function(e){
  e.preventDefault();
   $.get(`/topics/previous/${currentId}`).done(function(resp){
    currentId = resp.id;
   document.getElementById('topic_display').innerHTML = "";
   $('#topic_display').append("<h3>Topic Id:"+resp.id+"  Topic: "+resp.title+"</h3><br>Description: "+resp.description+"<br>Forum:"+
 resp.forum+"<br>");
})
})

$("#next").on("click",function(e){
  e.preventDefault();
   $.get(`/topics/next/${currentId}`).done(function(resp){
    currentId = resp.id;
   document.getElementById('topic_display').innerHTML = "";
   $('#topic_display').append("<h3>Topic Id:"+resp.id+"  Topic: "+resp.title+"</h3><br>Description: "+resp.description+"<br>Forum:"+
 resp.forum+"<br>");
})
})
})
