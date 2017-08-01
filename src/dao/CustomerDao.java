package dao;

import java.util.List;

import bean.Customer;

public interface CustomerDao {

	public List<Customer> searchAll();

	public List<Customer> search(Customer customer);

	public int insert(Customer customer);

	public Customer searchById(Customer customer);

	public int update(Customer customer);

	public int delete(Customer customer);

}
