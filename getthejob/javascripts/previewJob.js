$(function(){
	var post = "It is OK Post this Job";
	// var jobTitle = $("#jobTitle").val();
	 // var jobDesc = $("#jobDesc").val();
	// var workDesc = $("#workTypeDesc").text();
	var pop = function(){
				if($("#jobTitle").val() == "" || $("#jobDesc").val() == "" || $("#workType").val() == "" || $("#district").val() == "" || $("#subCategory").val() == "" || $("#expLevel").val() == "")
				{
				return false;	
				}
				else
				{
		
	        $('#screen').css({ 'opacity': 0.7, 'display': 'block', 'width':$(document).width(),'height':$(document).height()});
	       // $('body').css({'overflow':'hidden'});
	      $('#box').css({'display': 'block'});
		// $('#jobTitlePreview').html(jobTitle);
		 $("#jobTitlePreview").html($("#jobTitle").val());
		  $("#jobDescPreview").html($("#jobDesc").val());
		   $("#workTypePreview").html($("#workTypeDesc").text());
		    $("#experiencePreview").html($("#expLevel").val());
			 $("#districtPreview").html($("#district").val());
			  $("#subCategoryPreview").html($("#subCategory").val());
		  
		  $('#edit').click(function(){$('#box').css('display', 'none');$('#screen').css('display', 'none')});
		   $('#post').click(function(){
			   $('#box').css('display', 'none');$('#screen').css('display', 'none')
			//  $(location).attr('href',"addJob.php?post=It is OK Post this Job!&jobtitle=" + jobTitle);
			 // window.location = "addJob.php?post=It is OK Post this Job&jobtitle=" + jobTitle + "&jobdesc=" + jobDesc;
			 window.location.href = "addJob.php?post=" + post + "&jobtitle=" + $("#jobTitle").val() + "&jobdesc=" + $("#jobDesc").val() + "&worktype=" + $("#workType").val() + "&district=" + $("#district").val() + "&subcategory=" + $("#subCategory").val() + "&explevel=" + $("#expLevel").val();
			   });
				}
		  
	}
	$('#preview').click(pop);
	});
