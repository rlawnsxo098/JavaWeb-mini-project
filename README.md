# JavaWeb-mini-project

## 🥇 Team Members
###  이정훈
  * HTML, CSS 템플릿 참고 및 게시판 등록

###  김준태
  * DB 연동, 로그인, 회원가입 정보 검색 및 삽입
 
###  임혜창
  * DB 연동, 로그인, 회원가입 정보 검색 및 삽입


## 💫 Language
<p>
 <img src ="https://img.shields.io/badge/Java-007396?style=flat-square&logo=Java&logoColor=white"/>
 <img src="https://img.shields.io/badge/HTML5-E34F26?&style=flat-square&logo=html5&logoColor=white"/>
<img src="https://img.shields.io/badge/CSS3-1572B6?style=flat-square&logo=css3&logoColor=white" /> 
<img src="https://img.shields.io/badge/JavaScript-323330?style=flat-square&logo=javascript&logoColor=F7DF1E" />
 </p>

## ⭐Source Code

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

## ☀️ Review

### DB와 JAVA를 연동하여 DB의 값을 읽어 확인한 후 IF/ ELSE문을 이용하여 나타내는 등의
### 전문적인 분야로 나아가며 하나의 핵심 지식(능률)을 배웠다. 라고 생각한다.



 


