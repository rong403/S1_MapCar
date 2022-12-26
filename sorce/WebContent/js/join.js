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

$(document).ready(function() {
	$("#chk_all").click(function() {
		if($("#chk_all").is(":checked")) $("input[class=chk]").prop("checked", true);
		else $("input[class=chk]").prop("checked", false);
	});

	$("input[class=chk]").click(function() {
		var total = $("input[class=chk]").length;
		var checked = $("input[class=chk]:checked").length;

		if(total != checked) $("#chk_all").prop("checked", false);
		else $("#chk_all").prop("checked", true); 
	});
});