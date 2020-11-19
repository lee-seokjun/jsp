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
		request : 파라미터정보 , 파일정보 ,파일내용 저장하고 있는 요청객체.
		uploadPath : ㅇ벌도드 되는 폴더 정보
		size : 업로드되는 최대 파일의 크기
		euc-kr :파라미터 인코딩 설정
	*/
	MultipartRequest multi =new MultipartRequest(request,uploadPath,size,"euc-kr");
	String name = multi.getParameter("name");
	String title = multi.getParameter("title");
	String fname = multi.getFilesystemName("file1");
			
%>
업로드 위치 :<%=uploadPath %><br>
올린사람 :<%=name%><br>
제목:<%=title %><br>
파일:<a href="<%=fname%>"><%=fname%></a><br>
</body>
</html>