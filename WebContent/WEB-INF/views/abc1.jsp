<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Automated Payroll</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="library/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="library/bootstrap/ajax/jquery.min.js"></script>
<script type="text/javascript" src="library/usermade/user.js"></script>
<link rel="stylesheet" type="text/css"
	href="library/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="library/usermade/user.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	 	$(document).ready(function() {
	 $("#sig").on('click', function() {
	 $(".r").css({
	 'display' : 'none'
	 });
	 $(".k").css({
	 'display' : 'inline-block'
	 });

	 });

	 $("#reg").on('click', function() {
	 $(".k").css({
	 'display' : 'none'
	 });
	 $(".r").css({
	 'display' : 'inline-block'
	 });

	 });
	 
	 	});


</script>

</head>
<body style="background-color: #000">
	<div class="cont container-fluid">

		<div class="row">
			<div class="col-lg-1 col-lg-offset-1 bb col-xs-2 bbbb"
				style="padding: 20px; margin-left: 11.5%">

				<div class="bar1 "></div>
				<div class="bar2"></div>
				<div class="bar3"></div>


			</div>

			<div class="col-lg-1 col-lg-offset-1 bb1 col-xs-2 bbbb1"
				style="padding: 20px; margin-left: 11.5%; display: none">

				<div class="bar1"></div>
				<div class="bar2"></div>
				<div class="bar3"></div>


			</div>
			<!--<div  class=" col-lg-offset-0 col-lg-2 col-sm-3 col-sm-offset-0 col-md-3 col-md-offset-0 col-xs-2 col-xs-offset-0"  >
			<img class="img-rounded img-respon sive rep" src="Image/_Payroll2.jpg" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);" >
		</div>-->
			<div class="col-lg-5 col-lg-offset-1 col-xs-5  col-sm-4 col-md-6">

				<h1 class="s">
					Automated Payroll<br> <span class="ss">with gps
						tracking and Image Capture</span>
				</h1>


			</div>
			<div class="col-lg-2 col-xs-2 Pbbbb" id="userImg" style="padding: 15px;font-size:40px;margin:10px 15px 0 20px;">
				<span class='glyphicon glyphicon-user'> ${username } </span> 


			</div>
			<div class="col-lg-2 col-xs-2 Pbbbb1" id="userImg1" style="padding: 15px;display:none;font-size:40px;margin:10px 15px 0 20px;">
				<span class='glyphicon glyphicon-user'> ${username } </span> 


			</div>

			<div class="  lis kd"
				style="border-radius: 5%; transition: 2s; background-image: url('http://creationmedia.in/wp-content/uploads/2015/03/More-Tumblr-Backgrounds-for-guys-light-gray.jpg'); position: absolute; top: 151px; z-index: 1; left: -400px; width: 26%; box-shadow: 0 6px 8px 0 rgba(0, 0, 0, 0.4), 0 6px 20px 0 rgba(0, 0, 0, 0.49) 0 6px 20px 0 rgba(0, 0, 0, 0.59);">
			
					<a href="home"><span class="btn btn-group-justified"
						style="font-weight: 600; font-size: 25px; color: black; text-align: left">Home</span></a>
					<a href="addemployee"><span class="btn btn-group-justified"
						style="font-weight: 600; font-size: 25px; color: black; text-align: left">Add
							Employee</span></a>
					<a href="checkemployee"><span class="btn btn-group-justified"
						style="font-weight: 600; font-size: 25px; color: black; text-align: left">Check
							All Employee</span></a>
					<a href="location"><span class="btn btn-group-justified"
						style="font-weight: 600; font-size: 25px; color: black; text-align: left">View
							location</span></a>
					<a href="checksalary"><span class="btn btn-group-justified"
						style="font-weight: 600; font-size: 25px; color: black; text-align: left">Check
							Salary</span></a>
					<a href="viewimage"><span class="btn btn-group-justified"
						style="font-weight: 600; font-size: 25px; color: black; text-align: left">View
							Image</span></a>
					<a href="changepassword"><span class="btn btn-group-justified"
						style="font-weight: 600; font-size: 25px; color: black; text-align: left">Change
							Password</span></span></a>
				

			</div>

			<div class="Plis  "
				style="border-radius: 5%; transition: 2s; background-image: url('http://creationmedia.in/wp-content/uploads/2015/03/More-Tumblr-Backgrounds-for-guys-light-gray.jpg'); position: absolute; top: 151px; z-index: 1; right: -400px; width: 26%; box-shadow: 0 6px 8px 0 rgba(0, 0, 0, 0.4), 0 6px 20px 0 rgba(0, 0, 0, 0.49) 0 6px 20px 0 rgba(0, 0, 0, 0.59);">


			
					<a href="home"><span class="btn btn-group-justified"
						style="font-weight: 600; font-size: 25px; color: black; text-align: left">Change
							Password</span></a>
					<a href="addemployee"><span class="btn btn-group-justified"
						style="font-weight: 600; font-size: 25px; color: black; text-align: left">Edit
							Profile</span></a>
					<a href=""><span type="submit" id="logout"
						class="btn btn-group-justified" name="logout"
						style="font-weight: 600; font-size: 25px; color: black; text-align: left">LogOut</span></a>

		
			</div>
		</div>
	</div>
	<script>
		function myFunction(x) {
			x.classList.toggle("change");
		}
	</script>



	<div class="container"
		style="min-height: 550px; background-image: url('https://static1.squarespace.com/static/5585b545e4b0731538e8a45a/t/55b56cd1e4b05bdbc9d323a7/1437953262290/coffee-computer.jpg?format=1500w'); border-radius: 2%;">