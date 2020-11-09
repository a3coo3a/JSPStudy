<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<%@ include file="../include/header.jsp" %>
<!--게시판만 적용되는 css-->            
        <style>

            .table-striped > tbody > tr {
                background-color: rgba(255, 255, 255)
            }
            .row h2 {
                color: aliceblue;
                
            }
            .pagination-sm {
                margin: 0;
            }
            
        </style>
<section>
        
        <div class="container">
            <div class="row">
                
                <h2>게시판 목록</h2>
                <table class="table table-striped" style="text-align: center; border: 2px solid #737373">
                
                <div align="right">
					<select onchange="change(this)">
						<option value="10" ${page.amount == 10? 'selected':'' }>10개씩 보기</option>
						<option value="20" ${page.amount == 20? 'selected':'' }>20개씩 보기</option>
						<option value="50" ${page.amount == 50? 'selected':'' }>50개씩 보기</option>
					</select>
				</div>
				
                    <thead>
                        <tr>
                            <th style="background-color: #9DCAFF; text-align: center;">번호</th>
                            <th style="background-color: #9DCAFF; text-align: center;">제목</th>
                            <th style="background-color: #9DCAFF; text-align: center;">작성자</th>
                            <th style="background-color: #9DCAFF; text-align: center;">작성일</th>
                        </tr>
                    </thead>
                    <c:forEach var="list" items="${list }">
                    <tbody>
                        <tr>
                            <td>${list.bno }</td>
                            <td><a href="content.bbs?bno=${list.bno }">${list.title }</a></td>
                            <td>${list.writer }</td>
                            <td><fmt:formatDate value="${list.regdate }" pattern="yyyy-MM-dd HH:mm"/> </td>
                        </tr>
                    </tbody>
                    </c:forEach>
                </table>

                <div class="text-center">
                    <ul class="pagination pagination-sm">
                    	
                    	<c:if test="${page.prev }">
                    	
                        	<li><a href="bbs.bbs?pageNum=${page.startPage-1 }&amount=${page.amount}">이전</a></li>
                        </c:if>
                        
                        <c:forEach var="num" begin="${page.startPage }" end="${page.endPage }">
	                        <li class="${num eq page.pageNum ? 'active': ''}">
    	                    <a href="bbs.bbs?pageNum=${num }&amount=${page.amount}">${num }</a></li>
                     	</c:forEach>
                     	
                     	<c:if test="${page.next }">  
                        	<li><a href="bbs.bbs?pageNum=${page.endPage+1 }&amount=${page.amount}">다음</a></li>
                    	</c:if> 
                    </ul>
                    <button class="btn btn-info pull-right" onclick="location.href='write.bbs'">글쓰기</button>
                </div>
                
            </div>
        </div>
    </section>
    
    <script>
	function change(a) {
		location.href="bbs.bbs?pageNum=1&amount="+a.value;
	}

</script>
<%@ include file="../include/footer.jsp" %>