package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import service.PurAndProService;
import bean.Product;
import bean.PurAndPro;
import dao.PurAndProDao;

@Service
public class PurAndProServiceImpl implements PurAndProService {
	@Resource
	PurAndProDao purAndProDao;

	@Override
	public int add(PurAndPro purAndPro) {
		return purAndProDao.insert(purAndPro);
	}

	@Override
	public List<PurAndPro> searchByProId(Product product) {
		return purAndProDao.searchByProId(product);
	}

}
