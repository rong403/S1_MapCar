$(function() {
    var cnt1 = 0;
    $('.choice_cop_1').click(function() {
        cnt1 += 1;
        if(cnt1 == 2){
            $('.choice_cop_1_list').css("display", "none");
            $('.choice_list_btn_1').css("transform", "rotate(0deg)");
            cnt1 = 0;
        } else{
            $('.choice_cop_1_list').css("display", "block");
            $('.choice_list_btn_1').css("transform", "rotate(180deg)");
        }
    }); //transform: translate(50%, -50%) rotate(180deg);
    $('.choice_cop_1_list_ul > .choice_list_li').click(function() {
        // 폰트 디자인
        $('.choice_cop_1_list').css("display", "none");
        $('.choice_list_btn_1').css("transform", "rotate(0deg)");
        cnt1 = 0;
        // 텍스트 변환
        $(".choice_cop_name").text($(this).text());
    });
    var cnt2 = 0;
    $('.choice_cmodel_1').click(function() {
        cnt2 += 1;
        if(cnt2 == 2){
            $('.choice_cmodel_1_list').css("display", "none");
            $('.choice_list_btn_2').css("transform", "rotate(0deg)");
            cnt2 = 0;
        } else{
            $('.choice_cmodel_1_list').css("display", "block");
            $('.choice_list_btn_2').css("transform", "rotate(180deg)");
        }
    }); //transform: translate(50%, -50%) rotate(180deg);
    $('.choice_cmodel_1_list_ul > .choice_list_li').click(function() {
        // 폰트 디자인
        $('.choice_cmodel_1_list').css("display", "none");
        $('.choice_list_btn_2').css("transform", "rotate(0deg)");
        cnt2 = 0;
        // 텍스트 변환
        $(".choice_cmodel_name").text($(this).text());
    });
});