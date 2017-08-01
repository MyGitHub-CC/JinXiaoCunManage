package service;

import java.util.List;

import bean.Product;

public interface ProductService {

	public List<Product> search(Product product);

	public int modifyByPurchase(Product product);

	public int modifyBySales(Product product);

	public int add(Product product);

	public Product searchById(Product product);

	public int modify(Product product);

	public int delete(Product product);

}
