package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import service.CustomerService;
import bean.Customer;
import dao.CustomerDao;

@Service
public class CustomerServiceImpl implements CustomerService {
	@Resource
	CustomerDao customerDao;

	@Override
	public List<Customer> searchAll() {
		return customerDao.searchAll();
	}

	@Override
	public List<Customer> search(Customer customer) {
		return customerDao.search(customer);
	}

	@Override
	public int add(Customer customer) {
		return customerDao.insert(customer);
	}

	@Override
	public Customer searchById(Customer customer) {
		return customerDao.searchById(customer);
	}

	@Override
	public int modify(Customer customer) {
		return customerDao.update(customer);
	}

	@Override
	public int delete(Customer customer) {
		return customerDao.delete(customer);
	}
}
