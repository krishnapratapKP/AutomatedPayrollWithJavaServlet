<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="abc1.jsp" %>


 <div class="col-lg-5 col-md-8 col-sm-8 col-sm-offset-2 " style="backgroud-color:#fff" id="check">
 
  
 
   <!-- <h1>Employee Salary Detail</h1>
    <div class="form-group">
        <label>EmpId</label>
        <input type="text" readonly id="empId" class="form-control">
    
    </div>
     <div class="form-group">
        <label>Number of Days</label>
        <input type="text" readonly id="nuberofDays" class="form-control">
    
    </div>
     <div class="form-group">
        <label>Salary</label>
        <input type="text" readonly id="salary" class="form-control">
    
    </div>
    <div>		
        <input type="reset"  class="btn " value="Clear">
    </div> -->
    
 	<span id="kp"></span>
 </div>
 
 

<div class="col-lg-3  col-md-8 col-sm-8 col-sm-offset-2 ">
	<form name="form"  action="" >
		<div class="panel panel-primary">
			<div class="panel-heading">
				<p>Check Salary</p>
			</div>
			<div class="panel-body">
				<div class="form-group">
					<label for="emp_id">Employee Id</label>
					<input type="text" id="sId" name="emp_id" placeholder="emp_id" class="form-control">
				</div>
				<div class="form-group">
					<label for="inmonth"> Month</label>
					<label>From</label>
					<input type="date" id="fdate" name="frommonth" class="form-control">
					<label>To</label>
					<input type="date" id="tdate" name="tomonth" class="form-control">
				</div>
				<div class="form-group">
					<label for="pypday">Pay Per Day</label>
					<input type="text" id="sPay" name="pypday" class="form-control">
				</div>
				<div class="form-group">
					<input type="button" id="sButton" class="btn btn-danger" name="search" value="Check Salary">
				</div>
			</div>
		</div>

	</form>
</div>


<%@ include file="xyz.jsp" %>