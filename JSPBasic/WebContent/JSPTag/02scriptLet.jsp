<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 아래코드는 실제로 보이지 않으며, 자바코드를 넣을 수 있다.  -->
	<% 
	int a = 1;
	
	if(a >= 10){
		out.println("10보다 크다");
	}else{
		out.println("10보다 작다");    // system.out이 아닌 out이면 브라우저 화면으로 나감.
	}
	%>
	<hr/>
	<%
		for(int i = 1; i<=10; i++){
			out.println(i + "<br>");
		}
		for(int i = 1; i<=10; i++){
			out.println(i);
		}
	%>
	<hr/>
	<%
		int num = 0;
		if(num >= 10){
			out.println("<p>참입니다</p>");
		}else{
			out.println("<p>거짓입니다</p>");
		}
	%>	
	<hr/>
	<%	if(num >= 10){ %>
			<p>참입니다</p>
	<%	}else{	%>
			<p>거짓입니다</p>
	<% 	} 	%>	
	
	<hr/>
	1.구구단 3단 out.println과 hr태그를 사용해서 브라우저 화면에 출력
	
	<% 
		for(int j = 1; j <= 9; j++){
			out.println("3 X " + j + " = " + (3*j) + "<br/> <hr/>");
		
	} %>
	
	2. 체크박스 20개를 브라우저에 생성
		<form>
	<%	for(int i = 1; i<=20 ; i++){ %>
			<input type="checkbox" >					
	<%		out.println(i);
		if(i%5==0){
			out.println("<br/>");
		}
		}	%>
		</form>
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>