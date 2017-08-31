package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import service.ClassifyProductService;
import bean.ClassifyProduct;
import dao.ClassifyProductDao;

@Service
public class ClassifyProductServiceImpl implements ClassifyProductService {
	@Resource
	ClassifyProductDao classifyProductDao;

	@Override
	public List<ClassifyProduct> searchAll() {
		return classifyProductDao.searchAll();
	}

	@Override
	public List<ClassifyProduct> search(ClassifyProduct classifyProduct) {
		return classifyProductDao.search(classifyProduct);
	}

	@Override
	public int add(ClassifyProduct classifyProduct) {
		return classifyProductDao.insert(classifyProduct);
	}

	@Override
	public ClassifyProduct searchById(ClassifyProduct classifyProduct) {
		return classifyProductDao.searchById(classifyProduct);
	}

	@Override
	public int modify(ClassifyProduct classifyProduct) {
		return classifyProductDao.update(classifyProduct);
	}

	@Override
	public int delete(ClassifyProduct classifyProduct) {
		return classifyProductDao.delete(classifyProduct);
	}
}
