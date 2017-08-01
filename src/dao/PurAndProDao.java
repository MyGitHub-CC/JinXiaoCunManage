package dao;

import java.util.List;

import bean.Product;
import bean.PurAndPro;

public interface PurAndProDao {

	public int insert(PurAndPro purAndPro);

	public List<PurAndPro> searchByProId(Product product);

}
