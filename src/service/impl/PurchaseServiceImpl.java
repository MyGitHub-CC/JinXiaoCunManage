package service.impl;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import service.PurchaseService;
import bean.Purchase;
import dao.PurchaseDao;

@Service
public class PurchaseServiceImpl implements PurchaseService {
	@Resource
	PurchaseDao purchaseDao;

	@Override
	public List<Purchase> search(Purchase purchase) {
		return purchaseDao.search(purchase);
	}

	@Override
	public int add(Purchase purchase) {
		int rs = purchaseDao.insert(purchase);
		return rs;
	}

	@Override
	public Purchase searchById(Purchase purchase) {
		return purchaseDao.searchById(purchase);
	}

}
