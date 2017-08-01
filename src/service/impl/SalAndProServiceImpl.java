package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import service.SalAndProService;
import bean.Product;
import bean.SalAndPro;
import dao.SalAndProDao;

@Service
public class SalAndProServiceImpl implements SalAndProService {
	@Resource
	SalAndProDao salAndProDao;

	@Override
	public int add(SalAndPro salAndPro) {
		return salAndProDao.insert(salAndPro);
	}

	@Override
	public List<SalAndPro> searchByProId(Product product) {
		return  salAndProDao.searchByProId(product);
	}

}
