$(document).ready(function() {
    
    $("#names_form").submit(function(e){
        e.preventDefault();
        $("#names_form").ajaxSubmit({url: '/names_post', type: 'post'});
        // var names = $(this).ajaxSubmit();
        console.log(names)
      
        $("#names_form").remove();
        $('#games_section').show();
        update_names();
      });


    function update_names() {
        $.get('/update', function(res){
            var data = JSON.parse(res);
            if(data.status === 200) {
                $('#names_intro').text(data.player_1_name + ' vs. ' + data.player_2_name);
            };
        });
    };

    function update() {
        $.get('/update', function(res){
            var data = JSON.parse(res);
            console.log(res);
            console.log(data);
            if(data.status === 200) {
                $('#names_intro').text(data.player_1_name + ' vs. ' + data.player_2_name);

            };
        });
    };
    
});
