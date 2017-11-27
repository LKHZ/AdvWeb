<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8"  %>

<jsp:useBean id="signin" class="ssb.signin.SigninBean" scope="page" />
<jsp:setProperty name="signin" property="*" />
<%-- <jsp:useBean id="connect" class="ssb.connect.ConnectUserBean" scope="page" />
<jsp:setProperty name="connect" property="*" /> --%>


<!doctype html>
<html>
  <head> 
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="soccer-ball-variant.png">
    
    <title>Sports Score Board</title>

    <%
      request.setCharacterEncoding("UTF-8");
    %>
  </head>
  <body>
    <%
      signin.setUserid(request.getParameter("userid"));
      signin.setPasswd(request.getParameter("passwd"));
      if(!signin.checkUser()) {
    %>
      <script> window.alert("로그인에 실패 하셨습니다."); </script>
    <%
      }
      else {
    %>
      <script> window.alert("로그인에 성공 하셨습니다."); </script>
    <%
        //connect.setUserid(signin.getUserid());
        //connect.setPasswd(signin.getPasswd());
        //connect.setConnect(true);
        //session.setAttribute("cntUser", connect);
        session.setAttribute("logon", "true");
        session.setAttribute("userid", signin.getUserid());
        session.setAttribute("passwd", signin.getPasswd());
      }
    %>

    <HR>
    입력 아이디 : <jsp:getProperty name="signin" property="userid" /> <BR>
    입력 패스워드 : <jsp:getProperty name="signin" property="passwd" /> <BR>

    <jsp:forward page="index.jsp">
      <jsp:param name="callpage" value="signin_doit.jsp" />
    </jsp:forward>
  </body>
</html>
