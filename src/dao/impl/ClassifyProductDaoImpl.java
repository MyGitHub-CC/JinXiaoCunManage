package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import bean.ClassifyProduct;
import dao.ClassifyProductDao;

@Repository
public class ClassifyProductDaoImpl implements ClassifyProductDao {
	@Resource
	SessionFactory sessionFactory;

	Session session;

	public void getSession() {
		session = sessionFactory.getCurrentSession();
	}

	@Override
	public List<ClassifyProduct> searchAll() {
		getSession();
		Query query = session.createQuery("from ClassifyProduct where del = 0 ");
		return query.list();
	}

	@Override
	public List<ClassifyProduct> search(ClassifyProduct classifyProduct) {
		getSession();
		String hql = "from ClassifyProduct where 1 = 1 and del = 0 ";
		if (classifyProduct != null) {
			if (classifyProduct.getName() != null) {
				hql += " and name like '%" + classifyProduct.getName() + "%'";
			}
		}
		Query query = session.createQuery(hql);
		return query.list();
	}

	@Override
	public int insert(ClassifyProduct classifyProduct) {
		getSession();
		int rs = (Integer) session.save(classifyProduct);
		return rs;
	}

	@Override
	public ClassifyProduct searchById(ClassifyProduct classifyProduct) {
		getSession();
		Query query = session.createQuery("from ClassifyProduct where id=" + classifyProduct.getId());
		List<ClassifyProduct> list = query.list();
		return list.get(0);
	}

	@Override
	public int update(ClassifyProduct classifyProduct) {
		getSession();
		session.update(classifyProduct);
		return 1;
	}

	@Override
	public int delete(ClassifyProduct classifyProduct) {
		getSession();
		String hql = "update ClassifyProduct c set c.del = 1 where id =" + classifyProduct.getId();
		Query query = session.createQuery(hql);
		query.executeUpdate();
		return 1;
	}
}
