# JavaWeb-mini-project

## π₯ Team Members
###  μ΄μ ν
  * HTML, CSS ννλ¦Ώ μ°Έκ³  λ° κ²μν λ±λ‘

###  κΉμ€ν
  * DB μ°λ, λ‘κ·ΈμΈ, νμκ°μ μ λ³΄ κ²μ λ° μ½μ
 
###  μνμ°½
  * DB μ°λ, λ‘κ·ΈμΈ, νμκ°μ μ λ³΄ κ²μ λ° μ½μ


## π« Language
<p>
 <img src ="https://img.shields.io/badge/Java-007396?style=flat-square&logo=Java&logoColor=white"/>
 <img src="https://img.shields.io/badge/HTML5-E34F26?&style=flat-square&logo=html5&logoColor=white"/>
<img src="https://img.shields.io/badge/CSS3-1572B6?style=flat-square&logo=css3&logoColor=white" /> 
<img src="https://img.shields.io/badge/JavaScript-323330?style=flat-square&logo=javascript&logoColor=F7DF1E" />
 </p>

## β­Source Code

### LoginCheck
```
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
```

### LoginCheck 2
```
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
```
### Sign Up
```
public static boolean addLogin(LoginDTO log) throws SQLException{
      Connection con = null;
      PreparedStatement pstmt = null;
      try{
         con = DBUtil.getConnection();
         pstmt = con.prepareStatement("insert into mylogin values(?, ?, ? )");
         pstmt.setString(1, log.getId());
         pstmt.setString(2, log.getPw());
         pstmt.setString(3, log.getEmail());
         
         int result = pstmt.executeUpdate();
      
         if(result == 1){
            return true;
         }
      }finally{
         DBUtil.close(con, pstmt);
      }
      return false;
   }
```

## βοΈ Review

### DBμ JAVAλ₯Ό μ°λνμ¬ DBμ κ°μ μ½μ΄ νμΈν ν IF/ ELSEλ¬Έμ μ΄μ©νμ¬ λνλ΄λ λ±μ
### μ λ¬Έμ μΈ λΆμΌλ‘ λμκ°λ©° νλμ ν΅μ¬ μ§μ(λ₯λ₯ )μ λ°°μ λ€. λΌκ³  μκ°νλ€.



 


