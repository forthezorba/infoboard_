<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<layoutTag:layout>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 페이지</title>
</head>
<body>

<div class="container">
    <h1>회원 가입</h1>
    <hr>

    <form action="/user/signup" method="post">
	  <div class="form-group">
	    <label for="name">이름</label><br/>
	    <input type="text" name="name" placeholder="이름을 입력해주세요">
	  </div>
	  <div class="form-group">
	    <label for="email">아이디(이메일)</label><br/>
	    <input type="text" name="email" placeholder="이메일 입력해주세요">
	  </div>
	  <div class="form-group">
	  	<label for="password">비밀번호</label><br/>
	    <input type="password" name="password" placeholder="비밀번호">
	  </div>
	  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	  <button type="submit" class="btn btn-primary">Submit</button>
	</form>
	
</div>
</body>
<script>
</script>
</html>
</layoutTag:layout>