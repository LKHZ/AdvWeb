<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8"  %>	

<!doctype html>
<html>
  <head> 
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <%-- <link rel="icon" href="img/soccer-ball-variant.png"> --%>
    <title>Sports Score Board</title>

    <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="cssjs/navbar.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="cssjs/style.css">
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
        <jsp:param name="callpage" value="index_baseball.jsp" />
      </jsp:include> 

     <div >
        <form method="post" action="">
 	     	<table class="table">
  				<tbody>
  					<tr>
  						<td>카테고리 &nbsp;<select name="category">
  							<option value="sports">Sports</option>	
  							<option value="chat">chat</option>
  						</select></td>
  					</tr>
    				<tr>
    					<td><input type="text" class="form-control" placeholder="글 제목" maxlength="50"></td>
    				</tr>
    				<tr>
    					<td><textarea class="form-control" placeholder="글 내용" maxlength="2048" style="height: 350px"></textarea></td>
    				</tr>	
  				</tbody>
			</table>
	        <button type="submit" class="btn btn-sm btn-danger" style="float: right;">글쓰기</button>
      	</form>
   	</div>
	<div style="position: relative">
	  <footer class="footer" style="margin-top: 60px;">
        <p>Copyright© Lee*2+Kang</p>
      </footer>
     </div>
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