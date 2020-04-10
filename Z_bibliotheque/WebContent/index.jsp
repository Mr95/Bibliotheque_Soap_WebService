<%@page import="com.bibliotheque.Models.Employe" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="com.bibliotheque.Config.OracleConnection" %>
<%@page import="com.bibliotheque.Models.Adherent" %>
<%@page import="com.scolarite.services.ScolariteServiceStub.Info" %>
<%@page import="com.scolarite.services.ScolariteServiceStub.Etudiant" %>
<%@page import="com.scolarite.services.ScolariteServiceStub.Inscription" %>
<%@page import="com.scolarite.services.ScolariteServiceStub.InfoResponse" %>
<%@page import="com.scolarite.services.ScolariteServiceStub.Liste_Bloques" %>
<%@page import="com.scolarite.services.ScolariteServiceStub.Liste_BloquesResponse" %>
<%@page import="com.scolarite.services.ScolariteServiceCallbackHandler" %>
<%@page import="com.scolarite.services.ScolariteServiceStub" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.bibliotheque.Config.DBInteraction" %>
<%@page import="com.scolarite.services.ScolariteServiceStub.Est_inscrit" %>
<%@page import="com.scolarite.services.ScolariteServiceStub.Est_inscritResponse" %>


<% if(request.getSession().getAttribute("employe") == null){ 

	response.sendRedirect("login.jsp ") ;

}else{%>


<!doctype html>
<html lang="en">

<head>
	<title>Adherer</title>
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



		
								<!----------------Le traitement de blocage---------------->
							
							
								<%		DBInteraction db = new DBInteraction() ;
															
										ArrayList<Adherent> list_adherent = new ArrayList<Adherent>() ;
										
										ArrayList<Etudiant> list_bloque = new ArrayList<Etudiant>() ;
										
										list_adherent = db.getAllAdherent() ;		
										
										ScolariteServiceStub stu = new ScolariteServiceStub();
										
										if( stu.liste_Bloques(new Liste_Bloques()).get_return() != null){
											
											for( Etudiant etu : stu.liste_Bloques(new Liste_Bloques()).get_return()) {
												
												list_bloque.add(etu) ;	
											}
										
											for(int i = 0 ; i < list_adherent.size() ; i++){			
												
												int k = 0 ;
											
												for(int j = 0 ; j <list_bloque.size() ; j++){
												
													if(list_adherent.get(i).getId_adherent().equals(list_bloque.get(j).getId_etudiant())){
																				
														k = 1 ; 
														break ;														
													}
													
													
												}
											
												if(k == 1 ){
													
												db.updateBloqueDroit(list_adherent.get(i).getId_adherent() ,"non");
													
													
												}else{
												
													
													Est_inscrit inscritt = new Est_inscrit() ;
													 inscritt.setId_etudiant(list_adherent.get(i).getId_adherent());
														
														if(stu.est_inscrit(inscritt).get_return()){
															
															db.updateBloqueDroit(list_adherent.get(i).getId_adherent() ,"oui");
															
														}else{
															//a
															db.updateBloqueDroit(list_adherent.get(i).getId_adherent() ,"non");
														}
												
												}
											}
											
											
										}else{
											
											Est_inscrit inscrit = new Est_inscrit() ;	
											
											
											
											for(int i = 0 ; i < list_adherent.size() ; i++){	
											
											  inscrit.setId_etudiant(list_adherent.get(i).getId_adherent());
												
												if(stu.est_inscrit(inscrit).get_return()){
													
													db.updateBloqueDroit(list_adherent.get(i).getId_adherent() ,"oui");
													
												}else{
													//a
													db.updateBloqueDroit(list_adherent.get(i).getId_adherent() ,"non");
												}
											
											}
											
											
										}
											
								
										
								%>
							

								<!-----------------Fin traitement de blocage--------------->		
							










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
						<li><a href="index.jsp" class="active"><i class="lnr lnr-home"></i> <span>Adherer</span></a></li>
						<li><a href="purger.jsp" class=""><i class="lnr lnr-code"></i> <span>Purger</span></a></li>
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
										<span class="icon"><i class="fa fa-"></i></span>
										<p>
											<span class="number">Operation Permettent d'adherer un etudiant a la bibliotheque de son Université</span>
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
		
		
							<%if(request.getAttribute("reponse") != null){
								
								String message = (String) request.getAttribute("reponse") ; %>
								
								<div class="alert bg-info" role="alert">
								<em class="fa fa-lg fa-warning">&nbsp;</em> 
								<% out.println(message) ; %> <a href="#" class="pull-right"><em class="fa fa-lg fa-close"></em></a></div>		
							
							<%  } %>
						
		
		
		
		
							<%if(request.getAttribute("message") != null){
								
								String message = (String) request.getAttribute("message") ; %>
								
								<div class="alert bg-info" role="alert">
								<em class="fa fa-lg fa-warning">&nbsp;</em> 
								<% out.println(message) ; %> <a href="#" class="pull-right"><em class="fa fa-lg fa-close"></em></a></div>		
							
							<%  } %>
			
		
		
		
									<form action="EmployController"  method="post">
									
									
										<div class="form-group">
    										<label for="id_carte">ID Carte</label>
    											<input type="text" class="form-control" id="id_carte" name="id_carte">
  										</div>
									
								
										 <input type="hidden" name="operation" value="verifadherer">
										 
										 <button type="submit" class="btn btn-primary col-md-4">Verifier</button>
									
									
									</form>
										
								
								</div>
								
							</div>
							
							
							<div class="row">
						
							<% if(request.getAttribute("adherentObj") != null){ 
							
							 Adherent a  = (Adherent) request.getAttribute("adherentObj") ;
											
							%>									
						
								<table class="table table-striped">
								    <thead>
								      <tr>
								        <th>ID Carte</th>
								        <th>Nom</th>
								        <th>Prenom</th>
								        <th>Droit</th>
								      </tr>
								    </thead>
								    
								    <tbody>
								      	  <tr>
								        	<td><% out.println(a.getId_adherent()) ; %></td>
								        	<td><% out.println(a.getNom() );%></td>
								        	<td><% out.println(a.getPrenom()); %></td>
								        	<td><% if(a.getDroit().equals("oui")){
								        	
								        				out.println("l'adherent a tout les droits") ;
								        		
								        			}else{
								        			
								        				out.println("pas de droit") ;
								        			
								        			} %></td>
								        	
								    	  </tr>
									     
		   							 </tbody>
  							   
  							   </table>
					
					<%} %>
						 		
						 
						   <% if(request.getAttribute("nonadherent") != null) { 
							
							   
							   String id_carte = (String) request.getAttribute("nonadherent") ;
							   
							   ScolariteServiceStub stub = new ScolariteServiceStub();
							   
							    Info info = new Info() ;
								info.setId_etudiant(id_carte);
								Etudiant e1 = stub.info(info).get_return() ;
								
								if(e1 != null && e1.getInscription().getEtat_bloque().equals("non")){ %>
							
	
								
								    	
		   						<form action="EmployController"  method="post">
									
									
										<div class="form-group">
    										<label for="id_carte">ID Carte</label>
    											<input type="text" class="form-control" id="id_carte" name="id_carte" value="<%out.println(e1.getId_etudiant());%>">
  										</div>
									
										<div class="form-group">
    										<label for="nom">Nom</label>
    											<input type="text" class="form-control" id="nom" name="nom" value="<%out.println(e1.getNom());%>">
  										</div>
										
								
										<div class="form-group">
    										<label for="prenom">Prenom</label>
    											<input type="text" class="form-control" id="prenom" name="prenom" value="<%out.println(e1.getPrenom());%>">
  										</div>
								
										 <input type="hidden" name="operation" value="adherer">
										 
										 <button type="submit" class="btn btn-primary col-md-12">Adherer</button>
									
									
									</form>
											
							
							
							
									
								
							<%  }else if(e1 == null || e1.getInscription().getEtat_bloque().equals("oui")){ %>
								
									<br><br>
								<div class="alert bg-info" role="alert">
								<em class="fa fa-lg fa-warning">&nbsp;</em> 
								Etudiant Non inscrit ou il a bloqué ses etudes <a href="#" class="pull-right"><em class="fa fa-lg fa-close"></em></a></div>	
						   
						   
						  <% }
							} %>
						   
						 		
						 		
						 		
						 			
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
	<div></div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="assets/scripts/klorofil-common.js"></script>
	<script>
	
		
	</script>
</body>

</html>
<% }%>