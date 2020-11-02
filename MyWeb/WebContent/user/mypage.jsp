<%@page import="com.myweb.user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	if(session.getAttribute("login") == null){  // 로그인만료 없으면 로그인 창으로 돌아감.
		response.sendRedirect("login.jsp");
	}
	
	UserVO vo = (UserVO)session.getAttribute("login");
	
	String id = vo.getId();
	String name = vo.getName();
%>
<%@ include file="../include/header.jsp" %>
<section>
	<div align="center">
		<h2>마이페이지 확인</h2> 
		<hr>
		아이디 : <%=id %><br/>
		이름 : <%=name %><br/><br/>
	</div>
</section>
<%@ include file="../include/footer.jsp" %>