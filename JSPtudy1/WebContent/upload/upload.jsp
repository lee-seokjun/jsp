<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.IOException" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String uploadPath = application.getRealPath("/")+"upload/";
	int size = 10*1024*1024;
	File f = new File(uploadPath);
	if(!f.exists()) f.mkdirs();
	/*
	new MultipaatRequest
		request : �Ķ�������� , �������� ,���ϳ��� �����ϰ� �ִ� ��û��ü.
		uploadPath : �������� �Ǵ� ���� ����
		size : ���ε�Ǵ� �ִ� ������ ũ��
		euc-kr :�Ķ���� ���ڵ� ����
	*/
	MultipartRequest multi =new MultipartRequest(request,uploadPath,size,"euc-kr");
	String name = multi.getParameter("name");
	String title = multi.getParameter("title");
	String fname = multi.getFilesystemName("file1");
			
%>
���ε� ��ġ :<%=uploadPath %><br>
�ø���� :<%=name%><br>
����:<%=title %><br>
����:<a href="<%=fname%>"><%=fname%></a><br>
</body>
</html>