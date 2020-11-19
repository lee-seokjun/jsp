<%@page import="java.awt.Graphics2D"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>원본이미지와 썸네일 이미지 보기</title>
</head>
<body>
<%
	//이미지 파일 업로드 위치 지정
	String path =application.getRealPath("/") +"thumbnail/";
	int size= 10*1024*1024; //최대 업로드 크기 10MB
	MultipartRequest multi =new MultipartRequest(request,path,size,"euc-kr");//업로드 완료
	String fname = multi.getFilesystemName("picture");//<input type="file" name="picture">
	//fname : 업로드된 파일의 절대 경로 C:\Users\iope1\OneDrive\바탕 화면\
	// 	htmlstudy-master\.metadata\.plugins\org.eclipse.wst.server.core\
	// 	tmp0\wtpwebapps\JSPtudy1\thumbnail
	BufferedImage bi = ImageIO.read(new File(path+fname));
	//bi : 이미지 파일을 읽어서 메모리에 로드 => 원본이미지
	int width = bi.getWidth()/5;	//원본이미지 가로크기의 1/5
	int heigh = bi.getHeight()/5;
	//thumb : 원본이미지크기의 5분의1 크기의 도화지(이미지없음) 생성
	BufferedImage thumb = new BufferedImage(width,heigh,BufferedImage.TYPE_INT_RGB);
	//g : 그리기 도구
	Graphics2D g =thumb.createGraphics();
	//g.drawImage :이미지 그리기
	g.drawImage(bi,0,0,width,heigh,null);
	//f : 원본이미지와 같은 폴더에 sm_원본이미지파일명 파일 선택.
	File f = new File(path  + "sm_"+fname);
	//thumb 이미지를 f 파일로 생성.
	ImageIO.write(thumb,"jpg",f);
	
%>
<h3>원본이미지</h3><img src="<%=fname %>"><p>
<h3>썸네일이미지</h3><img src="sm_<%=fname %>"><p>

</body>
</html>