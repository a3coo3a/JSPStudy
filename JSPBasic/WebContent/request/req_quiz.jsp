<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 
	1. form를 이용해서 post형식으로 이름, 국, 영, 수 값을 입력받습니다.
	2. req_quiz_result.jsp로 전송
	3. 해당 페이지에서는 평균, 합계를 구하고, 80점이상 : 고득점, 60점이상 : 중간, 60점 아래 : 저득점 출력
-->

<h2>점수를 입력하세요</h2>
	
<form action="req_quiz_result.jsp" method="post">
<table>
<tr>
	<td>이름 : </td>
	<td>
		<input type="text" name="name" required/>
	</td>
</tr>
<tr>
	<td>국어 : </td>
	<td>
		<input type="text" name="kor" pattern="[0-9]{2,3}" required/>
	</td>
</tr>
<tr>
	<td>영어 : </td>
	<td>
		<input type="text" name="eng" required/>
	</td>
</tr>	
<tr>
	<td>수학 : </td>
	<td>
		<input type="text" name="math" required/>
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="입력">
	</td>
</tr>
</table>
</form>	

</body>
</html>