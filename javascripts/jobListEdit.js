$(function(){
	//var post = "It is OK Post this Job";
	// var jobTitle = $("#jobTitle").val();
	 // var jobDesc = $("#jobDesc").val();
	// var workDesc = $("#workTypeDesc").text();
	// var jobId = $("jobListing .jobid").text();
/*	var pop = function(){		
	        $('#screen').css({ 'opacity': 0.7, 'display': 'block', 'width':$(document).width(),'height':$(document).height()});
	       // $('body').css({'overflow':'hidden'});
	      $('#box').css({'display': 'block'});
		 //$("#jobTitlePreview").html($("#jobTitle").val());
		  //$("#jobDescPreview").html($("#jobDesc").val());
		  
		  
		  $('#cancel').click(function(){$('#box').css('display', 'none');$('#screen').css('display', 'none')});
		   $('#post').click(function(){
			   if($("#jobTitle").val() == "" || $("#jobDesc").val() == "")
			   {
				 $(".error").html("please provide Job title and job description");  
				 return false;
				}
				else
				{
				$(".error").html($("#jobid").text());	
			//   $('#box').css('display', 'none');$('#screen').css('display', 'none')
			// window.location.href = "addJob.php?post=" + post + "&jobtitle=" + $("#jobTitle").val() + "&jobdesc=" + $("#jobDesc").val() + "&worktype=" + $("#workType").val() + "&district=" + $("#district").val() + "&subcategory=" + $("#subCategory").val() + "&explevel=" + $("#expLevel").val();
			//window.location.href = "editJob.php?jobid=" + $(".jobid").text() + "&jobtitle=" + $("#jobTitle").val() + "&jobdesc=" + $("#jobDesc").val();
				}
		});
						   
	}
	$('.jobListing').click(pop);
	});   */
$('.jobListing').click(function(){
   alert($(this .jobid).attr("id"));
});

});