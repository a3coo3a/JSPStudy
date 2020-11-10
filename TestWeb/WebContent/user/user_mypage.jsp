<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ include file="../include/header.jsp" %>
<section>
        <div class="container">
            <div class="row join-wrap">
                
                <div class="col-xs-12 col-md-9 join-form">
                    
                    <div class="titlebox">
                        MEMBER                   
                    </div>
                    <div>
                        <p>${sessionScope.user.name}님 회원정보</p>
                    </div>
                    <div>
                        <button type="button" class="btn btn-primary" onclick="location.href='mypageinfo.user'">회원정보변경</button>
                        <button type="button" class="btn btn-primary" id="delCheck" >회원 탈퇴</button>
                        
                    </div>
                    <div class="delete-hidden">
                        <form name="pwChForm" action="delete.user" method="post">
                        <input name="pw" type="password" class="form-control" placeholder="비밀번호를 입력하세요">
                        <button type="submit" class="btn btn-primary">확인</button>
                        </form>
                    </div>
                    <br>
                    <span style="color: red">${msg }</span>
                    <br><br>
                    <div>
                        <p>${sessionScope.user.name}님의 작성 게시물</p>
                        <table class="table table-striped" style="text-align: center; border: 2px solid #737373">
                    <thead>
                    <div align="right">
					<select onchange="change(this)">
						<option value="10" ${page.amount == 10? 'selected':'' }>10개씩 보기</option>
						<option value="20" ${page.amount == 20? 'selected':'' }>20개씩 보기</option>
						<option value="50" ${page.amount == 50? 'selected':'' }>50개씩 보기</option>
					</select>
					</div>
                        <tr>
                            <th style="text-align: center;">번호</th>
                            <th style="text-align: center;">제목</th>
                            <th style="text-align: center;">작성자</th>
                            <th style="text-align: center;">작성일</th>
                        </tr>
                    </thead>
                   <c:forEach var="myCon" items="${myCon }" varStatus="status">
                    <tbody>
                        <tr>
                            <td><c:out value="${status.index+((page.pageNum-1)*page.amount)+1}" /></td>
                            <td><a href="<%=request.getContextPath() %>/bbs/content.bbs?bno=${myCon.bno }">${myCon.title }</a></td>
                            <td>${myCon.writer }</td>
                            <td><fmt:formatDate value="${myCon.regdate }" pattern="yyyy-MM-dd HH:mm"/> </td>
                        </tr>
                    </tbody>
                    </c:forEach>
                </table>
                    </div>
                  <div class="text-center">
                    <ul class="pagination pagination-sm">
                    	
                    	<c:if test="${page.prev }">
                    	
                        	<li><a href="mypage.user?pageNum=${page.startPage-1 }&amount=${page.amount}">이전</a></li>
                        </c:if>
                        
                        <c:forEach var="num" begin="${page.startPage }" end="${page.endPage }">
	                        <li class="${num eq page.pageNum ? 'active': ''}">
    	                    <a href="mypage.user?pageNum=${num }&amount=${page.amount}">${num }</a></li>
                     	</c:forEach>
                     	
                     	<c:if test="${page.next }">  
                        	<li><a href="mypage.user?pageNum=${page.endPage+1 }&amount=${page.amount}">다음</a></li>
                    	</c:if> 
                    </ul>
                </div>  
                    
                </div>


            </div>

        </div>

    </section>
 
<%@ include file="../include/footer.jsp" %>

   <script>
        //탈퇴버튼 디스플레이 처리
        var delCheck = document.getElementById("delCheck");
        delCheck.onclick = function() {
            var del  = document.querySelector(".delete-hidden");
            if(del.style.display == "none" || del.style.display == "") {
                del.style.display = "inline";
            } else {
                del.style.display = "none";
            }
        }
        function change(a) {
    		location.href="mypage.user?pageNum=1&amount="+a.value;
    	}
	
    </script>