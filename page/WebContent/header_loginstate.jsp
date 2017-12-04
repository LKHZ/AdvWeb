<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8"  %>	
<%-- <jsp:useBean id="connect" class="ssb.connect.ConnectUserBean" scope="page" />
<jsp:setProperty name="connect" property="*" /> --%>
<%@ include file="initsession.jsp" %> <%-- 세션 만료시 세션 초기화 --%>
<html>
  <head>
    <script>
      $(document).ready(function(){
        $('#loginbtn').on('click', function(){
          window.open('signin.jsp', '_self');
        });
      });
      $(document).ready(function(){
        $('#logoutbtn').on('click', function(){
          window.open('logout_doit.jsp', '_self');
        })
      })
    </script>
  </head>
  <body>
    <%
      if(session.getAttribute("logon") == "true") {
    %>
    /
    <%= session.getAttribute("userid") %>
    /
    <%= session.getAttribute("passwd") %>
    /
    <button type="button" class="btn btn-danger" id="logoutbtn">Logout</button>
    <%
      }
      else {
    %>
    <button type="button" class="btn btn-danger" id="loginbtn">Login</button>
    <%
      }
    %>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="bootstrap/assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="bootstrap/assets/js/vendor/popper.min.js"></script>
    <script src="bootstrap/dist/js/bootstrap.min.js"></script>
  </body>
</html>