$(document).ready(function()//When the dom is ready
{	var isValid = false;
	var ValidationErrors = new Array();
	var FormID = $("#empRegForm");
	if (!((typeof(ValidationErrors[FormID]) == 'object') && (ValidationErrors[FormID] instanceof Array))) {
            ValidationErrors[FormID] = new Array();
	}
/*	$('#uname').blur(function()
	{ 	
	var username = $("#uname").val();
		if(username.length > 3)//if the lenght greater than 3 characters
	{
		$("#availability_status").html('<img src="images/ajax-loader.gif" align="absmiddle">&nbsp;Checking availability...');
		//Add a loading image in the span id="availability_status"

		$.ajax({			//Make the Ajax Request
 		type: "POST",
 		url: "common/ajax_check_username.php",	 //file name
 		data: "username="+ username, //data
 		success: function(server_response){

		// $("#availability_status").ajaxComplete(function(event, request){
		 $(document).ajaxComplete(function(event, request){
			  $( "#availability_status" ).append( "<li>Request Complete.</li>" );
 		if(server_response == '0')//if ajax_check_username.php return value "0"
		 {
		   $( "#status" ).append( "<li>Request Completing 000.</li>" );
		 $("#availability_status").html('<img src="images/check.png" align="absmiddle"> <font color="Green"> Available </font>&nbsp; ');
		 for (var i = 0; i < ValidationErrors[FormID].length; i++) {
                    if (ValidationErrors[FormID][i] == uname) 
                        ValidationErrors[FormID].splice(i, 1);
                }
                isValid = true;
 		//add this image to the span with id "availability_status"
 		}
 		else if(server_response == '1')//if it returns "1"
 		{
		$( "#status" ).append( "<li>Request Completing 11111.</li>" );

		 $("#availability_status").html('<img src="images/cross.png" align="absmiddle"> <font color="red">Not Available </font>');
		 if ($.inArray(uname, ValidationErrors) == -1) 
					{
                         ValidationErrors[FormID].push(uname);
					}
		isValid = false;
 		}

 		});
 	}	

 	});

	}
	
	else
	{
	$("#availability_status").html('<font color="#cc0000">Username too short</font>');
	if ($.inArray(uname, ValidationErrors) == -1) 
					{
                         ValidationErrors[FormID].push(uname);
					}
	 isValid = false;
	}  
	//return false;  
	});   */
	
	$('#pwd1').blur(function()
	{  
		var pwd1 = $('#pwd1').val().length;
		if(pwd1 < 6)
		{
		$("#pwd1Error").html('<font color="#cc0000">Please keep password more then or equal to 6 characters.</font>');
		
                    if ($.inArray(pwd1, ValidationErrors) == -1) 
					{
                         ValidationErrors[FormID].push(pwd1);
					}
		 isValid = false;	
		}
		else
		{
		$("#pwd1Error").html('<img src="images/check.png" height="25" width="25" />');	
		for (var i = 0; i < ValidationErrors[FormID].length; i++) {
                    if (ValidationErrors[FormID][i] == pwd1) 
                        ValidationErrors[FormID].splice(i, 1);
                }
                 isValid = true;
		}
	});
	
	$('#pwd2').blur(function()
	{  	
	//$("#pwdError").html('<img src="images/ajax-loader.gif" align="absmiddle">&nbsp;Matching the Passwords...');
	var pwd1 = $('#pwd1').val();
	var pwd2 = $('#pwd2').val();
	var pwd2Length = $('#pwd2').val().length;
	if(pwd1 != pwd2 || pwd2Length < 6)
	{
	$("#pwd2Error").html('<font color="#cc0000">Passwords are not matching or are less then 6 Characters</font>');	
	 if ($.inArray(pwd2, ValidationErrors) == -1) 
					{
                         ValidationErrors[FormID].push(pwd2);
					}
		 isValid = false;
	}
	else
	{
	$("#pwd2Error").html('<img src="images/check.png" height="25" width="25" /><font color="#0f0">Passwords are matching.</font>');
	for (var i = 0; i < ValidationErrors[FormID].length; i++) {
                    if (ValidationErrors[FormID][i] == pwd2) 
                        ValidationErrors[FormID].splice(i, 1);
                }
                isValid = true;
	}
	});
	
	$('#fname').blur(function()
	{  
		var fname = $('#fname').val().length;
		if(fname == 0)
		{
		$("#fnameError").html('<font color="#cc0000">Please enter your first name.</font>');	
		 if ($.inArray(fname, ValidationErrors) == -1) 
					{
                         ValidationErrors[FormID].push(fname);
					}
                return false;
		}
		else
		{
		$("#fnameError").html('<img src="images/check.png" height="25" width="25" />');	
		for (var i = 0; i < ValidationErrors[FormID].length; i++) {
                    if (ValidationErrors[FormID][i] == fname) 
                        ValidationErrors[FormID].splice(i, 1);
                }
                return true;	
		}
	});
	$('#lname').blur(function()
	{  
		var lname = $('#lname').val().length;
		if(lname == 0)
		{
		$("#lnameError").html('<font color="#cc0000">Please enter your last name.</font>');	
		ValidationErrors[FormID].push(lname);
		 isValid = false;
		}
		else
		{
		$("#lnameError").html('');	
		for (var i = 0; i < ValidationErrors[FormID].length; i++) {
                    if (ValidationErrors[FormID][i] == lname) 
                        ValidationErrors[FormID].splice(i, 1);
                }
                isValid = true;	
		}
	});
	
	$('#address').blur(function()
	{  
		var address = $('#address').val().length;
		if(address == 0)
		{
		$("#addressError").html('<font color="#cc0000">Please enter your Address.</font>');	
		ValidationErrors[FormID].push(address);
		 isValid = false;
		}
		else
		{
		$("#addressError").html('');
		for (var i = 0; i < ValidationErrors[FormID].length; i++) {
                    if (ValidationErrors[FormID][i] == address) 
                        ValidationErrors[FormID].splice(i, 1);
                }
                isValid = true;		
		}
	});
	
	$('#mobPhone').blur(function()
	{
	//var mobPhone = $('#mobPhone').val();	
	//var mobPhoneLength = $('#mobPhone').val().length;
	//$mobPhone = preg_replace('/[^\d\(\)]/', '', $mobPhone);
	//$checkNo = '/^(\((03|04|06|07|09)\)\d{7})|(\((021|022|025|027|028|029)\)\d{6,8})|((0508|0800|0900)\d{5,8})$/';
	$("#mobPhoneError").html('<font color="#f00">please enter either mobile no or workphone or both</font>');	
	});	
	
	$('#workPhone').blur(function()
	{  
		var workPhone = $('#workPhone').val().length;
		var mobPhone = $('#mobPhone').val().length;
		var workPhoneValue = $('#workPhone').val();
		var mobPhoneValue = $('#mobPhone').val();
		if(workPhone == 0 && mobPhone == 0)
		{
		$("#workPhoneError").html('<font color="#cc0000">Please enter either valid mobile number or .</font>');	
		ValidationErrors[FormID].push(workPhone);
		 isValid = false;
		}
		else if (!workPhoneValue.match(/^((03|04|06|07|09)\d{7})|((0508|0800|0900)\d{5,8})$/ ) && !mobPhoneValue.match(/^((021|022|025|027|028|029)\d{6,8})$/))
		{
		$("#workPhoneError").html('<font color="#0000cc">Please enter either valid mobile number or work phone number .</font>');	
		ValidationErrors[FormID].push(workPhone);
		 isValid = false;
		}
		else
		{
		$("#workPhoneError").html('');
		//$("#mobPhoneError").remove();			
		$("#mobPhoneError").html('');
		for (var i = 0; i < ValidationErrors[FormID].length; i++) {
                    if (ValidationErrors[FormID][i] == workPhone) 
                        ValidationErrors[FormID].splice(i, 1);
                }
                isValid = true;
		}
	});
	
	$('#email').blur(function()
	{  
		var email = $('#email').val().length;
		var emailValue = $('#email').val();
		if(email == 0)
		{
		$("#emailError").html('<font color="#cc0000">Please enter your email.</font>');	
		ValidationErrors[FormID].push(email);
		 isValid = false;
		}
		else if(!emailValue.match(/^([a-zA-Z0-9\+_\-]+)(\.[a-zA-Z0-9\+_\-]+)*@([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,6}$/))
		{
		$("#emailError").html('<font color="#cc0000">Please enter valid email.</font>');	
		ValidationErrors[FormID].push(email);
		 isValid = false;	
		}
		else
		{
		$("#emailError").html('<img src="images/check.png" height="25" width="25" />');	
		for (var i = 0; i < ValidationErrors[FormID].length; i++) {
                    if (ValidationErrors[FormID][i] == email) 
                        ValidationErrors[FormID].splice(i, 1);
                }
                isValid = true;	
		}
	});
	
	$('#agentComName').blur(function()
	{  
		var agentComName = $('#agentComName').val().length;
		if(agentComName == 0)
		{
		$("#agentComNameError").html('<font color="#cc0000">Please enter your company Name.</font>');	
		ValidationErrors[FormID].push(agentComName);
		 isValid = false;
		}
		else
		{
		$("#agentComNameError").html('');	
		for (var i = 0; i < ValidationErrors[FormID].length; i++) {
                    if (ValidationErrors[FormID][i] == agentComName) 
                        ValidationErrors[FormID].splice(i, 1);
                }
                isValid = true;	
		}
	});
	
	$('#empType').blur(function()
	{  
		var empType = $('#empType').val();
		if(empType == '0')
		{
		$("#empTypeError").html('<font color="#cc0000">Please enter employer Type.</font>');
		ValidationErrors[FormID].push(empType);
		 isValid = false;	
		}
		else
		{
		$("#empTypeError").html('');	
		for (var i = 0; i < ValidationErrors[FormID].length; i++) {
                    if (ValidationErrors[FormID][i] == empType) 
                        ValidationErrors[FormID].splice(i, 1);
                }
                isValid = true;	
		}
	});	
	
	$('#empRegForm').submit(function() {
  	//alert('Handler for .submit() called.');
	var count = ValidationErrors[FormID].length;
			  
	if (ValidationErrors[FormID].length != 0 || isValid == false) 
           {
			$("#test").html('<font color="#cc0000">'+isValid+'All the '+ValidationErrors+'fields are  not filled.</font>'+count);
			return false;
			}
			
	});   
	
	
});

