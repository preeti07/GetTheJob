 jQuery(function(){
                jQuery("#jobTitle").validate({
                    expression: "if (VAL) return true; else return false;",
                    message: "Please enter the Job Title"
                });
				jQuery("#jobDesc").validate({
                    expression: "if (VAL.length > 5 && VAL) return true; else return false;",
                    message: "Please give some Job Description"
                });
				jQuery("#workType").validate({
                    expression: "if (VAL != '') return true; else return false;",
                    message: "Please make a selection for work type"
                });
				jQuery("#expLevel").validate({
                    expression: "if (VAL != '') return true; else return false;",
                    message: "Please make a selection for required experience level"
                });
				jQuery("#district").validate({
                    expression: "if (VAL != '' && jQuery('#region').val() != '') return true; else return false;",
                    message: "Please make a selection for region and district"
                });
				jQuery("#subCategory").validate({
                    expression: "if (VAL != '' && jQuery('#category').val() != '') return true; else return false;",
                    message: "Please make a selection for category and subcategory"
                });
				
                
				jQuery('.addJobForm').validated(function(){
					//alert("Use this call to make AJAX submissions.");
				});
            });