<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="model.domain.datainfo.*"%>
<%
request.setCharacterEncoding("euc_kr");

String title = request.getParameter("title");
String writer = request.getParameter("writer");
String contents = request.getParameter("contents");
String pw = request.getParameter("pw");
String date = new SimpleDateFormat("yyyy.MM.dd").format(new Date());

BoardDTO doc = new BoardDTO(title, writer, contents, pw, date);

	Vector<BoardDTO> docList = (Vector<BoardDTO>)application.getAttribute("docList");
	if(docList == null){
		docList = new Vector<BoardDTO>();
		application.setAttribute("docList", docList);
	}
	
	docList.add(doc);
	
	response.sendRedirect("template.jsp");
%>