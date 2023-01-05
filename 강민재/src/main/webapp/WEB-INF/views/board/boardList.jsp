<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>                                         
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'>   
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">    
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js'></script>         
</head>
<body>
<div class="container">
<h3>스프링 게시판</h3>

<div>
	<form id="searchForm" method="post" action="list.do">
		<div class="d-flex justify-content-center">
			<select class="form-select me-2" style="width:100px" name="searchType">
				<option>선택</option>
				<option value="S"
					<c:out value="${pDto.searchType == 'S' ? 'selected':''}"/>>제목</option>
				<option value="C"
					<c:out value="${pDto.searchType == 'C' ? 'selected':''}"/>>내용</option>
				<option value="W"
					<c:out value="${pDto.searchType == 'W' ? 'selected':''}"/>>글쓴이</option>
				<option value="SC"
					<c:out value="${pDto.searchType == 'SC' ? 'selected':''}"/>>제목+내용</option>
				<option value="SW"
					<c:out value="${pDto.searchType == 'SW' ? 'selected':''}"/>>제목+글쓴이</option>
				<option value="SWC"
					<c:out value="${pDto.searchType == 'SWC' ? 'selected':''}"/>>제목+내용+글쓴이</option>
			</select>
			<input class="form-control rounded-0 rounded-start" type="text" id="keyWord" name="keyWord" 
				placeholder="검색어 입력" style="width:300px" value="${pDto.keyWord}"/>
			<button class="btn rounded-0 rounded-end" style="width:40px; background:#138496; color:white"><i class="fa fa-search"></i></button>
		</div>
	</form>
</div>
<div class="d-flex mt-2 justify-content-between">
	<div class="">
		<b>${pDto.viewPage}</b> / ${pDto.totalPage} pages 
	</div>
	<c:if test="${pDto.searchType == null}">
	<div> 
		<select class="form-select form-select-sm" id="cntPerPage">
			<option value="5"
				<c:out value="${pDto.cntPerPage == 5 ? 'selected':''}"/>>5</option>
			<option value="10"
				<c:out value="${pDto.cntPerPage == 10 ? 'selected':''}"/>>10
			<option value="20"
				<c:out value="${pDto.cntPerPage == 20 ? 'selected':''}"/>>20</option>
		</select>
	</div>
	</c:if>
</div>
<table class="table">
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>조회수</th>
			<th>글쓴이</th>
			<th>등록일</th>
		</tr>
	</thead>
	<tbody>
		<c:set var="bno" value="${pDto.startRowNum}" />
		<c:forEach var="dto" items="${list}">
		<tr>
<%-- 			<td>${dto.bid}</td> --%>
			<td>${bno}</td>
			<td><a href="<c:url value='/view.do?bid=${dto.bid}&viewPage=${pDto.viewPage}&searchType=${pDto.searchType}&keyWord=${pDto.keyWord}'/>"/>${dto.subject}</a></td>
			<td>${dto.hit}</td>
			<td>${dto.writer}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.regDate}"/></td>
		</tr>
		<c:set var="bno" value="${bno-1}"/>
		</c:forEach>
		<tr>
			<td colspan="5" class="text-center">
				<button class="btn btn-primary" id="btn-write">글쓰기</button>
			</td>
		</tr>
	</tbody>
</table>
<ul class="pagination justify-content-center my-5">
  <li class="page-item ${pDto.prevPage <= 0 ? 'disabled' : ''}">
  	<a class="page-link" href="list.do?viewPage=${pDto.prevPage}&cntPerPage=${pDto.cntPerPage}">이전</a>
  </li>
  
  <c:forEach var="i" begin="${pDto.blockStart}" end="${pDto.blockEnd}">
  	<li class="page-item ${pDto.viewPage == i ? 'active' : ''}">
  		<a class="page-link" href="list.do?viewPage=${i}&cntPerPage=${pDto.cntPerPage}&searchType=${pDto.searchType}&keyWord=${pDto.keyWord}">${i}</a>
  	</li>
  </c:forEach>
  <li class="page-item ${pDto.blockEnd >= pDto.totalPage ? 'disabled' : ''}">
  	<a class="page-link" href="list.do?viewPage=${pDto.nextPage}&cntPerPage=${pDto.cntPerPage}">다음</a>
  </li>
</ul>

		
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#btn-write").click(() => {
			location.href="<c:url value='register.do'/>";
		})
		
		$("#cntPerPage").change(function(e){
			var cntVal = $("#cntPerPage option:selected").val();
			// alert(cntVal);
/* 			location.href="<c:url value='list.do?viewPage=${pDto.viewPage}&cntPerPage='/>"+cntVal; */	
			location.href="<c:url value='list.do?viewPage=1&cntPerPage='/>"+cntVal;	
		});
		
	});
</script>

</body>
</html>