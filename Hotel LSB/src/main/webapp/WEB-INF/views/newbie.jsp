<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Julius+Sans+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>
* {
	background-color: rgb(255, 245, 232);
}
.line {
	border: 2px solid white;
	width: 200px;
	height: 200px;
}
.container{
	display: flex;
    flex-flow: row wrap;
	justify-content: space-between;
	align-items: center;
	align-content: space-between; 
}
span#title {
    height: 90%;
	font-family: 'Lobster', cursive;
	font-size: 60px;
	color: #e8ac9b;
	position:relative;
	left: 700px;
	top: 350px;
	/*display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;*/
}
#frmSignin{
	background-color: white;
	font-family: 'Julius Sans One', sans-serif;
}
a{
	width: 200px;
	height:200px;
	background-color: white;
	display:block;
	text-align: center;

	font-family: 'Pacifico', cursive;
	font-size: 25px;
	color: #ccc2b6;


}
input[type=text] {
    border : 2px solid #f7ede1;
    border-radius : 5px;
    position:relative;
	left: 20px;
}
input[type=text]:hover {
    background : #ffeae3;
}
input[type=password] {
    border : 2px solid #f7ede1;
    border-radius : 5px;
    position:relative;
	left: 20px;
}
input[type=password]:hover {
    background : #ffeae3;
}
input[type=submit] {
    border : 1px solid #f7ede1;
    border-radius : 5px;
    font-family: 'Pacifico', cursive;
	font-size: 15px;
	color: #ccc2b6;
	background-color: #ffeae3;
	position:relative;
	left: 60px;
}
#info_login{
	background-color: white;
	font-family: 'Pacifico', cursive;
	margin: 0px;
	display: flex;
}
span#copyright{
	font-family: 'Gowun Dodum', sans-serif;
	color: #cbd1c7;
	position:relative;
	top:190px;
}
</style>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<header>
<span id="title">
	Please enter your info to sign in. 
	</span>
</header>


<div class='container'>

<div class='line' id='info_login'>
<form method="post" action="/app/signin" id="frmSignin">

NAME <input type=text name=realname><br><br>
ID <input type=text name=loginid><br><br>
PASSWORD <input type=password name=password id=id_pw><br><br>
CHECK PASSWORD <input type=password name=ch_password id=ch_pw><br><br>

<input type=submit value=signin>
</form>
</div>
<div class='line'></div>
<div class='line' id='info_login'>
<a href=selected?path= name=back>Back to Home</a>
</div>
<div class='line'>
<a href=selected?path=login name=back>Login</a>
</div>
<div class='line'></div>
<div class='line'></div>
<div class='line'></div>
<div class='line'></div>
<div class='line' id='info_login'></div>
<div class='line'></div>
<div class='line'></div>
<div class='line'></div>
<div class='line'></div>
<div class='line'></div>
<div class='line'></div>
<div class='line'></div>
<div class='line'></div>
<div class='line'></div>
<div class='line'></div>
<div class='line'></div>
<div class='line'></div>
<div class='line'></div>
<div class='line'></div>
<div class='line'></div>
<span id="copyright">(C)2021.(임샛별)all rights reserved.</span>


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
		return true;// 유효성 검사 리턴트루로!!!!!!!!!! 
	})
	
</script>
</html>