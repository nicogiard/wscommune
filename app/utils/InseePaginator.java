package utils;

import java.util.List;

import play.db.jpa.Model;
import play.modules.paginate.ModelPaginator;

public class InseePaginator<T extends Model> extends ModelPaginator {

	public InseePaginator(List<T> values) {
		super(values);
		this.setRowCountSummaryEnabled(true);
	}
}
