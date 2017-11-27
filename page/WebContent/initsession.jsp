<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8" %>	

<%
  // 새 세션 생성
  if(session.isNew()) {
    //connect.setConnect(false);
    //session.setAttribute("cntUser", connect);
    session.setAttribute("logon", "false");
  }
%>