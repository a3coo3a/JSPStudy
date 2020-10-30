<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 인증이 없는 사람은 첫번째 페이지로
	if(session.getAttribute("authYN") == null){
		response.sendRedirect("auth.jsp");
	}

	// application객체의 예약정보를 얻습니다.
	List<String> list = new ArrayList<>();
	if(application.getAttribute("okList") != null){
		list = (List<String>)application.getAttribute("okList");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		태그를 선택하지 못하도록 하는 옵션 : disabled
		checkbox, radio를 선택하게 하는 옵션 : checked
		select태그에서 미리 선택하게 하는 옵션 : selected
		input태그에 반드시 값을 입력 : required
		input태그를 읽기속성 : readonly
	 -->
	
	<div align="center">
		<h2>영화 좌석 예약</h2>
		<h4>예약할 좌석을 체크하세요</h4>
		
		<form action="reserve_ok.jsp" method="post">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<% for(char c = 'A'; c <= 'Z';c++){%>
				<small><%=c %></small>&nbsp;&nbsp;		<!-- &nbsp; -> 마크업언어의 스페이스바, html은 마크업언어 -->				
			<%}%>
			<br/>
			<%for(int i = 1;i <= 6; i++){ %>
				<%=i %>
				<%for(char c = 'A'; c <= 'Z'; c++){ // 체크박스 체크 못하게 하는 옵션 : disabled%>
					<input type="checkbox" name="seat" value="<%=c%>-<%=i%>" <%=list.contains(c+"-"+i) ? "disabled": ""%>> 
				<%} %>
				<%=i==3?"<br/>":""%>
				<br/>
			<%} %>
			
			<input type="submit" value="예약">
			<input type="button" value="처음으로" onclick="location.href='auth.jsp'">		<!-- onclick:클릭했을때라는 이벤트로 자바스크립트 기능이들어감. 첫 인증페이지로 돌아가게  -->
			
		</form>
		
	</div>

</body>
</html>