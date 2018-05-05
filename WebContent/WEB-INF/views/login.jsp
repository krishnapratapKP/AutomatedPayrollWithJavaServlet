<script type="text/javascript">
	
	$(document).ready(function(){
		$('#lbtn').on('click',function(){

			var user=$('#luser').val();
			var pass=$('#lpass').val();
			
			var ddata="username="+user+"&password="+pass+"&login";
			

			$.ajax({

				type:'POST',
				url :'login',
				data: ddata,
				success:function(result){
					alert(result);
					if(result=="success")
					{
						window.location="home";
					}
					else
					{
						alert("else");
					}
				}

			});
		});
	});

</script>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<div class="col-lg-4 col-lg-offset-4 bo1 col-xs-8  col-xs-offset-2 col-sm-6  col-sm-offset-3 k"  >
    	
			<div class="panel panel-primary l " style="margin-top: 60px;background-color:  #fffff2;">
				
						<p class="panel-heading"  style="text-align: center;font-weight: bold;font-size: 20px">Login</p>
				
				<div class="panel-body">
					
					<form name="form"  method="post" action="login">
						<div class="form-group">
							<input type="text" name="username" id="luser" class="form-control" placeholder="Username">		
						</div>
						<div class="form-group">
							<input type="password" name="password" id="lpass" class="form-control" placeholder="password">
						</div>
						<div class="form-group">
							<label style="text-align:  left">Position</label>
			              	 <select name="position" >
								 <option>Admin</option>
								 <option>HR</option>
			 					 </select>
						 </div>
						<div>
							<input type="button" name="login" id="lbtn" value="Submit" class="btn-primary">
						</div>
						
						
					
						</form>
				</div>
        
		</div>
	
	</div> 