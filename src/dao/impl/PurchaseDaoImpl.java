package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import bean.Purchase;
import dao.PurchaseDao;

@Repository
public class PurchaseDaoImpl implements PurchaseDao {
	@Resource
	SessionFactory sessionFactory;

	Session session;

	public void getSession() {
		session = sessionFactory.getCurrentSession();
	}

	@Override
	public List<Purchase> search(Purchase purchase) {
		getSession();
		String hql = "from Purchase where 1 = 1 and supplier.del=0  and jtFlag=" + purchase.getJtFlag();
		if (purchase.getSupplier().getId() > 0) {
			hql += " and supplier.id=" + purchase.getSupplier().getId();
		}
		if ( purchase.getDate() != null && !"".equals(purchase.getDate()) ) {
			hql += " and date='" + purchase.getDate() + "'";
		}
		Query query = session.createQuery(hql);
		return query.list();
	}

	@Override
	public int insert(Purchase purchase) {
		getSession();
		int rs = (Integer) session.save(purchase);
		return rs;
	}

	@Override
	public Purchase searchById(Purchase purchase) {
		getSession();
		Query query = session.createQuery("from Purchase where id="+ purchase.getId());
		List<Purchase> list = query.list();
		return list.get(0);
	}

}
