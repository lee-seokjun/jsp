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
alert("�α����ϼ���.")
location.href = ("loginForm.jsp")
</script>

<%}else if(!loginid.equals(delid) && !loginid.equals("admin")){ 
	//�Ϲݻ�����̰� �����ڰ� �ƴѵ� �α��ΰ� �Ķ���Ͱ� �ٸ�
%>
����� ���θ� ��������
loginid<%=loginid %>
delid<%=delid%>
<script type="text/javascript">
	alert("���� ������ ���� ����.")
	location.href= "main.jsp"+<%=loginid%>;
</script>

<%}else if(loginid.equals("admin")&& delid.equals("admin")) {
	//�������ε� �Ķ���͵� ��������
	%>
	����� �������ε� �Ķ���� ������
<script type="text/javascript">
	alert("�����ڴ� ���� �� ����")
	location.href= "list.jsp";
</script>
<%}else{ //���� �ϴ� �������
	String url="";
if(loginid.equals("admin")){//�������ΰ��
	 mem = new MemberDao().selectOne("admin");
	url="list.jsp";
}else{//�����ڰ� �ƴѰ��
	 mem = new MemberDao().selectOne(delid);
	 url="info.jsp?login="+loginid;
}

	String msg="����";
	if(!mem.getPass().equals(request.getParameter("pass"))){//��й�ȣ ����
		msg ="��й�ȣ�� �ٸ��ϴ�.";
		if(!mem.getId().equals("admin"))
			url="info.jsp?login="+loginid;
		%>
		��й�ȣ�� �޶�
<script type="text/javascript">
		alert("<%=msg%>")
		location.href = "<%=url%>";
</script>
		<%
	}else{
	//��й�ȣ ����
	int res =dao.delete(delid);
	if(res>0)
	{
		msg="Ż�𼺰�";
		if(!mem.getId().equals("admin"))
			{url="loginForm.jsp";
			session.invalidate();}
	}
	%>
	��й�ȣ �¾�
<script type="text/javascript">
		alert("<%=msg%>")
		location.href = "<%=url%>";
</script>
	
		


<%}} %>
</body>
</html>