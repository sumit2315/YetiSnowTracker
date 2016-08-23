jQuery(window).load(function () {

    // Page Preloader
    jQuery('#status').fadeOut();
    jQuery('#preloader').delay(350).fadeOut(function () {
        jQuery('body').delay(350).css({'overflow': 'visible'});
    });
});

jQuery(document).ready(function () {
    
    jQuery(".username").on("blur", function () {
        var getUsername = $(this).val();
        jQuery(".getSubDomain").val(getUsername);
    });

    jQuery.validator.addMethod("alphanumeric", function (value, element) {
        var regex = new RegExp("^[a-zA-Z0-9 ]+$");
        var key = value;

        if (!regex.test(key)) {
            return false;
        }
        return true;
    }, "Please use only alphanumeric.");

    jQuery.validator.addMethod("alphabets", function (value, element) {
        var regex = new RegExp("^[a-zA-Z ]+$");
        var key = value;

        if (!regex.test(key)) {
            return false;
        }
        return true;
    }, "Please use only alphabets.");


    jQuery.validator.addMethod("nocharcf", function (b, a) {
        var regex = /^[a-zA-Z ]*$/;
        var fst = b.substring(0, 2);
        if (regex.test(fst)) {
            return true
        } else {
            return false;
        }
    }, "Enter only alphabets in first three characters.");

    jQuery.validator.addMethod("validDocPdf", function (value, element) {
        var regex = /\.(doc|docx|DOC|DOCX|pdf|PDF)$/i;

        if (regex.test(value)) {
            return true;
        } else {
            return false;
        }
    }, "Please use valid doc or pdf.");

    jQuery.validator.addMethod('positiveNumber',
            function (value) {
                return Number(value) > 0;
            }, 'Enter a positive number.');
            
                /***Validator method for empty spaces :Ashish********/
    jQuery.validator.addMethod("noSpace", function(value, element) { 
        return value.indexOf(" ") < 0 && value != ""; 
    }, "No space(s) please");


    jQuery.validator.addMethod("hyphenNumeric", function (value, element) {
        return this.optional(element) || /^[0-9\-\+]+$/i.test(value);
    }, "Numbers and dashes only.");


// validation for registration form

    jQuery("#registerForm").validate({
        rules: {
            firstname: {
                required: true,
                alphabets: true,
                noSpace : true,
                maxlength: 32,
                minlength: 2
            },
            lastname: {
                required: true,
                alphabets: true,
                noSpace : true,
                maxlength: 32,
                minlength: 2
            },
            username: {
                required: true,
                noSpace : true,
                alphanumeric:true,
                maxlength: 30,
                minlength: 2
            },
            email: {
                required: true,
                email: true,
                maxlength: 150,
                minlength: 6
            },
            password: {
                required: true,
                maxlength: 20,
                minlength: 6
            },
            confirm_password: {
                required: true,
                equalTo: "#password"
            },
            address1: {
                required: true,
                maxlength: 150
            },
            city: {
                required: true,
                alphabets: true
            },
            postal_code: {
                required: true,
                 alphanumeric:true
            },
            mobile_carrier: {
                required: true,
                alphabets: true
            },
            notes: {
                required: true,
                maxlength: 150
            },
            company_name: {
                required: true,
                maxlength: 50
            },
            fax: {
                required: true,
                number:true,
                positiveNumber : true,
                maxlength: 15,
                minlength: 5
            }
        },
        // Specify the validation error messages
        messages: {
            firstname: {
                required: "Please enter first name.",
                maxlength: "Maximum  32 characters are allowed.",
                minlength: "Minimum  2 characters  are  required.",
            },
            lastname: {
                required: "Please enter last name.",
                maxlength: "Maximum  32 characters are allowed.",
                minlength: "Minimum  2 characters  are  required."
            },
            username: {
                required: "Please enter username.",
                maxlength: "Maximum  30 characters are allowed.",
                minlength: "Minimum  2 characters  are  required."
            },
            email: {
                required: "Please enter email.",
                email: "Invalid email.",
                maxlength: "Maximum  150 characters are allowed.",
                minlength: "Minimum  6 characters  are  required."
            },
            password: {
                required: "Please enter password.",
                maxlength: "Maximum  20 characters are allowed.",
                minlength: "Minimum  6 characters  are  required."
            },
            confirm_password: {
                required: "Please enter confirm password.",
                equalTo: "Password and confirm password should be same."
            },
            address1: {
                required: "Please enter address1.",
                maxlength: "Maximum 150 characters are allowed."
            },
            city: {
                required: "Please enter city.",
            },
            postal_code: {
                required: "Please enter postal code."
            },
            mobile_carrier: {
                required: "Please enter mobile carrier."
            },
            notes: {
                required: "Please enter notes.",
                maxlength: "Maximum 150 characters are allowed."
            },
            company_name: {
                required: "Please enter company name.",
                maxlength: "Maximum 50 characters are allowed."
            },
            fax: {
                required: "Please enter fax.",
                number: "Please enter numbers only.",
                maxlength: "Maximum  15 characters are allowed.",
                minlength: "Minimum  5 characters  are  required."
            }
        }
    });
// validation for registration form ends here


// validation for login form

jQuery("#loginForm").validate({
        rules: {
            email: {
                required: true,
                email:true
            },
            password: {
                required: true
            }
        },
        // Specify the validation error messages
        messages: {
            email: {
                required: "Please enter email.",
                email: "Invalid email."
            },
            password: {
                required: "Please enter password."
            }
        }
    });
// validation for login form ends here

// validation for forgot password form

    jQuery("#forgotpasswordForm").validate({
        rules: {
            email: {
                required: true,
                email:true
            }
        },
        // Specify the validation error messages
        messages: {
            email: {
                required: "Please enter email.",
                email: "Invalid email."
            }
        }
    });
    // validation for forgot password form ends here

    // validation for reset password form

    jQuery("#resetForm").validate({
        rules: {
            password: {
                required: true,
                minlength:6,
                maxlength: 20
            },
            confirm_password: {
                required: true,
                equalTo: "#password"
            }
        },
        // Specify the validation error messages
        messages: {
            password: {
                required: "Please enter password.",
                minlength: "Minimum 6 characters are required.",
                maxlength: "Maximum  20 characters are allowed."
            },
            confirm_password: {
                required: "Please enter confirm password.",
                equalTo: "Password and confirm password should be same."
            }
        }
    });
    // validation for reset password form ends here
});
