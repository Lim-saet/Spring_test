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

<style>
.container{
	display: flex;
    flex-flow: row wrap;
	justify-content: space-between;
	align-content: space-between; 
	border: 10px dotted white;

}
p{
        font-size: 20px;
    }
a {
        text-decoration-line: none;
    }
 a:hover{
 	background : #ffeae3;
 }
.r_possible {
        font-size: 18px;
        position:relative;
        top: 100px;

    }
.room_reserv {
      /*  position: relative;
        top: 100px;
        left: 300px;
        bottom: 200px;
        right: 200px;*/
        width: 390px;
        height: 480px;

    }
.already {
        display: flex;
        justify-content: center;
    	align-items: center;
    	flex-direction: column;
    }

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
span#reserv{
	background-image: linear-gradient(rgba(0, 195, 6, 0.2) 100%, transparent 0); 
	background-position: 0 0.85em; 
	background-repeat: repeat-x; 
	background-size: 1px 0.5em;
}
.line {
	border: 2px solid white;
	width: 400px;
	height: 90px;
}
nav {
	display: flex;
	justify-content: center;

}
input[type=date] {
    border : 2px solid #ffd4cc;
    border-radius : 5px;
}
input[type=date]:hover {
    background : #ffeae3;
}
input[type=text] {
    border : 2px solid #ffd4cc;
    border-radius : 5px;
}
input[type=text]:hover{
	background : #ffeae3;
}
select#selType1{
	border : 2px solid #ffd4cc;
    border-radius : 5px;
}
select#selType1:hover{
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

select#seltype{
	border: 3px solid white;
}
select#reservList{
	border: 3px solid white;
}
.updown {
    	border: 10px dotted white;
        width: 0.1px;
        height: 480px;
        position: relative;
        right:10px;
    }
 span#copyright{
	font-family: 'Gowun Dodum', sans-serif;
	color: #cbd1c7;
	position:relative;
	top:179px;
}
</style>
<head>
<meta charset="UTF-8">
<title>호텔예약 관리</title>
</head>
<body>
<header>
	    <div class='nowId'>* connected ID : ${loginid} *</div><br>
	     <div class='hoteltext'>_Hotel Reservation_</div>   	
</header>
        <nav>
            <p> <a href=/app/room>객실관리</a>&nbsp;&nbsp;&nbsp; 
    	<span id="reserv">예약관리</span>
            &nbsp;&nbsp;&nbsp; 
            <a href=/app/logout name=back>로그아웃</a></p><br>
        </nav>
            
            <div class='container'>
				<div class='line'>
        			<table>
                <tr>
                    <th>숙박기간</th>
                    <td>
                    <input type="date" id=checkin1> ~ <input type="date" id=checkout1><br><br></td> 
                </tr>
                <tr>
                    <th>객실분류</th>
                       <td> 
                         <select size=1 style='width:120px;' id=selType1>
		           			<option value='1'>Suite Room</option>
		           			<option value='2'>Family Room</option>
		           			<option value='3'>Double Room</option>
		           			<option value='4'>Single Room</option>
           				</select>
                			<input type="button" value="찾기" id="btnfind">
           				 </td>
           		 </tr>
       </div>
        	</table>
        	
        <table>
                <p><b>예약가능</b> </p> 
             <div class=r_possible>
                <table  width="250" height="200">
                    <tr>
                    
                    <td align="middle">
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
       <div class="updown"></div>
         <div class=room_reserv>
             <table>
             <tr><td align="middle">
             <br>
            객실이름 
            <input type="text" id="roomName" readonly><pre></pre>
         	<input type=hidden id="roomcode">
         	<input type=hidden id="bookcode">
           방 종류
			<select size=4 style='width:110px;' id="selType2" disabled>
           		<c:forEach items="${type}" var="room">
           			<option value='${room.typecode}'>${room.name}</option>
           		</c:forEach>
           </select><pre></pre>
            숙박인원 
            <input type="text" id=stayPerson ><pre></pre>
            최대인원 
            <input type="text" id="maxPerson" readonly><pre></pre>
            숙박기간 
            <input type="date" id=checkin disabled> ~ <input type="date" id=checkout disabled><br><br>     

            총 숙박비
            <input type="text" id="total" readonly><pre></pre>
            예약자명 
            <input type="text" id=reserv_name><pre></pre> 
            예약자모바일
            <input type=text id=phonenum><pre></pre>
            <input type=button id=ok_reserv value="   예약완료   ">&nbsp;&nbsp;&nbsp;   
            <input type=button id=delete value="   삭제   ">&nbsp;&nbsp;&nbsp; 
            <input type=button id=clear value="   클리어   ">&nbsp;&nbsp;&nbsp; 
            <input type=button id=update value="   예약수정   ">
            </td></tr>
        </table>
         </div>
         <div class="updown"></div>
        <div class=already>
            <span style="font-size: 20px;"><b>예약된 객실</b></span><br>
            <table  width="300" height="200" id=reserv_wan>
         <tr>
         	<td align="middle">
         	<input type=hidden id=roomcode1>
         	<input type=hidden id=bookcode1 >
         		<select size=10 style='width:600px;' id=reservList>
         			
         		</select>
         	</td>
         </tr>

            </table>

        </div>

		</div>
		<span id="copyright">(C)2021.(임샛별)all rights reserved.</span>
</body>
<script src= 'http://code.jquery.com/jquery-3.6.0.js'></script>
<script>
$(document)
.ready(function(){

		$("#seltype").change(function(){
				if($('#checkin').val()==''){
					alert("체크인날짜를 먼저 선택해주세요!");
					return false;
				} else if ($('#checkout').val()==''){
					alert("체크아웃날짜를 선택해주세요!");
					return false;
				}
			 var arr = $('#seltype option:selected').text().split(",");
			 
			 var trimArr1=arr[0].trim(); 
				 
			 $('#roomName').val(trimArr1);
			 //console.log(arr[0]);

			 $('#selType2 option:contains("'+arr[1]+'")').prop("selected",true);
			 if($('#selType2 option:selected')){
			 	let start=$('#checkin').val();
	  			let end=$('#checkout').val();
	  			
	  			var ar1=start.split('-');
	  			var ar2=end.split('-');
	  			
	  			var da1= new Date(ar1[0], ar1[1]-1, ar1[2]);
	  			var da2= new Date(ar2[0], ar2[1]-1, ar2[2]);
	  			//console.log(da1);
	  			var dif= da2-da1;
	  			var c_day=24*60*60*1000;
	  			
	  			$('#total').val(parseInt(dif/c_day)*arr[3]);
	  			}
			 
			 $('#maxPerson').val(arr[2]); 
			 
			 let code=$(this).val();
			 //console.log(code);
			 $('#roomcode').val(code); 
			 
			 return false;
	})
  })

$(document)
		 	.on('click','#ok_reserv',function(){
		 		let roomcode=$('#roomcode').val();
		 		//console.log(person);
				let person=$('#stayPerson').val();
				let howmany=$('#maxPerson').val();
				let checkin=$('#checkin').val();
				let checkout=$('#checkout').val();
				let mobile=$('#phonenum').val();
				let name=$('#reserv_name').val();
				let total=$('#total').val();
				let bookcode=$('#bookcode').val();
				
				//validation(유효성검사)
				if( roomcode==''|| howmany=="" || person=="" || checkin==""|| checkout==""|| mobile=="" || name=="")
				{
					alert('누락된 값이 있습니다.');
					return false;
				  } else if($('#stayPerson').val()>$('#maxPerson').val()) {
					 alert("인원수를 확인해주십시오");
					 return false;
				  }
					else{
						if(bookcode==''){
							$.post('http://localhost:8080/app/addBooking',
		 					{roomcode:roomcode,person:person,checkin:checkin
					     	,checkout:checkout,total:total,name:name,mobile:mobile}, 
					    	 function(result){
								if(result=='ok'){
									//let code=$('#roomcode').val();
									pstr='<option value="'+$('#roomcode').val()+'">'+
									$('#roomName').val()+','+$('#selType2 option:selected').text()+','+
									$('#stayPerson').val()+','+$('#maxPerson').val()+','+
									$('#checkin').val()+','+$('#checkout').val()+','+
									$('#reserv_name').val()+','+$('#phonenum').val()+','+$('#total').val()+'</option>';
									$('#reservList').append(pstr);
								
									$('#clear').trigger('click');//입력란 비우기
									$('#selType2 option:selected').remove();//roomlist에서 제거
									$('#checkin1,#checkout1').val('');
								}
							//location.reload();		
		       				},'text');
					     }
	 		}				     
 })
		
$(document)
  		.on('click','#clear',function(){
  			$('#roomName,#selType2,#checkin,#checkout,#stayPerson,#maxPerson,#total,#reserv_name,#phonenum').val('');
  			return false;
  		})
  		.on('change','#checkin1,#checkout1',function(){
  			let ch_in=$('#checkin1').val();
  			let ch_out=$('#checkout1').val();
  			$('#checkin').val(ch_in);
  			$('#checkout').val(ch_out);
  			
  		})
 		.on('click','#btnfind',function(){
 			if($('#checkin1').val()>$('#checkout1').val()){//왜 체크인날짜 정할때부터 alert뜨지;;
  				alert('체크인날짜가 체크아웃날짜를보다 앞에 있을 수 없습니다.');
  				return false;
  			}
 			if($('#checkin1').val()=='' || $('#checkout1').val()==''){
 				alert('날짜를 선택해주세요.');
 				return false;
 			}
 				$.post("http://localhost:8080/app/getBookedList",{checkin:$('#checkin1').val(),checkout:$('#checkout1').val()},function(result)
 				{
 					$('#reservList').empty();
 					$.each(result,function(ndx,value){
 						str='<option value="'+value['roomcode']+'">'+value['roomname']+','+value['typename']+','+value['person']+
 						','+value['max_howmany']+','+value['checkin']+','+value['checkout']+','+value['total']+','+value['name']+','
 						+value['mobile']+','+value['bookcode']+'</option>';
 						$('#reservList').append(str);
 					})
 				},'json');
 				
 				$.post("http://localhost:8080/app/getBookList",{checkin:$('#checkin1').val(),checkout:$('#checkout1').val(),typecode:$('#selType1 option:selected').val()},function(result){
					//console.log(result);
					$('#seltype').empty();
					$.each(result,function(ndx,value){
						str='<option value="'+value['roomcode']+'">'+value['roomname']+','+
							value['typename']+','+value['howmany']+','+value['howmuch']+'</option>';
							$('#seltype').append(str);
					})
					},'json');	
 			})
 			.on('click','#update',function(){
 				let roomcode=$('#roomcode').val();
 				//console.log(person);
				let person=$('#stayPerson').val();
				let checkin=$('#checkin').val();
				let checkout=$('#checkout').val();
				let mobile=$('#phonenum').val();
				let name=$('#reserv_name').val();
				let total=$('#total').val();
				let bookcode=$('#bookcode').val();
				
 				$.post('http://localhost:8080/app/updateBook',
						{bookcode:bookcode,roomcode:roomcode,checkin:checkin,checkout:checkout,total:total,
			    		 name:name,mobile:mobile,person:person},
			    		 //console.log(roomcode)
							function(result){
								if(result=='ok'){
								location.reload();
								}
					
							},'text');
 			})
 			.on('click','#delete',function(){
			$.post('http://localhost:8080/app/deleteBook',{bookcode:$('#bookcode').val()},
					function(result){ 
				console.log(result);
				if(result=='ok'){
					$('#clear').trigger('click');//입력란 비우기
					$('#reservList option:selected').remove();//roomlist에서 제거
				}
			},'text');
		})
		
$(document)
.ready(function(){
		$("#reservList").change(function(){
			var arr=$('#reservList option:selected').text().split(",");	
			var trimArr1=arr[0].trim();
			//var otherAr=arr[2].split("/");
			console.log(arr);
			
			$('#roomName').val(trimArr1);
			let code=$('#reservList option:selected').val();
			
			$('#selType2 option:contains("'+arr[1]+'")').prop("selected",true);
			$('#stayPerson').val(arr[2]);
			$('#maxPerson').val(arr[3]);
			$('#checkin').val(arr[4]);
			$('#checkout').val(arr[5]);
			$('#total').val(arr[6]);	
			$('#reserv_name').val(arr[7]);
			$('#phonenum').val(arr[8]);
			$('#bookcode').val(arr[9]);
			$('#roomcode').val(code);
			 
			return false;
	})
})
</script>
</html>