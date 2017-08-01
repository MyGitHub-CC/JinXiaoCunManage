package dao;

import java.util.List;

import bean.Supplier;

public interface SupplierDao {

	public List<Supplier> searchAll();

	public List<Supplier> search(Supplier supplier);

	public int add(Supplier supplier);

	public Supplier searchById(Supplier supplier);

	public int update(Supplier supplier);

	public int delete(Supplier supplier);
}
