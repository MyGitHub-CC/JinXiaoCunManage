package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import service.SupplierService;
import bean.Supplier;
import dao.SupplierDao;

@Service
public class SupplierServiceImpl implements SupplierService {
	@Resource
	SupplierDao supplierDao;

	@Override
	public List<Supplier> searchAll() {
		return supplierDao.searchAll();
	}

	@Override
	public List<Supplier> search(Supplier supplier) {
		return supplierDao.search(supplier);
	}

	@Override
	public int add(Supplier supplier) {
		return supplierDao.add(supplier);
	}

	@Override
	public Supplier searchById(Supplier supplier) {
		return supplierDao.searchById(supplier);
	}

	@Override
	public int modify(Supplier supplier) {
		return supplierDao.update(supplier);
	}

	@Override
	public int delete(Supplier supplier) {
		return supplierDao.delete(supplier);
	}

}
