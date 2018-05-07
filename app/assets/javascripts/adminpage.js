//constuctor function users
function User(att){
  this.id = att.id;
  this.name = att.name;
  this.email = att.email;
  this.topics = att.topics;
   }
// User prototype function

User.prototype.display = function(){
$('#displaymode ').append(`
     <div class="panel-group">
      <div class="panel panel-success">
        <div class="panel-heading">
         ${this.name}
            <b>Email:</b> ${this.email}
        </div>
         <div class="panel-body">

    ${this.topics.map(topic => `<br>${topic.title}`).join('')}
</div>
      </div>

  `);
 var myTopics =[];

 myTopics = this.topics.sort(function(a,b){return a.title.toUpperCase() > b.title.toUpperCase()});
this.topics.forEach((topic)=>{ $('#topicsByUser').append(" "+topic.title+"<br> ")});
}

 $(document).on('turbolinks:load',function(){

     $("#speakerdata").on("click",function(e){
       var user;
       e.preventDefault();
       $.get('/users').done(function(resp){
         resp  = resp.sort(function(a,b){
           var firstName = a.name.toUpperCase();
           var secName = b.name.toUpperCase();
           if(firstName < secName){
             return -1;
         }
            if(firstName > secName)
            {
              return 1;
            }
        return 0;

          });
          let response = resp.filter(el=>{if(el.topics.length>3) return el})
          response.forEach(el=>{
               user = new User(el);
               user.display(); // call to the User prototype function

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
});
