<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>BOARD</title>

<!-- Custom fonts for this template -->
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<style>
.top-right-nav{
	width: 240px;
    font-size: large;
    font-weight: 800;
}
.top-right-nav form{
	margin: auto;
}
.top-right-nav li{
	margin: auto;
}
.top-right-nav a {
	color: black;
	text-decoration:none;
	cursor:pointer;
}
</style>
</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <%@include file="sidebar.jsp" %>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

	  <%@include file="top-right-nav.jsp" %>

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800 font-weight-bolder">문의사항</h1>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bolder">
              		회원 가입
              </h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <form action="/user/signup" method="post">
				  <div class="form-group font-weight-bold text-primary">
				    <label for="name">이름</label><br/>
				    <input type="text" name="name" placeholder="이름을 입력해주세요">
				  </div>
				  <div class="form-group font-weight-bold text-primary">
				    <label for="email">아이디(이메일)</label><br/>
				    <input type="text" name="email" placeholder="이메일 입력해주세요">
				  </div>
				  <div class="form-group font-weight-bold text-primary">
				  	<label for="password">비밀번호</label><br/>
				    <input type="password" name="password" placeholder="비밀번호">
				  </div>
				  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				  <button type="submit" class="btn btn-primary">Submit</button>
				</form>
				</div>
              </div>
            </div>
          </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; InfoTech</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
  <!-- Bootstrap core JavaScript-->
  <script src="/vendor/jquery/jquery.min.js"></script>
  <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="/js/demo/datatables-demo.js"></script>
<script>
//logout
$(document).ready(function(){
	var actionForm= $('#actionForm');
	$('.logout_btn').on('click',function(e){
			e.preventDefault();
			actionForm.submit();
	})
	
});
</script>
</body>

</html>
