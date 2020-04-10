package com.bibliotheque.Config;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.bibliotheque.Models.Adherent;
import com.scolarite.services.ScolariteServiceStub.Etudiant;



public class main {

	public static void main(String[] args) throws SQLException {
		

		
		
		ArrayList<Adherent> list_adherent = new ArrayList<Adherent>() ;
		
		list_adherent.add(new Adherent("1","","","","","oui"));
		list_adherent.add(new Adherent("2","","","","","oui"));
		list_adherent.add(new Adherent("3","","","","","oui"));
		list_adherent.add(new Adherent("4","","","","","oui"));
		list_adherent.add(new Adherent("5","","","","","non"));
		
		ArrayList<Etudiant> list_bloque = new ArrayList<Etudiant>() ;
		
		Etudiant e1 = new Etudiant() ;
		e1.setId_etudiant("2") ;
		list_bloque.add(e1);
		
		Etudiant e2 = new Etudiant() ;
		e2.setId_etudiant("4") ;
		list_bloque.add(e2);
			
			
			for(int i = 0 ; i < list_adherent.size() ; i++){			
				
				int k = 0 ;
			
				for(int j = 0 ; j <list_bloque.size() ; j++){
				
					if(list_adherent.get(i).getId_adherent().equals(list_bloque.get(j).getId_etudiant())){
												
						k = 1 ; 
						break ;														
					}
					
					
				}
			
				if(k == 1 ){
					
					System.out.println("droit devient non " + list_adherent.get(i).getId_adherent());
					
					
				}else{
					
					System.out.println("droit devient oui " + list_adherent.get(i).getId_adherent());
					
					
				}
					
				
			}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
			

		
	}

}
