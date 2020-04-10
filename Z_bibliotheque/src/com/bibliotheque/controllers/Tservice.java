package com.bibliotheque.controllers;



import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.scolarite.services.ScolariteServiceStub.Info;
import com.scolarite.services.ScolariteServiceStub.Etudiant;
import com.scolarite.services.ScolariteServiceStub.Inscription;
import com.scolarite.services.ScolariteServiceStub.Est_inscrit;
import com.scolarite.services.ScolariteServiceStub.Est_inscritResponse;
import com.scolarite.services.ScolariteServiceStub.InfoResponse;
import com.scolarite.services.ScolariteServiceStub.Liste_Bloques;
import com.scolarite.services.ScolariteServiceStub.Liste_BloquesResponse;
import com.scolarite.services.ScolariteServiceStub.Liste_Fin_Etude;
import com.scolarite.services.ScolariteServiceStub.Liste_Fin_EtudeResponse;



import com.scolarite.services.ScolariteServiceCallbackHandler;
import com.scolarite.services.ScolariteServiceStub;


public class Tservice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Tservice() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		PrintWriter out = response.getWriter() ;

		ScolariteServiceStub stub = new ScolariteServiceStub();
		
		Est_inscrit inscrit = new Est_inscrit() ;	
		inscrit.setId_etudiant("17/02/070");
		out.println(stub.est_inscrit(inscrit).get_return()+"\n");
		
		Info info = new Info() ;
		info.setId_etudiant("17/02/070");
		Etudiant e1 = stub.info(info).get_return() ;
		
		out.println(e1.getId_etudiant() +" "+e1.getNom() + " " +e1.getInscription().getEtat_bloque());
		
		
		
		
		for(Etudiant e : stub.liste_Fin_Etude(new Liste_Fin_Etude()).get_return()) {
			
			out.println(e.getNom() + " " + e.getPrenom() );
			
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
			
		
	}

}
