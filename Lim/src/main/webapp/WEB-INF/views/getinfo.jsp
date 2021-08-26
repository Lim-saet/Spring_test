<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- <form method="get" action="/info">
	ID: <input type=text name=userid><br>
	Address: <input type=text name=address><br>
	<input type=submit value="전송">
</form>
<br> -->
<table border=1>
<%-- <%
	int k=1;
	for(int i=0;i<5;i++) {
		out.println("<tr>");
		for(int j=0;j<4;j++) {
			out.println("<td align=center>"+k+"</td>");
			k++;
		}
		out.println("</tr>");
	}
%> --%>

<%! int k=1;%>
<%  
	for(int i=0;i<5;i++) {
%>
<tr>
<%
	for(int j=0;j<4;j++){
%>	
<td align=center><%=k %> </td>
<% 	
			k++;
		}
	out.println("</tr>");
	}
%>
</table>
</body>
</html>