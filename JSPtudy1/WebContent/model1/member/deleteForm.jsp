<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/deleteForm.jsp
   1. id 파라미터 저장하기
   2. login 여부 검증하기
            로그아웃상태인 경우 
                  로그인하세요.메세지 출력 후 loginForm.jsp 페이지로 이동
            관리자가 아니면서 id 파라미터 정보와 login 정보가 다른 경우
                  본인만 탈퇴 가능합니다. 메세지 출력 후 main.jsp 페이지로 이동      
   3. 현재 화면 출력하기           
--%>
<%
   String id = request.getParameter("id");
   String login = (String)session.getAttribute("login");
   if(login == null) {%>
   <script>
      alert("로그인 하세요")
      location.href="loginForm.jsp";
   </script>
<%   
   } else if(!login.equals(id) && !login.equals("admin")) {
%>
     <script>
        alert("본인만 탈퇴 가능합니다.")
        location.href="main.jsp";
     </script>    	 
<% } else { %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 탈퇴 비밀번호 입력</title>
<link rel="stylesheet" href="../../css/main.css" >
<script type="text/javascript">
   function inputcheck(f) {
	   if(f.pass.value == "") {
		   alert("비밀번호를 입력하세요")
		   f.pass.focus();
		   return false;
	   }
	   return true;
   }
</script></head><body>
<form action="delete.jsp" method="post"
                        onsubmit="return inputcheck(this)">
  <input type="hidden" name="id" value="<%=id%>" >
<table>
   <caption>회원비밀번호 입력</caption>
   <tr><th>비밀번호</th>
       <td><input type="password" name="pass" /></td></tr>
   <tr><td colspan="2">
       <input type="submit" value="탈퇴하기" /></td></tr>
</table></form></body></html> <% } %>