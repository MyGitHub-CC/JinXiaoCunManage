package service;

import java.util.List;

import bean.Product;
import bean.PurAndPro;

public interface PurAndProService {

	public int add(PurAndPro purAndPro);

	public List<PurAndPro> searchByProId(Product product);

}
