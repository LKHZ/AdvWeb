<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

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
<jsp:useBean class = "ssb.makeview.TSVBean" id="TSV" scope = "page"/></jsp>
	<main role="main">
		<%@ page import="java.util.*"%>
		<%TSV.setSportsnum(3); %>
		<% TSV.AllScore(3); %>
		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
          	<%
          	for(int i=0; i<TSV.getSportsnum(); i++){
          		if(i==0){
          			%>
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <%	}
          		else{
          		%>
          			<li data-target="#carouselExampleIndicators" data-slide-to=i></li>
          		<% }
          		} %>
          </ol>
          <div class="carousel-outter">
          <%
          for(int j=0; j<TSV.getSportsnum(); j++){
          		if(j==0){
          			%>
                     <div class = "carousel-item active">
				
				<td><% TSV.setleagueNum(j); %></td>
				&nbsp;<%=TSV.getLeagueName() %>
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
						<% TSV.setRank(); %>
						<%				
						for ( int i = 0; i <TSV.getSize() ; i++ ) {
						%>
							<th scope="row"><%=i+1%></th>
							<td><%=TSV.getTeamName(i) %>
							<td><%=TSV.getTeamWin(i) %></td>
							<td><%=TSV.getTeamLose(i) %></td>
							<td><%=TSV.getTeamSame(i) %></td>
							<td><%=TSV.getRate(i) +"%" %></td>
						</tr>
						<%}%>						
					</tbody>
				</table>
			</div>
                    <%	}
          		else{
          		%>
          			 <div class = "carousel-item">
				</td><td><% TSV.setleagueNum(j); %>
				&nbsp;<%=TSV.getLeagueName() %>
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
						<% TSV.setRank(); %>
						<%				
						for ( int i = 0; i <TSV.getSize() ; i++ ) {
						%>
							<th scope="row"><%=i+1%></th>
							<td><%=TSV.getTeamName(i) %>
							<td><%=TSV.getTeamWin(i) %></td>
							<td><%=TSV.getTeamLose(i) %></td>
							<td><%=TSV.getTeamSame(i) %></td>
							<td><%=TSV.getRate(i) +"%" %></td>
						</tr>
						<%}%>						
					</tbody>
				</table>
			</div>
          		<% }
          		} %>
          </div>

		
			<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
      </main>
</body>
</html>