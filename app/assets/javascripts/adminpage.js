 $(document).ready(function(){

     $("#speakerdata").on('click',function(e){
     e.preventDefault();
  var path=this.href;
       alert(path);
       $.ajax({
       type: "GET",
       url: path,
       dataType: JSON
       }).done(function(res){

          $('#displaymode').append("<h3>Topic Id:"+res.id+"  <br>");
       });


 })
 });
