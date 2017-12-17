<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8" %>	

<%
	session.invalidate();
	Cookie cookie[] = new Cookie[4];
	cookie[0] = new Cookie("autologin", "CANCEL");
	cookie[1] = new Cookie("userid", "");
	cookie[2] = new Cookie("passwd", "");
	cookie[3] = new Cookie("userseq", "");
	
	for(int i=0; i<4; i++){
		  cookie[i].setMaxAge(10); // 한시간 유효
		  response.addCookie(cookie[i]); // 쿠키 추가
	}
	response.sendRedirect("index.jsp");
  
%>