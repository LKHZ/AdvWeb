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


	<%--$(function{
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

      <main role="main">
        <div class="row">
      		<div class="col-lg-4 col-md-4">
   				<!-- 라이브 경기 -->	
      			<div>
      			<center>
      				<div class="input-group date" style="width: 60%;">
      					<input type="text" class="form-control" id="datepick" size=12>
      				</div>	
				</center>
      				<table class="table table-sm">
      					<tbody>
      						<tr>
      							<th colspan="3"><center>KBL</center></th>
      						</tr>
      						<tr style="height: 30px;">
      							<td>
      								<div>팀1</div>
      							</td>
      							<td>
      								<div>시간, 스코어</div>
      							</td>
      							<td>
      								<div>팀2</div>
      							</td>
      						</tr>
      					</tbody>
      				</table>
      			</div>
				<!-- 시즌 순위 -->
      			<div>
      				&nbsp;&nbsp;팀 순위
					<table class="table table-sm">
						<thead>
							<tr>
								<th scope="col" id="ran"></th>
								<th scope="col" id="team">팀명</th>	
								<th scope="col" id="win">승</th>	
								<th scope="col" id="lose">패</th>	
								<th scope="col" id="draw">무</th>	
								<th scope="col" id="pervic">승률</th>	
							</tr>
						</thead>	
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>서울SK</td>
								<td>14</td>
								<td>5</td>
								<td>0</td>
								<td>0.737</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>원주 DB</td>
								<td>13</td>
								<td>6</td>
								<td>0</td>
								<td>0.722</td>
							</tr>
						
						</tbody>
					</table>
      			</div>
      		</div> 
      		
      		<!-- 우측 게시판 -->
      		<div class="col-lg-8 col-md-8">
 	     		<table class="table table-sm table-striped">
	     			<!-- 게시판 헤드 -->
 					<thead class="thead-dark">
   						<tr>
      						<th scope="col" id="no">No</th>
      						<th scope="col" id="cat">Cat</th>
      						<th scope="col" id="sub" style="text-align: center;">Subject</th>
      						<th scope="col" id="nam">Name</th>
      						<th scope="col" id="dat">Date</th>
    					</tr>
  					</thead>
  					<!-- 게시글 -->
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
