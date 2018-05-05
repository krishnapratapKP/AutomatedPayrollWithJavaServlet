<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="abc1.jsp"%>




<form name="form" enctype="multipart/form-data" method="post" action="">

	<div class="col-lg-4 col-lg-offset-4">
		<div class="panel panel-primary" style="background-color: rgba(0,0,0,.7);color:#fff;border-radius: 8%;margin-top: 20px">
			<div class="panel-heading" style="text-align: center;font-weight: bold;font-size: 20px;border-radius: 10%">
				<p>Check Salary</p>
			</div>
			<div class="panel-body">
		<div class="form-group ">
			<label for="emp_id">Employee Id</label>
			<input type="text" name="empId" id="empId" class="form-control">
		</div>
		<div class="form-group" id="old">
			<label for="old_password">Old Password</label>
			<input type="password" name="oldPassword" id="oldPass" class="form-control">
		</div>
		<div class="form-group" id="new" style="display: none">
			<label for="new_password">New Password</label>
			<input type="password" id="newPass" name="newPassword"  class="form-control">
		</div>
		<div class="form-group" style="text-align: center;margin-top: 5px">
			<input type="button" name="changePassword" id="check" value="Check Password" class="btn btn-md btn-danger">
			<input type="button" name="changePassword" id="change" value="Change Password" style="display: none" class="btn btn-md btn-success">
			<input type="reset" name="clear" value="Clear" id="clear" class="btn btn-md	 btn-warning">
		</div>
		<span id='success'></span>

	</div>
	</div>
		</div>
</form>
<%@ include file="xyz.jsp"%>