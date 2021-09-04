<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔예약 관리</title>
</head>
<style>
    p{
        font-size: 20px;
    }
    a {
        text-decoration-line: none;
    }
    .r_possible {
        font-size: 18px;
        float: left;
    }
    .room_reserv {
        position: relative;
        left: 300px;
        bottom: 300px;
        right: 200px;
        width: 390px;
        height: 400px;
        border: solid 2px black;
    }
    .already {
        position:relative;
        left: 800px;
        bottom: 730px;
    }
</style>
<body>
    <section id="wrap">
    * 로그인한 ID : ${loginid} *
        <h1>호텔예약관리페이지</h1>
        <header>
        <section id="container"></section>
            <p> <a href=/app/room>객실관리</a>&nbsp;&nbsp;&nbsp; 
           예약관리
            &nbsp;&nbsp;&nbsp; 
            <a href=/app/logout name=back>로그아웃</a></p><br>
            
        </header>
        <table>
         <div class= d_rcategory>
                <tr>
                    <th>숙박기간</th>
                    <td><input type="date" id=month> ~ <input type="date" id=month><br><br></td> 
                </tr>
                <tr>
                    <th>객실분류</th>
                       <td> 
                           <select>
                           <option>연결예정</option>
                        </select>
                <input type="button" value="찾기" id="find">
            </td>
            </tr>
         </div>
        </table><br>
        <table>
                 <span style= "font-size:20px">
                    예약가능
                    <br>
                    </span>
             <div class=r_possible>
                <table border="1" bordercolor="black" width="250" height="300">
                    <tr><td align="middle">
                     <select size=10 style='width:250px;' id=seltype>
            			<%-- <c:forEach items="${list}" var="room">
            				<option value='${room.roomcode}'>
            					${room.roomname},${room.typename},${room.howmany}명,${room.howmuch}원
            				</option> 
            			</c:forEach>--%>
            		</select>
                    </td></tr>          
                       </table>
            
         </div> 
        </table>
         <div class=room_reserv>
             <table>
             <tr><td align="middle">
             <br>
            객실이름 
            <input type="text" id=roomName><pre></pre>
         
           방 종류
           <select size=5 style='width:120px;' id=selType2>
				<option>연결예정</option>
           </select><pre></pre>
            숙박인원 
            <input type="text" id=stayPerson><pre></pre>
            최대인원 
            <input type="text" id=maxPerson><pre></pre>
            숙박기간 
            <input type="date" id=month1> ~ <input type="date" id=month2><br><br>
           예약자명 
            <input type="text" id=reserv_name><pre></pre>
<!--        1박비용
            <input type="text" id=onedaypri><pre></pre>
            총 숙박비
            <input type="text" id=total>원<pre></pre> -->
            예약자모바일
            <input type=text id=phonenum><pre></pre>
            <input type=button id=register value="   등록   ">&nbsp;&nbsp;&nbsp;   
            <input type=button id=delete value="   삭제   ">&nbsp;&nbsp;&nbsp; 
            <input type=button id=clear value="   클리어   ">
            </td></tr>
        </table>
         </div>
        <div class=already>
            <span style="font-size: 20px;">예약된 객실</span><br>
            <table border="1" bordercolor="black" width="150" height="200">
         <tr>
         	<td align="middle">
         		//
         	</td>
         </tr>

            </table>

        </div>
        </section>

</body>
<script src= 'http://code.jquery.com/jquery-3.6.0.js'></script>
<script>
  
</script>
</html>