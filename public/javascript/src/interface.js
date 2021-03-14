$(document).ready(function() {
    $('#games_section').hide();

    $("#names_form").submit(function(e){
        e.preventDefault();
        $("#names_form").ajaxSubmit({url: '/names_post', type: 'post'});
        
        $("#names_form").remove();
        update_names();
      });


    function update_names() {
        $.get('/update', function(res){
            var data = JSON.parse(res);
            if(data.status === 200) {
                $('#names_intro').text(data.player_1_name + ' vs. ' + data.player_2_name);
                $('#player_1_name').text(data.player_1_name);
                $('#player_2_name').text(data.player_2_name);
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
                $('#player_1_pins').text(data.player_1_points);
                $('#player_1_bonus').text(daya.player_1_bonus);
            };
        });
    };
    
});
