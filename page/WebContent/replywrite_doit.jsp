<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="reply" class="ssb.dbmanage.ReplyBean" scope="page" />
<jsp:setProperty name="reply" property="*" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
					window.open("board.jsp", "_self");
				</script>
			<%
			return;
		}
		
		reply.setBoardNum(boardNum);
		reply.setContent(request.getParameter("replycontent"));
		reply.setUserSeq(Integer.parseInt(userSeq));
		reply.setBulletinNum(Integer.parseInt(request.getParameter("bulletin")));
		
		int num = reply.replyCreate();
		
		switch(num) {
		case 1:
		%>
			<script>
				window.alert("새 글 생성에 성공하였습니다.");
				document.location.href="bulletin.jsp?read=" + (String)(<%= request.getParameter("read") %>);
			</script>
		<%
			break;
		default:
		%>
			<%= num %>
			<%= boardName %>
			<%= boardNum %>
			<%= reply.getBulletinNum() %>
			<script>
				window.alert("새 글 생성에 실패하였습니다.");
				document.location.href="bulletin.jsp?read=" + (String)(<%= request.getParameter("read") %>);
			</script>
		<%
		}
		
	%>


</body>
</html>