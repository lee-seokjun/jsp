<%@page import="model.Member"%>
<%@page import="model.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%-- <jsp:useBean id="mem" class="model.Member"/> --%>
<%-- <jsp:setProperty property="*" name="mem"/>   --%>
<%
	String login = (String) session.getAttribute("login");
	boolean opener = true;	//opener �������� url�� ����
	boolean closer = true;	// ���������� close
	String msg=null;
	String url=null;
	String ppp=null;
	if(login==null){
		msg= "�α��� �ϼ���.";
		url="loginForm.jsp";
	}else{
		String pass =request.getParameter("pass");
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(login);
		if(pass.equals(mem.getPass())){
			String chgpass =request.getParameter("chgpass");
			if(dao.updatePass(login,chgpass)>0){
				msg="��й�ȣ�� ����Ǿ����ϴ�.";
				url="info.jsp?id="+login;
			}else{
				msg="��й�ȣ ����� ������ �߻� �߽��ϴ�.";
				url = "updateForm.jsp?id="+login;
			}
		}else{
			opener =false;
			closer =false;
			msg="��й�ȣ ���� �Դϴ�. Ȯ���ϼ���";
			url= "passwordForm.jsp";
		}
	}
	%>
	<script type="text/javascript">
	alert("<%=msg+ppp%>")
	<% if(opener){%>
		opener.location.href="<%=url%>";
	<%}else{%>
		location.href="<%=url%>";
	<% }if(closer){%>
	self.close();
	<%}%>
		
	</script>
</head>
<body>

</body>
</html>