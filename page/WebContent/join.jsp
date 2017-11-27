<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8"  %>
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
     
        
    <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="cssjs/join.css" rel="stylesheet">
  </head>
  <body>
    <div class="container">
      <form class="form-login" action="" method="POST">
        <h2 class="form-login-heading">Sign up</h2>
        <input type="text" class="form-control" placeholder="아이디" required autofocus>
        <input type="password" class="form-control" placeholder="비밀번호" required>
        <input type="password" class="form-control" placeholder="비밀번호 재확인" required>

        <div id="NickNameDiv">
          <input type="text" class="form-control" placeholder="닉네임" required autofocus>
        </div>
        닉네임 중복을 확인하세요.<button type="button" class="btn btn-sm btn-danger " id="checkBtn">중복확인</button>
        <hr>
        <button type="submit" class="btn btn-lg btn-danger btn-block">회원가입</button>
      </form>
    </div>
  </body>
</html>