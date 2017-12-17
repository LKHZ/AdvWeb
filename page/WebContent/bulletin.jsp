<%@page import="ssb.content.ReplyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="ssb.content.BulletinDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="ssb.content.ReplyDTO" %>
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

    <!-- iframe 높이 가변적으로 변경 -->
    <script>
<<<<<<< HEAD
        $(document).ready(function() {
=======
		function resizeIframe(i){
			var iframeHeight = (i).contentWindow.document.body.scrollHeight;
			(i).height = iframeHeight+20;
		}
    </script>

    <script>
        <%-- $(document).ready(function() {
>>>>>>> branch 'master' of https://Getjy@bitbucket.org/TOT0Ro/ssb.git
            $('#bulletinwrite').on('click', function() {
            	<%
            		if(session.getAttribute("logon") == "true") {
            	%>
<<<<<<< HEAD
		            	window.open("bulletinwrite.jsp, "_self");
=======
		            	window.open("bulletinwrite.jsp", "_self");
>>>>>>> branch 'master' of https://Getjy@bitbucket.org/TOT0Ro/ssb.git
		        <%
            		}
            		else {
            	%>
            			window.alert("로그인을 해주세요");
            	<%
            		}
            	%>
            });
        }); --%>
        $(document).ready(function() {
        	<%
        		int i = Integer.parseInt(request.getParameter("read"));
        	
	        	@SuppressWarnings("unchecked")
        		ArrayList<BulletinDTO> bulletins = (ArrayList<BulletinDTO>)session.getAttribute("bulletins");
        		
        		BulletinDTO bulletin = bulletins.get(i);
        		
        		//session.setAttribute("read", new ArrayList<BulletinDTO>());
        	%>
        });
        
        
        $(document).ready(function() {
        	$('#listbtn').on('click', function() {
        		document.location.href="board.jsp?page=" + (String)(<%= session.getAttribute("page") %>);
        	});
        });
        
        $(document).ready(function() {
        	$('#dropbtn').on('click', function() {
        		<%
	        		if(session.getAttribute("logon") == "true" && session.getAttribute("userid").toString().equals(bulletin.getUserid())) {
	        	%>
	        			document.location.href="bulletindrop_doit.jsp?bulletin=" + (String)(<%= bulletin.getId() %>);
		        <%
	        		}
	        		else {
	        	%>
	        			window.alert("본 계정의 게시물이 아닙니다.");
	        	<%
	        		}
	        	%>
        	});
        });
        <%--<%
		ReplyDTO most = reply.mostReply(bulletin.getId());
		if(most.getId() > (int)session.getAttribute(Integer.toString(bulletin.getId()))) {
		//if((Integer)(application.getAttribute(
		//		Integer.toString(bulletin.getId()))) 
		//		> (Integer)(session.getAttribute(Integer.toString(bulletin.getId())))) {
	%>
			$('#replyframe').attr('src', $('#replyframe').attr('src'));
	<%
		}
	%>--%>
        $(document).ready(function() {
        	<%
        		if(session.getAttribute(
        				Integer.toString(bulletin.getId())) == null) {
        			session.setAttribute(Integer.toString(bulletin.getId()), 0);
        		}
        	%>
        	var reloadReply = setInterval(function() {
        		//if(<%= (reply.mostReply(bulletin.getId())).getId()%> > <%= session.getAttribute(Integer.toString(bulletin.getId()))%>) {
        			$('#replyframe').attr('src', $('#replyframe').attr('src'));
        			//$('#replyframe').contentWindow.location.reload(true);
        		//}
        	}, 2000);
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
			width: 10%;
			font-size: 10px;
		}
		pre {
			white-space: normal;
			word-break: keep-all;
			word-spacing: 5px;
			word-wrap: break-word;
			
		}
    </style>
</head>
<body>
    <main role="main">
	<table class="table table-sm">
 	<thead class="thead-dark">
  		<tr>
    		<th scope="col" id="bulletinno"><%= bulletin.getId() %></th>
    		<th colspan="2" scope="col"  id="bulletintitle"><%= bulletin.getTitle() %></th>
		</tr>
    </thead>
    <tbody>
    	<tr>
    		<td colspan="2" id="writer_1"><%= bulletin.getUserid() %></td>
    		<td><%= bulletin.getDate() %></td>
    	</tr>
		<tr>
  			<td colspan="3" >
				<pre>
					<%= bulletin.getContent() %>
				</pre>

  			</td>
		</tr>
		
    </tbody>
    </table>

	<%-- <main role="main">
		<form action="replywrite_doit.jsp" method="POST">
        <!-- 4*3 col-->
        <input type=hidden name=board value=<%= session.getAttribute("board") %>>
        <div class="row">
          <div class="col-lg-11 col-md-11 col-sm-10 col-xs-12">
            <textarea id="replycontent" name="replycontent" rows="5" ></textarea>
          </div>
          <div class="col-lg-1 col-md-1 col-sm-2 col-xs-3">
            <button id="submitreply" type="submit" class="btn btn-sm btn-danger btn-block" >댓글입력</button>
          </div>
        </div>
        </form>
    </main> --%>
    
    <main role="main">
        <form method="post" action="replywrite_doit.jsp">
        	<input type=hidden name=board value=<%= session.getAttribute("board") %>>
        	<input type=hidden name=bulletin value=<%= bulletin.getId() %>>
        	<input type=hidden name=read value=<%= i %>>
        	<table class="table table-sm">
  				<tbody>
  					<%
            			if(session.getAttribute("logon") == "true") {
            		%>
		         		   	<tr>
								<td colspan="2">
									<textarea id="replycontent" name="replycontent" rows="5" ></textarea>
								</td>
								<td style="width: 20px;">
		        					<button id="submitreply" type="submit" class="btn btn-sm btn-danger btn-block" >댓글입력</button>
								</td>
							</tr>
		        	<%
            			}
            			else {
            		%>
            				<tr>
								<td colspan="2">
									<textarea id="replycontent" disabled="disabled" name="replycontent" rows="5" >댓글을 입력하시려면 로그인을 해주세요.</textarea>
								</td>
								<td style="width: 20px;">
		        					<button id="submitreply" disabled="disabled" type="submit" class="btn btn-sm btn-danger btn-block" >댓글입력</button>
								</td>
							</tr>
            		<%
            			}
            		%>
  					
   					
				</tbody>
			</table>
		</form>
	</main>
      
		
	<iframe runat="server" id="replyframe" width="100%" onload="resizeIframe(this)" 
		src="reply.jsp?bulletin=<%= bulletin.getId() %>" frameborder="0">
	</iframe>
	
	<button type="button" id="listbtn" class="btn btn-sm btn-danger" style="float: left; margin-left: 10px;">목록</button>
	<button type="button" id="dropbtn" class="btn btn-sm btn-danger" style="float: left; margin-left: 10px;">삭제</button>
	

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