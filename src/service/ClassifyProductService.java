package service;

import java.util.List;

import bean.ClassifyProduct;

public interface ClassifyProductService {

	public List<ClassifyProduct> searchAll();
	
	public List<ClassifyProduct> search(ClassifyProduct classifyProduct);

	public int add(ClassifyProduct classifyProduct);

	public ClassifyProduct searchById(ClassifyProduct classifyProduct);

	public int modify(ClassifyProduct classifyProduct);

	public int delete(ClassifyProduct classifyProduct);

}
