<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8"  %>	
<!doctype html>
<html>
  <head> 
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="icon" href="img/soccer-ball-variant.png">
    <title>Sports Score Board</title>

    <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="cssjs/navbar.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="cssjs/style.css">
    <link type="text/css" rel="stylesheet" href="cssjs/board.css">
    <script src = "jquery-3.2.1.js"></script>

    <%-- <script>
      $(document).ready(function(){
        $('#loginbtn').on('click', function(){
          window.open('signin.jsp', '_self');
        });
      });
    </script> --%>
  </head>
  <body>
    <div class="container">
      <jsp:include page="header.jsp">
        <jsp:param name="callpage" value="index_basketball.jsp" />
      </jsp:include> 

      <main role="main">
        <div class="row">
      		<div class="col-lg-4 col-md-4">
      			<div class="row">
      				<div class="container">
      					
      				<jsp:include page="RTGame.jsp">
       					<jsp:param name="game" value="index_basketball.jsp" />
      				</jsp:include>
      						 
      				</div>
      			</div>
      			<div class="row">
      				<div class="container">
      					
      				<jsp:include page="TeamRank.jsp">
       					<jsp:param name="game" value="index_basketball.jsp" />
      				</jsp:include>
      						 
      				</div>
      			</div>
      			
      		</div>
      		
      		<div class="col-lg-8 col-md-8">
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
  					</tbody>
				</table>
      			<div>
	       			<button type="button" class="btn btn-sm btn-danger " id="write" style="float: right;">글쓰기</button>
      			</div>
      		</div>
      	</div>
      </main> 

      <footer class="footer">
        <p>Copyright© Lee*2+Kang</p>
      </footer>
    </div> <!-- /container -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="bootstrap/assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="bootstrap/assets/js/vendor/popper.min.js"></script>
    <script src="bootstrap/dist/js/bootstrap.min.js"></script>
  </body>
</html>
