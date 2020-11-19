<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%=request.getParameter("pass") %>
<%
	Member mem;
	MemberDao dao= new MemberDao();
	request.setCharacterEncoding("euc-kr");
	String delid = request.getParameter("id");
	String loginid = (String)session.getAttribute("login");
	if(loginid==null){%>
<script type="text/javascript">
alert("로그인하세요.")
location.href = ("loginForm.jsp")
</script>

<%}else if(!loginid.equals(delid) && !loginid.equals("admin")){ 
	//일반사용자이고 관리자가 아닌데 로그인과 파라미터가 다름
%>
여기는 본인만 삭제가능
loginid<%=loginid %>
delid<%=delid%>
<script type="text/javascript">
	alert("본인 계정만 삭제 가능.")
	location.href= "main.jsp"+<%=loginid%>;
</script>

<%}else if(loginid.equals("admin")&& delid.equals("admin")) {
	//관리자인데 파라미터도 관리자임
	%>
	여기는 관리자인데 파라미터 관리자
<script type="text/javascript">
	alert("관리자는 지울 수 없음")
	location.href= "list.jsp";
</script>
<%}else{ //이제 일단 지울것임
	String url="";
if(loginid.equals("admin")){//관리자인경우
	 mem = new MemberDao().selectOne("admin");
	url="list.jsp";
}else{//관리자가 아닌경우
	 mem = new MemberDao().selectOne(delid);
	 url="info.jsp?login="+loginid;
}

	String msg="실패";
	if(!mem.getPass().equals(request.getParameter("pass"))){//비밀번호 실패
		msg ="비밀번호가 다릅니다.";
		if(!mem.getId().equals("admin"))
			url="info.jsp?login="+loginid;
		%>
		비밀번호가 달라
<script type="text/javascript">
		alert("<%=msg%>")
		location.href = "<%=url%>";
</script>
		<%
	}else{
	//비밀번호 성공
	int res =dao.delete(delid);
	if(res>0)
	{
		msg="탈퇴성공";
		if(!mem.getId().equals("admin"))
			{url="loginForm.jsp";
			session.invalidate();}
	}
	%>
	비밀번호 맞아
<script type="text/javascript">
		alert("<%=msg%>")
		location.href = "<%=url%>";
</script>
	
		


<%}} %>
</body>
</html>