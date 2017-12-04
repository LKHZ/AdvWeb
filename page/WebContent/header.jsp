<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8"  %>	
<%-- <%@ include file="initsession.jsp" %> --%>
<%@ include file="initsession.jsp" %>

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
    <script src = "jquery-3.2.1.js"></script>
    <style>
      header a:link{color:#868e96; text-decoration:none;}
      header a:visited{color:#868e96; text-decoration:none;}
      header a:active{color:#868e96; text-decoration:none;}
      header a:hover{color:#868e96; text-decoration:none;}
    </style>
    <%-- <jsp:include page="initsession.jsp">
      <jsp:param name="callpage" value="header.jsp" />
    </jsp:include> --%>

  </head>

  <body>
      
      <header class="masthead">
      <h3 class="text-muted"><a href="index.jsp" target="_self"><img src="img/soccer-ball-variant.png"><span id="forTitle">Sports Score Board</span></a></h3>
        <nav class="navbar navbar-expand-lg navbar-light bg-light rounded">
          <div class="navbar-brand" id="menu">Menu</div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarsExample09">
            <ul class="navbar-nav mr-auto">
              <li class="nav-item active" id="menuButton">
                <a class="nav-link" href="index_live.jsp" target="_self">Live<span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item" id="menuButton">
                <a class="nav-link" href="index_soccer.jsp" target="_self">축구</a>
              </li>
              <li class="nav-item" id="menuButton">
                <a class="nav-link" href="index_basketball.jsp" target="_self">농구</a>
              </li>
              <li class="nav-item" id="menuButton">
                <a class="nav-link" href="index_baseball.jsp" target="_self">야구</a>
              </li>
            </ul>
            <form class="form-inline my-2 my-md-0">
              <jsp:include page="header_loginstate.jsp">
                <jsp:param name="callpage" value="header.jsp" />
              </jsp:include>
            </form>
          </div>
        </nav>
      </header>
    
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="bootstrap/assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="bootstrap/assets/js/vendor/popper.min.js"></script>
    <script src="bootstrap/dist/js/bootstrap.min.js"></script>
  </body>
</html>
