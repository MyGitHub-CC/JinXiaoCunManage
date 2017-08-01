package dao;

import java.util.List;

import bean.Product;
import bean.SalAndPro;

public interface SalAndProDao {

	public int insert(SalAndPro salAndPro);

	public List<SalAndPro> searchByProId(Product product);

}
