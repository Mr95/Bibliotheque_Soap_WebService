package com.bibliotheque.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bibliotheque.Config.DBInteraction;
import com.bibliotheque.Models.Adherent;
import com.scolarite.services.ScolariteServiceStub;
import com.scolarite.services.ScolariteServiceStub.Etudiant;
import com.scolarite.services.ScolariteServiceStub.Liste_Fin_Etude;


public class EmployController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
    public EmployController() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		PrintWriter out  = response.getWriter() ;
		
		DBInteraction db = new DBInteraction();
		
		List<Adherent> list_adherent_fin_etude  = new ArrayList<Adherent> () ;
		
		List<Adherent> list_adherent_bloque_etude = new ArrayList<Adherent>();
		
		
		
			String operation = request.getParameter("operation") ;
		
			
			
				if(operation.equals("verifadherer")) {
					
									
					String id_carte = request.getParameter("id_carte") ;
					
					if(Pattern.matches("^(\\d+\\/\\d+\\/\\d+)?$",id_carte)) {
						
						
						 Adherent adherent = null ;
						
					     adherent = db.verifierLocalement(id_carte) ;
						
					   if(adherent != null ) {
						  
						   request.setAttribute("adherentObj",adherent);
						   request.setAttribute("message", "Etudiant deja Adherent");
						   request.getRequestDispatcher("index.jsp").forward(request, response);
						  
						   
					   }else {
						   request.setAttribute("message", "Etudiant Non Adherent");
						   request.setAttribute("nonadherent",id_carte);
						   request.getRequestDispatcher("index.jsp").forward(request, response);
						   
					   }
					   
					 	
						
					}else {
					
						   request.setAttribute("message", "Identifiant invalid");
						   request.getRequestDispatcher("index.jsp").forward(request, response);
						
					}
					
					
					
					
					
				}else if(operation.equals("adherer")) {
				
					
					String id_carte = request.getParameter("id_carte") ;
					
					String nom = request.getParameter("nom") ;
					
					String prenom = request.getParameter("prenom") ;
					
					int i = 0 ;
					
					try {
						
					 i =	db.adherer(id_carte, nom, prenom) ;
			
					} catch (SQLException e) {	e.printStackTrace(); }
					
					
					if( i == 1) {
						
						request.setAttribute("reponse","etudiant bien Adheré");
						request.getRequestDispatcher("index.jsp").forward(request, response);
						
					}else {
						request.setAttribute("reponse","erreur survenu");
						request.getRequestDispatcher("index.jsp").forward(request, response);
						
					}
					
					
					
					
				
				}else if(operation.equals("purger")) {
					
								
					
					ScolariteServiceStub stub = new ScolariteServiceStub();
					
					if(stub.liste_Fin_Etude(new Liste_Fin_Etude()).get_return() != null) {
						
					for(Etudiant e : stub.liste_Fin_Etude(new Liste_Fin_Etude()).get_return()) {
						
											 
						Adherent a = new Adherent() ;
						a.setId_adherent(e.getId_etudiant());
						a.setNom(e.getNom());
						a.setPrenom(e.getPrenom());
						a.setEmail(e.getEmail()) ;
						a.setTelephone(e.getNumtelephone()) ;
						
						list_adherent_fin_etude.add(a) ;
						
					}
					
						
					for(int i = 0 ; i < list_adherent_fin_etude.size() ; i++) {
						
						db.Purger(list_adherent_fin_etude.get(i));
						
					}
					
					
					request.setAttribute("purger","Liste des etudiant diplomé purgé");
					request.getRequestDispatcher("purger.jsp").forward(request, response);
					
				
				}else {
					
					request.setAttribute("purger","Liste vide");
					request.getRequestDispatcher("purger.jsp").forward(request, response);
					
				}
				
		
		
		
		
		
		
		
				}
		
		
		
	}

}