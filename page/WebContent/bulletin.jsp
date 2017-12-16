<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		function resizeIframe(i){
			var iframeHeight = (i).contentWindow.document.body.scrollHeight;
			(i).height = iframeHeight+20;
		}
    </script>

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
			width: 10%;
			font-size: 10px;
		}
    </style>
</head>
<body>
    <main role="main">
	<table class="table table-sm">
 	<thead class="thead-dark">
  		<tr>
    		<th scope="col" id="bulletinno">1123</th>
    		<th colspan="2" scope="col"  id="bulletintitle">제목이다~~~~~~~~</th>
		</tr>
    </thead>
    <tbody>
    	<tr>
    		<td colspan="2" id="writer_1">얄리얄리(닉네임)</td>
    		<td>2017.12.14</td>
    	</tr>
		<tr>
  			<td colspan="3">
<pre>
글 내용입니다.
살어리 살어리랏다 쳥산(靑山)애 살어리랏다

멀위랑 다래랑 먹고 쳥산(靑山)애 살어리랏다
얄리 얄리 얄랑셩 얄라리 얄라
우러라 우러라 새여 자고 니러 우러라 새여
널라와 시름 한 나도 자고 니러 우리노라
얄리 얄리 얄라셩 얄라리 얄라
가던 새 가던 새 본다 믈아래 가던 새 본다
잉무든 장글란 가지고 믈아래 가던 새 본다
얄리 얄리 얄라셩 얄라리 얄라
</pre>
  			</td>	
		</tr>
    </tbody>
    </table>
	<iframe width="100%" onload="resizeIframe(this)" src="reply.jsp" frameborder="0">
	</iframe>
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