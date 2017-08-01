package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import bean.Product;
import dao.ProductDao;

@Repository
public class ProductDaoImpl implements ProductDao {
	@Resource
	SessionFactory sessionFactory;

	Session session;

	public void getSession() {
		session = sessionFactory.getCurrentSession();
	}

	@Override
	public List<Product> search(Product product) {
		getSession();
		String hql = "from Product where 1 = 1 and del=0  ";
		if(product != null){
			if(product.getName() != "" && product.getName() != null){
				hql += " and name like '%" + product.getName() + "%'";
			}
		}
		Query query = session.createQuery(hql);
		return query.list();
	}

	@Override
	public int updateByPurchase(Product product) {
		getSession();
		String hql = "update Product p set p.inventory=p.inventory+" + product.getInventory()
				+ " where p.id=" + product.getId();
		Query query  = session.createQuery(hql);
		query.executeUpdate();
		return 1;
	}

	@Override
	public int updateBySales(Product product) {
		getSession();
		String hql = "update Product p set p.inventory=p.inventory-" + product.getInventory()
				+ " where p.id=" + product.getId();
		Query query  = session.createQuery(hql);
		query.executeUpdate();
		return 1;
	}

	@Override
	public int insert(Product product) {
		getSession();
		int rs = (Integer) session.save(product);
		return rs;
	}

	@Override
	public Product searchById(Product product) {
		getSession();
		Query query = session.createQuery("from Product where id=" + product.getId());
		List<Product> list = query.list();
		return list.get(0);
	}

	@Override
	public int update(Product product) {
		getSession();
		session.update(product);
		return 1;
	}

	@Override
	public int delete(Product product) {
		getSession();
		String hql = "update Product p set p.del = 1 where id =" + product.getId();
		Query query = session.createQuery(hql);
		query.executeUpdate();
		return 1;
	}
}
