package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import play.db.jpa.GenericModel;

@Entity
public class Departement extends GenericModel {
	@Id
    public String code;
	
	@ManyToOne
	public Region region;

	public String codeChefLieu;

	public Integer typeNomClair;
	
	public String libelle;

	public String libelleEnrichi;
}
