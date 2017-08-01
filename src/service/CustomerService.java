package service;

import java.util.List;

import bean.Customer;

public interface CustomerService {

	public List<Customer> searchAll();

	public List<Customer> search(Customer customer);

	public int add(Customer customer);

	public Customer searchById(Customer customer);

	public int modify(Customer customer);

	public int delete(Customer customer);
}
