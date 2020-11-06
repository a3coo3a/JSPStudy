<%@page import="com.myweb.user.model.UserDAO"%>
<%@page import="com.myweb.user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	1. 로그인 페이지에서 넘어오는 id, pw를 받습니다.
	2. 반환유형 UserVO. login메서드에 (id, pw)를 매개변수로 넘깁니다.
		id, pw기반으로 로그인검증해서 결과가 있다면  UserVO에 select결과를 저장합니다.
		없다면 null반환
	3. login_ok에서는  UserVO가 null이 아니면 로그인 성공 ->로그인에 대한 정보(UserVO)를 세션에 저장
		후에  mypage.jsp로 리다이렉트
	4. null이면 실패 -> script로 "아이디 비밀번호를 확인하세요"를 출력한 후에 다시 로그인 페이지로
	*/

	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	UserDAO dao = UserDAO.getInstance();
	UserVO vo = dao.login(id, pw);
	
	if(vo != null){
		session.setAttribute("login", vo);
		response.sendRedirect("mypage.jsp");
	}else{
%>
		<script>
			alert("아이디 비밀번호를 확인하세요");
			location.href="login.jsp";
		</script>
<%
	}
	
	
%>