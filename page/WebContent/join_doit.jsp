<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8"  %>

<jsp:useBean id="join" class="ssb.dbmanage.JoinBean" scope="request" />
<jsp:setProperty name="join" property="*" />


<!doctype html>
<html>
  <head> 
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title>Sports Score Board</title>

    <%
      request.setCharacterEncoding("UTF-8");
    %>
  </head>
  
  <body>
    <%
      //String idcheck = request.getParameter("idcheck");;
      //String nickcheck = request.getParameter("nickcheck");
      //String passwdcheck = request.getParameter("passwdcheck");

      if(join.duplicationCheckIdent(request.getParameter("userid"))) {
        %>
	        <script> window.alert("아이디가 중복됩니다."); </script>
        <%
        return;
      }
      if(join.duplicationCheckNick(request.getParameter("nickname"))) {
        %>
	        <script> window.alert("닉네임이 중복됩니다."); </script>
        <%
        return;
      }
      if(!request.getParameter("passwd").equals(request.getParameter("passwdagain"))) {
      //if(!passwdcheck.equals("yes")) {
        %>
	        <script> window.alert("입력한 패스워드가 틀렸습니다."); </script>
        <%
        return;
      }

      join.setUserid(request.getParameter("userid"));
      join.setPasswd(request.getParameter("passwd"));
      join.setNickname(request.getParameter("nickname"));
      int num = join.joinUser();
      switch(num) {
      case 1:
    %>
        <script>
          window.alert("회원가입에 성공 하였습니다."); 
          window.open("index.jsp", "_self");
        </script>

    <%
    	  break;
      default:
    %>
        <%= num %>
        <script> 
          window.alert("회원가입에 실패 하셨습니다.");
          window.open("join.jsp", "_self");
        </script>
    <%
    	  break;
      }
    %>

    <%-- <HR>
    입력 아이디 : <jsp:getProperty name="signin" property="userid" /> <BR>
    입력 패스워드 : <jsp:getProperty name="signin" property="passwd" /> <BR> --%>

  </body>
</html>