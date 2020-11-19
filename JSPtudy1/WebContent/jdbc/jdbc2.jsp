<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/jdbc/jdbc2.jsp --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>emp 테이블 읽어 화면에 출력하기</title>
<link rel="stylesheet" href="../css/main.css" >
</head>
<body>
<%
    Class.forName("org.mariadb.jdbc.Driver");//클래스 정보 로드
    Connection conn = DriverManager.getConnection
    ("jdbc:mariadb://localhost:3307/classdb","scott","1234");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery
    		   ("select * from student");
    //ResultSetMetaData : 조회된 레코드의 정보 저장
    ResultSetMetaData rsmt = rs.getMetaData();
%>
<table><tr>
<% //getColumnCount() : 조회된 컬럼의 갯수 
   //getColumnName(1) : 첫번째 조회된 컬럼의 이름 
   for(int i=1;i<=rsmt.getColumnCount();i++) { %>
    <th><%=rsmt.getColumnName(i) %></th>
<% } %></tr>
<%   while(rs.next()) { //읽어온 레코드 한개씩 리턴  %>
<tr>
   <% 
     //getString(1) : 첫번째 컬럼의 값
     for(int i=1;i<=rsmt.getColumnCount();i++) {%>
     <td><%=rs.getString(i) %></td>
   <% } %>
</tr>
<% }  %>
</table></body></html>