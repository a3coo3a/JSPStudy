<%@page import="com.myweb.user.model.UserDAO"%>
<%@page import="com.myweb.user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*
1. 폼데이터를 받습니다
2. DAO에 update()메서드를 생성하고, 업데이트 구문을 실행.
3. 수정성공시 "회원정보가 수정되었습니다" 출력후에 마이페이지로 이동
 	실패시 "회원정보 수정에 실패했습니다." 출력후에 마이페이지로 이동
*/

	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	UserDAO dao = UserDAO.getInstance();
	UserVO vo = new UserVO(id, pw, name, email, address, null);
	if(dao.update(vo) == 1){
		session.setAttribute("login", vo);%>
		<script>
			alert("회원정보가 수정되었습니다");
			location.href="mypage.jsp";
		</script>
	<%}else{%>
		<script>
			alter("회원정보 수정에 실패했습니다");
			location.href="mypage.jsp";
		</script>
	<%}


%>