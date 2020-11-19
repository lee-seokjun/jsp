<%@page import="java.awt.Graphics2D"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
String path =application.getRealPath("/") +"model1/member/picture/";
int size= 10*1024*1024;
MultipartRequest multi =new MultipartRequest(request,path,size,"euc-kr");//업로드 완료
String fname = multi.getFilesystemName("picture");
BufferedImage bi = ImageIO.read(new File(path+fname));
int width = bi.getWidth()/3;	
int heigh = bi.getHeight()/3;
BufferedImage thumb = new BufferedImage(width,heigh,BufferedImage.TYPE_INT_RGB);
Graphics2D g =thumb.createGraphics();
g.drawImage(bi,0,0,width,heigh,null);
File f = new File(path  + "sm_"+fname);
ImageIO.write(thumb,"jpg",f);
String path_name_sm = "./picture/sm_"+fname;
%>
<h3>썸네일이미지</h3><img src="<%=path_name_sm %>"><p>

<script type="text/javascript">
alert("등록완료")
opener.document.f.pic.src ="<%=path_name_sm%>";
opener.document.f.picture.value ="<%=fname%>";
//썸네일이 필요할때만 sm_을 가져다 쓸 것임으로 .. 썸네일명으로 보낼 필요가 없다....
self.close();
</script>
</body>
</html>