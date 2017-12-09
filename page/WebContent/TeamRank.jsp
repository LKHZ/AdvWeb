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
<jsp:useBean class = "ssb.makeview.TSVBean" id="TSV" scope = "page"/>
	<main role="main">
		<%@ page import="java.util.*"%>

		<div>
		<td><% TSV.AllScore(); %></td>
		<td><% TSV.setleagueNum(2); %></td>
		
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
						
						<%
							for ( int i = 0; i <TSV.getSize() ; i++ ) {
						%>
						<tr>
							<th scope="row">1</th>
							<td><%=TSV.getTeamNum(i) %>
							<td><%=TSV.getTeamWin() %></td>
							<td><%=TSV.getTeamLose() %></td>
							<td><%=TSV.getTeamSame() %></td>
							
						</tr>
							<%
								}
							%>						
						</tbody>
					</table>
      			</div>
      </main>

</body>
</html>