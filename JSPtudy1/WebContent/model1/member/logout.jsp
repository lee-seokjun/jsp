<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model1/member/logout.jsp
//    1. session 로그인 정보 제거.
//    2. loginForm.jsp 페이지 이동
 
      1. session 로그인 정보 제거.
      2. 로그아웃하셨습니다. 메세지 출력 후 
                         loginForm.jsp 페이지 이동
--%>    
<%
     session.invalidate(); //기존의 session 만료, 새로운 session 변경
//   session.removeAttribute("login");
//   response.sendRedirect("loginForm.jsp");
%>
<script type="text/javascript">
  alert("로그아웃하셨습니다.")
  location.href="loginForm.jsp";
</script>
