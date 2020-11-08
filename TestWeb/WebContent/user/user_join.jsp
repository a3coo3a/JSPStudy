<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
    <!--회원가입 폼만 적용되는 css-->
    <style type="text/css">
        .table-striped>tbody>tr {
            background-color: #f9f9f9
        }

        .join-form {
            margin: 0 auto;
            padding: 20px;
            width: 50%;
            float: none;
            background-color: white;
        }
        
        
        .form-group > .sel {
            width: 120px;
            display: inline-block;
            
        }
    </style>
    
    <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-9 col-sm-12 join-form">
                    <h2 align="center">회원가입<small>(가운데정렬)</small></h2>
					<h4 align="center">${msg }</h4>
                    <form name="regForm" action="joinForm.user" method="post">
                        <div class="form-group">
                            <label for="id">아이디</label>
                            <input type="text" name="id" class="form-control" id="id" placeholder="아이디를 (영문포함 4~12자 이상)">
                        </div>
                        <div class="form-group">
                            <label for="password">비밀번호</label>
                            <input type="password" name="pw" class="form-control" id="password" placeholder="비밀번호 (영 대/소문자, 숫자, 특수문자 3종류 이상 조합 8자 이상)">
                        </div>
                        <div class="form-group">
                            <label for="password-confrim">비밀번호 확인</label>
                            <input type="password"  name="pwCheck" class="form-control" id="password-confrim" placeholder="비밀번호를 확인해주세요.">
                        </div>
                        <div class="form-group">
                            <label for="name">이름</label>
                            <input type="text" name="name" class="form-control" id="name" placeholder="이름을 입력하세요." required>
                        </div>
                        <!--input2탭의 input-addon을 가져온다 -->
                        <div class="form-group">
                            <label for="hp">휴대폰번호</label><br>
                            
                            <input name="phoneNum1" class="form-control sel" placeholder="010"> -
                            <input name="phoneNum2" class="form-control sel" placeholder="xxxx"> -
                            <input name="phoneNum3" class="form-control sel" placeholder="xxxx">
                        
                        </div
                        >
                        <div class="form-group">
                             <label for="hp">이메일</label><br>
                            <input name="beEmail" class="form-control sel" required>@
                            <select name="afEmail" class="form-control sel">
                                <option value="naver.com">naver.com</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="daum.net">daum.net</option>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label for="addr-num">주소</label>
                            <input type="text" name="basicAddress" class="form-control" id="addr-basic" placeholder="기본주소" required>
                        </div>
                        <div class="form-group">
                            <input type="text" name="detailAddress" class="form-control" id="addr-detail" placeholder="상세주소" required>
                        </div>
                        <div class="form-group">
                            <button type="button" class="btn btn-lg btn-success btn-block" onclick="check()">회원가입</button>
                        </div>
                        <div class="form-group">
                            <button type="button" class="btn btn-lg btn-info btn-block" onclick="location.href='login.user'">로그인</button>
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
			
		if(!idReg.test(document.getElementById('id').value)){
			alert('아이디가 잘못 입력되었습니다.');
			return;		
		}else if(!pwReg.test(document.regForm.pw.value)){  
			alert('비밀번호가 잘못 입력되었습니다.');
			return;		
		}else if(document.regForm.pw.value != document.regForm.pwCheck.value){
			alert('비밀번호 확인란을 확인하세요');
			return;
		}else if(document.regForm.name.value == ''){
			alert('이름은 필수 입니다.');
			return;
		}else{
			document.regForm.submit();
		}
 
	}
</script>
<%@ include file="../include/footer.jsp" %>