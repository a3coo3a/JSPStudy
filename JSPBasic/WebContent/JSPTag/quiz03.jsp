<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	String[] friend = {"어피치","라이언","제이지","무지","프로도","튜브"};		//6명
	ArrayList<String> list = new ArrayList<>();
	Random ran = new Random();
%>
<%
	int num = ran.nextInt(6);
	int count = 0;
	if(list.size() >= 10){
		list.clear();
	}
	list.add( friend[num] );
	for(String n : list){
		if(n.equals(list.get(list.size()-1))){
			count++;
		}
	}
	//for( int i = 0; i < list.size(); i++ ){
	//	if( list.get(i) == list.get(list.size() - 1 ) ){
	//		count++;
	//	}
	//}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>
	<strong>[<%=list.get(list.size()-1) %>]</strong>님이 입장<br/>	
	현재 같은 카카오 프렌즈는 <%=count %>명 입니다.<br/>
</p>
<h2>현재 구성정보</h2>
<p>
	<%=list.toString() %> (<%=list.size() %>명 참가중)
</p>
</body>
</html>