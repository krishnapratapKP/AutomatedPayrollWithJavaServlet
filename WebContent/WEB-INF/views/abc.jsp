<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
 	<title>Automated Payroll</title>
 
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="text/javascript" src="library/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="library/bootstrap/ajax/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="library/bootstrap/css/bootstrap.min.css">
	<script type="text/javascript"	src="library/usermade/user.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <script type="text/javascript">
//   	$(document).ready(function(){
//   		$("#sig").on('click',function(){
//   			$(".r").css({'display':'none'});
//   			$(".k").toggle();
  			
//   		});

//   		$("#reg").on('click',function(){
//   			$(".k").css({'display':'none'});
//   			$(".r").toggle();
  			
//   		});
//   	});
  </script>
	<style type="text/css">
		

		.r,.k{
			display: none;
		}
		.bar1,.bar2,.bar3{
			width: 40px;
			height: 5px;
			margin: 5px;
			transition: 0.2s;
			background-color: black;
		}
		.cont{
			/*display: inline-block;*/
			 background-color:  #faa;
			 top: fixed;
			max-height:160px;
			min-height: 50px;
			/*border: groove;*/
			padding: 10px 0 10px 0;
			margin:0px 5px 0px 5px;
			border-radius: 15%;

		}
        
        @media screen and (min-width: 992px) {
 		    .s {
  		     font-size:  40px;
  		     text-align: center;
        	margin-top: 5px
   			 }
   			 .ss{
        	font-size:  25px;
        	text-align: center;
         }
		}

		
     
        @media screen and (max-width: 992px) {
 		    .s{
        	font-size:  30px;
        	text-align: center;
        	margin-top: 16px
        	}
        	.ss{
        	font-size:  18px;
        	text-align: center;
      	  }
      	   h1{
      	  	font-size: 22px;
      	  }
		}

		@media screen and (max-width: 768px) {
 		    .s{
        	font-size:  25px;
        	text-align: center;
        	margin-top: 2px;
        	margin-right:4px;
        	}
        	.ss{
        	font-size:  14px;
        	

      	  }
      	  h1{
      	  	font-size: 18px;
      	  }
		}

		.bo{
			
			min-height: 200px;
			text-align:  center;
			margin-top: 5px
		}
		.bo1{
			
			min-height: 463px;
			text-align:  center;
			margin-top: 5px;
			margin-bottom: 5px;
		}
        /*.s{
        	font-size:  25px;
        	text-align: center;
        	margin-top: 20px
        }
        .ss{
        	font-size:  15px;
        	text-align: center;
        }
       */
		.change .bar1 {
    		-webkit-transform: rotate(-45deg) translate(-9px, 6px);
   			 transform: rotate(-45deg) translate(-9px, 6px);
		}

		.change .bar2 {opacity: 0;}

		.change .bar3 {
  		  -webkit-transform: rotate(45deg) translate(-8px, -8px);
  		  transform: rotate(45deg) translate(-8px, -8px);
		}
	</style>
</head>
<body style="background-color:#000">
	<div class="cont container-fluid" >
	  <div class="row">
       
		<div  class="col-lg-4 col-sm-3 col-sm-offset-2 col-md-3 col-md-offset-1 col-xs-4 col-xs-offset-1" >
			<img class="img-rounded img-responsive" src="library/Image/_Payroll1.jpg" width="250px" height="150px">
			
		</div>
		
		<div class="col-lg-5 col-xs-7 col-sm-6 col-md-6">

			<p class="s">Automated Payroll<br><span class="ss">with gps tracking and Image Capture</span></p>
		
        
		</div>
		</div>
	</div>
	<script>
		function myFunction(x) {
		    x.classList.toggle("change");
		}
	</script>

 	<div class="container" style="border:none;background-color: #C4C0CDFF; border-radius: 2%;">
