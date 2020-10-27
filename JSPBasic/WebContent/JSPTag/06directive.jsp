<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Date
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd hh:mm:ss");
	String now = sdf.format(date);
	//ArrayList
	ArrayList<String> list = new ArrayList<>();
	list.add("홍길동");
	list.add("홍길자");
	//HashMap
	HashMap<Integer,String> map = new HashMap<>();
	map.put(1, "홍길동");
	map.put(2, "홍길자");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 표현식과 스트립트릿을 이용해서 map데이터, list데이터를 순서대로 출력 -->
	<%=now %>
	
	<br/>
	<h3>리스트 요소 출력</h3>
	
	<% for(int i = 0; i < list.size() ; i++){%>
		<%=list.get(i) %> <br/>
	<%}	%>
	<br/>
	<% for(String name : list){%>
		<%=name %> <br/>
	<%}	%>
	
	<h3>맵 요소 출력</h3>
	<%
	Iterator<Integer> iter = map.keySet().iterator();
	while(iter.hasNext()){%>
		<%=map.get(iter.next()) %><br/>
	<%}	%>
	
	<br/>
	
	<%Set<Entry<Integer,String>> iter2 = map.entrySet();%>
	<%for(Entry<Integer,String> j : iter2){%>
		<%= j.getKey() %>
		<%= j.getValue() %><br/>
	<%}	%>
	
	
	<%-- <%=map %>--%>	




</body>
</html>