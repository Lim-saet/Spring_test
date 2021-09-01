<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
        width: 420px;
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
        <h1>호텔객실관리페이지</h1>
        <header>
        <section id="container"></section>
            <p> <a href=/app/booking>예약관리</a>&nbsp&nbsp&nbsp 
           객실관리
            &nbsp&nbsp&nbsp 
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
                <table border="1" bordercolor="black" width="250" height="300">
                    <tr><td align="middle">
                     <select size=10 style='width:250px;' id=seltype>
            			<c:forEach items="${list}" var="room">
            				<option value='${room.roomcode}'>
            					${room.roomname},${room.typename},${room.howmany}명,${room.howmuch}원
            				</option>
            			</c:forEach>
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
           		<c:forEach items="${type}" var="room">
           			<option value='${room.typecode}'>${room.name}</option>
           		</c:forEach>
           </select><pre></pre>
            숙박기간 
            <input type="date" id=month> ~ <input type="date" id=month>(N박)<br><br>
            숙박인원 
            <input type="text" id=stayperson><pre></pre>
            1박비용
            <input type="text" id=onedaypri><pre></pre>
            총 숙박비
            <input type="text" id=total>원<pre></pre>
            예약자모바일
            <input type=text id=phonenum><pre></pre>
            <input type=button id=register value="   등록   ">&nbsp&nbsp&nbsp   
            <input type=button id=delete value="   삭제   ">&nbsp&nbsp&nbsp  
            <input type=button id=clear value="   클리어   ">
            </td></tr>
        </table>
         </div>
        <div class=already>
            <span style="font-size: 20px;">예약된 객실</span><br>
            <table border="1" bordercolor="black" width="150" height="200">
         <tr><td align="middle">광덕산<br>흑성산<br>태조산<br>관악산</td></tr>

            </table>

        </div>
        </section>

</body>
<script src= 'http://code.jquery.com/jquery-3.6.0.js'></script>
<script>
  $(document).ready(function(){
		$("#seltype").change(function(){
			
			 var arr = $('#seltype option:selected').text().split(",");
			 
			 var trimArr1=arr[0].trim(); 
				 
			 $('#roomName').val(trimArr1);
			 console.log(arr[0]);

			 $('#selType2 option:contains("'+arr[1]+'")').prop("selected",true);
		
			 $('#stayperson').val(arr[2]); 
			 $('#onedaypri').val(arr[3]); 
			 return false;
	})
  })
  $(document)
  		.on('click','#clear',function(){
  			$('#roomName,#selType2,#month,#stayperson,#onedaypri,#total,#phonenum').val('');
  			return false;
  		})
		.ready(function(){
			$.post("http://localhost:8080/app/getRoomList",{},function(result){
					console.log(result)},
					'json');
			
		})
	/*function appear(obj){
		 var arr = $('#obj option:selected').text().split(","); 
		alert('#seltype option selected'.text()); 
		
	     $('#roomname').val(arr[0]);
		 console.log(arr[0]);
		 for(i=1;i<5;i++){
		 if(arr[1]==$('#selType2').val('i'))
		 {$('#selType2').val('i').prop("selected",true);
		 }
	  }
		 $('#stayperson').val(arr[2]);
		 $('#onedaypri').val(arr[3]);
	   }
	
	 }
	}*/
</script>
</html>