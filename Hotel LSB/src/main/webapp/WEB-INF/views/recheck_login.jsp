<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<body>
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
	left: 300px;
	top: 350px;
	/*display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;*/
}
a{
	width: 200px;
	height:200px;
	background-color: white;
	display:block;
	text-align: center;
	margin: 5px;
	font-family: 'Pacifico', cursive;
	font-size: 26px;
	color: #ccc2b6;


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
span#copyright{
	font-family: 'Gowun Dodum', sans-serif;
	color: #cbd1c7;
	position:relative;
	top:190px;
}

</style>
<body>
<header>
<span id="title">
	Incorrect user ID or password! Please check again! 
	</span>
</header>
<nav>
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
</nav>
<span id="copyright">(C)2021.(임샛별)all rights reserved.</span>
</body>
</html>
