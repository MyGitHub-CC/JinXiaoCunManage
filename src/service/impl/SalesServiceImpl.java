package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import service.SalesService;
import bean.Sales;
import dao.SalesDao;

@Service
public class SalesServiceImpl implements SalesService {
	@Resource
	SalesDao salesDao;

	@Override
	public List<Sales> search(Sales sales) {
		return salesDao.search(sales);
	}

	@Override
	public int add(Sales purchase) {
		int rs = salesDao.insert(purchase);
		return rs;
	}

	@Override
	public Sales searchById(Sales sales) {
		return salesDao.searchById(sales);
	}

}
