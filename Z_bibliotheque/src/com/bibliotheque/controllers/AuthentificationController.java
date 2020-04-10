package com.bibliotheque.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bibliotheque.Config.DBInteraction;
import com.bibliotheque.Models.Employe;

public class AuthentificationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AuthentificationController() {
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		PrintWriter out = response.getWriter() ;
		
		DBInteraction db = new DBInteraction();
	
		Employe employe = null ;
	
	

		
		
		String email = request.getParameter("email") ;
		String password = request.getParameter("password") ;		
		
			/*out.println(email + " " + password);*/
	
		
		   if(email.isEmpty()) {
				
			   	request.setAttribute("failed","champ vide");
				request.getRequestDispatcher("login.jsp").forward(request, response);

				
			}else if(password.isEmpty()) {
			
				request.setAttribute("failed","champ vide");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			
			}else{
				
			
				try {
					employe = db.authentifierEmploye(email, password) ;
				} catch (SQLException e) {e.printStackTrace();}
				
				
				
				if(employe != null) {
					
					request.getSession().setAttribute("employe",employe);
					
					request.getRequestDispatcher("index.jsp").forward(request, response);
					
				}else{
					
					
					request.setAttribute("failed","employe introuvable");
					request.getRequestDispatcher("login.jsp").forward(request, response);
					
					
				}
						
				
			}
		
		
			
	}

}