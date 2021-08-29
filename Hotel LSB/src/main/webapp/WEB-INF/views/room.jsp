<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔객실 관리</title>
</head>
<style>
    p{
        font-size: 20px;
    }
    table {
        border: 1px solid black;
        
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
        left: 200px;
        bottom: 300px;
        width: 420px;
        height: 300px;
        border: solid 2px black;
    }
    .already {
        position:relative;
        left: 700px;
        bottom: 630px;
    }
</style>
<body>
    <section id="wrap">
        <h1>호텔객실관리페이지</h1>
        <header>
        <section id="container"></section>
            <p> <a href=/app/booking>예약관리&nbsp&nbsp&nbsp</a> 
           객실관리
            
            <a href=/app/logout name=back>로그아웃</a></p>
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
                            <option>Suite Room</option>
                            <option>Family Room</option>
                            <option>Double Room</option>
                            <option>Single Room</option>
                            <option>Dormitory</option>
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
                <table border="1" bordercolor="white" width="150" height="300">
                    <tr><td align="middle"><a href =#>한라산</a>
                        <br>
                        <a href =#>백두산</a>
                        <br>
                        <a href =#>남산</a>
                        <br>
                        <a href =#>수명산</a>
                        <br>
                        <a href =#>태조산</a>
                    </td></tr>          
                       </table>
            
         </div>
        </table>
         <div class=room_reserv>
             <table>
            객실이름 
            <input type="text" id=roomname><pre></pre>
            숙박기간 
            <input type="date" id=month> ~ <input type="date" id=month>(N박)<br><br>
            숙박인원 
            <input type=number id=stayperson>명<pre></pre>
            1박비용
            <input type="text" id=onedaypri>원<pre></pre>
            총 숙박비
            <input type="text" id=onedaypri>원<pre></pre>
            예약자모바일
            <input type=text id=phonenum><pre></pre>
            <input type=button id=register value="   등록   ">&nbsp&nbsp&nbsp   
            <input type=button id=register value="   삭제   ">&nbsp&nbsp&nbsp  
            <input type=button id=register value="   클리어   ">
        </table>
         </div>
        <div class=already>
            <span style="font-size: 20px;">예약된 객실</span><br>
            <table border="1" bordercolor="white" width="150" height="200">
         <tr><td align="middle">광덕산<br>흑성산<br>태조산<br>관악산</td></tr>

            </table>

        </div>
        </section>
<a href=selected?path=/booking name=gotobook>예약관리</a>
<a href=selected?path= name=back>로그아웃</a>
</body>
</html>