<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<style>
.container-fluid{
	margin-left:15;
}
.navbar{
	margin-bottom: 0;
}
form{
	margin:0 auto;
}
.logout_btn{
	padding: 15px;
    cursor: pointer;
}
</style>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Q&A 게시판</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">

				<sec:authorize access="isAnonymous()">
					<li><a href="/user/login">Login</a></li>
				</sec:authorize>

				<sec:authorize access="isAuthenticated()">
					<form action="/user/logout" method="post" role="form" id="actionForm">
					<li class="logout_btn">Logout</li>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					</form>
				</sec:authorize>
				
				<sec:authorize access="isAnonymous()">
					<li><a href="/user/signup">SignUp</a></li>
				</sec:authorize>
				
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->

</nav>
<script>

$(document).ready(function(){
	var actionForm= $('#actionForm');
	$('.logout_btn').on('click',function(e){
			e.preventDefault();
			actionForm.submit();
	})
	
});

</script>


