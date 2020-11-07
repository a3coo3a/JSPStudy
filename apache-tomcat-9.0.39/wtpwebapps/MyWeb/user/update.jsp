<%@page import="com.myweb.user.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<section>
	<div align="center">
		<h2>회원정보 수정연습</h2>
		<hr>
		<form name="regForm" action="updateForm.user" method="post">
			<table>	
				<tr>
					<td>아이디 : </td>
					<td>
						<input type="text" name="id" value="${sessionScope.login.id }" readonly>
					</td>
				</tr>
				<tr>
					<td>비밀번호 : </td>
					<td>
						<input type="password" name="pw">
					</td>
				</tr>
				<tr>
					<td>비밀번호확인 : </td>
					<td>
						<input type="password" name="pwCheck">
					</td>
				</tr>
				<tr>
					<td>이름 : </td>
					<td>
						<input type="text" name="name" value="${sessionScope.login.name }">
					</td>
				</tr>
				<tr>
					<td>이메일 : </td>
					<td>
						<input type="email" name="email" value="${sessionScope.login.email }">
					</td>
				</tr>
				<tr>
					<td>주소 : </td>
					<td>
						<input type="text" name="address" value="${sessionScope.login.address }">
					</td>
				</tr>
			</table>
			<br/>
			<input type="button" value="정보 수정" class="btn btn-default" onclick="check()">
			<input type="button" value="취소" class="btn btn-primary" onclick="history.go(-1)">
		</form>
	</div>
</section>
<%@ include file="../include/footer.jsp" %>
<script>
<%-- java 의 함수와 동일한데 반환유형이 없음--%>
	function check(){
		//form 는 유일하게  document.form이름.이름...  접근이 가능합니다
		//console.log(document.regForm.id);
		//console.log(document.regForm.id.name);
		//console.log(document.regForm.id.value);
		
		if(document.regForm.id.value.length < 4){	//4자리 이상 필수
			alert('아이디는 필수 입니다.');
			return;		//함수종료
		}else if(document.regForm.pw.value.length < 4){  
			alert('비밀번호는 4자리 이상 입니다.');
			return;		
		}else if(document.regForm.pw.value != document.regForm.pwCheck.value){
			alert('비밀번호 확인란을 확인하세요');
			return;
		}else if(document.regForm.name.value ==''){	//공백
			alert('이름은 필수 입니다.');
			return;
		}else{
			//submit은 자바스크립트의 서브밋기능
			document.regForm.submit();
		}
		
		
		
		
	}
</script>