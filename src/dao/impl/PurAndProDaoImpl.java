package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import bean.Product;
import bean.PurAndPro;
import dao.PurAndProDao;

@Repository
public class PurAndProDaoImpl implements PurAndProDao {
	@Resource
	SessionFactory sessionFactory;

	Session session;

	public void getSession() {
		session = sessionFactory.getCurrentSession();
	}

	@Override
	public int insert(PurAndPro purAndPro) {
		getSession();
		int rs = (Integer) session.save(purAndPro);
		return rs;
	}

	@Override
	public List<PurAndPro> searchByProId(Product product) {
		getSession();
		String hql = "from PurAndPro where product.id=" + product.getId();
		Query query = session.createQuery(hql);
		return query.list();
	}

}
