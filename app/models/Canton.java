package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import play.db.jpa.GenericModel;

@Entity
public class Canton extends GenericModel {
	@Id
    public String code;
	
	@ManyToOne
	public Region region;
	
	@ManyToOne
	public Departement departement;

	@ManyToOne
	public Arrondissement arrondissement;

	public String codeChefLieu;

	public Integer typeNomClair;
	
	public String article;
	
	public String libelle;

	public String articleEnrichi;

	public String libelleEnrichi;
}
