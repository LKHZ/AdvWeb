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
</head>
<body>
    <main role="main">
	<table class="table table-sm table-striped">
 	<thead class="thead-dark">
  		<tr>
    		<th scope="col" id="no">No</th>
    		<th scope="col" id="cat">Cat</th>
    		<th scope="col" id="sub" style="text-align: center;">Subject</th>
        	<th scope="col" id="nam">Name</th>
  			<th scope="col" id="dat">Date</th>
		</tr>
    </thead>
    <tbody>
		<tr>
  			<th scope="row">1</th>
  			<td>Sport</td>
  			<td><a href="#">sub1111</a></td>
  			<td>lee</td>
  			<td>2017.12.07</td>
		</tr>
		<tr>
  			<th scope="row">2</th>
  			<td>Sport</td>
  			<td><a href="#">sub2222</a></td>
  			<td>lee</td>
  			<td>2017.12.07</td>
		</tr>
		<tr>
  			<th scope="row">3</th>
  			<td>Sport</td>
  			<td><a href="#">sub33333</a></td>
  			<td>lee</td>
  			<td>2017.12.07</td>
		</tr>
		<tr>
  			<th scope="row">4</th>
  			<td>Sport</td>
  			<td><a href="#">sub33333</a></td>
  			<td>lee</td>
  			<td>2017.12.07</td>
		</tr>
    </tbody>
    </table>

    <div>
		<button type="button" class="btn btn-sm btn-danger " id="bulletinwrite" style="float: right;">글쓰기</button>
	</div>
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