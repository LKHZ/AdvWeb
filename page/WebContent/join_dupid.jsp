<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8" %>	

<jsp:useBean id="join" class="ssb.dbmanage.JoinBean" scope="request" />
<jsp:setProperty name="join" property="*" />

<%
  request.setCharacterEncoding("UTF-8");

  if(join == null) {
    %>
    <script> alert("join이 전달되지 않음."); </script>
    <%
  }

  String ident = request.getParameter("userid");
  if(join.duplicationCheckIdent(ident)) {
    %>
    <script> window.alert("중복되지 않는 아이디입니다."); </script>
    <%
  }
  else {
    %>
    <script> window.alert("이미 있는 아이디입니다."); </script>
    <%
  }

%>