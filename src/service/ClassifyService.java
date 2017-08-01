package service;

import java.util.List;

import bean.Classify;

public interface ClassifyService {

	public List<Classify> searchAll();
	
	public List<Classify> search(Classify classify);

	public int add(Classify classify);

	public Classify searchById(Classify classify);

	public int modify(Classify classify);

	public int delete(Classify classify);

}
