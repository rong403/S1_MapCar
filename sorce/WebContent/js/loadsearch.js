$(function() {
    var start = null;
    var arrival = null;
    $('#switch_btn').click(function() {
        start = document.getElementById('start_btn').value;
        arrival = document.getElementById('arrival_btn').value;

        document.getElementById('start_btn').value = arrival;
        document.getElementById('arrival_btn').value = start;
    });
    $('#reset_btn').click(function() {
        document.getElementById('start_btn').value = "";
        document.getElementById('arrival_btn').value = "";
    });
    var cnt1 = 0;
    $('#all_hidden_button').click(function() {
        cnt1 += 1;
        if(cnt1 == 2){
            $('.map_home_box').css("transform", "translateX(0%)");
            $('.all_hidden_button_img').css("transform", "rotate(0deg)");
            cnt1 = 0;
        } else{
            $('.map_home_box').css("transform", "translateX(-100%)");
            $('.all_hidden_button_img').css("transform", "rotate(180deg)");
        }
    }); 
});