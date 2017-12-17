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
  
  <%
  	session.setAttribute("board", "index");
  %>
  </head>
  <body>
  <%@ page import="org.json.simple.JSONArray"%>
  <%@ page import="org.json.simple.JSONObject" %>
  <%@ page import = "org.json.simple.parser.JSONParser"%>
    <div class="container">
      <jsp:include page="header.jsp">
        <jsp:param name="callpage" value="index_baseball.jsp" />
      </jsp:include> 

      <main role="main">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img class="d-block w-100" src="img/soccer.png" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" src="img/baseball.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" src="img/basketball.jpg" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </main>
	
	<div class"fixed-bottom">
      <footer class="footer">
        <p>CopyrightÂ© Lee*2+Kang</p>
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