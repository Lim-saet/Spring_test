<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form method="post" action="/app/signin" id="frmSignin">
실명: <input type=text name=realname><br>
로그인아이디: <input type=text name=loginid><br>
비밀번호: <input type=password name=password id=id_pw><br>
비밀번호확인: <input type=password name=ch_password id=ch_pw><br>

<input type=submit value=가입하기>
<a href=selected?path= name=back>홈페이지로(취소)</a>
<a href=selected?path=login name=back>로그인하기</a>
</form>
</body>
<script src= 'http://code.jquery.com/jquery-3.6.0.js'></script>
<script>
$(document)
	.on('submit','#frmSignin', function(){
		if($('input[name=realname]').val()==""){
			alert('실명을 입력하세요.');
			return false;
		}
		if($('input[name=loginid]').val()==''){
			alert('아이디를 입력하세요.');
			return false;
		}
		if($('#id_pw').val()==""){
			alert('비밀번호를 입력하세요.');
			return false;
		}
		if($('input[name=ch_password]').val()==""){
			alert('비밀번호 확인을 입력하세요.');
			return false;
		}
		if($('#id_pw').val()!=$('#ch_pw').val()){
			alert('비밀번호가 확인번호와 일치하지 않습니다.');
			return false;
		}
		return true;
	})
	
</script>
</html>