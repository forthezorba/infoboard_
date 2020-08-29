<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<layoutTag:layout>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Detail</title>
<style>
.container dl {
	font-size: large;
}

.table-light {
	background-color: #ececec;
}

.table th {
	width: 15%;
}
</style>
</head>
<body>

	<div class="wrapper" style="display: flex;">
		<%@include file="side.jsp"%>

		<div class="container" style="margin: 0;">
			<div class="col-xs-12" style="margin: 15px auto;">
				<label style="font-size: 20px;"><span
					class="glyphicon glyphicon-list-alt"></span>게시글 상세</label>
			</div>

			<div class="col-xs-12">
				<form action="/insertProc" method="post">

					<table class="table table-bordered">

						<tbody>
							<tr>
								<th scope="col" class="table-light">제목</th>
								<td scope="col">${detail.subject}</td>
							</tr>
							<tr>
								<th scope="row" class="table-light">아이디</th>
								<td>${detail.writer}</td>
							</tr>
							<tr>
								<th scope="row" class="table-light">작성자</th>
								<td>${detail.name}</td>
							</tr>
							<tr>
								<th scope="row" class="table-light">날짜</th>
								<td><fmt:formatDate value="${detail.reg_date}"
										pattern="yyyy.MM.dd HH:mm:ss" /></td>
							</tr>

						</tbody>
					</table>

					<table class="table table-bordered">
						<tr>
							<th scope="row" class="table-light">내용</th>
						</tr>
						<tr>
							<td style="height: 20vh;">${detail.content}</td>
						</tr>
					</table>

				</form>
				<div class="btn-group btn-group-sm" role="group"
					style="float: right;">
					
					<sec:authentication property="principal" var="pinfo"/>
					<c:if test="${pinfo.username eq detail.writer}">
          			
          				<button type="button" id="delete" class="btn btn-default">삭제</button>
						<button type="button" class="btn btn-default" onclick="location.href='/update/${detail.bno}'">수정</button>	
          			
          			</c:if>
					
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<button type="button" class="btn btn-default"
							onclick="location.href='/insert/${detail.bno}'">답글</button>
					</sec:authorize>

					<button type="button" class="btn btn-default"
						onclick="location.href='/list'">목록</button>
				</div>
			</div>
		</div>

	</div>
	<script>
 $(document).ready(function() {
	
	//상세페이지(get) 이동
	$('#delete').on('click',function(e){
		e.preventDefault();
		if(!confirm('삭제하시겠습니까?')){
            return
        }
		self.location='/delete/${detail.bno}';
	})
	
});
 </script>
</body>
	</html>
</layoutTag:layout>


