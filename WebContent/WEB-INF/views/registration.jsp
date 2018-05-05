<script type="text/javascript">
	$(document).ready(function() {
		$('#repass').on('keyup', function() {

			var pass = $('#rpass').val();
			var repass = $('#repass').val();
			if (pass == repass) {

				$('#repass').css({
					'border-color' : 'green'
				}, {
					'border' : 'bold'
				});
				console.log("match");
				$('#dpass').html('Password match').css({
					'color' : 'green'
				});
			} else {
				$('#repass').css({
					'border-color' : 'red'
				}, {
					'border' : 'bold'
				});
				console.log("not match");
				$('#dpass').html('Password not match').css({
					'color' : 'red'
				});
			}

		});

		$('#mobile').on('keyup', function() {

			var mobile = $('#mobile').val();
			var rge=/[a-z A-Z]/;
   
			 
			 
			if (mobile.length <= 9 || rge.test(mobile)) {

				$('#mobile').css({
					'border-color' : 'red'
				}, {
					'border' : 'bold'
				});
				console.log("match");
				$('#dmob').html('Number is invalid').css({
					'color' : 'red'
				});
			} else {
				$('#mobile').css({
					'border-color' : 'green'
				}, {
					'border' : 'bold'
				});
				console.log("match");
				$('#dmob').html('Number is valid').css({
					'color' : 'green'
				});
			}

		});

		$('#ruser').on('keyup', function() {

			var user = $('#ruser').val();
			var data = "username=" + user + "&uvalidation";

			$.ajax({
				type : 'GET',
				url : 'registration',
				data : data,
				success : function(result) {
					
					
                           alert(${user});
					if (result == 'yes') {

						$('#duser').html('Username is already exist').css({
							'color' : 'red'
						});
					} else {

						$('#duser').html('Username is valid').css({
							'color' : 'green'
						});
					}
				}
			});

		});

	});

	$(document).ready(
			function() {

				$('#rbtn').on(
						'click',
						function() {

							var username = $('#ruser').val();
							var password = $('#rpass').val();
							var mobile = $('#mobile').val();
							var position = $('#position').val();
							var address = $('#address').val();
							var city = $('#city').val();
							var state = $('#state').val();
							var country = $('#country').val();
							var data = "username=" + username + "&password="
									+ password + "&mobile=" + mobile
									+ "&position=" + position + "&address="
									+ address + "&city=" + city + "&state="
									+ state + "&country=" + country
									+ "&registration";

							alert(form);

							$.ajax({

								type : 'POST',
								url : 'reg_emp.php',
								data : data,
								success : function(data) {
									alert(data);
								}
							});

						});

			});
</script>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div
	class="col-lg-4 col-lg-offset-4 bo1 col-xs-8  col-xs-offset-2 col-sm-6  col-sm-offset-3 r">
	<div class="panel panel-primary  "
		style="margin-top: 60px; background-color: #fffff2;">

		<div class="panel-heading">
			<p style="text-align: center; font-weight: bold; font-size: 30px">Registration</p>
		</div>
		<div class="panel-body">
			<form name="form" method="post" action="registration">
				<div class="form-group">
					<input type="text" name="username" id="ruser" class="form-control"
						placeholder="Username"> <span id='duser'></span>
				</div>
				<div class="form-group">
					<input type="password" id="rpass" name="password"
						class="form-control" placeholder="password">
				</div>
				<div class="form-group">
					<input type="password" id="repass" name="repassword"
						class="form-control" placeholder="Repassword"> <span
						id="dpass"></span>
				</div>
				<div class="form-group">
					<input type="tel" name="mobile" id="mobile" maxlength="10"
						class="form-control" placeholder="Mobile Number"> <span
						id="dmob"></span>
				</div>
				<div class="form-group">
					<input type="password" name="cmpcode" class="form-control"
						placeholder="Company Code">
				</div>
				<div class="form-group">
					<input type="text" name="postion" id="position"
						class="form-control" placeholder="Postion">
				</div>
				<div class="form-group">
					<input type="text" name="address" id="address" class="form-control"
						placeholder="Address">
				</div>
				<div class="form-group">
					<input type="text" name="city" id="city" class="form-control"
						placeholder="City">
				</div>
				<div class="form-group">
					<input type="text" name="state" id="state" class="form-control"
						placeholder="State">
				</div>
				<div class="form-group">
					<input type="text" name="country" id="country" class="form-control"
						placeholder="Country">
				</div>
				<div>
					<input type="submit" name="registration" value="Sumbit"
						class="btn-primary">
				</div>

			</form>

		</div>

	</div>
</div>
