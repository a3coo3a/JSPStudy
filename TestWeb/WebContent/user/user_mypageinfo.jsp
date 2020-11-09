<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../include/header.jsp" %>
<section>
        <div class="container">
            <div class="row join-wrap">
                <!--join-form을 적용한다 float해제 margin:0 auto-->
                <div class="col-xs-12 col-md-9 join-form">
                    
                    <div class="titlebox">
                        MEMBER INFO                    
                    </div>
                    
                    <p>*표시는 필수 입력 표시입니다</p>
                    <form name="updateForm" action="modify.user" method="post">
                    <table class="table">
                        <tbody class="m-control">
                            <tr>
                                <td class="m-title">*ID</td>
                                <td><input type="text" name="id" id="id" class="form-control input-sm" value="${sessionScope.user.id }" readonly></td>
                            </tr>
                            <tr>
                                <td class="m-title">*이름</td>
                                <td><input type="text" name="name" class="form-control input-sm" value="${sessionScope.user.name }" required></td>
                            </tr>
                            <tr>
                                <td class="m-title">*비밀번호</td>
                                <td><input name="pw" type="password" id="pw" class="form-control input-sm" required></td>
                            </tr>
                            <tr>
                                <td class="m-title">*비밀번호확인</td>
                                <td><input name="pwCheck" type="password" class="form-control input-sm" required></td>
                            </tr>
                            <tr>
                                <td class="m-title">*E-mail</td>
                                <td>
                                    <input type="text" name="beEmail" value="${fn:split(sessionScope.user.email,'@')[0] }" class="form-control input-sm" required>@
                                    <select name="afEmail" class="form-control input-sm sel">
                                        <option value="naver.com">naver.com</option>
                                        <option value="gmail.com">gmail.com</option>
                                        <option value="daum.net">daum.net</option>
                                    </select>
                                    <button class="btn btn-info">중복확인</button>
                                </td>
                            </tr>
                            <tr>
                                <td class="m-title">*휴대폰</td>
                                <td>
                                    <input type="text" name="phoneNum1" value="${fn:split(sessionScope.user.phoneNumber,'-')[0] }" class="form-control input-sm sel" required> -
                                    <input type="text" name="phoneNum2" value="${fn:split(sessionScope.user.phoneNumber,'-')[1] }" class="form-control input-sm sel" required> -
                                    <input type="text" name="phoneNum3" value="${fn:split(sessionScope.user.phoneNumber,'-')[2] }" class="form-control input-sm sel" required>
                                </td>
                            </tr>
                            <tr>
                                <td class="m-title">*주소</td>
                                <td><input type="text" name="basicAddress" value="${sessionScope.user.basicAddress }" class="form-control input-sm add" required></td>
                            </tr>
                            <tr>
                                <td class="m-title">*상세주소</td>
                                <td><input type="text" name="detailAddress" value="${sessionScope.user.detailAddress }" class="form-control input-sm add" required></td>
                            </tr>
                            <tr>
                            	<td colspan="2" align="center">
                            	${msg }
                            	</td>
                            </tr>
                        </tbody>
                    </table>
                    
                    <div class="titlefoot">
                        <button type="button" class="btn" onclick="check()">수정</button>
                        <button type="button" class="btn" onclick="location.href='user.mypage'">목록</button>
                    </div>
                    </form>
                </div>


            </div>

        </div>

    </section>
    
    <script>
    
	function check(){
		var idReg = /^(?=.*[A-Za-z])[A-Za-z0-9]{4,12}$/;
		var pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
			
		if(!pwReg.test(document.getElementById('pw').value)){  
			alert('비밀번호가 잘못 입력되었습니다.');
			return;		
		}else if(document.updateForm.pw.value != document.updateForm.pwCheck.value){
			alert('비밀번호 확인란을 확인하세요');
			return;
		}else if(document.updateForm.name.value == ''){
			alert('이름은 필수 입니다.');
			return;
		}else if(document.updateForm.beEmail.value == ''){ss
			alert('email은 필수 입니다.');
			return;
		}else if(document.updateForm.basicAddress.value == '' || document.updateForm.detailAddress.value == ''){
			alert('주소는 필수 입니다.');
			return;
		}else{
			document.regForm.submit();
		}
 
	}
</script>
  
<%@ include file="../include/footer.jsp" %>