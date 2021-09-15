<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<style>
* {
	background-color: rgb(255, 245, 232);
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
.container{
	display: flex;
    flex-flow: row wrap;
	justify-content: space-between;
	align-items: center;
	align-content: space-between; 
}
.line {
	border: 2px solid white;
	width: 200px;
	height: 200px;
}
#info_login{
	background-color: white;
	font-family: 'Pacifico', cursive;
	margin: 0px;
	display: flex;
}
#frmLogin{
	background-color: white;
	
}
a{
	width: 200px;
	height:200px;
	background-color: white;
	display:block;
	text-align: center;
	margin: 5px;
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
input[type=submit]:hover{
	background : #d6f7be;
}
span{
	font-family: 'Gowun Dodum', sans-serif;
	color: #cbd1c7;
	position:relative;
	top:190px;
}
</style>
<head>
<meta charset="UTF-8">
<title>로그인창</title>
</head>

<body>
<header>
<span id="title">
	Please enter your login information. 
	</span>
</header>
<div class='container'>

<div class='line' id='info_login'>
<form method="post" action="/app/check_user" id=frmLogin>
ID <input type=text name=userid>
PW <input type=password name=pw><br><br>
<input type=submit value=Login>
</form>
</div>
<div class='line'></div>
<div class='line' id='info_login'>
<a href=selected?path= name=back>Back to Home</a>
</div>
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
<div class='line'></div>
<div class='line'></div>
<div class='line'></div>
<div class='line'></div>
<div class='line'></div>
<div class='line'></div>

</div>
<span>(C)2021.(임샛별)all rights reserved.</span>
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