<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   
<%@ include file="../include/header.jsp" %>
     <section>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 col-sm-12 join-form">
                    <h2>게시판 상세보기<small>(디자인이궁금하세요?)</small></h2>

                    <form>
                        <div class="form-group">
                            <label>등록일</label>
                            <input type="text" class="form-control" readonly value=<fmt:formatDate value="${bbsCon.regdate }" pattern="yyyy-MM-dd HH:mm"/> />
                            
                        </div>
                        <div class="form-group">
                            <label>글번호</label>
                            <input type="text" class="form-control" value="${bbsCon.bno }" readonly>
                        </div>
                        <div class="form-group">
                            <label>글쓴이</label>
                            <input type="text" class="form-control" value="${bbsCon.writer }" readonly>
                        </div>
                        <div class="form-group">
                            <label>제목</label>
                            <input type="text" class="form-control" value="${bbsCon.title }" readonly>
                        </div>
                        <div class="form-group">
                            <label>내용</label>
                            <textarea class="form-control" rows="5" readonly>
                            	${bbsCon.content }
                            </textarea>
                        </div>
                        
                        <!--구현로직: 버튼은 온클릭을 사용하던 자바스크립트를 이용해야 합니다-->
                        <div class="form-group">
                            <c:set var="referURL" value="${header.referer}" />
                            	<button type="button" class="b tn btn-success" onclick="location.href='${referURL }'">목록</button>
                            <c:choose>
	                    		<c:when test="${sessionScope.user.id == bbsCon.writer}">
	                            	<button type="button" class="btn btn-info" onclick="location.href='modify.bbs?bno=${bbsCon.bno}'">수정</button>
	                            </c:when>
                            </c:choose>
							
                        </div>

                    </form>
                </div>
            </div>
        </div>


        </section>
        
       
        
<%@ include file="../include/footer.jsp" %>