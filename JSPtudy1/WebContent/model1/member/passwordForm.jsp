<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="../../css/main.css">
<title>비밀번호 변경</title>
</head>
<body>
<script type="text/javascript">
function inchk(f){
	console.log(f.chgpass)
	console.log(f.chgpass2)
	if(f.chgpass.value!=f.chgpass2.value){
	alert("변경 비밀번호와 변경 비밀번호 재입력이 다릅니다.");
	f.chgpass2.value="";
	f.chgpass2.focus();
	return false;
	}
	return true;
}
</script>
<form action="password.jsp?" method="post" onsubmit="return inchk(this)">
<table><caption>비밀번호 변경</caption>
<tr><th>현재 비밀번호</th><td><input type="password" name = "pass" ></td></tr>
<tr><th>변경 비밀번호</th><td><input type="password" name = "chgpass" ></td></tr>
<tr><th>변경 비밀번호 재입력</th><td><input type="password" name = "chgpass2" ></td></tr>
<tr><td colspan="2"><input type="submit" value="비밀번호 변경"></td></tr>

</table>
</form>
</body>
</html>