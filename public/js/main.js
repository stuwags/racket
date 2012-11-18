$(document).ready(function() {
	
	$('.button').hover(function() { $(this).animate({backgroundColor: '#19784d'}); }, function() { $(this).animate({backgroundColor: '#1aad63'}); });
	$('.listing').hover(function() { $(this).animate({backgroundColor: '#dcdcdc'}); }, function() { $(this).animate({backgroundColor: '#f4f4f4'}); });
	
	$('.fadeThis').append('<span class="hover"></span>').each(function () {
	  var $span = $('> span.hover', this).css('opacity', 0);
	  $(this).hover(function () {
	    $span.stop().fadeTo(300, 1);
	  }, function () {
	    $span.stop().fadeTo(300, 0);
	  });
	});
	
	$("#welcome_start_button").click(function() {
		$("#welcome").hide("slide", { direction: "left" }, 500, function() { $("#start").fadeIn('fast'); });
	});
	
	var down = false;
	$("#serve_button").click(function() { if(down) { $(".new_serve_from_dashboard").slideUp(); down = false;  } else { $(".new_serve_from_dashboard").slideDown(); down = true; } });
	
	
	function isEmail(input) {
		var indexAt = input.indexOf("@");
		var indexDot = input.lastIndexOf(".");
		return ((indexAt > 0) &&
				(indexDot > indexAt) &&
				(indexDot > 2) &&
				(indexDot < input.length-1));
	}
	
	function validUsername(input) {
		var result;
		
   	    jQuery.ajax({
			type: "POST",
    		url: "/user/validate_username",
    		data: { username : input },
    		success: function(response){	
				if(response == "valid" && $('#screen2 input[name="username"]').val().match("^[a-z0-9'.\s]{3,50}$")) {
					username_valid = true;
					$('#screen2 input[name="username"]').css('background', 'url("/img/valid_yes.png") no-repeat top right #fff');
					checkFields();
				} else {
					username_valid = false;
					$('#screen2 input[name="username"]').css('background', 'url("/img/valid_no.png") no-repeat top right #fff');
					checkFields();
				}
    		},
    		error: function(){
    		}
    	});

		return true;
	}
	
	function checkFields() {
		if(username_valid && password_valid && email_valid) {
			$("button#next").removeAttr("disabled");
			console.log("valid");
		} else {
			$("button#next").attr("disabled", "disabled");
			console.log("invalid");
		}
	}
	
});