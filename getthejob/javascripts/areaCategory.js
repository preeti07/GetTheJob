$(function()
   {
        $(window).load(function()
        {
            //$('#category').change(function()
			$('#category').bind('change keyup keypress', function() 
            {
                var parentValue = $(this).val();
				// Determine the selected Value
                if( parentValue.length != "" )
                {
                    $.ajax(
                    {
                        url: 'levelCategory.php',
                        data: {parent: parentValue},
                        success: function(data)
                        {
                            $('#subCategory').html(data);
                        }
                    });
                }
                else
                {
                    $('#subCategory').html('<option value="">Please first select category</option>');
                }
            });
			
			$('#region').change(function()
            {
                var parentValue = $(this).val();
				// Determine the selected Value
                if( parentValue.length != "" )
                {
                    $.ajax(
                    {
                        url: 'levelRegion.php',
                        data: {parent: parentValue},
                        success: function(data)
                        {
                            $('#district').html(data);
                        }
                    });
                }
                else
                {
                    $('#district').html('<option value="">Please first select region</option>');
                }
            });
        });
    });