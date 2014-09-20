

$(document).ready(function(e) {
	var pattern = /^[^\W][a-zA-Z0-9\_\-\.]+([a-zA-Z0-9\_\-\.]+)*\@[a-zA-Z0-9_]+(\.[a-zA-Z0-9_]+){0,2}\.[a-zA-Z]{2,4}$/;
	var name_regexp = /^[a-zA-Z][a-zA-Z0-9\-\_\.]{2,25}$/;
    $('#job_alert_submit_button').click(function()
	{
		  var job_alert_user_name = $('#job_alert_user_name').val();
		  var job_alert_user_email = $('#job_alert_user_email').val();
		  if($('#job_alert_user_name').val().length == 0)
			  {
				  $('#message_p').html("Please enter your name");	
				  
			  }
		  else if(!name_regexp.test(job_alert_user_name))
		  {
			  $('#message_p').html("Name entered as incorrect. Please enter valid Name, which can contain only a-zA-Z, 0-9, . - _ and should start with a letter.");	
		  }	
		  else if($('#job_alert_user_email').val().length == 0)
		  {
			  $('#message_p').html("Please enter your email");
			  
		  }
		  else if(!pattern.test(job_alert_user_email) || $('#job_alert_user_email').val().length > 49)
		  {
			  $('#message_p').html("Email entered as incorrect. Please enter valid Email");	
		  }	
		  else 
		  {
			  
				  //$('#message_p').html("");	
			  $.ajax(
				  {
					  url: 'include/job_alert_check.php',
					  data: {job_alert_email: job_alert_user_email, job_alert_name:job_alert_user_name},
					  success: function(data)
					  {
						  $('#message_p').html(data);
					  }
				  });
				
		  }
		  $('#overlay').fadeIn('fast',function(){
			  $('#box').animate({'top':'100px'},500);
			  $('#job_alert_form_name').val($('#job_alert_user_name').val());
			  $('#job_alert_form_email').val($('#job_alert_user_email').val());				
		  }); 
	 });
	 
	$('#boxclose').click(function(){
		$('#box').animate({'top':'-500px'},500,function(){
			$('#overlay').fadeOut('fast');
		});
	});
	
	$('#boxclose_button').click(function(){
		$('#box').animate({'top':'-500px'},500,function(){
			$('#overlay').fadeOut('fast');
		});
	});
	
	$('#register_button').click(function()
	{
		 	  var job_alert_form_email = $('#job_alert_form_email').val();
			  var job_alert_form_name = $('#job_alert_form_name').val();
			  var job_alert_form_title = $('#job_alert_form_title').val();
			  var job_alert_form_keyword = $('#job_alert_form_keyword').val();
			  var job_alert_form_work_type = $('#job_alert_form_work_type').val();
			  var job_alert_form_category = $('#category').val() || [];
			  
			  var job_alert_form_salary = $('#job_alert_form_salary').val();
			  var job_alert_form_region = $('#region').val() || [];
			  
		if($('#job_alert_form_title').val().length == 0)
			  {
				  $('#message_alert').html("<span class='error_msg'>Please enter job alert title, it is required field.</span>");	
				  
			  }
		else if($('#job_alert_form_title').val().length > 90)
			  {
				  $('#message_alert').html("<span class='error_msg'>Please choose a shorter title, it's too big.</span>");	
				  
			  }	  	  
		else if(job_alert_form_category.length > 4)
			{
				$('#message_alert').html("<span class='error_msg'>Please choose 4 or less number of categories.</span>");	
			}
		else if(job_alert_form_region.length > 4)
			{
				$('#message_alert').html("<span class='error_msg'>Please choose 4 or less number of locations.</span>");	
			}		  
		else 
		  {
			 job_alert_form_category = job_alert_form_category.join(",");
			 job_alert_form_region = job_alert_form_region.join(",");
			  $.ajax(
				  {
					  url: 'include/seeker_job_alert.php',
					  data: {job_alert_email: job_alert_form_email, job_alert_name:job_alert_form_name, job_alert_title:job_alert_form_title, job_alert_keyword:job_alert_form_keyword, job_alert_work_type:job_alert_form_work_type, job_alert_category:job_alert_form_category, job_alert_region:job_alert_form_region, job_alert_salary:job_alert_form_salary},
					  success: function(data)
					  {
						  if(data == "message_alert_error")
						  window.location.href = "http://localhost:8000/getthejob1/index.php";
						  else if(data == "message_alert_success")
						  {
							$('#job_alert_form').css('display','none');
							$('#message_alert_success').html("<span class='success_msg'>Congratulations! You have successfully set your job alert filters now you will get more selected newly posted jobs in your inbox. Best of Luck</span>"); 
							
							setTimeout(function()
							{ 
							 $('#box').animate({'top':'-500px'},500,function()
							 	{
								$('#overlay').fadeOut('fast');
								$('p#message_p').css('display','block');
								$('p#message_alert').html("");
								$('form#job_alert_form').css('display','none');
								$('#message_alert_success').html("");
								});
							}, 5000);
							 
						  }
						  else
						  $('#message_alert').html("<span class='error_msg'>"+data+"</span>");
					  }
				  });
				
		  }	  
	});
});