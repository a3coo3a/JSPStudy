<%@page import="com.myweb.user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<section>
	<div align="center">
		<h2>마이페이지 확인</h2> 
		<hr>
		아이디 : ${sessionScope.login.id }<br/>
		이름 : ${sessionScope.login.name }<br/><br/>
		
		<a href="update.user">[정보 수정]</a>
		<a href="delete.user">[회원 탈퇴]</a>
		
	</div>
</section>
<%@ include file="../include/footer.jsp" %>