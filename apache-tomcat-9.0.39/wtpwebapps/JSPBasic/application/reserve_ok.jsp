<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 좌석정보를 받습니다
	String[] seat = request.getParameterValues("seat");
	System.out.println(seat.toString());
	
	// 2. 좌석정보를 저장할 list생성
	// 3. application에서 좌석정보가 존재하면 2번list에 저장
	List<String> seatlist = new ArrayList<>();
	List<String> copylist = new ArrayList<>();
	if(application.getAttribute("okList") != null){
		seatlist = (List<String>)application.getAttribute("okList");
	}
	// 4. 좌석정보를 비교해서 중복이 없을때 하나씩 저장해 놓을 사본 리스트 생성
	// 4. 좌석정보와 2번 리스트를 비교해서, 중복된 좌석이 아니라면, 사본리스트에 추가
	for(String s : seat){
		if(seatlist.contains(s)){
			break;
		}else{
			copylist.add(s);
		}
	}
	
	// 5. 사본리스트와 좌석정보가 길이가 같아면 중복이 없으므로, 2번리스트에 통째로 사본리스트에 추가
	
	if(seat.length == copylist.size()){
		seatlist.addAll(copylist);
		
	}
	// 6. application에 같은 이름으로 저장
	application.setAttribute("okList", seatlist);
	// 7. 화면에 예약 성공실패의 결과를 출력해주세요
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
	<%if(   seat.length == copylist.size()  ) { %>
		<h3>예약성공</h3>
		예매정보 확인<br>
		예매좌석 번호 : <%for(String s : seat){ %>
			[<%=s %>]
		<%} %>
		<br>
		예매된 전체 좌석번호 : <%=application.getAttribute("okList").toString() %>
	<% } else { %>
		<h3>예약실패</h3>
	<% } %>
	<button type="button" onclick="location.href='reserve.jsp'">다시 예약하기</button>
</div>
</body>
</html>