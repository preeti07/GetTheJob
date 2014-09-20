/* Created by jankoatwarpspeed.com */

$(document).ready(function(){		
	
	$("#b1").click(function(){
		$("#step2").css('display', 'block');
		$("#step1").css('display', 'none');
		$(".steps").html(" &nbsp; &nbsp; You are at step 2 of 3 ");
		$("#level1").css('color', '#666');
		$("#level2").css('color', '#c00');
		$("#c1").removeClass('circle');
		$("#c1").addClass('grey_circle');
		$("#c2").removeClass('white_circle');
		$("#c2").addClass('circle');		
		});
		
	$("#b2").click(function(){
		$("#step2").css('display', 'none');
		$("#step3").css('display', 'block');
		$(".steps").html(" &nbsp; &nbsp; You are at step 3 of 3 ");
		$("#level2").css('color', '#666');
		$("#level3").css('color', '#c00');
		$("#c2").removeClass('circle');
		$("#c2").addClass('grey_circle');
		$("#c3").removeClass('white_circle');
		$("#c3").addClass('circle');
		});
			
	$(".one").click(function(){
		$("#step1").css('display', 'block');
		$("#step2").css('display', 'none');
		$("#step3").css('display', 'none');
		$(".steps").html(" &nbsp; &nbsp; You are at step 1 of 3 ");
	//	$("#level1").css('color', '#666');
	//	$("#level2").css('color', '#c00');
	//	$("#c1").removeClass('circle');
	//	$("#c1").addClass('grey_circle');
	//	$("#c2").removeClass('white_circle');
	//	$("#c2").addClass('circle');	
	});
	$(".two").click(function(){
		$("#step2").css('display', 'block');
		$("#step1").css('display', 'none');
		$("#step3").css('display', 'none');
		$(".steps").html(" &nbsp; &nbsp; You are at step 2 of 3 ");
	//	$("#level1").css('color', '#666');
	//	$("#level2").css('color', '#c00');
	//	$("#c1").removeClass('circle');
	//	$("#c1").addClass('grey_circle');
	//	$("#c2").removeClass('white_circle');
	//	$("#c2").addClass('circle');	
	});
	
function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah').attr('src', e.target.result);
			 $('#blah').attr('width', '150px');
			  $('#blah').attr('height', '60px');
        }

        reader.readAsDataURL(input.files[0]);
    }
}

$("#file").change(function(){
    readURL(this);
});		
});

