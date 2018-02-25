 $(document).on('turbolinks:load',function(){

     $("#speakerdata").on("click",function(e){
     e.preventDefault();

       $.get('/users/').done(function(resp){
console.log(resp)
          //
             resp.forEach((user)=>{

               var mailTo= "mailto:"+user.email;

             $('#displaymode ol').append("<li>Name: "+user.name+"    "+mailTo+"</a></li>")});


        });
    })
 });

// $(document).ready(function(){
//
//     $("#speakerdata").on('click',function(e){
//     e.preventDefault();
//  var path=this.href;
//       alert(path);
//       $.ajax({
//       type: "GET",
//       url: path,
//       dataType: JSON
//       }).done(function(res){
//
//          $('#displaymode').append("<h3>Topic Id:"+res.id+"  <br>");
//       });
//
//
// })
// });
