<%@page import="com.bibliotheque.Models.Employe" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="com.bibliotheque.Config.OracleConnection" %>


<% if(request.getSession().getAttribute("employe") == null){ 

	response.sendRedirect("login.jsp ") ;

}else{%>


<!doctype html>
<html lang="en">

<head>
	<title>Purger</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/vendor/linearicons/style.css">
	<link rel="stylesheet" href="assets/vendor/chartist/css/chartist-custom.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="assets/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="assets/css/demo.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
</head>

<body>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">Bibliotheque
				<a href="index.html"><!-- <img src="assets/img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo"> --></a>
			</div>
			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
				</div>
			
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						
						
					</ul>
				</div>
			</div>
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						<li><a href="index.jsp"><i class="lnr lnr-home"></i> <span>Adherer</span></a></li>
						<li class="active"><a href="purger.jsp" class=""><i class="lnr lnr-code"></i> <span>Purger</span></a></li>
						<li><a href="logout.jsp" class=""><i class="lnr lnr-cog"></i> <span>Deconexion</span></a></li>
						
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<!-- OVERVIEW -->
					<div class="panel panel-headline">
						<div class="panel-heading">
						
						
							<%
							
							Employe e = (Employe) request.getSession().getAttribute("employe") ;
							
							Connection con = OracleConnection.getconnect() ;
							
							PreparedStatement pstm = con.prepareStatement("select * from employe where id_employe = ?") ;
							
							pstm.setInt(1,e.getId_employe());
							
							ResultSet rs = pstm.executeQuery() ;
							
							if(rs.next()){
							
								e = new Employe(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
								
							}
							
							con.close() ;
							
							%>
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
							<h3 class="panel-title"><% out.println("Bonjour  " +  e.getNom() + " " + e.getPrenom()) ; %></h3>
							<p class="panel-subtitle"></p>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-12">
									<div class="metric">
										<span class="icon"><i class="fa fa-trash"></i></span>
										<p>
											<span class="number">Operation Permettent de Purger les etudiants ayant obtenu leurs Diplomes</span>
											<span class="title"></span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
								
								</div>
								
								
							</div>
							<div class="row">
								
								<div class="col-md-2">
								
								</div>
		
								<div class="col-md-9">
								
								
							<%if(request.getAttribute("purger") != null){
								
								String message = (String) request.getAttribute("purger") ; %>
								
								<div class="alert bg-info" role="alert">
								<em class="fa fa-lg fa-warning">&nbsp;</em> 
								<% out.println(message) ; %> <a href="#" class="pull-right"><em class="fa fa-lg fa-close"></em></a></div>		
							
							<%  } %>
							
		
									
		
		
									<form action="EmployController"  method="post">
									
										   
										 <input type="hidden" name="operation" value="purger">
										 
										 <button type="submit" class="btn btn-primary col-md-9">Purger</button>
									
									
									</form>
										
										
										
										
		
		
								
								
									
								
									
								</div>
								
							</div>
						</div>
					</div>
					<!-- END OVERVIEW -->
					
					
					
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->





		<div class="clearfix"></div>
		<footer>
			<div class="container-fluid">
				<p class="copyright">&copy; 2017 <a href="https://www.themeineed.com" target="_blank">Theme I Need</a>. All Rights Reserved.</p>
			</div>
		</footer>
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="assets/scripts/klorofil-common.js"></script>
	<script>
	$(function() {
		var data, options;

		// headline charts
		data = {
			labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
			series: [
				[23, 29, 24, 40, 25, 24, 35],
				[14, 25, 18, 34, 29, 38, 44],
			]
		};

		options = {
			height: 300,
			showArea: true,
			showLine: false,
			showPoint: false,
			fullWidth: true,
			axisX: {
				showGrid: false
			},
			lineSmooth: false,
		};

		

	</script>
</body>

</html>



<% } %>