;
/* Set the width of the side navigation to 250px and the left margin of the page content to 250px */
function openNav() {
    document.getElementById("mySidenav").style.width = "200px";
    document.getElementById("main").style.marginLeft = "200px";
};

/* Set the width of the side navigation to 0 and the left margin of the page content to 0 */
function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft = "0";
};


$(function(){
$("#addClass").click(function () {
        $('#qnimate').addClass('popup-box-on');
          });

          $("#removeClass").click(function () {
        $('#qnimate').removeClass('popup-box-on');
          });
})
