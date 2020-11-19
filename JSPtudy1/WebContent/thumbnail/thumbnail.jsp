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
<title>�����̹����� ����� �̹��� ����</title>
</head>
<body>
<%
	//�̹��� ���� ���ε� ��ġ ����
	String path =application.getRealPath("/") +"thumbnail/";
	int size= 10*1024*1024; //�ִ� ���ε� ũ�� 10MB
	MultipartRequest multi =new MultipartRequest(request,path,size,"euc-kr");//���ε� �Ϸ�
	String fname = multi.getFilesystemName("picture");//<input type="file" name="picture">
	//fname : ���ε�� ������ ���� ��� C:\Users\iope1\OneDrive\���� ȭ��\
	// 	htmlstudy-master\.metadata\.plugins\org.eclipse.wst.server.core\
	// 	tmp0\wtpwebapps\JSPtudy1\thumbnail
	BufferedImage bi = ImageIO.read(new File(path+fname));
	//bi : �̹��� ������ �о �޸𸮿� �ε� => �����̹���
	int width = bi.getWidth()/5;	//�����̹��� ����ũ���� 1/5
	int heigh = bi.getHeight()/5;
	//thumb : �����̹���ũ���� 5����1 ũ���� ��ȭ��(�̹�������) ����
	BufferedImage thumb = new BufferedImage(width,heigh,BufferedImage.TYPE_INT_RGB);
	//g : �׸��� ����
	Graphics2D g =thumb.createGraphics();
	//g.drawImage :�̹��� �׸���
	g.drawImage(bi,0,0,width,heigh,null);
	//f : �����̹����� ���� ������ sm_�����̹������ϸ� ���� ����.
	File f = new File(path  + "sm_"+fname);
	//thumb �̹����� f ���Ϸ� ����.
	ImageIO.write(thumb,"jpg",f);
	
%>
<h3>�����̹���</h3><img src="<%=fname %>"><p>
<h3>������̹���</h3><img src="sm_<%=fname %>"><p>

</body>
</html>