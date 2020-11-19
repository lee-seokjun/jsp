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
	boolean opener = true;	//opener 페이지의 url을 변경
	boolean closer = true;	// 현재페이지 close
	String msg=null;
	String url=null;
	String ppp=null;
	if(login==null){
		msg= "로그인 하세요.";
		url="loginForm.jsp";
	}else{
		String pass =request.getParameter("pass");
		MemberDao dao = new MemberDao();
		Member mem = dao.selectOne(login);
		if(pass.equals(mem.getPass())){
			String chgpass =request.getParameter("chgpass");
			if(dao.updatePass(login,chgpass)>0){
				msg="비밀번호가 변경되었습니다.";
				url="info.jsp?id="+login;
			}else{
				msg="비밀번호 변경시 오류가 발생 했습니다.";
				url = "updateForm.jsp?id="+login;
			}
		}else{
			opener =false;
			closer =false;
			msg="비밀번호 오류 입니다. 확인하세요";
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