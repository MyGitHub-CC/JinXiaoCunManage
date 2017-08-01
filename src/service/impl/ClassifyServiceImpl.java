package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import service.ClassifyService;
import bean.Classify;
import dao.ClassifyDao;

@Service
public class ClassifyServiceImpl implements ClassifyService {
	@Resource
	ClassifyDao classifyDao;

	@Override
	public List<Classify> searchAll() {
		return classifyDao.searchAll();
	}

	@Override
	public List<Classify> search(Classify classify) {
		return classifyDao.search(classify);
	}

	@Override
	public int add(Classify classify) {
		return classifyDao.insert(classify);
	}

	@Override
	public Classify searchById(Classify classify) {
		return classifyDao.searchById(classify);
	}

	@Override
	public int modify(Classify classify) {
		return classifyDao.update(classify);
	}

	@Override
	public int delete(Classify classify) {
		return classifyDao.delete(classify);
	}
}
