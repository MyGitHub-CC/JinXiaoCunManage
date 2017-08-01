package dao;

import java.util.List;

import bean.Product;

public interface ProductDao {
	
	public List<Product> search(Product product);

	public int updateByPurchase(Product product);

	public int updateBySales(Product product);

	public int insert(Product product);

	public Product searchById(Product product);

	public int update(Product product);

	public int delete(Product product);

}
