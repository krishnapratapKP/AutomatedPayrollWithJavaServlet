<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="abc1.jsp" %>


<div class="col-lg-5 col-lg-offset-1" id="info" style="margin-top: 8px;display: none;color: white;">
	<table class="table-bordered">
		<tr ><td colspan="2" style="background-color: black"><h2 style="text-align: center;">Employee Detail</h2></td></tr>
		<tr><td><span id="noinfo"></span></td></tr>
        <tr >
        	<td rowspan="4"><span id="imtr"></span></td>
        </tr>
        <tr>
        	<td>Employee Id<span id="viewId"></span></td>
        </tr>
        <tr>
        	<td>Employee Name:<span id="viewName"></span></td>
        </tr>
        <tr>
        	<td>Date :<span id="viewda"></span></td>
        </tr>
		
	</table>
</div>
<form name="form" enctype="multipart/form-data" method="POST" action="#">

	<div class="col-lg-3 col-lg-offset-4" style="float: right;margin-top: 8px;margin-right: 20px;">
		<div class="panel panel-primary" style="background-color: rgba(0,0,0,.7);color:#fff;border-radius: 8%;">
			<div class="panel-heading" style="border-radius: 10%">
				<p style="font-size: 20px; text-align: center; font-family: georgia;">View Image</p>
			</div>
			<div class="panel-body">
				<div class="form-group ">
					<label for="emp_id">Employee Id</label>
					<input type="text" name="empId" id="viewEmpId" style="color: black" placholder="Employee Id" class="form-control">
				</div>
			<div class="form-group ">
				<label for="date">Date </label>
				<input type="date" name="date" id="viewDate" class="form-control">
			</div>
			<div class="form-group" style="text-align: center;  font-family: georgia;font-size: 20px">
				<input type="button" id="viewButton" name="checkImage" value="Check Image" class="btn btn-md btn-success">
				<input type="reset" name="clear" value="Clear" class="btn btn-md	 btn-warning">
			</div>

		</div>
		</div>
	</div>
</form>

<%@ include file="xyz.jsp" %>