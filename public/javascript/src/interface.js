$(document).ready(function() {
    update();

    // $('#test_button').click(function() {
    //     $('#test_button').remove();
    // });
    $("test_button").click(function(){
        console.log("randomword")
        $("test_button").attr("display","none");
      });

    update = function() {
        $.get('/', function(){
            var data = JSON.parse(res);
            if(data.status === 200) {
                return ;
            };
        })
    };


});
$("test_button").click(function(){
    console.log("randomword")
    $("test_button").attr("display","none");
  });
