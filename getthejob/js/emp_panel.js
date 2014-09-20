//$(document).ready(function(e) {
	$(function(e){

   /*$('#employer_panel a').click(function(e) {
        if($('#tab2').hasClass('active'))
	   
		{
			$('.expired_job_icon').css('opacity','1');
			//$('div.expired_job_icon').css('background-image','url(../images/menu_images/expired_jobs.png) 0 0');
			//$('#expired_job_icon').removeClass('expired_job_icon');
			//$('#expired_job_icon').addClass('expired_job_icon_light');
		}
    });*/
	$('#employer_panel a').click(function(){
		$('#employer_panel a').children('div').css('opacity','.5');	
		($(this).is(".active"))
		{
		//var id = $(this).selector;
		$(this).children('div').css('opacity','1');	
		}
		
	})
	 
});