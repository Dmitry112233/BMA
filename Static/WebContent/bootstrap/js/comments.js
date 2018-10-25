function doAjax(id) { 
	$("#message").fadeIn();
	 $.ajax({
		  url : 'save_comment',
		  type: 'GET',
		  dataType: 'json',
		  contentType: 'application/json',
		     mimeType: 'application/json',
		  data : ({
		   id: id,
		   name: $("#name").val(),
		   comment: $("textarea[name='comment']").val(),
		   level: $("select[name='level']").val(),
		   email: $("#email").val()
		  }),
		  success: function (data) {    
		  }
		 });
	 document.getElementById('name').value = "";
	 document.getElementById('email').value = "";
	 document.getElementsByClassName('comments_textarea w-input')[0].value = "";
	 document.getElementsByClassName('comments_select w-select')[0].value = "";
	 document.getElementById("message").style.color = "#2f80ed"
	 document.getElementById('message').innerHTML="Ваш комментарий рассматривается";
	 $("#message").fadeOut(4500);
	}