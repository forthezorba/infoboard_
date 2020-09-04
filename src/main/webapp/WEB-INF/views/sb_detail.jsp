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
 
          <div class="row justify-content-center">

	      <!-- Post Content Column -->
	      <div class="col-lg-10 mb-5">
	
	        <!-- Title -->
	        <h1 class="mt-4">${detail.subject}</h1>
	
	        <!-- Author -->
	        <p class="lead">
	          by
	          <span href="#">${detail.name}</span>
	        </p>
	
	        <hr>
	
	        <!-- Date/Time -->
	        <p><fmt:formatDate value="${detail.reg_date}" pattern="yyyy.MM.dd HH:mm:ss" /></p>
	
	        <hr>
<!-- 	        Preview Image
	        <img class="img-fluid rounded" src="http://placehold.it/900x300" alt="">
	        <hr> -->
	
	        <!-- Post Content -->
	        <p class="lead">
	        <c:out value="${detail.content}" /> 
	        </p>
	
	        <blockquote class="blockquote">
	          <footer class="blockquote-footer">
	            <cite title="Source Title">${detail.writer}</cite>
	          </footer>
	        </blockquote>
	        <hr>
	        
	        <div class="my-3 d-flex justify-content-end">
	       		<div class="btn-group btn-group-sm">
					<c:if test="${user.email eq detail.writer}">
	         			
	         			<button type="button" id="delete" class="btn btn-danger ml-1">삭제</button>
						<button type="button" class="btn btn-primary ml-1" onclick="location.href='/update/${detail.bno}'">수정</button>	
	         			
	         			</c:if>
					<button type="button" class="btn btn-secondary ml-1" onclick="location.href='/'">목록</button>
				</div> 
			</div>
			 
            
            <div class="mt-5 read-form">
				 <hr>
			        <!-- Comments Form -->
			        <h4>
		            	답변&nbsp;<i class="fas fa-hand-point-down"></i>
			        </h4>
			        
			        <div class="card my-4">
			          <h5 class="card-header">
			          <span class="re_title">${reply.title}</span>
			          <small class='float-right text-muted'>
			      	  <fmt:formatDate value="${reply.reg_date}" pattern="yyyy.MM.dd HH:mm:ss" />
			      	  </small>
			          </h5>
			          
			          <div class="card-body re_content" style="white-space: pre-line;">
			          	<c:out value="${reply.content}" />

			          </div>
			        </div>
					<div class="float-right write-form-btn">				
						<button type='button' class='modReplyBtn btn btn-primary btn-sm' data-dismiss='modal' data-rno='${reply.rno}'  data-bno="${reply.bno}" >수정</button>
						<button type='button' class='removeBtn btn btn-danger btn-sm ml-1' data-bno='${reply.bno}' data-rno='${reply.rno}' >삭제</button>
		          	</div>
		    </div>
				
					<!-- Comments Form -->
			        <div class="card my-4 write-form">
			          <div class="card-header">
			          	<label for="title">제목</label>
					    <input class="form-control" type="text" id="title" name="title" />
					  </div>
			          <div class="card-header">
			            <form>
			              <div class="form-group">
			               <label for="content">내용</label>
			               <textarea class="form-control" rows="7" id="content" name="content"></textarea>
			              </div>
			              <button type="button" class="btn btn-primary addReplyBtn"  data-bno="${detail.bno}" data-rno="${reply.rno}">등록</button>
			              <button type="button" class="btn btn-secondary cancelReplyBtn"  data-bno="${detail.bno}" data-rno="${reply.rno}">취소</button>
			            </form>
			          </div>
			        </div>
		        
			
	        
	        
	      </div>
	      
	    </div>
	    <!-- /.row -->
          
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
  <script type="text/javascript" src="/js/reply.js"></script>
<script>
//logout
$(document).ready(function(){
	var actionForm= $('#actionForm');
	$('.logout_btn').on('click',function(e){
			e.preventDefault();
			actionForm.submit();
	})
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

<script>
//reply
 $(document).ready(function() {
	 var user = '<c:out value="${user.email}"/>';
	 var isReply = '<c:out value="${reply.rno}"/>';

	 if(!isReply){
		 $('.read-form').hide();
	 }
	 if(isReply){
		 $('.write-form').hide();
	 }

	 if(user!=='admin@naver.com'){
		 $('.write-form').hide();
		 $('.write-form-btn').hide();
 	 }
	 $('.write-form').on('click','.cancelReplyBtn',function(e){
		 if(!$('.write-form .cancelReplyBtn').attr('data-rno'))return;
		 $('.write-form').hide();
		 $('.read-form').show();
	 });

		
  	//등록
  	$('.addReplyBtn').on('click',function(e){
		e.stopPropagation();
		
		var reply={
				rno: $('.addReplyBtn').attr('data-rno'),
				bno: $('.addReplyBtn').attr('data-bno'),
				title: $('input[name="title"]').val(),
				content: $('textarea[name="content"]').val(),
		};

		console.log(reply)

		if(!reply.rno){
			console.log('reply add...')
			replyService.add(reply, function(result){
				create_read_form(result);
			})
			return
		}

		if(reply.rno){
			console.log('reply update...')
			replyService.update(reply, function(result){
				create_read_form(result);
			})
			return
		}
		
	});


    //삭제
	$('.read-form').on('click','.removeBtn',function(e){
		if(!confirm('삭제하시겠습니까?')){
            return
        }
		var rno=$(this).data('rno');
		var bno=$(this).data('bno');
		var reply={
				rno: rno,
				bno: bno,
		};
		replyService.remove(reply,function(result){
			$('.read-form').hide();
			$('.write-form').show();
			$('input[name="title"]').val('');
			$('textarea[name="content"]').val('');
			$('.write-form .addReplyBtn').attr('data-rno','');
			$('.write-form .cancelReplyBtn').attr('data-rno','');
		})
		
	})
	//수정
	$('.read-form').on('click','.modReplyBtn',function(e){
		var rno=$(this).data('rno');
		var title = $(this).parents().find('.re_title').text().trim();
		var content = $(this).parents().find('.re_content').text().trim();

		$('.read-form').hide();
		$('.write-form').show();
		$('.write-form .addReplyBtn').attr('data-rno',rno)
		$('.write-form .cancelReplyBtn').attr('data-rno',rno)
		$('.write-form #title').val(title);
		$('.write-form #content').val(content);
	})
	

  	//form 
	function create_read_form(result){

		var str='';
		
		str += "<hr><h4>답변&nbsp;<i class='fas fa-hand-point-down'></i></h4>"  
		str += '<div class="card my-4">'
			str += '<h5 class="card-header">'  
			str += '<span class="re_title">'+result.title+'</span>'  
			str += '<small class="float-right text-muted">'+replyService.displayTime(result.reg_date)+'</small>'  
			str += '</h5>'  
			str += '<div class="card-body re_content" style="white-space: pre-line;">'+result.content+'</div>'  
		str += '</div>'  
			str += '<div class="float-right write-form-btn">'  

			if(user==='admin@naver.com'){
				str += '<button type="button" class="removeBtn btn btn-danger btn-sm mr-1" data-bno='+result.bno+' data-rno='+result.rno+' >삭제</button>'
				str += "<button type='button' class='modReplyBtn btn btn-primary btn-sm' data-dismiss='modal' data-rno="+result.rno+"  data-bno="+result.rno+">수정</button>"  
			}
			str += '</div>'
        str += "</small></td>"
		str += "</tr>"
		 
		$('.read-form').html(str).show();
		$('.write-form').hide();

		//초기화
		$('input[name="title"]').val('');
		$('textarea[name="content"]').val('');
		
	}
});
</script>
</body>
</html>

