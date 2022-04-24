$(document).ready(function() {
    $('#games_section').hide();

    $("#names_form").submit(function(e){
        e.preventDefault();
        $("#names_form").ajaxSubmit({url: '/names_post', type: 'post'});
        $("#names_form").remove();
        update_names();
        update();
    });
    
    $('#input_result').submit(function(e) {
        e.preventDefault();
        $('#input_result').ajaxSubmit({url: '/input_result', type: 'post'});
        update();
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
            console.log(data.player_1_score);
            if(data.status === 200) {
                $('#names_intro').text(data.player_1_name + ' vs. ' + data.player_2_name);

                $('#p1_total_pins').text(data.player_1_points);
                $('#p1_bonus').text(data.player_1_bonus);
                $('#p1_overall').text(data.player_1_total);

                $('#p2_total_pins').text(data.player_2_points);
                $('#p2_bonus').text(data.player_2_bonus);
                $('#p2_overall').text(data.player_2_total);

                if(data.whos_turn === 'player_1') {$('#whos_turn').text(data.player_1_name)}
                else {$('#whos_turn').text(data.player_2_name)};
                
            };
        });
    };
    
});
