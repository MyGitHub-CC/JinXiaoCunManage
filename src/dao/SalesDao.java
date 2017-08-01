package dao;

import java.util.List;

import bean.Sales;

public interface SalesDao {
	public List<Sales> search(Sales sales);

	public int insert(Sales sales);

	public Sales searchById(Sales sales);

}
