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
#result,#request{
	background-color:#020935;
	color:white;
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
          <h1 class="h3 mb-2 text-gray-800 font-weight-bolder"></h1>
          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">조회</h1>
          <p class="mb-4">homeTax</p>
          
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">   

                <div class="row ml-1"> 
	              	<input type="text" name="txprDscmNo" class="searchTax form-control bg-white border-0 small w-25" 
	              	placeholder="사업자 번호..." aria-label="Search" aria-describedby="basic-addon2">
	              	<button class="btn btn-primary btn-sm searchTax" style="float:right;">조회</button>
              	</div>
              </h6>
            </div>
            <div class="card-body w-75">
              <div class="table-responsive">
                <table class="table table-borderless bg-light"  width="80%" cellspacing="0"> 
                  <thead>
                    <tr class="">
		                <th style="width:30%; font-size:2rem;">요청</th>
		                <th style="width:70%; font-size:2rem;">결과</th>
		            </tr> 
                  </thead> 
                  <tbody>
                 	 <tr  style="cursor: pointer;">
                 	      <th>
                	      <textarea id="request" rows="17" cols="50"></textarea>
                 	      </th> 
                 	      <th>
                	      <textarea id="result" rows="17" cols="80"></textarea>		
                	      </th> 
	                  </tr>
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

	$('.searchTax').keyup(function(event){
		if (window.event.keyCode != 13) {
        	return;
        }
		if($('input[name=txprDscmNo]').val().length!==10){
			alert("10자리를 입력해주세요")
			return
		}
		
		var txprDscmNo = $('input[name=txprDscmNo]').val();
		//self.location='/homeTax/query_action?txprDscmNo='+txprDscmNo+'';

		var req={
				actionsId: 'ATTABZAA001R08',
				txprDscmNo: txprDscmNo
		};
		add(req, function(result){
			console.log(result)
			$('#request').val(JSON.stringify(req,null,4))
			$('#result').val(JSON.stringify(result.map,null,4));
			$('input[name=txprDscmNo]').val('');
		})
	})
});
function add(req,callback,error){
	console.log("insert.........");
	
	$.ajax({
		type: 'post',
		url: '/homeTax/sendReq',
		data: JSON.stringify(req),
		contentType: "application/json; charset=utf-8",
		success: function(result,status,xhr){
				
			if(callback){
				callback(result);
			} 
		},
		error: function(xhr,status,er){
			if(error){
				error(er); 
			}
		}
	})
}
</script>
<script>
$('#dataTable').DataTable({
	"ordering": false // false to disable sorting (or any other option)
});
</script>
</body>

</html>
