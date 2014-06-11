$(function() {
	  $( '#orderForm' ).parsley( 'addListener', {
    		onFormSubmit: function(isFormValid, event) {
				
		    // Get all the values of the form
                        var package = $("input#package").val();
			var name = $("input#name").val();
			var surname = $("input#surname").val();
			var age = $("input#age").val();
			var gender = $("#gender option:selected").text();
		        var phone = $("input#phone").val();
			var address = $("input#address").val();
			var details = $("input#details").val();
			var state = $("#state option:selected").text();
		        var city = $("#city option:selected").text();
		        var payment = $("input[name=payment]:checked").val();
		    
                    //Is it valid?
		    if(isFormValid) {
		    //var dataString = 'matt#vectorloft.com' + '&package=' + package + 'name='+ name + 'surname='+ surname + 'age='+ age + 'gender='+ gender + '&phone=' + phone + 'address='+  address + 'details='+ details + 'state='+ state + 'city=' + city + 'payment='+ payment ;
		    var dataString = 'matt#vectorloft.com' + 'name='+ "NAME TEST" + '&email=' + "EMAIL TEST" + '&message=' + "MESSAGE TEST";

                    //alert (dataString);
                    $('#orderForm').submit(function(){ return false; });
		    //Send Data
                    /*$.ajax({
                      type: 'POST',
                      url: 'http://formmail.dreamhost.com/cgi-bin/formmail.cgi',
                      data: dataString,
                      success: function(){
                          alert ("success");
                        $('.submit-box').html("<div id='message'></div>");
                        $('#message').html("<h2>Submitted!</h2>")
                        .append("<p>We will be in touch soon.</p>")
                        .hide()
                        .fadeIn(1500, function() {
                          $('#message').append("<img id='checkmark' src='images/check.png' />");
                        });
                      },
                      error: function() {alert("ERROR");}
                    }); */

                    return false;
			}
			
			
	

    
    }
});
});