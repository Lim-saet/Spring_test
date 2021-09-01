<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔객실 예약화면</title>
</head>
<script src= 'http://code.jquery.com/jquery-3.5.0.js'></script>
<style>
    p{
    font-size: 20px;
    }
     a {
        text-decoration-line: none;
    }
    .rname {
        width:200px;
        height:300px;
        background-color: rgb(255, 227, 250);
        font-size: 17px;
        margin-right: 100px;
        float: left; 
        margin-bottom: 100%;
    }
    .rcont {
        top: 300px;
       
    }
 
  
</style>
<body>
* 로그인한 ID : ${loginid} *
<a href=/app/logout name=back>로그아웃</a>&nbsp 
<a href=selected?path=login name=cancel1>취소</a>
    <section id="wrap">
        <h1>호텔예약관리페이지</h1>
        <header>
        <p>
            <a href=/app/room>객실관리</a>
            	예약관리
            	</p>
        </header>
    <p style=left:100px;>객실목록</p>
    <div class="rname">
        <br>
         백두산 SuiteRoom 4명<br>
         한라산 FamilyRoom 6명<br>
         태조산<br>
         흑성산<br>
    </div>
    <table border="1" bordercolor="black" width="350" height="400">
    <div class="rcont">
    <tr><td align="middle">
        객실이름 
        <input type="text" id=roomname><pre> </pre>
        객실분류
        <select size="4" multiple>
            <option>Suite Room</option>
            <option>Family Room</option>
            <option>Double Room</option>
            <option>Single Room</option>
            <option>Dormitory</option>
        </select><pre> </pre>
        숙박가능인원 
        <input type=number id=stayperson>명<pre> </pre>
        1박요금
        <input type=text id=pricecnt>원<pre> </pre>
        <input type=button id=register value="등록">&nbsp&nbsp&nbsp   
        <input type=button id=register value="삭제">&nbsp&nbsp&nbsp  
        <input type=button id=register value="클리어">
        </td></tr>
    </div>
    </table>
    
    
    <script>

        
    </script>
    </section>


</body>
</html>