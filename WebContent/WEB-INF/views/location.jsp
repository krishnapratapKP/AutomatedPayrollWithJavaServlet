<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="java.io.PrintWriter" %>
<%@ include file="abc1.jsp" %>

 <div class="col-lg-8">
 	
 	
 </div>
 <div class="col-lg-4 ">
 		<form name="form" enctype="multipart/form-data"  method="get" action="#">
 			<div class="panel panel-primary" style="background-color: rgba(0,0,0,.7);color:#fff;border-radius: 8%;margin-top: 20px">


				<p class="panel-heading" style="text-align: center;font-weight: bold;font-size: 20px;border-radius: 10%"> Search Employee Location Detail</p>
				<div class="panel-body">
        			<div class="form-group">
 						
 									<div class="form-group">
 										<label for="emp_id"> Employee Id:</label>
 									
 										<input type="text" name="emp_id" id="empId" class="form-control">
 									</div>
 								
 									<div class="form-group">
 										<label for="emp_date">Date :</label>
 									
 										<input type="date" name="emp_date" id="date" class="form-control">
 										</div>
 								<div class=form-group>
 									<input type="submit" style="color:black" class="btn btn-success" name="search" id="searchLocation" value="Search">
 							</div>	
 							
 					</div>
 				</div>
 			</div>
 		
	 	</form>
 	</div>
    <input type="hidden" class="hidden" id="res">
    
    <span  id="KP"></span>
	<div class="row">
		<div class="col-lg-12 " id="googleMap" style="border: 1px red solid; height: 550px;border-radius: 2%;margin: 2px;padding: 2px">
		
	<%-- 	<script>
		<%   HttpSession o=request.getSession(false);%>
		
		var data='<%=o.getAttribute("string")%>';
		//var flightPlanCoordinates=new Array(plan);
		alert("data"+data);
		var resultArray = JSON.parse(data);
		var flightPlanCoordinates = [];
		for (var i=0; i<resultArray.length; i++) {
			flightPlanCoordinates[i] =new google.maps.LatLng(resultArray[i].lat, resultArray[i].lng);
		}
		
		    alert(flightPlanCoordinates);
		</script> --%>
			<script>
			<%   HttpSession oo=request.getSession(false);%>
			
			var data='<%=oo.getAttribute("string")%>';
			var resultArray = JSON.parse(data);
<%-- 			<%   HttpSession o=request.getSession(false);%> --%>
<%-- 			var data='<%=o.getAttribute("string")%>'; --%>
			
				function myMap() {
				
				
				
				//var flightPlanCoordinates=new Array(plan);
				
				
				var flightPlanCoordinates = [];
				for (var i=0; i<resultArray.length; i++) {
					flightPlanCoordinates[i] =new google.maps.LatLng(resultArray[i].lat, resultArray[i].lng);
				}
				
				var lglt=new google.maps.LatLng(resultArray[1].lat,resultArray[1].lng);
				
					var mapProp= {
    					center:lglt,
    					zoom:13,
					};
					var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);

					//var flightPlanCoordinates =$('#res').val();
					
					alert(flightPlanCoordinates);
        var flightPath = new google.maps.Polyline({
          path: flightPlanCoordinates,
          geodesic: true,
          strokeColor: '#FF0000',
          strokeOpacity: 1.0,
          strokeWeight: 5
        });

       flightPath.setMap(map);
      }
				
			</script>
  			<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBIbymudRAW7AZ7EgRdhX9HMoWo7dyI0-k&callback=myMap"></script>
		</div>
	</div>

 <%@ include file="xyz.jsp" %>