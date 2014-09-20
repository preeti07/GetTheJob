// step 1 validation
$(function()
{
 var uvalid = false;
var evalid =false;	  
var p2valid = false;
var p1valid = false;
	   //var valid;
       // $(window).load(function()
       // {
$('#uname').on('blur change keyup keypress', function() 
  {
	  var username = $(this).val();
	  
	   var pattern=/^[a-z][a-zA-Z0-9_.-]{3,19}$/;
	  if( username.length < 4 )
	  {
		   $('.availability_status').html('Too short username');
		  uvalid = false;
		  
	  }
	  else if (!pattern.test(username))
	  {
		  $('.availability_status').html('can contain only a-z, 0-9, - _ .');
		  uvalid = false;
	  }
	  else
	  {
		 $(".availability_status").html('<img src="images/ajax-loader.gif" align="absmiddle">&nbsp;Checking availability...');
		  $.ajax(
		  {
			  url: 'common/usernameAvailabilityCheck.php',
			  data: {uname: username},
			  success: function(data)
			  {
				  $('.availability_status').html(data);
				  if(data == '<img src="images/check.png" align="absmiddle" width="25"><font color="grey">User name is available</font>')
				  {
					 // $('.availability_status').append(1);
					  uvalid = true;
					  //alert("burtujkj");
				  }
			  }
		  });
	  }
	 
	 })

$('#email').on('blur change keyup keypress click', function() 
  {
	 var email = $(this).val();
	  if( email.length == "" )
	  {
		  
		   $('.availability_status_email').html('please enter email');
		  evalid = false;
	  }
	 else if( email.length != "")
      {
		 var pattern=/^([a-zA-Z0-9_.-])+@([a-zA-Z0-9_.-])+\.([a-zA-Z])+([a-zA-Z])+/;
    	  if(!pattern.test(email)){         
		  $(".availability_status_email").html('Please enter a valid Email ID');
		  evalid = false;
		  }
		  else if (pattern.test(email))
		  {
		  $(".availability_status_email").html('<img src="images/ajax-loader.gif" align="absmiddle">&nbsp;Checking availability...');
		  $.ajax(
		  {
			  url: 'common/email_availability.php',
			  data: {email: email},
			  success: function(data)
			  {
				  $('.availability_status_email').html(data);
				  if(data == '<img src="images/check.png" align="absmiddle" width="25"><font color="grey">Email Id is available</font>')
				  {
					//  $('.availability_status_email').append(1);
					  evalid = true;
					  //alert("burtujkj");
				  }
			  }
		  });
	  } 
	}
	 
})
	 
$('#pwd1').on('keyup keypress blur change', function() 
  {
	var password = $(this).val();	
/*	 if(pwd1.length <= 4 ) 
	 {
		  $('.availability_status_pwd1').html('Should be more than 5');
		 p1valid = false;
	 } 
	 if(($(this).val() != $('#pwd2').val()) && $('#pwd2').val() != '')
	 {
		 $('.availability_status_pwd1').html('passwords are not matching');
		  p1valid = false;
	 }
	 else 
	 {
		 $('.availability_status_pwd1').html('');
		 p1valid = true;
	  }  */

        var desc = new Array();
        desc[0] = "Too short";
        desc[1] = "Weak";
        desc[2] = "Better";
        desc[3] = "Medium";
        desc[4] = "Strong";
        desc[5] = "Strongest";
        var score   = 0;
        if (password.length < 5) 
		{
			$("#passwordDescription").html("Too short");
			$("#passwordStrength").addClass("strength0");
			p1valid = false;
		}
		else 
		{
			score++;
		 //if password has both lower and uppercase characters give 1 point      
        if ( ( password.match(/[a-z]/) ) && ( password.match(/[A-Z]/) ) ) score++;
        //if password has at least one number give 1 point
        if (password.match(/\d+/)) score++;
        //if password has at least one special caracther give 1 point
        if ( password.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/) ) score++;
        //if password bigger than 12 give another 1 point
        if (password.length > 12) score++;	
		}
		if(($(this).val() != $('#pwd2').val()) && $('#pwd2').val() != '')
	 	{
			//$("#passwordDescription").html("passwords are not matching");
			document.getElementById("passwordStrength").className = "strength" + score;
		  p1valid = false;
	 	}
		else
		{
		p1valid = true;
		}
         document.getElementById("passwordDescription").innerHTML = desc[score];
         document.getElementById("passwordStrength").className = "strength" + score;
		
 })

$('#pwd2').on('keyup keypress blur change', function() 
  {
	 var pwd2 = $(this).val();	
	 if(pwd2.length > 4 && $(this).val() == $('#pwd1').val())
	 {
		  $('.availability_status_pwd2').html('');
		 p2valid = true;
	 } 
	 else
	 {
		$('.availability_status_pwd2').html('Passwords are not matching');
		  p2valid = false;
	 }
  })
 $('#uname, #email, #pwd1, #pwd2').on('keyup keypress blur change', function() 	
 {
if(uvalid == true && evalid == true && p1valid == true && p2valid == true)
	{
		document.getElementById("b1").disabled = false;
		$('.b11').attr('src','images/next_btn.png');
	}
	else
	{
		document.getElementById("b1").disabled = true;
		$('.b11').attr('src','images/next_btn_grey.png');
	}   	
 })
}) 	

//step 2 validation
$(function()
{
 var c1Valid = false;
 var c2Valid = false;
 var c3Valid = false;
 var c4Valid = true;	  
	 
$('#companyUrl').on('keyup keypress blur change', function() 
  {
	 // var username = $(this).val();
	  if( $(this).val() == "" )
	  {
		  $(".vaidation_company_url").html('Please enter your company website');
		  c1Valid = false;
	  }
	  else
	  {
		  $('.vaidation_company_url').html('');
		  c1Valid = true;
	  }
	 
	 })
	 
$('#empType').on('keyup keypress blur change', function() 
  {
	  if( $(this).val() == "" )
	  {
		  $(".vaidation_empType").html('Please select employer type');
		  c2Valid = false;
	  }
	  else
	  {
		  $('.vaidation_empType').html('');
		  c2Valid = true;
	  }
 })
	 
$('#companyName').on('keyup keypress blur change', function() 
  {
	// var pwd1 = $(this).val();	
	 if($(this).val() == "")
	 {
		 $('.availability_companyName').html("<input type='checkbox' name='companyNo' id='companyNo'>Please provide your company No. or tick on this chechbox");
		  c3Valid = false;
		  $('#companyNo').on('click change', function()
			  {
			  if($('.availability_companyName input:checked').length > 0) {
				//$("#error").fadeIn().text("You must check at least one option.");
				//confirm("are you sure");
				c3Valid = true;
				alert("Please call at 0800 23456 for get activating your account and get ready your company no that time. OR provide your company no. now to instantly activate your account.");
				
				}
			  else
			  {
				 c3Valid = false; 
		      }
		  })
	 
	 } 
	  else
	 {
		 $('.availability_companyName').html('');
		 c3Valid = true;
	 }
 })	
 $('#file').on('change', function()
 {
	 if(this.files[0].size > 350000)
	 {
		$('.file_error').html('File size should be of Max 350KB.');
		c4Valid = false; 
	 }
	 else
	 {
		$('.file_error').html(''); 
		c4Valid = true;
	 }
 })
 
 $('#companyUrl, #empType, #companyName,#companyNo, #file').on('keyup keypress blur change', function() 	
 {
if(c1Valid == true && c2Valid == true && c3Valid == true && c4Valid == true)
	{
		document.getElementById("b2").disabled = false;
		$('.b22').attr('src','images/next_btn.png');
	}
	else
	{
		document.getElementById("b2").disabled = true;
		$('.b22').attr('src','images/next_btn_grey.png');
	}   	
 }) 
}) 	

//step 3 validation
$(function()
{
 var add1Valid = false;
 var add2Valid = false;
 var p1Valid = false;
 var p2Valid = false; 
	 
$('#physicalAddress').on('keyup keypress blur change', function()
  {
	 // var username = $(this).val();
	  if( $(this).val() == "" )
	  {
		  $(".add1_valid").html('Please enter your physical address');
		  add1Valid = false;
	  }
	  else
	  {
		  $('.add1_valid').html('');
		  add1Valid = true;
	  }
	 
	 })
	 
$('#postalAddress').on('keyup keypress blur change', function()
  {
	  if( $(this).val() == "" )
	  {
		  $(".add2_valid").html('Please enter your postal address');
		  add2Valid = false;
	  }
	  else
	  {
		  $('.add2_valid').html('');
		  add2Valid = true;
	  }
 })
	 
$('#workPhone').on('keyup keypress blur change', function()
  {
	// var pwd1 = $(this).val();	
	var pattern = /^[(03|04|06|07|09)][0-9]{8}|[(0508|0800|0900)][0-9]{6,9}$/;
	 //if($(this).val() == "" || !pattern.test($(this).val()) || $(this).val().length > 9)
	 if(($(this).val() != "") && ($(this).val().match(/^[0][3|4|6|7|9][0-9]{7}$/)) && ($(this).val().length < 10))
	 {
		 $('.p1_valid').html('');
		 p1Valid = true;
	 } 
	  else
	 {
		  $('.p1_valid').html('Please provide your work phone.');
		  p1Valid = false;
	 }
 })
$('#mobPhone').on('keyup keypress blur change', function()
  {
	//var pattern = /^[(021|022|025|027|028|029)][0-9]{7,9}$/;	
	// if(($(this).val() != "") && ($(this).val().match(/^[(021|022|025|027|028|029)][0-9]{7,9}$/)) && ($(this).val().length < 11))
	if(($(this).val() != "") && ($(this).val().match(/^[0][2][(1|2|5|7|8|9)][0-9]{7,9}$/)) && ($(this).val().length < 11))
	 {
		  $('.p2_valid').html('');
		 p2Valid = true;
	 } 
	  else
	 {
		 $('.p2_valid').html('Please provide your mobile no.');
		  p2Valid = false;
		
	 }
 }) 	
 $('#physicalAddress, #postalAddress, #mobPhone, #workPhone').on('keyup keypress blur change', function() 	
 {
if(add1Valid == true && add2Valid == true && p1Valid == true && p2Valid == true)
	{
		document.getElementById("b3").disabled = false;
		$('.b3').attr('src','images/finish_btn.png');
	}
	else
	{
		document.getElementById("b3").disabled = true;
		$('.b3').attr('src','images/finish_btn_grey.png');
	}   	
 }) 
}) 	



	
	/*			
			if(valid == true) { 
				//$("input[type=button]").b1.removeAttr("disabled");
				document.getElementById("b1").disabled = false;
				//$(".b1").prop('disabled', false);
				
	      		}
			else
			{
				document.getElementById("b1").disabled = true;
				//$('.b1').prop('disabled', true);
			}	
			});  */
 

jQuery(function(){
              /*  jQuery("#uname").validate({
                    expression: "if (VAL) return true; else return false;",
                    message: "Please enter the Required field"
                });
				jQuery("#pwd1").validate({
                    expression: "if (VAL.length > 5 && VAL) return true; else return false;",
                    message: "Please enter a valid Password"
                });
                jQuery("#pwd2").validate({
                    expression: "if ((VAL == jQuery('#pwd1').val()) && VAL) return true; else return false;",
                    message: "Passwords are not matching"
                });  
				jQuery("#fname").validate({
                    expression: "if (VAL) return true; else return false;",
                    message: "Please enter the Required field"
                });
				jQuery("#lname").validate({
                    expression: "if (VAL) return true; else return false;",
                    message: "Please enter the Required field"
                });
				jQuery("#address").validate({
                    expression: "if (VAL.length > 0) return true; else return false;",
                    message: "Please enter the Required field"
                });
			jQuery("#mobPhone").validate({
                    //expression: "if (VAL.match(/^[(021|022|025|027|028|029)][0-9]{7,9}$/)) return true; else return false;",
					expression: "if (VAL) return true; else return false;",
                    message: "Please enter a valid mobile number or work Phone."
                });  
				jQuery("#workPhone").validate({
                    expression: "if ((VAL.match(/^[(03|04|06|07|09)][0-9]{8}|[(0508|0800|0900)][0-9]{6,9}$/)) ||  (jQuery('#mobPhone').val().match(/^[(021|022|025|027|028|029)][0-9]{7,9}$/))) return true; else return false;",
                    message: "Unvalid Mobile Phone"
                });
			jQuery("#email").validate({
                    expression: "if (VAL.match(/^[^\\W][a-zA-Z0-9\\_\\-\\.]+([a-zA-Z0-9\\_\\-\\.]+)*\\@[a-zA-Z0-9_]+(\\.[a-zA-Z0-9_]+)*\\.[a-zA-Z]{2,4}$/)) return true; else return false;",
                    message: "Please enter a valid Email ID"
                }); 
				jQuery("#agentComName").validate({
                    expression: "if (VAL) return true; else return false;",
                    message: "Please enter the Required field"
                });
                jQuery("#empType").validate({
                    expression: "if (VAL != '') return true; else return false;",
                    message: "Please make a selection"
                });
             
				jQuery('.empRegForm').validated(function(){
					//alert("Use this call to make AJAX submissions.");
				});  */
            });
 