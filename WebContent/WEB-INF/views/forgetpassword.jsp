
<%@ include file="abc.jsp"%>


<form name="form" enctype="multipart/form-data" method="post" action="">

	<div class="col-lg-4 col-lg-offset-4">
		<div class="panel panel-primary" style="background-color: rgba(0,0,0,.7);color:#fff;border-radius: 8%;margin-top: 20px">
			<div class="panel-heading" style="text-align: center;font-weight: bold;font-size: 20px;border-radius: 10%">
				<p>Forget Password</p>
			</div>
			<div class="panel-body">
		<div class="form-group " id="em">
			<label for="empEmail">Employee Email</label>
			<input type="text" name="empEmail" id="email" class="form-control">
		</div>
		
		<div class="form-group" id="new" style="display: none">
			<label for="newpassword">New Password</label>
			<input type="password" id="newfPass" name="newPassword"  class="form-control">
		</div>
		<div class="form-group" id="enew" style="display: none">
			<label for="new_password">Retype Password</label>
			<input type="password" id="newRePass" name="new_Password"  class="form-control">
		</div>
		<div class="form-group" style="text-align: center;margin-top: 5px">
			<input type="button" name="emailCheck" id="emailCheck" value="Check Email" class="btn btn-md btn-danger">
			<input type="button" name="changePassword" id="changePass" value="Change Password" style="display: none" class="btn btn-md btn-success">
			<input type="reset" name="clear" value="Clear" id="clear" class="btn btn-md	 btn-warning">
		</div>
		<span id='success'></span>

	</div>
	</div>
		</div>
</form>


<%@ include file="xyz.jsp" %>