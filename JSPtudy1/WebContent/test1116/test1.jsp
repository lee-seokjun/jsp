<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/test1116/test1.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>간단한 select 구문 실행 결과 확인</title>
<link rel="stylesheet" href="../css/main.css">
</head>
<body>
<%
    request.setCharacterEncoding("euc-kr");
    String sql = request.getParameter("sql"); //null
%>
<%-- form 에 action 속성이 없는 경우 자신의 페이지를 다시 호출함.--%>
<form method="post">
<textarea cols="60" rows="5" name="sql"><%=(sql==null)?"":sql %></textarea>
   <input type="submit" value="실행" >
</form>
<% 
Connection conn = null; 
if(sql != null && !sql.trim().equals("")) { //입력된 구문이 존재.
 try {	
// 드라이버 설정	 
   Class.forName("org.mariadb.jdbc.Driver");
// 연결객체 (Connection 객체)
   conn = DriverManager.getConnection
   ("jdbc:mariadb://localhost:3307/classdb","scott","1234");
// PreparedStatement : Statement 하위 인터페이스
//                     sql 구문을 미리 db 서버에 전송. 
// PreparedStatement pstmt = conn.prepareStatement(sql);
// ResultSet rs = pstmt.executeQuery();
   Statement stmt = conn.createStatement();
   ResultSet rs = stmt.executeQuery(sql);
   ResultSetMetaData rsmt = rs.getMetaData();
   PreparedStatement pstmt2 = 
   conn.prepareStatement("select count(*) from (" + sql + ") a");
   ResultSet rs2 = pstmt2.executeQuery();
   rs2.next();
   int cnt = rs2.getInt(1); //조회된 레코드 건수 
   %>
 <table>
 <tr><td colspan="<%=rsmt.getColumnCount()%>" 
     style="text-align: right;">
     조회된 레코드 갯수:<%=cnt %></td></tr>
 <tr><%-- 컬럼명 출력 --%>
<% for(int i=1;i<=rsmt.getColumnCount();i++) {%>
   <th><%=rsmt.getColumnName(i)%></th>
<% } %>
</tr>
<%-- 컬럼내용 출력 --%>
<% while(rs.next()) { %><tr>
 <% for(int i=1;i<=rsmt.getColumnCount();i++) {%>
	   <td><%=rs.getString(i) %></td><% } %>	   
<% }%></tr>
</table>  
<% } catch (Exception e) { %>
<h1>sql 구문 오류 입니다. </h1>
<h1><%=e.getMessage() %> </h1>
<h1>sql 구문 :<%=sql%> </h1>
<% } finally {
    conn.close();
   } }%>
</body></html>