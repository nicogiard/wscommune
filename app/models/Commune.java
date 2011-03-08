package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import play.db.jpa.GenericModel;

@Entity
public class Commune extends GenericModel {
	@Id
    public String code;
	
	@ManyToOne
	public Region region;
	
	@ManyToOne
	public Departement departement;

	@ManyToOne
	public Arrondissement arrondissement;
	
	@Column(name="canton_code")
	public String canton;

	public String typeChefLieu;

	public Integer typeNomClair;
	
	public String article;
	
	public String libelle;

	public String articleEnrichi;

	public String libelleEnrichi;

	public String codePostal;
}
