<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>formatNumber, formatDate, parseDate, parseNumber</h2>
	<h3>※ formatNumber -> 숫자의 자리수를 지정합니다.</h3>
	<c:set var="d01" value="2020" />
	<fmt:formatNumber var="v01" value="${d01 }" pattern="000000" />
	6자리 : ${v01 } <br/>
	
	<fmt:formatNumber var="v02" value="${d01 }" pattern="0000.00"/>
	4자리, 소수점2자리 : ${v02 } <br/>


	<hr/>
	<h3>※ formatDate -> 날짜형을 지정된 날짜 형태로 변경.</h3>
	<h4>반드시! 바꿔야 하는 데이터도 날짜형식여야 한다는 이야기</h4>
	<c:set var="d02" value="<%=new Date() %>" />
	<%-- <%=new Timestamp(202304234) %>"  --%>
	${d02 }<br/>
	
	<fmt:formatDate var="v03" value="${d02 }" pattern="yyyyMMdd HHmmss"/>
	<fmt:formatDate var="v04" value="${d02 }" pattern="yyyy년 MM월 dd일"/>
	<fmt:formatDate var="v05" value="${d02 }" pattern="yyyy-MM-dd HH:mm:ss"/>
	${v03 }<br/>
	${v04 }<br/>
	${v05 }<br/>
	
	<hr/>
	<h3>※ parseDate -> 문자를 날짜(java.util.Date)로 형변환</h3>
	<h4>db에  to_date 역할</h4>
	<c:set var="d03" value="2020/11/04" />
	<fmt:parseDate var="v06" value="${d03 }" pattern="yyyy/MM/dd" />
	${v06 }<br/>
	
	<c:set var="d04" value="2020-11-04 23:12:34"/>
	<fmt:parseDate var="v07" value="${d04 }" pattern="yyyy-MM-dd HH:mm:ss"/>
	${v07 }
	
	
	<hr/>
	<h3>※ parseNumber -> 문자를 숫자형으로 형변환</h3>

	<c:set var="d05" value="<%=new Date() %>"/>
	<fmt:parseNumber var="v08" value="${d05.time }"  />
	
	v08 값  :  ${v08 }<br/>
	밀리초형식 : <%=new Date().getTime() %><br/>
	
	<c:set var="d06" value="1,100.00"/>
	<fmt:parseNumber var="v08" value="${d06 }" pattern="0,000.00"/>
	${v08 }
	
	
	
	

</body>
</html>