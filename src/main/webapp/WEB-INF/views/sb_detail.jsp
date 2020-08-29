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
  <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

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
              <h6 class="m-0 font-weight-bold text-primary"></h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" cellspacing="0" style="width: 300px;">
                  <thead>
                    <tr class="table-light">
		                <th scope="col" class="table-light">제목</th>
						<th scope="col">${detail.subject}</th>
		            </tr>
                    <tr class="table-light">
		                <th scope="row" class="table-light">아이디</th>
						<th>${detail.writer}</th>
		            </tr>
                    <tr class="table-light">
		                <th scope="row" class="table-light">작성자</th>
						<th>${detail.name}</th>
		            </tr>
                    <tr class="table-light">
		                <th scope="row" class="table-light">날짜</th>
						<th><fmt:formatDate value="${detail.reg_date}"
								pattern="yyyy.MM.dd HH:mm:ss" /></th>
		            </tr>

                  </thead>
               </table>
               <table class="table table-bordered" width="100%" cellspacing="0">
                  <tbody>
                 	 <tr>
						<th scope="row" class="table-light">내용</th>
					</tr>
					<tr>
						<td style="height: 20vh;">${detail.content}</td>
					</tr>
                  </tbody>
                </table>
                
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
						onclick="location.href='/'">목록</button>
				</div>
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
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="/resources/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="/resources/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="/resources/js/demo/datatables-demo.js"></script>
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

<script>
//detail delete
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

