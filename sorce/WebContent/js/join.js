$(function() {
    var cnt1 = 0;
    $('.choice_cop_1').click(function() {
        cnt1 += 1;
        if(cnt1 == 2){
            $('.choice_cop_1_list').css("display", "none");
            cnt1 = 0;
        } else{
            $('.choice_cop_1_list').css("display", "block");
        }
    });
    var cnt2 = 0;
    $('.choice_cmodel_1').click(function() {
        cnt2 += 1;
        if(cnt2 == 2){
            $('.choice_cmodel_1_list').css("display", "none");
            cnt2 = 0;
        } else{
            $('.choice_cmodel_1_list').css("display", "block");
        }
    });

});