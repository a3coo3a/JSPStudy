<%@page import="java.util.Collections"%>
<%@page import="javafx.print.Collation"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 정수를 저정하는 list 생성
	// 1~45까지 랜덤한 번호를 생성하고 리스트에 저장
	// 중복되지 않는 숫자로 6개 번호를 저장하면 됨.
	// 화면에 출력.
	// set을 이용해서도 처리
	ArrayList<Integer> list = new ArrayList<>(); 
	Set<Integer> set = new HashSet<>();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>리스트를 이용한 랜덤 번호 출력</h2>
<%
Random ran = new Random();

while(list.size() < 6){
	int num = ran.nextInt(45)+1;
		if(!list.contains(num)){
			list.add(num);
		}
}
	Collections.sort(list);  // static메서드 리스트 정렬
	
%>
<%=list %>
<hr/>
<h2>SET을 이용한 랜덤 번호 출력</h2>
<%
	while(set.size() < 6){
		int num = ran.nextInt(45)+1;
		set.add(num);
	}
%>
<%=set %>


</body>
</html>