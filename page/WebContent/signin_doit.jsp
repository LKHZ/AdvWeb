<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8" %>

<!doctype html>

<jsp:useBean id="signin" class="ssb.dbmanage.SigninBean" scope="page" />
<jsp:setProperty name="signin" property="*" />
<%-- <jsp:useBean id="connect" class="ssb.connect.ConnectUserBean" scope="page" />
<jsp:setProperty name="connect" property="*" /> --%>

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
      int userseq;
      if((userseq = signin.checkUser()) == 0) {
    %>
        <script>
          window.alert("로그인에 실패 하셨습니다.");
          window.open("signin.jsp", "_self");
        </script>
    <%
      }
      else {
    %>
    <%
        //connect.setUserid(signin.getUserid());
        //connect.setPasswd(signin.getPasswd());
        //connect.setConnect(true);
        //session.setAttribute("cntUser", connect);
      String autologin[] = request.getParameterValues("autologin");
      if(autologin != null) {
    	  Cookie cookie[] = new Cookie[4];
    	  cookie[0] = new Cookie("autologin", "OK");
    	  cookie[1] = new Cookie("userid", signin.getUserid());
    	  cookie[2] = new Cookie("passwd", signin.getPasswd());
    	  cookie[3] = new Cookie("userseq", Integer.toString(userseq));

		  for(int i=0; i<4; i++){
			  cookie[i].setMaxAge(60*60); // 한시간 유효
			  response.addCookie(cookie[i]); // 쿠키 추가
		  }
		  %>
	      <script>
	        window.alert("자동로그인.");
	      </script>
	      
	    <%
      }
      
      session.setAttribute("logon", "true");
      session.setAttribute("userid", signin.getUserid());
      session.setAttribute("passwd", signin.getPasswd());
      session.setAttribute("userseq", userseq);
    %>
      <script>
        window.alert("로그인에 성공 하셨습니다.");
        window.open("index.jsp", "_self");
      </script>
      
    <%
      }
    %>

    <%-- <HR>
    입력 아이디 : <jsp:getProperty name="signin" property="userid" /> <BR>
    입력 패스워드 : <jsp:getProperty name="signin" property="passwd" /> <BR> --%>

  </body>
</html>
