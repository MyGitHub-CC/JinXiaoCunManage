package service;

import java.util.List;

import bean.Purchase;

public interface PurchaseService {

	public List<Purchase> search(Purchase purchase);

	public int add(Purchase purchase);

	public Purchase searchById(Purchase purchase);

}
