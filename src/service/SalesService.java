package service;

import java.util.List;

import bean.Sales;

public interface SalesService {

	public List<Sales> search(Sales sales);

	public int add(Sales sales);

	public Sales searchById(Sales sales);

}
