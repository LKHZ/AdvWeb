<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8"  %>
<%@ include file="initsession.jsp" %>

<jsp:useBean id="join" class="ssb.dbmanage.JoinBean" scope="request" />
<jsp:setProperty name="join" property="*" />

<!doctype html>
<html>
  <head> 
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="soccer-ball-variant.png">
    <script src = "jquery-3.2.1.js"></script>
    
    <title>Sports Score Board</title>
     

    <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="cssjs/join.css" rel="stylesheet">
	
    <%
      request.setCharacterEncoding("UTF-8");
    %>

    <script>
    // function identCheckClick() {

    //       window.alert("중복되지 않는 아이디입니다.");
      
    //     if(true){
          
    //       $('#iddup').val("yes");
    //       window.alert("중복되지 않는 아이디입니다.");
          
    //     }
    //     else {
          
    //       $('#iddup').val("no");
    //       window.alert("이미 있는 아이디입니다.");
          
    //     }
    
    // }

    </script>

    <script>
      // $(document).ready(function(){
      //   $('#identCheckBtn').on('click', function(){
           <%
      //       if(join.duplicationCheckIdent("asd")) {
               %>
      //         $('#iddup').val("yes");
      //         alert("중복되지 않는 아이디입니다.");
               <%
      //       }
      //       else {
               %>
      //         $('#iddup').val("no");
      //         alert("이미 있는 아이디입니다.");
               <%
      //       }

           %> 
      //   });
      // });
      // $(document).ready(function(){
      //   $('#nickCheckBtn').on('click', function(){
           <%
      //       if(join.duplicationCheckIdent("zxc")) {
               %>
      //         $('#nickdup').val("yes");
      //         alert("중복되지 않는 낙네임입니다."); 
               <%
      //       }
      //       else {
               %>
      //         $('#nickdup').val("no");
      //         alert("이미 있는 닉네임입니다.");
               <%
      //       }

           %>
      //   });
      // });
      
    </script>
      
    <script>
      
      function passinput(){
        if($('#passwdagain').val() != null && $('#passwd').val() != null) {
          if($('#passwdagain').val() == $('#passwd').val()) {
            $('#passwdcheck').text('패스워드가 일치합니다.').css('color', 'green');
            $('#pwcheck').val("yes");
          }
          else {
            $('#passwdcheck').text('패스워드가 일치하지 않습니다.').css('color', 'red');
            $('#pwcheck').val("no");
          }
        }
      }
    </script>

    <%-- <script>
      function passwdEqualPattern() {
        if($('#passwd').va
      }
    </script> --%>

  </head>
  <body>
    <div class="container">
      <form class="form-login" action="join_doit.jsp" method="POST" >
        <h2 class="form-login-heading">Sign up</h2>
        <input type="text" id="idident" class="form-control" name="userid" placeholder="아이디" required autofocus>
        <input type="password" oninput="passinput()" class="form-control" id="passwd" name="passwd" placeholder="비밀번호" required>
        <input type="password" oninput="passinput()" class="form-control" id="passwdagain" name="passwdagain" placeholder="비밀번호 재확인" required>
        <input type="text" id="idnick" class="form-control" name="nickname" placeholder="닉네임" required autofocus>
       
        <hr>
        <%-- <div id="labelIdentCheck">아이디 중복을 확인하세요.
          <button type="button" class="btn btn-sm btn-danger " id="identCheckBtn" >중복확인</button>
          <input type=hidden id="iddup" name="idcheck" value="no">
        </div>
        <br>
        <div id="labelNickCheck">닉네임 중복을 확인하세요.
          <button type="button" class="btn btn-sm btn-danger " id="nickCheckBtn">중복확인</button>
          <input type=hidden id="nickdup" name="nickcheck" value="no">
        </div>
        <hr> --%>
        <div id="passwdcheck"> 
          <input type=hidden id="pwcheck" name="passwdcheck" value="no">
        </div>
        <br>
        <button id="submitJoin" type="submit" class="btn btn-lg btn-danger btn-block" >회원가입</button>
      </form>
    </div>
  <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="bootstrap/assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="bootstrap/assets/js/vendor/popper.min.js"></script>
    <script src="bootstrap/dist/js/bootstrap.min.js"></script>
  </body>
</html>