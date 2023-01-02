$(function() {
   
	$('#carModelSearch').focusin(function() {
            $('.choice_cmodel_1_list').css("display", "block");
    });
    $('#carModelSearch').focusout(function() {
            $('.choice_cmodel_1_list').css("display", "none");
    });
    $('#carCopSearch').focusin(function() {
            $('.choice_cop_1_list').css("display", "block");
    });
    $('#carCopSearch').focusout(function() {
            $('.choice_cop_1_list').css("display", "none");
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