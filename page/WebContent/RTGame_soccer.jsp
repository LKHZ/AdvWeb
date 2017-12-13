<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>Sports Score Board</title>

    <link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="cssjs/navbar.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="cssjs/style.css">
    <script src = "jquery-3.2.1.js"></script>
</head>
<body>
<jsp:useBean class = "ssb.makeview.RTGameBean" id="RTG" scope = "page"/>
	<% RTG.setValue(1); %>
	<main role="main">
	 <div id="carouselExampleIndicators1" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
          	<% for(int i=0; i<RTG.getSize(); i++){
          		if(i==0){ %>
          			 <li data-target="#carouselExampleIndicators1" data-slide-to="0" class="active"></li>
          		<%}
          		else{%>
          			<li data-target="#carouselExampleIndicators1" data-slide-to=i></li>
          			<%
          		}
          	}
          	%> 
          </ol>
          <div class="carousel-inner">
            <%if(RTG.getSize()==0){%>
					<div class="row">
							<div class="col text-center">
      							<h5> 진행중인 </h5>
      						</div>
					</div>
      				<div class="row">
							<div class="col text-center">
      							<h5> 경기가 </h5>
      						</div>
					</div>
      				<div class="row">
							<div class="col text-center">
      							<h5> 없습니다. </h5>
      						</div>
					</div>
          		 </div>
          	<%}
            else{ 
          	  for(int i=0; i<RTG.getSize(); i++){
          		 if(i==0){%>
          		 <div class="carousel-item active">
          		 		<div class="row">
          		 			<div class="col-lg text-center mb-3">
          		 				<%=RTG.getLeagueName(i)%>
          		 			</div>
          		 		</div>
      					<div class="row">
      							<div class="col-lg-5 col-mg-5">
      								<p class="text-right"><%=RTG.gethtName(i)%></p>
      							</div>
      							<div class="col-lg-2 col-mg-2">
      								<p class="text-center">VS</p>
      							</div>
      							<div class="col-lg-5 col-mg-5">
      								<p class="text-left"><%=RTG.getatName(i)%><p>
      							</div>
      						</div>
      					<div class="row">
      							<div class="col-lg-5 col-mg-5">
      								<p class="text-right mr-4"><%=RTG.gethtScore(i)%></p>
      							</div>
      							<div class="col-lg-2 col-mg-2">
      								<p class="text-center">:</p>
      							</div>
      							<div class="col-lg-5 col-mg-5">
      								<p class="text-left ml-4"><%=RTG.getatScore(i)%><p>
      							</div>
      					</div>
          		 </div>
          		 
          	  <%}
          		 else{
          		%>  <div class="carousel-item">
          		 		<div class="row">
          		 			<div class="col-lg text-center mb-3">
          		 				<%=RTG.getLeagueName(i)%>
          		 			</div>
          		 		</div>
      					<div class="row">
      							<div class="col-lg-5 col-mg-5">
      								<p class="text-right"><%=RTG.gethtName(i)%></p>
      							</div>
      							<div class="col-lg-2 col-mg-2">
      								<p class="text-center">VS</p>
      							</div>
      							<div class="col-lg-5 col-mg-5">
      								<p class="text-left"><%=RTG.getatName(i)%><p>
      							</div>
      						</div>
      					<div class="row">
      							<div class="col-lg-5 col-mg-5">
      								<p class="text-right mr-4"><%=RTG.gethtScore(i)%></p>
      							</div>
      							<div class="col-lg-2 col-mg-2">
      								<p class="text-center">:</p>
      							</div>
      							<div class="col-lg-5 col-mg-5">
      								<p class="text-left ml-4"><%=RTG.getatScore(i)%><p>
      							</div>
      					</div>
          		 </div>	 
          		<%
          		 }
          	  }
            }
          	%> 	        
       
          <a class="carousel-control-prev" href="#carouselExampleIndicators1" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators1" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </main>

</body>
</html>