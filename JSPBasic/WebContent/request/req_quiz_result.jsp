<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int math = Integer.parseInt(request.getParameter("math"));
	
	int sum = kor + eng + math;
	double avg = sum/3.0;
	
	String result = String.format("%.2f", avg);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>성적표</h2>
	이름 : <%=name %><br/>
	국어점수 : <%=kor %><br/>
	영어점수 : <%=eng %><br/>
	수학점수 : <%=math %><br/>
	합계 : <%=sum %><br/>
	평균 : <%=result %><br/>
	등급 : 
	<%if(avg >= 80){%>
		고득점
	<%}else if(avg >= 60){%>
		중간
	<%}else{%>
		저득점
	<%}%>
	<br/>
</body>
</html>