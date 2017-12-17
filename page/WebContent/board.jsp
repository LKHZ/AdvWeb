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
		int pageNum = (int)session.getAttribute("page");
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
	%>
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
				for(int i=0+(pageNum-1)*20; i<(bulletins.size()<20?bulletins.size():20)+(pageNum-1)*20; i++) {
			%>
				<script> var vv = <%= i %>; alert(i); </script>
				<tr>
					<th scope="row"><%= bulletins.get(i).getId() %></th>
					<td><a href="bulletin.jsp" target="_serlf"><%= bulletins.get(i).getTitle() %></a></td>
					<td><%= bulletins.get(i).getUserid() %></td>
					<td><%= bulletins.get(i).getDate() %></td>
				</tr>
			<% } %>

			<tr>
  				<th scope="row">4</th>
  				<td><a href="bulletin.jsp" target="_self">sub1111</a></td>
  				<td>lee</td>
	  			<td>2017.12.07  17:54</td>
			</tr>
			<tr>
  				<th scope="row">3</th>
  				<td><a href="#">sub2222</a></td>
  				<td>lee</td>
	  			<td>2017.12.07  17:54</td>
			</tr>
			<tr>
  				<th scope="row">2</th>
  				<td><a href="#">sub33333</a></td>
  				<td>lee</td>
	  			<td>2017.12.07  17:54</td>
			</tr>
			<tr>
  				<th scope="row">1</th>
  				<td><a href="#">sub33333</a></td>
  				<td>lee</td>
	  			<td>2017.12.07  17:54</td>
			</tr>
	    </tbody>
		</table>
	    <hr>

		<button type="button" class="btn btn-sm btn-danger " id="bulletinwrite" style="float: right;">글쓰기</button>
   		<nav aria-label="Page navigation example">
  			<ul class="pagination justify-content-center">
  				<!-- 왼쪽화살표 -->
    			<li class="page-item">
      				<a class="page-link" href="#" aria-label="Previous">
        				<span aria-hidden="true">&laquo;</span>
        				<span class="sr-only">Previous</span>
      				</a>
    			</li>
    			<!-- pagination -->
    			<li class="page-item"><a class="page-link" href="#">1</a></li>
    			<li class="page-item"><a class="page-link" href="#">2</a></li>
    			<li class="page-item"><a class="page-link" href="#">3</a></li>
    			<!-- 오른쪽화살표 -->
    			<li class="page-item">
      				<a class="page-link" href="#" aria-label="Next">
        				<span aria-hidden="true">&raquo;</span>
        				<span class="sr-only">Next</span>
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