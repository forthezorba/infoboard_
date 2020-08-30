<!-- Topbar -->
<nav
	class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

	<!-- Sidebar Toggle (Topbar) -->
	<form class="form-inline">
		<button id="sidebarToggleTop"
			class="btn btn-link d-md-none rounded-circle mr-3">
			<i class="fa fa-bars"></i>
		</button>
	</form>

	<!-- Topbar Navbar -->
	<ul class="navbar-nav ml-auto top-right-nav">
		<!-- Nav Item - User Information -->
		<li class="nav-item dropdown no-arrow">
			<span class="mr-2 d-none d-lg-inline text-gray-600 small"> 
					<sec:authorize access="isAnonymous()">
						<li><a href="/user/login">Login</a></li>
					</sec:authorize> 
					
					<sec:authorize access="isAnonymous()">
						<li><a href="/user/signup">SignUp</a></li>
					</sec:authorize> 
					
					<li>${user.name}</li>
					
					
					<sec:authorize access="isAuthenticated()">               
						<form action="/user/logout" method="post" role="form"
							id="actionForm">
							<li class="logout_btn"><a>Logout</a></li> 
							<input type="hidden"
								name="${_csrf.parameterName}" value="${_csrf.token}" />
						</form>
					</sec:authorize>

			</span>
		</li>

	</ul>
</nav>
<!-- End of Topbar -->

