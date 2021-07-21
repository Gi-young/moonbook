<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
  </head>

  <body>
    <button id="click_button">딸깍해 보세요</button>
    <div style="width: 125px; background-color: rgb(90, 200, 220);" id="button_content">말아올리고 말아내리는 글상자</div>
    <script type="text/javascript">
      $('#click_button').click(function() {
        $('#button_content').slideToggle('slow', function() {
          // 객체가 다 펼치지거나 접히고 나면 여기에 든 내용이 실행된다.
        });
      });
    </script>
  </body>
</html>