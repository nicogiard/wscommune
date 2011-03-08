package controllers;

import java.util.List;

import models.Commune;
import models.Departement;
import models.Region;

import org.apache.commons.lang.StringUtils;

import play.modules.paginate.ModelPaginator;
import play.mvc.Controller;
import utils.CommuneSerializer;
import utils.InseePaginator;

public class Application extends Controller {

	public static void index() {
		render();
	}

	public static void regions() {
		List<Region> regions = Region.find("order by libelleEnrichi").fetch();
		InseePaginator paginator = new InseePaginator(regions);
		render(paginator);
	}

	public static void region(String code) {
		Region region = Region.find("code=?", code).first();
		notFoundIfNull(region);
		List<Departement> departements = Departement.find("region.code=?", region.code).fetch();
		int countDepartement = departements.size();
		render(region, departements, countDepartement);
	}

	public static void departements() {
		List<Departement> departements = Departement.findAll();
		InseePaginator paginator = new InseePaginator(departements);
		render(paginator);
	}

	public static void departement(String code) {
		Departement departement = Departement.find("code=?", code).first();
		notFoundIfNull(departement);
		List<Commune> communes = Commune.find("departement.code=?", code).fetch();
		int countCommune = communes.size();
		InseePaginator paginator = new InseePaginator(communes);
		render(departement, paginator, countCommune);
	}

	public static void communes() {
		render();
	}

	public static void searchCommunes(String term) {
		List<Commune> communes = Commune.find("libelleEnrichi like ?", "%" + term + "%").fetch(10);
		renderJSON(communes, new CommuneSerializer());
	}

	public static void searchCommune(String code) {
		Commune commune = null;
		if (StringUtils.isNotBlank(code)) {
			commune = Commune.find("code = ?", code).first();
			notFoundIfNull(commune);
		}
		render("Application/communes.html", commune);
	}

	public static void commune(String code) {
		Commune commune = Commune.find("code=?", code).first();
		notFoundIfNull(commune);
		render(commune);
	}
}