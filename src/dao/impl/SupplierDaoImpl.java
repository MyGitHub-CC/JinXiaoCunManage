package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import bean.Purchase;
import bean.Supplier;
import dao.SupplierDao;

@Repository
public class SupplierDaoImpl implements SupplierDao {
	@Resource
	SessionFactory sessionFactory;

	Session session;

	public void getSession() {
		session = sessionFactory.getCurrentSession();
	}

	@Override
	public List<Supplier> searchAll() {
		getSession();
		Query query = session.createQuery("from Supplier where del = 0");
		return query.list();
	}

	@Override
	public List<Supplier> search(Supplier supplier) {
		getSession();
		String hql = "from Supplier where 1 = 1 and del = 0 ";
		if(supplier != null){
			if(supplier.getName() != null){
				hql += " and name like '%" + supplier.getName() + "%'";
			}
		}
		Query query = session.createQuery(hql);
		return query.list();
	}

	@Override
	public int add(Supplier supplier) {
		getSession();
		int rs = (Integer) session.save(supplier);
		return rs;
	}

	@Override
	public Supplier searchById(Supplier supplier) {
		getSession();
		Query query = session.createQuery("from Supplier where id="+ supplier.getId());
		List<Supplier> list = query.list();
		return list.get(0);
	}

	@Override
	public int update(Supplier supplier) {
		getSession();
		session.update(supplier);
		return 1;
	}

	@Override
	public int delete(Supplier supplier) {
		getSession();
		String hql = "update Supplier s set s.del = 1 where id =" + supplier.getId();
		Query query = session.createQuery(hql);
		query.executeUpdate();
		// session.delete(supplier);
		return 1;
	}
}
