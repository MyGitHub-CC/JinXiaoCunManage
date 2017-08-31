package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import bean.Sales;
import dao.SalesDao;

@Repository
public class SalesDaoImpl implements SalesDao {
	@Resource
	SessionFactory sessionFactory;

	Session session;

	public void getSession() {
		session = sessionFactory.getCurrentSession();
	}

	@Override
	public List<Sales> search(Sales sales) {
		getSession();
		String hql = "from Sales where 1 = 1 and customer.del=0 and xtFlag=" + sales.getXtFlag();
		if(sales != null){
			if(sales.getCustomer() != null && sales.getCustomer().getId() > 0){
				hql += " and customer.id=" + sales.getCustomer().getId();
			}
			if(sales.getDate() != null && !"".equals(sales.getDate())){
				hql += " and date='" + sales.getDate() +"'";
			}
		}
		Query query = session.createQuery(hql);
		return query.list();
	}

	@Override
	public int insert(Sales sales) {
		getSession();
		int rs = (Integer) session.save(sales);
		return rs;
	}

	@Override
	public Sales searchById(Sales sales) {
		getSession();
		Query query = session.createQuery("from Sales where id="+ sales.getId());
		List<Sales> list = query.list();
		return list.get(0);
	}

}
