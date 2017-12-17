<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="ssb.content.ReplyDTO" %>
<%@ page import="java.util.ArrayList" %>

<jsp:useBean id="reply" class="ssb.dbmanage.ReplyBean" scope="page" />
<jsp:setProperty name="reply" property="*" />


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
    <script src = "jquery-3.2.1.js"></script>
    <script>
    	var board = <%= request.getAttribute("game") %>;
        $(document).ready(function() {
            $('#bulletinwrite').on('click', function() {
            	<%
            		if(session.getAttribute("logon") == "true") {
            	%>
		            	window.open("bulletinwrite.jsp?board="+board, "_self");
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
    <style>
   		#bulletinno th{
   			width: 10%;
   		} 
   		#bulletintitle th{
   			width: 90%;	
   		}
		textarea{
	  		border:1px solid #999999;
	  		width:100%;
	  		margin:5px 0;
	  		padding:3px;
		}
		#writer_1{
			padding-left: 20px;
		}
		#date_1{
			text-aligh: right;
			padding-right: 20px;
		}
		#writer_2{
			width: 20%;
			padding-left: 20px;
		}
		#date_2{
			width: 15%;
			font-size: 10px;
		}
    </style>
    
    <%
    	int bulletinNum = Integer.parseInt(request.getParameter("bulletin"));
    	
    	ArrayList<ReplyDTO> replys;
    	
    	replys = reply.replyList(bulletinNum);
    	if(replys.size() > 0) {	
	    	session.setAttribute(Integer.toString(bulletinNum), replys.get(0).getId());
	    	
    	}
    %>
</head>
<body>
    <main role="main">
	<form method="post" action="#">
	<table class="table table-sm">
    <tbody>
    	<%
    		for(int i=0; i<replys.size(); i++) {
    	%>
    			<tr>
					<td id="writer_2"><%= replys.get(i).getUserid() %></td>
					<td><%= replys.get(i).getContent() %></td>
					<td id="date_2"><%= replys.get(i).getDate() %></td>
				</tr>
    	<% } %>
    </tbody>
    </table>
	</form>
<%-- 
    <div>
		<button type="button" class="btn btn-sm btn-danger " id="bulletinwrite" style="float: right;">글쓰기</button>
	</div> 
--%>

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