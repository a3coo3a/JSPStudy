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
                                <td><input type="text" name="name" class="form-control input-sm" value="${sessionScope.user.name }" readonly></td>
                            </tr>
                            <tr>
                                <td class="m-title">*비밀번호</td>
                                <td><input name="pw" type="password" id="password" class="form-control input-sm" required onkeyup="checkPw()">&nbsp<span id="checkPw"></span></td>
                            </tr>
                            <tr>
                                <td class="m-title">*비밀번호확인</td>
                                <td><input name="pwCheck" id="password-confrim" type="password" class="form-control input-sm" required onkeyup="matchCheckPW()">&nbsp<span id="matchCheckPw"></span></td>
                            </tr>
                            <tr>
                                <td class="m-title">*E-mail</td>
                                <td>
                                    <input type="text" name="beEmail" value="${fn:split(sessionScope.user.email,'@')[0] }" class="form-control input-sm" required onkeyup="checkEmail()">@
                                    <select name="afEmail" class="form-control input-sm sel" style="width: 100px;">
                                        <option ${fn:split(sessionScope.user.email,'@')[1] == 'naver.com' ?'selected':'' } value="naver.com" >naver.com</option>
                                        <option ${fn:split(sessionScope.user.email,'@')[1] == 'gmail.com' ?'selected':'' } value="gmail.com">gmail.com</option>
                                        <option ${fn:split(sessionScope.user.email,'@')[1] == 'daum.net' ?'selected':'' } value="daum.net">daum.net</option>
                                    </select>
                                    &nbsp<span id="checkEmail"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="m-title">*휴대폰</td>
                                <td>
                                    <input type="text" name="phoneNum1" value="${fn:split(sessionScope.user.phoneNumber,'-')[0] }" class="form-control input-sm sel" required onkeyup="return checkNum(event)"> -
                                    <input type="text" name="phoneNum2" value="${fn:split(sessionScope.user.phoneNumber,'-')[1] }" class="form-control input-sm sel" required onkeyup="return checkNum(event)"> -
                                    <input type="text" name="phoneNum3" value="${fn:split(sessionScope.user.phoneNumber,'-')[2] }" class="form-control input-sm sel" required onkeyup="return checkNum(event)">&nbsp<span id="checkNum"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="m-title">*주소 </td>
                                <td><input type="text" name="basicAddress" value="${sessionScope.user.basicAddress }" class="form-control input-sm add" required onkeyup="checkBaAdd()">&nbsp<span id="checkBeAdd"></span></td>
                            </tr>
                            <tr>
                                <td class="m-title">*상세주소 </td>
                                <td><input type="text" name="detailAddress" value="${sessionScope.user.detailAddress }" class="form-control input-sm add" required onkeyup="checkDeAdd()">&nbsp<span id="checkDeAdd"></span></td>
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
                        <button type="button" class="btn" onclick="location.href='mypage.user'">목록</button>
                    </div>
                    </form>
                </div>


            </div>

        </div>

    </section>
 <script>  
	var chpw = false;
	var chpwma = false;
	var chemail = false;
	var chbaadd = false;
	var chdeadd = false;
	
	
	function checkNum(e){
		var keyVal = event.keyCode;
		 
        if(((keyVal >= 48) && (keyVal <= 57))){
            return true;
        }else{
        	document.getElementById('checkNum').innerHTML = '숫자만 입력할 수 있습니다';
			document.getElementById('checkNum').style.color = 'red';
            return false;
        }

	}
	
	function checkPw(){
		var pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[가-힣A-Za-z\d@$!%*#?&]{8,}$/;
		
		if(!pwReg.test(document.getElementById('password').value)){
			document.getElementById('checkPw').innerHTML = '비밀번호 (영 대/소문자, 숫자, 특수문자 3종류 이상 조합 8자 이상)여야 합니다.';
			document.getElementById('checkPw').style.color = 'red';
			chpw = false;
		}else if(pwReg.test(document.getElementById('password').value)){
			document.getElementById('checkPw').innerHTML = '';
			chpw = true;
		} 
	}
	
	function matchCheckPw(){
		if(document.getElementById('password').value != document.getElementById('password-confrim').value){
			document.getElementById('matchCheckPw').innerHTML = '비밀번호가 다릅니다';
			document.getElementById('matchCheckPw').style.color = 'red';
			chpwma = false;
		}else if(document.getElementById('password').value == document.getElementById('password-confrim').value){
			document.getElementById('matchCheckPw').innerHTML = '비밀번호가  같습니다';
			document.getElementById('matchCheckPw').style.color = 'blue';
			chpwma = true;
		}
	}
	
	function checkEmail(){
		if(document.updateForm.beEmail.value == '' || document.updateForm.beEmail.value == null ){
			document.getElementById('checkEmail').innerHTML = '메일은 필수 입니다';
			document.getElementById('checkEmail').style.color = 'red';
			chemail = false;
		}else if(!(document.updateForm.beEmail.value == '' || document.updateForm.beEmail.value == null )){
			document.getElementById('checkEmail').innerHTML = '';
			chemail = true;
		}
	}
	function checkBaAdd(){
		if(document.updateForm.basicAddress.value == '' || document.updateForm.basicAddress.value == null ){
			document.getElementById('checkBeAdd').innerHTML = '기본주소는 필수 입니다';
			document.getElementById('checkBeAdd').style.color = 'red';
			chbaadd = false;
		}else if(!(document.updateForm.basicAddress.value == '' || document.updateForm.basicAddress.value == null )){
			document.getElementById('checkBeAdd').innerHTML = '';
			chbaadd = true;
		}
	}
	
	function checkDeAdd(){
		if(document.updateForm.detailAddress.value == '' || document.updateForm.detailAddress.value == null ){
			document.getElementById('checkDeAdd').innerHTML = '상세주소는 필수 입니다';
			document.getElementById('checkDeAdd').style.color = 'red';
			chdeadd = false;
		}else if(!(document.updateForm.detailAddress.value == '' || document.updateForm.detailAddress.value == null )){
			document.getElementById('checkDeAdd').innerHTML = '';
			chdeadd = true;
		}
	}
	
	function check(){
		checkPw();
		matchCheckPw();
		checkEmail();
		checkBaAdd();
		checkDeAdd();
		if(chpw && chpwma && chemail && chbaadd && chdeadd){
			document.updateForm.submit();
		}
	}
</script>
  
<%@ include file="../include/footer.jsp" %>