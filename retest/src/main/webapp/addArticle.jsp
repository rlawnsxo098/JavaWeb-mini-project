<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.domain.datainfo.ArticleDTO" %>
    <%@ page import="java.util.Vector" %>
    
<%
request.setCharacterEncoding("euc_kr");

	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String contents = request.getParameter("contents");
	String pw = request.getParameter("pw");
	
	ArticleDTO article = new ArticleDTO(title, writer, contents, pw);
	
	Vector<ArticleDTO> list = (Vector<ArticleDTO>)application.getAttribute("list");
	if(list == null){
		list = new Vector<ArticleDTO>();
		application.setAttribute("list", list);
	}
	
	list.add(article);
	
	response.sendRedirect("list.jsp");
%>