$(document).ready(function(){
	$('#summernote').summernote({
		height: 300,
		lang: 'ko-KR', 
		callbacks: {
			  onImageUpload: function(files) {
				  sendFile(files)
			  },
			  onMediaDelete: function (target) {
				  console.log($('#summernote').summernote('code'));

			  }
		  }
	});
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880;
	function checkExtension(fileName, fileSize){
		if(fileSize>=maxSize){
			alert('파일 크기 초과');
			return false;
		}
		if(regex.test(fileName)){
			alert('해당 종류의 파일은 업로드 할 수 없습니다')
			return false;
		}
		return true;
	} 
	//파일 ajax
	function sendFile(files) {
		var formData = new FormData();
		for(var i=0; i<files.length; i++){
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			} 
			formData.append("uploadFile",files[i]);
		}

		$.ajax({
			url: '/uploadAjax',
			processData: false,
			contentType: false,
			data: formData,
			type: 'post',
			dataType: 'json', 
			enctype: "multipart/form-data",
			success: function(result){

				$(result).each(function(i,obj){
					var fileCallPath = '/summernoteImage/'+obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName;
					console.log(fileCallPath)
					$('#summernote').summernote('editor.insertImage', fileCallPath, obj.uuid);
			    })
			}
		});
	}
});