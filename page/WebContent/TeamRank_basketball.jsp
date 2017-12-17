<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
@media (min-width: 768px) {
  .modal-dialog {
    width: 600px;
    margin: 30px auto;
  }
}
@media (min-width: 768px) {
  .modal-xl {
    width: 90%;
   max-width:1200px;
  }
}

#MyModal {}

.modal-body {
  overflow-x: auto;
}


.Pikaday{
	z-index: 100000;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sports Score Board</title>
  
    <link rel="stylesheet" href="Pikaday-master/css/pikaday.css">
    <link rel="stylesheet" href="Pikaday-master/css/site.css">
	
	<link href="cssjs/navbar.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="cssjs/style.css">
    <script src = "jquery-3.2.1.js"></script>
    
    
    <jsp:useBean class = "ssb.makeview.TSVBean" id="TSV" scope = "page"/></jsp>
    <jsp:useBean class = "ssb.makeview.TGBean" id="TG" scope = "page"/></jsp>
    <script type="text/javascript">    
   		function clickTrEvent(trObj){
   	 		$("#myModal"+trObj.id).modal('show');
    	}
        
	</script>

</head>
<body>
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
				
				<% TSV.setleagueNum(j); 
				int a = TSV.getSize();%>
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
						<tr id=<%=i+(j*a)%> onclick = "javascript:clickTrEvent(this)">
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
				<%int a = TSV.getSize();
				TSV.setleagueNum(j); 
				%>
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
						<tr id=<%=i+(j*a)%> onclick = "javascript:clickTrEvent(this)">
							<th scope="row"><%=i+1%></th>
							<td><%=TSV.getTeamName(i) %></td>
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
        <%for(int j=0; j<TSV.getSportsnum(); j++){
        	int a = TSV.getSize();
        	TSV.setleagueNum(j);
        	for( int i = 0; i <TSV.getSize() ; i++ ) { %>
       	<div id= "myModal<%=i+(j*a)%>" class="modal fade">
  			<div class="modal-dialog modal-xl">
    			<div class="modal-content">
      				<div class="modal-header">
        				<h4 class="modal-title"> <%=TSV.getTeamName(i)%></h4>
        				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
      				</div>
      				<div class="modal-body">
    					
    					<div>
    					<%TG.TeamGame(5416,"2017-01-01", "2017-12-01"); %>
    					<%TG.setTeamNum(0); %>
    						<table class="table table-sm">
    							<thead>
									<tr>
										<th scope="col" id="gc"></th>
										<th scope="col" id="awayteam">상대팀명</th>	
										<th scope="col" id="score">점수</th>
										<%for(int x=0; x<TG.getMatchCount(); x++){ %>
										<th scope="col" id="ss<%=x%>"><%=x%>세트 점수</th>	
										<%} %>	
									</tr>
								</thead>	
    							<tbody>
									<tr>
										<th scope="row"><%=0%></th>
										<td><%=TG.getAwayTeamName() %></td>
										<td><%=TG.getAwayTeamScore() %></td>
										<%for(int x=0; x<TG.getMatchCount(); x++){ %>
										<%TG.setMatchNum(x); %>
											<%=TG.getMatchaScore() %>
										<%} %>	
									</tr>						
								</tbody>
    						</table>
    					</div>
    				</div>
      				<div class="modal-footer">
        				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        				<button type="button" class="btn btn-primary">Save changes</button>
      				</div>
    			</div><!-- /.modal-content -->
  			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		    
		<%} }%>
		
      </main>
</body>

	
    <script src="Pikaday-master/pikaday.js"></script>
    
    <%int a;
    for(int j=0; j<TSV.getSportsnum(); j++){
    	if(j==0){
  			TSV.setleagueNum(j);
			a = TSV.getSize();
    	}
    	else{
    		a = TSV.getSize();
    		TSV.setleagueNum(j);
    	}
    	for( int i = 0; i <TSV.getSize() ; i++ ) {
    		 %>
    		 <script>var startDate,
    	        endDate,
    	        updateStartDate = function() {
    	            startPicker.setStartRange(startDate);
    	            endPicker.setStartRange(startDate);
    	            endPicker.setMinDate(startDate);
    	        },
    	        updateEndDate = function() {
    	            startPicker.setEndRange(endDate);
    	            startPicker.setMaxDate(endDate);
    	            endPicker.setEndRange(endDate);
    	        },
    	        startPicker = new Pikaday({
    	            field: document.getElementById('start<%=i+(j*a)%>'),
    	            format: 'D/M/YYYY',
    	            minDate: new Date(2017,0,1),
    	            maxDate: new Date(2020, 12, 31),
    	            onSelect: function() {
    	                startDate = this.getDate();
    	                updateStartDate();
    	            }
    	        }),
    	        endPicker = new Pikaday({
    	            field: document.getElementById('end<%=i+(j*a)%>'),
    	            format: 'D/M/YYYY',
    	            minDate: new Date(2017, 0 , 1),
    	            maxDate: new Date(2020, 12, 31),
    	            onSelect: function() {
    	                endDate = this.getDate();
    	                updateEndDate();
    	            }
    	        }),
    	        _startDate = startPicker.getDate(),
    	        _endDate = endPicker.getDate();

    	        if (_startDate) {
    	            startDate = _startDate;
    	            updateStartDate();
    	        }

    	        if (_endDate) {
    	            endDate = _endDate;
    	            updateEndDate();
    	        }
    	        </script>
    	<%}
    }
    	%>
   
</html>