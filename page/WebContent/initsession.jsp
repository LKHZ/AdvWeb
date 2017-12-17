<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8" %>	

<%
  // 새 세션 생성
  if(session.isNew()) {
    //connect.setConnect(false);
    //session.setAttribute("cntUser", connect);
    session.setAttribute("logon", "false");
    Cookie cookies[] = request.getCookies();
	boolean flag = false;
	for(int i=0; i<cookies.length; i++) {
		String name = cookies[i].getName();
		String val = cookies[i].getValue();
		if(name.equals("autologin")) {
			if(val.equals("OK")) {
				flag = true;
				session.setAttribute("logon", "true");
			}
		}else if(flag && name.equals("userid")) {
			session.setAttribute("userid", val);
		}else if(flag && name.equals("passwd")) {
			session.setAttribute("passwd", val);
		}else if(flag && name.equals("userseq")) {
		    session.setAttribute("userseq", Integer.parseInt(val));
		}
	      
	}
  }
%>