package dao;

import java.util.List;

import bean.Classify;

public interface ClassifyDao {

	public List<Classify> searchAll();

	public List<Classify> search(Classify classify);

	public int insert(Classify classify);

	public Classify searchById(Classify classify);

	public int update(Classify classify);

	public int delete(Classify classify);

}
