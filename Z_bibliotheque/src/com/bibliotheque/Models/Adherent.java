package com.bibliotheque.Models;



public class Adherent {
	
	
	private String id_adherent ;
	
	private String nom ;
	
	private String prenom ;
	
	private String email ;
	
	private String telephone ;
	
	private String droit ;
	
	
		public Adherent() {
			
			
		}



		public Adherent(String id_adherent, String nom, String prenom, String email, String telephone, String droit) {
			super();
			this.id_adherent = id_adherent;
			this.nom = nom;
			this.prenom = prenom;
			this.email = email;
			this.telephone = telephone;
			this.droit = droit;
		}



		public String getId_adherent() {
			return id_adherent;
		}



		public void setId_adherent(String id_adherent) {
			this.id_adherent = id_adherent;
		}



		public String getNom() {
			return nom;
		}



		public void setNom(String nom) {
			this.nom = nom;
		}



		public String getPrenom() {
			return prenom;
		}



		public void setPrenom(String prenom) {
			this.prenom = prenom;
		}



		public String getEmail() {
			return email;
		}



		public void setEmail(String email) {
			this.email = email;
		}



		public String getTelephone() {
			return telephone;
		}



		public void setTelephone(String telephone) {
			this.telephone = telephone;
		}



		public String getDroit() {
			return droit;
		}



		public void setDroit(String droit) {
			this.droit = droit;
		}
			
}