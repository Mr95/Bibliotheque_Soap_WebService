package com.bibliotheque.Config;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List ;

import com.bibliotheque.Models.Adherent;
import com.bibliotheque.Models.Employe;



public class DBInteraction {
	
	private Connection con = null ;
	
	private Statement st = null; 
	
	private PreparedStatement pstm = null ;
	
	private ResultSet rs =null ;
	
	
	public Employe authentifierEmploye(String email , String password) throws SQLException {
		
		con = OracleConnection.getconnect() ;
				
	    Employe employe = null ;
			
					pstm = con.prepareStatement("select * from employe where email = ? and password = ?") ;
				
					pstm.setString(1, email);
					
					pstm.setString(2, password);
					
					rs = pstm.executeQuery() ;
				
					if(rs.next()) {
						
						employe = new Employe(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)) ;
						
					}
					
					con.close();
				
		
		return employe ;
		
	}
	
	
	
	public Adherent verifierLocalement(String id_carte) {
		
		con = OracleConnection.getconnect() ;
		
		Adherent adherent = null ;
		
		try {
		
			pstm = con.prepareStatement("select * from adherent where id_adherent = ?") ;
		
			pstm.setString(1,id_carte);
			
			rs = pstm.executeQuery() ;
		
			if(rs.next()) {
				
			 adherent = new Adherent();
			 adherent.setId_adherent(rs.getString(1));
			 adherent.setNom(rs.getString(2));
			 adherent.setPrenom(rs.getString(3));
			 adherent.setDroit(rs.getString(4)) ;
			 
			}
			
		} catch (SQLException e) {	e.printStackTrace(); }
		
		
		return adherent ;
	
	}
	
	
	
	public int adherer(String id_carte , String nom , String prenom) throws SQLException {
		
	
		con = OracleConnection.getconnect() ;
		
		pstm = con.prepareStatement("insert into ADHERENT values(?,?,?,?)") ;
		pstm.setString(1,id_carte);
		pstm.setString(2,nom);
		pstm.setString(3,prenom);
		pstm.setString(4,"oui");
		
		int i =  pstm.executeUpdate() ; 
		
		return i ;
	
	}
	
	
	
	
	 public ArrayList<Adherent> getAllAdherent(){
		 
	   ArrayList<Adherent> list_adherent = new ArrayList<Adherent>() ;
		 
		 con = OracleConnection.getconnect() ;
		 
		 try {
			 
			st = con.createStatement() ;
			rs = st.executeQuery("select * from adherent") ;
	
			while(rs.next()) {
			
				Adherent a = new Adherent() ;
				a.setId_adherent(rs.getString(1));
				a.setNom(rs.getString(2));
				a.setPrenom(rs.getString(3));
				a.setDroit(rs.getString(4));

				list_adherent.add(a) ;
				
			}
			
			con.close();	
		 
		 } catch (SQLException e) {	e.printStackTrace();}
		 
		 
		 return list_adherent ;
	 }
	

	 public void updateBloqueDroit(String id_adherent , String droit) {
		 
		 con = OracleConnection.getconnect() ;
		 
		 try {
			pstm = con.prepareStatement("update adherent set droit = ? where id_adherent = ?") ;
	
		 pstm.setString(1, droit);
		 pstm.setString(2, id_adherent);
		 pstm.executeUpdate() ;
		 
		 con.close() ;
			
		 } catch (SQLException e) {	e.printStackTrace();}	
		 
	 }
	 
	
	 
	 
	public void Purger(Adherent a) {
	
		con = OracleConnection.getconnect() ;
		
		try {
			pstm = con.prepareStatement("delete from adherent where id_adherent = ?") ;
			pstm.setString(1,a.getId_adherent());
		
			pstm.executeUpdate() ;
		
		} catch (SQLException e) {e.printStackTrace();	}
	
		
	}
	
	
	
	

}