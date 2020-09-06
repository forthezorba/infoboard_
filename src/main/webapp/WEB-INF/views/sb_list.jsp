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
td{
	word-wrap: break-word !important;
}
.reply_btn{
	float:right;
}
.btn_toggle{
	cursor: initial !important;
}
.origin td{
vertical-align: baseline !important;
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
          <h5 class="mb-2 text-gray-800 ">
          </h5>
          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800 font-weight-bolder">문의</h1>
          <p class="mb-4">board</p>
          <!-- DataTales Example -->
          <div class="card shadow mb-4">
          
          	
         	 
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">   
              	<button class="btn btn-primary btn-sm" style="float:right; " onclick="location.href='/sb_insert'">글쓰기</button>
              </h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" style="table-layout:fixed" id="dataT"  width="100%" cellspacing="0">
                  <thead class="thead-dark">
                    <tr class="table-light">
		                <th >No</th>
		                <th  >상태</th>
		                <th style="width:50%;">제목</th>
		                <th  >링크</th>
		                <th >이름</th>
		                <th style="width:15%;">날짜</th>
		            </tr>
                  </thead>
                  <tbody class="chat">
                  
                  <c:forEach var="l" items="${list}" varStatus="sta">
                 	 <tr class="origin accordion" data-bno="${l.bno}">
	                      <td>
	                      <c:out value="${sta.count}" /> 
	                      </td>
	                      <td class="stateBtn">
	                      <c:if test="${l.bReply ==0}"> 
		                      	<button class="btn-danger btn btn-sm disabled btn_toggle" data-bno="${l.bBno}">대기</button>
				 	  	  </c:if>
	                      <c:if test="${l.bReply !=0}"> 
                     		    <button class="btn-primary btn btn-sm disabled btn_toggle" data-bno="${l.bBno}">완료</button>
				 	  	  </c:if>
	                      
	                      </td> 
	                      <td class='text_content'>
						 	  <h5 class="font-weight-bold text-truncate" data-toggle="collapse" data-target="#collapse${l.bBno}"  style="cursor: pointer;">
						 	  	${l.bSubject}
						 	  </h5>
						 	  
		                      <div id='collapse${l.bBno}' class='collapse'>
			                      <hr>
			                      ${l.bContent}
			                      
			                      
			                      <!-- reply -->
			                      <c:if test="${l.rRno != null}">
			                      <hr>
			                      <div class="re_content">
			                          <h5 class="font-weight-bold">
					                      <i class="fab fa-replyd" style="font-size:2rem;"></i>
					                      ${l.rTitle}
			                     	 </h5>
			                     	  <hr> 
			                      	  ${l.rContent}
			                      </div>
			                      </c:if>
		                      </div>  
	                      </td>
	                      
	                      <td onclick="location.href='/detail/${l.bBno}'"  style="cursor: pointer;">상세보기</td> 
	                      
	                      <td>${l.bName}</td>
	                      
                      	  <td>
                      	  		<fmt:formatDate value="${l.bDate}" pattern="yyyy.MM.dd"/>
								<%--<fmt:formatDate value="${l.bDate}" pattern="yyyy.MM.dd HH:mm:ss"/> --%>
	                     
	                     		<c:if test="${l.bReply ==0}">
	  	                            <sec:authorize access="hasRole('ROLE_ADMIN')"> 
							            <button class="addReplyBtn btn btn-secondary btn-sm reply" style="float:right;" data-bno="${l.bBno}">
						                    	<i  class="fa fa-comments fa-fw" style="width: auto;">답글</i>
							            </button> 
								    </sec:authorize>
							    </c:if> 
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

      
      
 		<!-- Modal -->
           <div class="modal fade reply_modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="overflow-y: auto;">
               <div class="modal-dialog">
                   <div class="modal-content">
<!--                        <div class="modal-header">
                           <h4 class="modal-title" id="myModalLabel">확인</h4>
                       </div> -->
                       <div class="modal-body">
                      		
                      		<c:if test="${user != null}">
                      		
	                      		<div class="form-group">
	                      			<label>아이디</label><input class="form-control" name="email" value='${user.email}' readonly='readonly'/>
	                      		</div>
	                      		<div class="form-group">
	                      			<label>작성자</label><input class="form-control" name="name" value='${user.name}' readonly='readonly'/>
	                      		</div>
	                      		
	                      	</c:if>
	                      	
          		       		<div class="form-group">
                      			<label>제목</label>
                      			<input class="form-control" id="title" name="title"/>
                      		</div>
                      		
<!--           		       		<div class="form-group">
                      			<label>내용</label>
                      			<textarea class="form-control" id="content" name="content" rows="10"></textarea>
                      		</div> -->
                      		<div class="form-group">
					   		    <label>노트</label>
					   		    <textarea id="summernote" class="form-control" name="content" rows="3"></textarea>
					   	    </div>
                      		
                       </div>
                       <input type='hidden' id='bno' name="bno">
                       <input type='hidden' id='rno' name="rno">
                       
                       <div class="modal-footer">
                           <!-- <button id='modalModBtn' type="button" class="btn btn-primary" data-dismiss="modal">수정</button> -->
                           <!-- <button id='modalRemoveBtn' type="button" class="btn btn-primary">삭제</button> -->
                           <button id='modalRegisterBtn' type="button" class="btn btn-primary">등록</button>
                           <button id='modalCloseBtn' type="button" class="btn btn-secondary">취소</button>
                       </div>
                   </div>
                   <!-- /.modal-content -->
               </div>
               <!-- /.modal-dialog -->
           </div>
  			<!-- /.modal -->
  			
  			
		  <!--Message Modal -->
          <div class="modal fade" id="myModal-msg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">성공</h4>
                        </div>
                        <div class="modal-body">
                             	처리가 완료됐습니다.
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default btn-primary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
      
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
	var user = '<c:out value="${user.email}"/>';

	var result = '<c:out value="${result}"/>';
	checkModal(result);
	history.replaceState({},null,null);
	function checkModal(result){
		if(result==='' || history.state){
			return; 
		}
		if(parseInt(result)>0){
			$('.modal-body').html('게시글 '+parseInt(result)+'번이 등록되었습니다.');
		}
		$('#myModal-msg').modal('show');
	}
	
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
	
	//reply
	var modal=$('.reply_modal');
	//input
	var modalInputBno = modal.find("input[name='bno']");
	var modalInputRno = modal.find("input[name='rno']");
	var modalInputTitle = modal.find("input[name='title']");
	var modalInputContent = modal.find("textarea[name='content']");

	//btn
	var modalModBtn = $('#modalModBtn'); 
	var modalRemoveBtn = $('#modalRemoveBtn'); 
	var modalRegisterBtn = $('#modalRegisterBtn');
	var modalCloseBtn = $('#modalCloseBtn');
	
	

  	$("#modalCloseBtn").on("click", function(e){
    	modal.modal('hide');
    	initialize();
    });

  	//등록
  	$('.addReplyBtn').on('click',function(e){
		e.stopPropagation();
		var bno=$(this).data('bno');
		modal.find('input[name="bno"]').val(bno);
		$('.reply_modal').modal('show');
	});
	//등록,수정 액션버튼
	modalRegisterBtn.on('click',function(e){
		let rno = 0;
		var bno = modalInputBno.val();
		var reply={
				rno: modalInputRno.val(),
				bno: bno,
				title: modalInputTitle.val(),
				content: modalInputContent.val()
		};

		var target=$("#collapse"+bno+"");
		//data num으로 찾기
		var btnTarget = $(".stateBtn button[data-bno="+bno+"]")
		btnTarget.parent().html('<button class="btn-primary btn btn-sm disabled btn_toggle" data-bno="'+bno+'">완료</button>')
		
		str ='';
		str += '<hr><div class="re_content">';
		str += '<h5 class="font-weight-bold">';
		str += '<i class="fab fa-replyd" style="font-size:2rem;"></i>';
		str += ''+reply.title+'';
		str += '</h5>';
		str += '<hr> ';
		str += ''+reply.content+'';
		str += '</div>';
		target.append(str)
		
		//방금 입력한 댓글 보여주기
		
	
		replyService.add(reply, function(result){
			if(result){
				target.addClass('show')
			}
		})
			
		//초기화
		initialize();
		modal.modal('hide');
		//해당 원글의 답글 버튼 감추기
		$(".addReplyBtn[data-bno="+bno+"]").hide();
	});

	//모달 초기화
	function initialize(){
		modal.find('input[name="bno"]').val('');
		modal.find('input[name="rno"]').val('');
		modal.find('input[name="title"]').val('');
		modal.find('textarea[name="content"]').val('');
	}
	
	
	function showList(page){
		console.log('showlist')
		replyService.getList({page: page|| 1}, function(list){
		$('tr.reply').html('')
			
			if(list==null || list.length == 0){
				return;
			}
			for(var i=0, len=list.length||0; i<len; i++){
				var str='';
				var target=$("tr.origin[data-bno="+list[i].bno+"]")
				
				str += "<tr class='reply accordion' data-bno="+list[i].bno+" style='cursor:pointer;'>"
				str += "<td colspan='1'><i class='fab fa-replyd' style='font-size:2rem;'></i></td>"
				str += "<td>"
				str += '<button class="btn disabled btn-sm btn-secondary btn_toggle">답변</span>'
				str += "</td></pre>"

				str += "<td class='font-weight-bold accordion'>"
					str += '<span class="btn re_title" data-toggle="collapse" data-target="#collapse'+list[i].rno+'">'+list[i].title+'</span>'
					str += "<div id='collapse"+list[i].rno+"' class='collapse re_content'>"+list[i].content+"</div></td>"
				str += "<td>확인</td>"
				str += "<td>운영자</td>"
           	    str += "<td class='pull-right><small text-muted'>"+replyService.displayTime(list[i].reg_date)+"";

				//운영자만 버튼 show
    			if(user==='admin@naver.com'){
    				str += "<span class='reply_btn'><button id='modalModBtn' type='button' class='modReplyBtn btn btn-secondary btn-sm' data-dismiss='modal' data-bno='"+list[i].bno+"' data-rno='"+list[i].rno+"' >수정</button>"
                    str += "<button type='button' class='removeBtn btn btn-danger btn-sm ml-1' data-bno='"+list[i].bno+"' data-rno='"+list[i].rno+"'>삭제</button></span>"
      			}       	    
                
                str += "</small></td>"
				str += "</tr>"
        		 
                console.log(target);
               	target.after(str);
               	$(target).css('display','table-row')				
			}

		});
	}
	var table = $('#dataT').DataTable({
		"ordering": false, // false to disable sorting (or any other option),
		"stateSave": true
	});
	//pagination
	table.on('draw',function(){
		showList()
	})

});
</script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="/js/file.js"></script>
</body>

</html>
