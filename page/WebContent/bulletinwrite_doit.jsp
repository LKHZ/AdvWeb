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

    <%
      request.setCharacterEncoding("UTF-8");
    %>
</head>
<body>
	<%
		String boardName = request.getParameter("board");
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
					window.open("board.jsp?game="+<%= boardName %>+"&page=1", "_self");
				</script>
			<%
			return;
		}
		board.setBoardNum(boardNum);
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		int num = board.bulletinCreate();
		
		switch(num) {
		case 1:
		%>
			<script>
				window.alert("새 글 생성에 성공하였습니다.");
				window.open("board.jsp?game="+<%= boardName %>+"&page=1", "_self");
			</script>
		<%
			break;
		default:
		%>
			<%= num %>
			<script>
				window.alert("새 글 생성에 실해하였습니다.");
				window.open("board.jsp??game="+<%= boardName %>+"&page=1", "_self");
			</script>
		<%
		}
		
	%>
</body>
</html>