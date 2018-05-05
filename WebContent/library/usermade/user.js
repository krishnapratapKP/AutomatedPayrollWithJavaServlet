
		// Check Employee

$(document).ready(function(){
     	 $('#clic').on('click',function(){
                
     		 var data="k=ok";

     	 	$.ajax({

     	 	  type:'GET',
     	 	  url : 'checkemployee',
     	 	  data:   data,
     	 	  success:function(result)
     	 	  {
     	 		  alert(result);
     	 	  	   var obj=JSON.parse(result);
                    
     	 	      var x="";
     	 	      
     	 	      x="<table class='table' style='border-radius:5px;color:white'><tr><th>EmpId</th><th>empName</th><th>empEmail</th><th>empMobileNo</th></tr>"
     	 	      for(var i=0; i<obj.length; i++)
     	 	      {
                      x+="<tr><td>"+obj[i].id+"</td><td width='450'>"+obj[i].username+"</td><td>"+obj[i].email+"</td><td>"+obj[i].mobile+"</td></tr>";
     	 	      }	    

     	 	      x+="<tr><td colspan='4'> Total Employee Working : "+obj.length+"</td></tr></table>"

     	 	      $('#tab').html(x).css({'display':'block'},{'color':'white'});

     	 	  }
     	 });
     	 });
     	 

     });
     

// view Image
		
		$(document).ready(function(){

	 		$('#viewButton').on('click',function(){

	 			var empId=$('#viewEmpId').val();
	 			var date=$('#viewDate').val();
	 			
	 			alert(date);
	 			var data="Id="+empId+"&date="+date+"&k=ok";

	 			$.ajax({
	 				type:'GET',
	 				url:'viewimage',
	 				data: data,
	 				success:function(result){
	 					
	                       alert(result);
	 					if(result!='')
	 					{
	 						var obj=JSON.parse(result);
	 						
	 					$('#viewImage').attr('src',obj[0].empImage);
	 					$('#viewId').html(obj[0].id);
	 					$('#viewName').html(obj[0].username);
	 					$('#viewda').html(obj[0].date);
	 					$('#info').css({'display':'inline'});
	 					$('#noinfo').html('');

	 					imaga='<img src="WebContent/library/'+obj[0].image+'" alt="Image" id="viewImage" width="150px"  height="200px">';
	 					$('#imtr').html(imaga);
	 					
	 					
	 					}
	 					else
	 					{
	 						$('#info').css({'display':'inline'});
	 						$('#noinfo').html('No Information Available').css({'color':'yellow'});
	 					}

	 				}
	 			});


	 			


	 			
	 		});
	 	});
	 	
		
		// Check Salary 
		
		
		
		$(document).ready(function(){
			$('#sButton').on('click',function(){

				var Id=$('#sId').val();
				var fdate=$('#fdate').val();
				
				var tdate=$('#tdate').val();
				
				var Pay=$('#sPay').val();
				
				var ddata="Id="+Id+"&fdate="+fdate+"&tdate="+tdate;
				  
				

				$.ajax({

					type:'POST',
					url :'checksalary',
					data: ddata,
					success:function(result){
						
							alert(result);
							 
                        // $('#empId').html(Id);
                         var totalsalary=result*int(Pay);
                         alert(totalsalary);
//                         $('#numberofDays').html(result);
//                         $('#salary').html(totalsalary+" df");
                         $('#kp').html(""+totalsalary);
                         
							
							

						}
					

				});
			});
		});

	 	
	 	// Change Password section
	 	
	 	
	 
	
   $(document).ready(function(){



    	$('#check').on('click',function(){

    		var EmpId=$('#empId').val();
    		var oldPass=$('#oldPass').val();
    		var data="Id="+EmpId+"&Pass="+oldPass+"&type=check";

    		$.ajax({
    			type:'POST',
    			url: 'changepassword',
    			data: data,
    			success:function(result)
    			{
    				
    				
    				if(result.trim()=='success')
    				{
    					$('#old').css({'display':'none'});
    					$('#new').css({'display':'inline'});
    					$('#check').css({'display':'none'});
                        $('#clear').css({'display':'none'});
    					$('#change').css({'display':'inline'});
                        $('#success').html('').fadeIn();
                        $('#empId').attr({'readonly': 'true'});
                    }
    				
    				else
    				{
    					
    					$('#success').html('Wrong employee Id or Password').css({'color':'red'});
    				}
    			}
    		});
    	});

    	$('#change').on('click',function(){

    		var EmpId=$('#empId').val();
    		var newPass=$('#newPass').val();

            if(newPass!='')
            {
    		var data="Id="+EmpId+"&Pass="+newPass+"&type=change";

    		$.ajax({
    			type: 'POST',
    			url: 'changepassword',
    			data: data,
    			success:function(result)
    			{
    				
    				if(result.trim()=='success')
    				{
    					$('#success').html('Successfully Changed Password').css({'color':'green'});
    					$('#old').css({'display':'inline'});
    					$('#new').css({'display':'none'});
    					$('#check').css({'display':'inline'});
    					$('#change').css({'display':'none'});
                        $('#empId').attr({'readonly': false});
                        $('#clear').css({'display':'inline'}).click();
                         $('#success').fadeOut(6000);
                         
    				}
    			}
    		});
        }
        else
        {
            $('#success').html('Empty Password not allowed').css({'color':'red'},{'font-weight':'bold'});

        }
    	});


    });
   
   
   // Forget Password
   
   
   $(document).ready(function(){



   	$('#emailCheck').on('click',function(){

   		var EmpEmail=$('#email').val();
   	
   		var data="email="+EmpEmail+"&type=email";

   		$.ajax({
   			type:'POST',
   			url: 'forgetpassword',
   			data: data,
   			success:function(result)
   			{
   				
   				
   				if(result=='success')
   				{
   					
   					$('#new').css({'display':'inline'});
   					$('#enew').css({'display':'inline'});
   					$('#email').attr({'readonly':'true'});
   					$('#emailCheck').css({'display':'none'});
                       $('#clear').css({'display':'none'});
   					$('#changePass').css({'display':'inline'});
                       $('#success').html('').fadeIn();
                      
                   }
   				
   				else
   				{
   					
   					$('#success').html('Wrong Email').css({'color':'red'});
   				}
   			}
   		});
   	});

   	$('#changePass').on('click',function(){

   		var Pass=$('#newfPass').val();
   		var email=$('#email').val();
   		
   		

           if(Pass!='')
           {
   		var data="Pass="+Pass+"&Email="+email+"&type=change";

   		$.ajax({
   			type: 'POST',
   			url: 'forgetpassword',
   			data: data,
   			success:function(result)
   			{
   				
   				if(result=='success')
   				{
   					$('#success').html('Successfully Changed Password').css({'color':'green'});
   					$('#em').css({'display':'inline'});
   					$('#new').css({'display':'none'});
   					$('#enew').css({'display':'none'});
   					$('#emailCheck').css({'display':'inline'});
   					$('#changePass').css({'display':'none'});
   					$('#email').attr({'readonly':'false'});
                       $('#clear').css({'display':'inline'}).click();
                        $('#success').fadeOut(6000);
                        
   				}
   			}
   		});
       }
       else
       {
           $('#success').html('Empty Password not allowed').css({'color':'red'},{'font-weight':'bold'});

       }
   	});


   });
   
   // head section part
   
   
   $(document).ready(function(){


 		$(".lis").fadeOut();

 		$("#sig").on('click',function(){
			$(".r").css({'display':'none'});
			$(".k").css({'display':'inline-block'});
			
			
		});

		$("#reg").on('click',function(){
			$(".k").css({'display':'none'});
			$(".r").css({'display':'inline-block'});
			
		});

 		
 		$(".bb").on('click',function(){
 			
 			$(".lis").fadeIn(100,function(){
 				$('.lis').css({'left':5});
 				$('.bbbb').css({'display':'none'});
 				$('.bbbb1').css({'display':'inline-block'});
 			});


 			
 			
 		});

 		$(".bb1").on('click',function(){
 			
 			$(".lis").fadeOut(100,function(){
 				$('.lis').css({'left':-400});
 				$('.bbbb').css({'display':'inline-block'});
 				$('.bbbb1').css({'display':'none'});
 			});


 			
 			
 		});

 		$("#userImg").on('click',function(){
 			
 			$(".Plis").fadeIn(100,function(){
 				$('.Plis').css({'right':5});
 				$('.Pbbbb').css({'display':'none'});
 				$('.Pbbbb1').css({'display':'inline-block'});
 			});


 			
 			
 		});

 		$("#userImg1").on('click',function(){
 			
 			$(".Plis").fadeOut(100,function(){
 				$('.Plis').css({'right':-400});
 				$('.Pbbbb').css({'display':'inline-block'});
 				$('.Pbbbb1').css({'display':'none'});
 			});


 			
 			
 		});
 		
 		$('#logout').on('click',function(){

            
			   $.ajax({
			   	type: 'GET',
			   	url: 'logout',
			   	success:function(res)
			   	{
			   		window.location="logout";
			   	}
			   });

		});
 		
   });

   
   //   Add Employee Javascript
   
   
   function previewFile() {
		var preview = document.querySelector('#profile');
		var file = document.querySelector('input[type=file]').files[0];
		var reader = new FileReader();

		reader.addEventListener("load", function() {
			preview.src = reader.result;
		}, false);

		if (file) {
			reader.readAsDataURL(file);
		}
	}
   
   $(document).ready(function() {
		$('#emrepass').on('keyup', function() {

			var pass = $('#empass').val();
			var repass = $('#emrepass').val();
			if (repass == "") {

				$('#emdpass').html('Empty').css({
					'border-color' : 'white'
				});

			} else if (pass == repass) {
				$('#emrepass').css({
					'border-color' : 'green'
				}, {
					'border' : 'bold'
				});
				console.log("match");
				$('#emdpass').html('Password match').css({
					'color' : 'green'
				});

			}

			else {
				$('#emrepass').css({
					'border-color' : 'red'
				}, {
					'border' : 'bold'
				});
				console.log("not match");
				$('#emdpass').html('Password not match').css({
					'color' : 'red'
				});

			}

		});

		$('#emEmail').on('keyup', function() {

			var reg_exp = /[a-z 0-9]+[@][a-z]+[.][a-z]+/;
			var email = $('#emEmail').val();

			if (reg_exp.test(email)) {
				$('#emEmail').css({
					'border-color' : 'green'
				});
			} else {
				$('#emEmail').css({
					'border-color' : 'red'
				});
			}
		});

		$('#emmobile').on('keyup', function() {

			var mobile = $('#emmobile').val();

			if (mobile.length <= 9) {

				$('#emmobile').css({
					'border-color' : 'red'
				}, {
					'border' : 'bold'
				});
				console.log("match");
				
			} else {
				$('#emmobile').css({
					'border-color' : 'green'
				}, {
					'border' : 'bold'
				});
				console.log("match");
				
			}

		});

		$('#emSubmit').on('click', function() {
			var firstName = $('#emFirstname').val();
			var lastName = $('#emLastname').val();
			var userName = $('#emUsername').val();
			var Gender = $('#emGn:checked').val();
			var Status = $('#emSt:checked').val();
			var Dob = $('#emDate').val();
			var FaHu = $('#emFaHu').val();
			var Address = $('#emAddress').val();
			var State = $('#emState').val();
			var Tahsil = $('#emTahsil').val();
			var District = $('#emDistrict').val();
			var City = $('#emCity').val();
			var Country = $('#emCountry').val();
			var Phone = $('#emPhone').val();
			var Mobile = $('#emmobile').val();
			var Email = $('#emEmail').val();
			var Password = $('#empass').val();
			var File = document.getElementById("fie").files[0];
			var sDob = Dob.split("-");
			Dob = sDob[2] + "/" + sDob[1] + "/" + sDob[0];
			

			var formData = new FormData();
			formData.append("username", userName);
			formData.append("firstname", firstName);
			formData.append("fie", File);
			formData.append("lastname", lastName);
			formData.append("gn", Gender);
			formData.append("st", Status);
			formData.append("date", Dob);
			formData.append("f_h", FaHu);
			formData.append("address", Address);
			formData.append("city", City);
			formData.append("state", State);
			formData.append("district", District);
			formData.append("country", Country);
			formData.append("phone", Phone);
			formData.append("mobile", Mobile);
			formData.append("email", Email);
			formData.append("password", Password);
			formData.append("tahsil", Tahsil);

			

			$.ajax({
				url : 'addemployee',
				type : "POST",
				data : formData,
				mimeType : "multipart/form-data",
				contentType : false,
				cache : false,
				processData : false,
				success : function(data) {

					alert(data);
				}
			});

		});

	});
   
   
   // view Location
  
   
   $(document).ready(function(){
	  
	   $('#searchLocation').on('click',function(){
		  
		   var id=$('#empId').val();
		   var date=$('#date').val();
		   var data="Id="+id+"&date="+date;
		   alert(data);
		   $.ajax({
			   url:'location',
			   type:'POST',
			   data:data,
			   success:function(result)
			   {
				   
				  
			   }
		   });
	   });
	   
   });

