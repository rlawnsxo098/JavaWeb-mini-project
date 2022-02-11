<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<%
  Connection con=null;

System.out.println("22");


  try{
	 String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
     String dbId = "SCOTT";
     String dbPass = "TIGER";
	
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 con = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	 
	 String id = request.getParameter("id");
	 String pw = request.getParameter("pw");
	 
	 
	 String sql = "select * from mylogin where id = ?";
	 PreparedStatement pstmt = con.prepareStatement(sql);
	 
	 pstmt.setString(1, id);
	 ResultSet rs = pstmt.executeQuery();
	 
		if(rs.next()){
			if(pw.equals(rs.getString("pw"))){
				request.getRequestDispatcher("template.jsp").forward(request, response);
			}
		}
		else{
			String url = "showError.jsp";
			request.getRequestDispatcher(url).forward(request, response);

		}	
	  }catch(Exception e){ 
		 e.printStackTrace();
 	 }
  
  
%>
