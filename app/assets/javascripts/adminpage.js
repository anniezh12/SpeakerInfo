 $(document).on('turbolinks:load',function(){

     $("#speakerdata").on("click",function(e){
     e.preventDefault();
       alert(this.href);
       $.get('/welcome/jsondata').done(function(json){
         var $ol= $("div displaymode ol");//get the div from displayspeakers html
         $ol.html("");//empty it
          json.forEach(function(el){
          $ol.append("<li>"+el.name+"</li>");
       });
    })
 });
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
