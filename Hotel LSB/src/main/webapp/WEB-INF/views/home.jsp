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
	left: 500px;
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
	font-size: 30px;
	color: #ccc2b6;
	text-decoration: none; 
	text-shadow: 0 0 24px;

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
</style>
<body>
<header>
<span id="title">
	Welcome to LaVida Hotel.  
	</span>
</header>
<nav>
<div class='container'>

<div id="login"><a href='selected?path=login'>Login</a></div>
<div class='line'></div>
<div id="signup"><a href='selected?path=newbie'>Signin</a></div>
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
</nav>

</body>
</html>
