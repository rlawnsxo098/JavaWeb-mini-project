<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="model.domain.datainfo.*" %>
<%
int num = Integer.parseInt(request.getParameter("num"));

	String pw = request.getParameter("pw");
	 	
	Vector<BoardDTO> list = (Vector<BoardDTO>)application.getAttribute("docList");
	
	BoardDTO temp = new BoardDTO(num);
	
	BoardDTO original = list.get(list.indexOf(temp));
	
	String msg = "삭제가 완료되었습니다.";
	if(pw.equals(original.getPw())){
		list.remove(temp);
	}else{
		msg ="비밀번호가 일치하지 않습니다.";
	}
	
	session.setAttribute("msg", msg);
	response.sendRedirect("template.jsp");
%>