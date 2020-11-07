<%@page import="com.myweb.user.model.UserDAO"%>
<%@page import="com.myweb.user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	// 1. DAO객체 생성
	UserDAO dao = UserDAO.getInstance();

	// insert 전 중복검사가 우선 일어나야함.
	int result = dao.checkId(id);
	
	// 실행결과 중간 확인
	System.out.println(result);

	if(result == 1){  // 중복%>
		<script>
			alert("아이디 중복입니다.");
			history.go(-1);		
		</script>
	<%	//history.go(-1);	뒤로가기  >> 리다이렉트와 달리 기록이 있는 것에서 뒤로가는 것
	}else{
		UserVO vo = new UserVO(id, pw, name, email, address, null);
		int result2 = dao.join(vo);
		if(result2 == 1){	// 성공
%>
			<script>
				alert("가입을 축하합니다");
				location.href="login.jsp";
			</script>			
<%
		}else{	//실패
%>
			<script>
				alert("가입에 실패했습니다. 다시 시도하세요");
				location.href="join.jsp";
			</script>
<%			
		}
	}
	
%>