package service;

import java.util.List;

import bean.Product;
import bean.SalAndPro;

public interface SalAndProService {

	public int add(SalAndPro salAndPro);

	public List<SalAndPro> searchByProId(Product product);

}
