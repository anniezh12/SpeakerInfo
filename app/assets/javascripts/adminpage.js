function userObj(att){
  this.id = att.id;
  this.name = att.name;
  this.email = att.email;
}



 $(document).on('turbolinks:load',function(){

     $("#speakerdata").on("click",function(e){
       var user;
       e.preventDefault();
        $.get('/users').done(function(resp){

      for(var i=0;i<resp.length;i++){
               user = new userObj(resp[i]);
            $('#displaymode ol').append("<li>Name: "+user.name+"<br>Email: "+user.email+"<br>Topics: "+
            "</a></li>")
          };
          });

 });
 });
