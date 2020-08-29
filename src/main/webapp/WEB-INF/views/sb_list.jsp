<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
.table tr td,.table tr th{
	vertical-align: middle;
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
              <h6 class="m-0 font-weight-bold text-primary">   
              <%-- 
              	<form id="searchForm" action="/cri_list" method="get" 
              		class="d-none d-sm-inline-block form-inline mr-auto my-2 my-md-0 mw-100 navbar-search">
		           
		           <div class="input-group">
		           
		             <select name='type' class="form-control mr-2">
						<option value=""
							<c:out value="${pageMaker.cri.type==null? 'selected':''}"/>>--</option>
						<option value="G" 
							<c:out value="${pageMaker.cri.type=='G'? 'selected':''}"/>>제목</option>
						<option value="T"
							<c:out value="${pageMaker.cri.type=='T'? 'selected':''}"/>>내용</option>
						<option value="C"
							<c:out value="${pageMaker.cri.type=='C'? 'selected':''}"/>>작성자</option>
						<option value="W"
							<c:out value="${pageMaker.cri.type=='W'? 'selected':''}"/>>이름</option>
						
						<option value="GT"
							<c:out value="${pageMaker.cri.type=='GT'? 'selected':''}"/>>제목 or 내용</option>
						
						<option value="TW"
							<c:out value="${pageMaker.cri.type=='GC'? 'selected':''}"/>>제목 or 작성자</option>
						<option value="TWC"
							<c:out value="${pageMaker.cri.type=='GCT'? 'selected':''}"/>>제목 or 작성자 or 내용</option>
						
					</select>
		           
		           
		             <input type="text" name="keyword" class="form-control bg-white border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
		             <div class="input-group-append">
		               <button class="btn btn-primary" type="button">
		                 <i class="fas fa-search fa-sm"></i>
		               </button>
		             </div>
		           </div>
		         </form>
                  --%> 
              	<button class="btn btn-primary btn-sm" style="float:right;" onclick="location.href='/sb_insert'">글쓰기</button>
              </h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered"  id="dataTable"  width="100%" cellspacing="0">
                  <thead>
                    <tr class="table-light">
		                <th>No</th>
		                <th>제목</th>
		                <th>작성자</th>
		                <th>이름</th>
		                <th>날짜</th>
		            </tr>
                  </thead>
                  <tbody>
                  
                  <c:forEach var="l" items="${list}" varStatus="sta">
                 	 <tr onclick="location.href='/detail/${l.bno}'" style="cursor: pointer;">
	                      <td>
	                      <c:out value="${sta.count}" />
	                      </td>
	                      <td>
		                      <c:if test="${l.reply !=0}"> 
		                      	[답변완료]
						 	  </c:if>
		                      <c:if test="${l.bno !=l.ref}"> 
		                      <i class="fab fa-replyd" style="font-size:2rem;"></i>
						 	  </c:if>
		                      ${l.subject}
	                      </td>
	                      <td>${l.writer}</td>
	                      <td>${l.name}</td>
	                      <td>
	                      <fmt:formatDate value="${l.reg_date}" pattern="yyyy.MM.dd HH:mm:ss"/>
	                    </td>
	                  </tr>
	              </c:forEach> 
                  </tbody>
                </table>
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

	var searchForm=$('#searchForm');
	$('#searchForm button').on('click',function(e){
		if(!searchForm.find('option:selected').val()){
			alertify.alert('확인','검색종류를 선택하세요');
			return false;
		}
		if(!searchForm.find('input[name="keyword"]').val()){
			alertify.alert('확인','키워드를 입력하세요');
			return false;
		}
		searchForm.find('input[name="pageNum"]').val('1');
		e.preventDefault();
		searchForm.submit();
	})
	
	
});
</script>
<script>
$('#dataTable').DataTable({
	"ordering": false // false to disable sorting (or any other option)
});
</script>
</body>

</html>
