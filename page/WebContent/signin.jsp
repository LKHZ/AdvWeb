<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ include file="initsession.jsp" %>

<!doctype html>
<html>
  <head> 
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="soccer-ball-variant.png">
    
    <title>Sports Score Board</title>
        
    <!-- Bootstrap core CSS -->
    <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="cssjs/signin.css" rel="stylesheet">
    <script src = "jquery-3.2.1.js"></script>
    <!--JS-->
    <script>
      $(document).ready(function(){
        $('#joinBtn').on('click', function(){
          window.open('join.jsp', '_self');
        });
      });
    </script>
  </head>
  <body>
    <div class="container">
      <form class="form-signin" method="post" action="signin_doit.jsp">
        <h2 class="form-signin-heading">Login</h2>
        <%-- <form method="post" action="signin_doit.jsp"> --%>
          <input type="text" class="form-control" name="userid" placeholder="아이디" required autofocus>
          <input type="password" class="form-control" name="passwd" placeholder="비밀번호" required>
          <div class="checkbox">
            <label>
              <input type="checkbox" name="autologin" value="remember-me">로그인 상태 유지
            </label>
          </div>
          <button type="submit" class="btn btn-lg btn-danger btn-block">로그인</button>
        
        <hr> 
        <div id="join">
          <ul>
            <li>  <a id="joinBtn">회원가입</a>  </li>
          </ul>
        </div>
      </form>
    </div>
  </body>
</html>

