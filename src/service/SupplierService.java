package service;

import java.util.List;

import bean.Supplier;

public interface SupplierService {

	public List<Supplier> searchAll();
	
	public List<Supplier> search(Supplier supplier);

	public int add(Supplier supplier);

	public Supplier searchById(Supplier supplier);

	public int modify(Supplier supplier);

	public int delete(Supplier supplier);

}
