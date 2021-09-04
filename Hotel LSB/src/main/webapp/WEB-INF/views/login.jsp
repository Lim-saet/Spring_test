<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인창</title>
</head>
<body>
<form method="post" action="/app/check_user" id=frmLogin>
ID: <input type=text name=userid>
PW: <input type=password name=pw>
<input type=submit value=로그인>

<a href=selected?path= name=back>홈페이지로</a>
</form>
</body>
<script src= 'http://code.jquery.com/jquery-3.6.0.js'></script>
<script>
$(document)
.on('submit','#frmLogin',function(){
	let pstr=$.trim($('input[name=userid]').val());
	$('input[name=passcode]').val(pstr);
	pstr=$.trim($('input[name=pw]').val());
	$('input[name=pw]').val(pstr);
	if($('input[name=userid]').val()==''){
		alert('로그인아이디를 입력하세요');
		return false;
	}
	if($('input[name=pw]').val()==''){
		alert('비밀번호를 입력하세요');
		return false;
	}
	return true;
});
</script>
</html>