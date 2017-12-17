<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="board" class="ssb.dbmanage.BoardBean" scope="page" />
<jsp:setProperty name="board" property="*" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
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
		String boardName = request.getParameter("board");
		String userSeq = session.getAttribute("userseq").toString();
		int boardNum;
		if(boardName.equals("baseball")) {
			boardNum = 1;
		}
		else if(boardName.equals("basketball")) {
			boardNum = 2;
		}
		else if(boardName.equals("soccer")) {
			boardNum = 3;
		}
		else {
			boardNum = 0;
			%>
				<script>
					window.alert("게시판이 선택되지 않았습니다." + <%= boardName %> + "   " + <%= boardNum %>);
					document.location.href="board.jsp?page=1";
				</script>
			<%
			return;
		}
		board.setBoardNum(boardNum);
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		board.setUserSeq(Integer.parseInt(userSeq));
		int num = board.bulletinCreate();
		
		switch(num) {
		case 1:
		%>
			<script>
				window.alert("새 글 생성에 성공하였습니다.");
				document.location.href="board.jsp?page=1";
			</script>
		<%
			break;
		default:
		%>
			<%= num %>
			<%= boardName %>
			<%= boardNum %>
			<script>
				window.alert("새 글 생성에 실패하였습니다.");
				document.location.href="board.jsp?page=1";
			</script>
		<%
		}
		
	%>
</body>
</html>