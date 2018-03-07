//constuctor function users
function User(att){
  this.id = att.id;
  this.name = att.name;
  this.email = att.email;
  this.topics = att.topics;
   }
// User prototype function

User.prototype.display = function(){
$('#displaymode ol').append("<li><b>Name: </b>"+this.name+"<br><b>Email:</b> "+this.email+"<br><div id='topic'><b>Topics:</b></div></li>");
 var myTopics =[];
 myTopics = this.topics.sort(function(a,b){return a.title.toUpperCase() > b.title.toUpperCase()});
myTopics.forEach((topic)=>{ $('#topic').append(" "+topic.title+"<br> ")});

}

 $(document).on('turbolinks:load',function(){

     $("#speakerdata").on("click",function(e){
       var user;
       e.preventDefault();
       $.get('/users').done(function(resp){
         resp.sort(function(a,b){return a.name.toUpperCase() > b.name.toUpperCase();});

          for(var i=0;i<resp.length;i++){
               user = new User(resp[i]);
               user.display(); // call to the User prototype function
             };
          });

 });

 //Following jquery will take care of representing the Speaker with most lectures


 $("#speakers_mostLectures").on("click",function(e){
    e.preventDefault();

    $.get('/users/most_lectures').done(function(resp){

      $("#displaymode ol").append("<b>User With Most Topics is:</b>"+resp.name);
    });
  });

  //Following jquery will take care of representing the Speaker with least lectures


  $("#speakers_leastLectures").on("click",function(e){
     e.preventDefault();
         $.get('/users/least_lectures').done(function(resp){

       $("#displaymode ol").append("<b>User With Least Topics is:</b>"+resp.name);
     });
   });
  })
