package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import service.ProductService;
import bean.Product;
import dao.ProductDao;

@Service
public class ProductServiceImpl implements ProductService {
	@Resource
	ProductDao productDao;

	@Override
	public List<Product> search(Product product) {
		return productDao.search(product);
	}
	
	@Override
	public int add(Product product) {
		return productDao.insert(product);
	}

	@Override
	public Product searchById(Product product) {
		return productDao.searchById(product);
	}

	@Override
	public int modify(Product product) {
		return productDao.update(product);
	}

	@Override
	public int delete(Product product) {
		return productDao.delete(product);
	}
	
	@Override
	public int modifyByPurchase(Product product) {
		return productDao.updateByPurchase(product);
	}

	@Override
	public int modifyBySales(Product product) {
		return productDao.updateBySales(product);
	}

}
