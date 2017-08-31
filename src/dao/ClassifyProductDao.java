package dao;

import java.util.List;

import bean.ClassifyProduct;

public interface ClassifyProductDao {

	public List<ClassifyProduct> searchAll();

	public List<ClassifyProduct> search(ClassifyProduct classify);

	public int insert(ClassifyProduct classify);

	public ClassifyProduct searchById(ClassifyProduct classify);

	public int update(ClassifyProduct classify);

	public int delete(ClassifyProduct classify);

}
