<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
#MOVE_TOP_BTN {
    position: fixed;
    left: 2%;
    bottom: 40px;
    display: none;
    z-index: 999;
    cursor:pointer;
}
</style>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<img id="MOVE_TOP_BTN" src="../display?fileName=top.png" width=50/>
<script>
    $(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 500) {
                $('#MOVE_TOP_BTN').fadeIn();
            } else {
                $('#MOVE_TOP_BTN').fadeOut();
            }
        });
        
        $("#MOVE_TOP_BTN").click(function() {
            $('html, body').animate({
                scrollTop : 0
            }, 400);
            return false;
        });
    });
</script>