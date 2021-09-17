<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>  
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Julius+Sans+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">

<head>
<meta charset="UTF-8">
<title>호텔객실 관리</title>
</head>
<style>
* {
	background-color: rgb(255, 245, 232);
	font-family: 'Gowun Dodum', sans-serif;
}
.nowId {
	font-family: 'Julius Sans One', sans-serif;
}
.hoteltext{
	font-family: 'Lobster', cursive;
	color: #e8ac9b;
	font-size: 60px;
	display: flex;
	align-items: center;
	justify-content: center;
}
.container{
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	justify-content: center;
}
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
        top: 10px;
        left: 330px;
        bottom: 450px;
        right: 300px;
        width: 280px;
        height: 300px;
        
    }
    .already {
        position:relative;
        left: 800px;
        bottom: 730px;
    }
    span#room_{
	background-image: linear-gradient(rgba(0, 195, 6, 0.2) 100%, transparent 0); 
	background-position: 0 0.85em; 
	background-repeat: repeat-x; 
	background-size: 1px 0.5em;
}
nav {
	display: flex;
	justify-content: center;

}
 a:hover{
 	background : #ffeae3;
 }
 select#seltype{
	border : 3px solid white;
    border-radius : 5px;
    
}
select#seltype:hover{
	background : #ffeae3;
}
input[type=button] {
     border : 1px solid #f7ede1;
    border-radius : 5px;
    color: black;
	background-color: #ffeae3;
}
input[type=button]:hover{
	background : #d6f7be;
}
input[type=text] {
    border : 2px solid #ffd4cc;
    border-radius : 5px;
}
input[type=text]:hover{
	background : #ffeae3;
}
input[type=number] {
    border : 2px solid #ffd4cc;
    border-radius : 5px;
}
input[type=number]:hover{
	background : #ffeae3;
}
.updown {
    	border: 10px dotted white;
        width: 0.1px;
        height: 350px;
        position: relative;
		left: 300px;
		bottom: 40px;
    }
 .box1{
 	border: 10px dotted white;
 	width:300px;
 	height:350px;
 	display: flex;
 	flex-direction: column;
 	flex-wrap: wrap;
 	align-content: space-around;
 	justify-content: center;
 	align-items: center;
 }
  span#copyright{
	font-family: 'Gowun Dodum', sans-serif;
	color: #cbd1c7;
	position:relative;
	top:179px;
}
div#box-color{
	background: #DF7861; 
}
div#box-color1{
	background: #ECB390;
}
div#box-color2{
	background: #F9F3DF;
}
div#box-color3{
	background: #D4E2D4;
}
div#box-color4{
	background: #FCF8E8;
}
</style>
<body>
    <header>
    <div class='nowId'>* connected ID : ${loginid} *</div><br>
       <div class='hoteltext'>_Hotel Room_</div>
        </header>
        <nav>
        <p>
        	<span id="room_">객실관리</span>&nbsp;&nbsp;&nbsp; 
        	
             <a href=/app/booking>예약관리</a>
           
            &nbsp;&nbsp;&nbsp; 
            <a href=/app/logout name=back>로그아웃</a></p><br>
            </nav>
        
       <div class="container">
       <div class="box1">
                 <span style= "font-size:20px">
                    <b>예약가능</b>
                    <br>
                    </span>
             <div class=r_possible>
                <table  width="250">
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
       </div>
     <div class="box1" id="box-color3">
         <div class=room_reserv>
             <table>
             <tr><td align="middle">
             <br>
            객실이름 
            <input type="text" id=roomName><pre></pre>
            <input type=hidden id=roomcode>
           방 종류
           <select size=5 style='width:120px;' id=selType2 >
           		<c:forEach items="${type}" var="room">
           			<option value='${room.typecode}'>${room.name}</option>
           		</c:forEach>
           </select><pre></pre>

            숙박인원 
            <input type="number" id=stayperson><pre></pre>
      1박비용
            <input type="number" id=onedaypri><pre></pre>
          
            <input type=button id=register value="   등록   ">&nbsp;&nbsp;&nbsp;   
            <input type=button id=delete value="   삭제   ">&nbsp;&nbsp;&nbsp; 
            <input type=button id=clear value="   클리어   ">
            </td></tr>
        </table>
         </div>
        </div>
       
<div class="box1" ></div>
<div class="box1" id="box-color"></div>
<div class="box1"></div>
<div class="box1" id="box-color1"></div>
<div class="box1"></div>
<div class="box1" id="box-color2"></div>

<div class="box1"></div>
<div class="box1" id="box-color4"></div>
</div>
<span id="copyright">(C)2021.(임샛별)all rights reserved.</span>
</body>
<script src= 'http://code.jquery.com/jquery-3.6.0.js'></script>
<script>
  $(document).ready(function(){
		$("#seltype").change(function(){
			
			 var arr = $('#seltype option:selected').text().split(",");
			 
			 var trimArr1=arr[0].trim(); 
				 
			 $('#roomName').val(trimArr1);
			 //console.log(arr[0]);

			 $('#selType2 option:contains("'+arr[1]+'")').prop("selected",true);
		
			 $('#stayperson').val(arr[2]); 
			 $('#onedaypri').val(arr[3]); 
			 
			 let code=$(this).val();
			 console.log(code); //확인해보러 가좌
			 $('#roomcode').val(code);
			 
			 return false;
	})
  })
  $(document)
  		.on('click','#clear',function(){
  			$('#roomName,#selType2,#month,#stayperson,#onedaypri,#total,#phonenum,#roomcode').val('');
  			return false;
  		})
		.ready(function(){
			$.post("http://localhost:8080/app/getRoomList",{},function(result){
					console.log(result);
					$.each(result,function(ndx,value){
						str='<option value="'+value['roomcode']+'">'+value['roomname']+','+
							value['typename']+','+value['howmany']+','+value['howmuch']+'</option>';
							$('#seltype').append(str);
					})
					},'json');
		})
		
		.on('click','#delete',function(){
			$.post('http://localhost:8080/app/deleteRoom',{roomcode:$('#roomcode').val()},
					function(result){ 
				console.log(result);
				if(result=='ok'){
					$('#clear').trigger('click');//입력란 비우기
					$('#selType2 option:selected').remove();//roomlist에서 제거
				}
			},'text');
		})
			
  
			.on('click','#register',function(){
					let roomname=$('#roomName').val();
					let roomtype=$('#selType2').val();//이거 셀렉트아이디 맞죠?
					let howmany=$('#stayperson').val();
					let howmuch=$('#onedaypri').val();
					//validation(유효성검사)
				if(roomname=='' || roomtype=="" || howmany=="" || howmuch==""){
					alert('누락된 값이 있습니다.');
					return false;
				  }
				let roomcode=$('#roomcode').val();
				if(roomcode=='') { //insert
				$.post('http://localhost:8080/app/addRoom',
					{roomname:roomname,roomtype:roomtype,howmany:howmany,howmuch:howmuch},
						function(result){
						if(result=='ok'){
							location.reload();
						} 
					},'text');
			}   else {//update console.log(arr[0]);
			//console.log('roomname['+roomname+']')
						$.post('http://localhost:8080/app/updateRoom',
								{roomcode:roomcode,roomname:roomname,
								 roomtype:roomtype,howmany:howmany,
								 howmuch:howmuch}, 
								 function(result){ 
									 if(result=='ok'){
										 location.reload();
									 }
					},'text');
				}
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