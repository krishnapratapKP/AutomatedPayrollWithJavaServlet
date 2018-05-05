<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="abc1.jsp"%>

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	function submit_id() {
		document.form.submit();
	}

	/*
		   $(document).ready(function() {
		   	   $("#form").on('submit',function(){
		   	   	var image=$("#fie").val();
		   	   	alert(image);

		   	   	var datastring='f='+image;
		   	   	$.ajax({

		   	   		type:"POST",
		   	   		url:"imageupload.php",
		   	   		data:new FormData(this),
		   	   		cache:false,
		   	   		success:function(data){
		   	   			alert(result);
		   	   		}
		   	   	});
		   	    var k="<?php $fileNewName=$_SESSION['file'];
   	   	   		         echo $fileNewName; ?>";
		   	    	
	             alert(k);
		   	   		  
		   	   		$('#profile').attr("src",k);
		   	   	})
		   	   
		   	 

		   });

	 */

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
	/*
	 $(document).ready(function(e){

	 $("#form1").on('submit',(function(e){
	 e.preventDefault();

	 $.ajax({
	 url:"imageupload.php",
	 type="POST",
	 data: new FormData(this),
	 contentType: false,
	 cache: false,
	 processData: false,
	 success : function(data)
	 {
	 alert(data);
	 }
	 });
	 }));

	
	 });*/
</script>

 <script type="text/javascript">
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
				//$('#dmob').html('Number is less than 10').css({'color':'red'});
			} else {
				$('#emmobile').css({
					'border-color' : 'green'
				}, {
					'border' : 'bold'
				});
				console.log("match");
				//$('#dmob').html('Number is valid').css({'color':'green'});
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
			alert(Dob);

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

			alert(form);

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
</script>
<form name="form" enctype="multipart/form-data" id="form1"
	action="addemployee" method="post">
	<div class="col-lg-10 col-lg-offset-1">
		<div class="panel panel-primary"
			style="background-color: rgba(0, 0, 0, .7); color: #fff; font-size: 20px; margin-top: 20px; border-radius: 5%;">
			<div class="panel-heading" style="border-radius: 10%;">Add
				Employee</div>
			<div class="panel-body">
				<table class="table">

					<tr>
						<td colspan="2">
							<div
								style="display: block; position: relative; margin-left: auto; margin-right: auto; width: 50%; height: auto;">
								<img src="library/Image/defaultProfile.jpg" alt="kp" id="profile"
									name="k"
									style="border-radius: 50%; width: 50%; margin-left: 25%; margin-right: 50%;">

								<input type="file"
									style="opacity: 0.1; width: 50%; margin-left: 25%; margin-right: 50%;"
									name="fie" id="fie" onchange="previewFile()"></input>

							</div>


						</td>
					</tr>
					<tr>

						<td>
							<div class="form-group">
								<label for="username">Username</label> <input type="text"
									id="emUsername" class="form-control" name="username"
									placeholder="Username" />
							</div>
							<div class="form-group">
								<label for="gn">Gender</label><br> <input type="radio"
									id="emGn" name="gn" value="Male"> <label>Male</label> <input
									type="radio" id="emGn" name="gn" style="margin-left: 10%"
									value="Female"> <label>Female</label>
							</div>
							<div class="form-group">
								<label for="date">Date of Birth</label> <input type="date"
									id="emDate" class="form-control" name="date">
							</div>
							<div class="form-group">
								<label for="state">State</label> <input type="text" id="emState"
									class="form-control" name="state">
							</div>
							<div class="form-group">
								<label for="tahsil">Tahsil</label> <input type="text"
									id="emTahsil" class="form-control" name="tahsil">
							</div>
							<div class="form-group">
								<label for="city">Villag/Town/City</label> <input type="text"
									id="emCity" class="form-control" name="city">
							</div>
							<div class="form-group">
								<label for="country">Country</label> <input type="text"
									id="emCountry" placeholder="country" class="form-control"
									name="country">
							</div>
							<div class="form-group">
								<label for="mobile">Mobile No.</label> <input type="tel"
									class="form-control" id="emmobile" maxlength="10" name="mobile">
								<span id="emdmob"></span>
							</div>
							<div class="form-group">
								<label for="password">Password</label> <input type="password"
									id="empass" class="form-control" name="password">
							</div>


						</td>
						<td>
							<div class="form-group">
								<label for="firstname">First Name</label> <input type="text"
									id="emFirstname" class="form-control" name="firstname"
									placeholder="First Name" />
							</div>
							<div class="form-group">
								<label for="lastname">Last Name</label> <input type="text"
									id="emLastname" name="lastname" class="form-control"
									placeholder="Last Name" />
							</div>
							<div class="form-group">
								<label for="st"> Status</label><br> <input type="radio"
									id="emSt" name="st" value="Married"> <label>Married</label>
								<input type="radio" id="emSt" name="st" style="margin-left: 10%"
									value="Unmarried"> <label>Unmarried</label>
							</div>
							<div class="form-group">
								<label for="f_h">Father/Husband's Name</label> <input
									type="text" id="emFaHu" class="form-control"
									placeholder="Father/Husband's Name" name="f_h">
							</div>
							<div class="form-group">
								<label for="address">Address</label> <input type="text"
									id="emAddress" class="form-control" name="address">
							</div>
							<div class="form-group">
								<label for="district">District</label> <input type="text"
									id="emDistrict" class="form-control" name="district">
							</div>
							<div class="form-group">
								<label for="phone">Phone No</label> <input type="text"
									id="emPhone" class="form-control" name="phone">
							</div>
							<div class="form-group">
								<label for="email">Email</label> <input type="text" id="emEmail"
									class="form-control" name="email">

							</div>
							<div class="form-group">
								<label for="rePassword">Re-password</label> <input
									type="password" id="emrepass" class="form-control"
									name="rePassword"> <span id="emdpass"></span>
							</div>

						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div style="text-align: center;">
								<input type="button" id="emSubmit" value="Submit" name="submit"
									class="btn btn-lg btn-primary"> <input type="reset"
									name="clear" value="Clear" class="btn btn-lg btn-primary">
							</div>
						</td>
					</tr>

				</table>


			</div>
		</div>
	</div>
</form>


<%@ include file="xyz.jsp"%>
