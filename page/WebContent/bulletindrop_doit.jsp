<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="board" class="ssb.dbmanage.BoardBean" scope="page" />
<jsp:setProperty name="board" property="*" />
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title>Sports Score Board</title>
    <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="cssjs/navbar.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="cssjs/style.css">
    <script src = "jquery-3.2.1.js"></script>

    <%
      request.setCharacterEncoding("UTF-8");
    %>
</head>
<body>
	<%
		int bulletinNum = Integer.parseInt(request.getParameter("bulletin"));
	
		int num = board.bulletinDrop(bulletinNum);
		
		switch(num) {
		case 1:
		%>
			<script>
				window.alert("글 삭제에 성공하였습니다.");
				document.location.href="board.jsp?page=" + (String)(<%= session.getAttribute("page") %>);
			</script>
		<%
			break;
		default:
		%>
			<%= num %>
			<script>
				window.alert("글 삭제에 실패하였습니다.");
				document.location.href="board.jsp?page=" + (String)(<%= session.getAttribute("page") %>);
			</script>
		<%
		}
		
	%>
</body>
</html>