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
        width: 280px;
        height: 300px;
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
        <h1>호텔객실관리페이지</h1>
        <header>
        <section id="container"></section>
            <p> <a href=/app/booking>예약관리</a>&nbsp;&nbsp;&nbsp; 
           객실관리
            &nbsp;&nbsp;&nbsp; 
            <a href=/app/logout name=back>로그아웃</a></p><br>
            
        </header>
       
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
            <input type=hidden id=roomcode>
           방 종류
           <select size=5 style='width:120px;' id=selType2>
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
        
        </section>

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