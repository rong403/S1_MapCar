function openNav() {
    document.getElementById("map_home_page").style.width = "0px";
  }
  
  /* Close when someone clicks on the "x" symbol inside the overlay */
  function closeNav() {
    document.getElementById("map_home_page").style.width = "0%";
  }

$(function() {
    var cnt1 = 0;
    $('.login_button').click(function() {
        cnt1 += 1;
        if(cnt1 == 2){
            $('.map_home_box').css("width", "450px");
            cnt1 = 0;
        } else{
            $('.map_home_box').css("width", "0px");
        }
    }); 
})