package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import bean.Product;
import bean.SalAndPro;
import dao.SalAndProDao;

@Repository
public class SalAndProDaoImpl implements SalAndProDao {
	@Resource
	SessionFactory sessionFactory;

	Session session;

	public void getSession() {
		session = sessionFactory.getCurrentSession();
	}

	@Override
	public int insert(SalAndPro salAndPro) {
		getSession();
		int rs = (Integer) session.save(salAndPro);
		return rs;
	}

	@Override
	public List<SalAndPro> searchByProId(Product product) {
		getSession();
		String hql = "from SalAndPro where product.id=" + product.getId();
		Query query = session.createQuery(hql);
		return query.list();
	}

}
