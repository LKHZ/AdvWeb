<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ page import="ssb.content.BulletinDTO" %>
<%@ page import="java.util.ArrayList" %>

<jsp:useBean id="board" class="ssb.dbmanage.BoardBean" scope="page" />
<jsp:setProperty name="board" property="*" />


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">


    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="cssjs/navbar.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="cssjs/style.css">
    <link type="text/css" rel="stylesheet" href="cssjs/board.css">
    <script src = "jquery-3.2.1.js"></script>
    <script>
    	//var board = ;
        $(document).ready(function() {
            $('#bulletinwrite').on('click', function() {
            	<%
            		if(session.getAttribute("logon") == "true") {
            	%>
		            	window.open("bulletinwrite.jsp", "_self");
		        <%
            		}
            		else {
            	%>
            			window.alert("로그인을 해주세요");
            	<%
            		}
            	%>
            });
        });
    </script>
	<%
		String boardName = (String)session.getAttribute("board");
		int pageNum = Integer.parseInt(request.getParameter("page"));
		if(!(pageNum > 1)) {
			pageNum = 1;
		}
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
		
		ArrayList<BulletinDTO> bulletins;

		bulletins = board.bulletinList(boardNum);
		
		session.setAttribute("bulletins", bulletins);
		
	%>

	<script>
	
		
		function clickBulletinEvent() {
			<%
//				BulletinDTO bulletin = bulletins.get(i+(pageNum-1)*10);
//				session.setAttribute("read", bulletin);
			%>
			window.open("bulletin.jsp", "_self");
		}

		function clickPageEvent(np) {
			if(np = 1 && pageNum < bulletins.size()/10+1) {
				<%
					session.setAttribute("page", pageNum + 1);
				%>
			}
			else if(np = 0 && pageNum > 1){
				<%
					session.setAttribute("page", pageNum - 1);
				%>
			}
			window.open("board.jsp", "_self");
		}
	</script>
</head>
<body>
    <main role="main">
		<table class="table table-sm table-striped">
 		<thead class="thead-dark">
  			<tr>
    			<th scope="col" width="5%">No</th>
    			<th scope="col" width="55%" style="text-align: center;">Subject</th>
        		<th scope="col" width="20%">Name</th>
  				<th scope="col" width="20%">Date</th>
			</tr>
    	</thead>
    	<tbody>
			<%
				int pageUnit = (pageNum-1)*10;
				for(int i=0+pageUnit; i<(bulletins.size()<10?bulletins.size():10)+pageUnit; i++) {
			%>
				<tr>
					<th scope="row"><%= bulletins.get(i).getId() %></th>
					<% BulletinDTO bllt = bulletins.get(i); %>
					<td><a href="bulletin.jsp?read=<%= i %>" target="_self"><%= bulletins.get(i).getTitle() %></a></td>
					<td><%= bulletins.get(i).getUserid() %></td>
					<td><%= bulletins.get(i).getDate() %></td> 
				</tr>
			<% } %>

	    </tbody>
		</table>
	    <hr>

		<button type="button" class="btn btn-sm btn-danger " id="bulletinwrite" style="float: right;">글쓰기</button>
   		<nav aria-label="Page navigation example">
  			<ul class="pagination justify-content-center">
  				<!-- 왼쪽화살표 -->
    			<li class="page-item">
      				<a class="page-link" href="board.jsp?page=1" target="_self" aria-label="Lirst">
        				<span aria-hidden="true">&laquo;</span>
        				<span class="sr-only">First</span>
      				</a>
    			</li>
    			<!-- pagination -->
				<%
					int pageSize = bulletins.size()/10+1;
					int startPage;
					int endPage;
					if(pageNum < 4) {
						startPage = 1;
						endPage = (pageSize < 5 ? pageSize : 5);
					}
					else if(pageNum > pageSize - 3) {
						startPage = pageSize - 4;
						endPage = pageSize;
					}
					else {
						startPage = pageNum - 2;
						endPage = pageNum + 2;
					}
					for(int j=startPage; j<=endPage; j++) {
				%>
    			<li class="page-item"><a class="page-link" href="board.jsp?page=<%= j %>" target="_self"><%= j %></a></li>
					
    			<% } %>
    			<!--<li class="page-item"><a href="#">1</a></li>
    			<li class="page-item"><a href="#">2</a></li>
    			<li class="page-item"><a href="#">3</a></li> -->
					<!-- 오른쪽화살표 -->
    			<li class="page-item">
      				<a class="page-link" href="board.jsp?page=<%= pageSize %>" target="_self" aria-label="Last">
        				<span aria-hidden="true">&raquo;</span>
        				<span class="sr-only">Last</span>
      				</a>
    			</li>
  			</ul>
		</nav>
    </main> 
					
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="bootstrap/assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="bootstrap/assets/js/vendor/popper.min.js"></script>
    <script src="bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>