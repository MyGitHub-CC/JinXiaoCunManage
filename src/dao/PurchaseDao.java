package dao;

import java.util.List;

import bean.Purchase;

public interface PurchaseDao {
	public List<Purchase> search(Purchase purchase);

	public int insert(Purchase purchase);

	public Purchase searchById(Purchase purchase);

}
