package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import bean.Classify;
import dao.ClassifyDao;

@Repository
public class ClassifyDaoImpl implements ClassifyDao {
	@Resource
	SessionFactory sessionFactory;

	Session session;

	public void getSession() {
		session = sessionFactory.getCurrentSession();
	}

	@Override
	public List<Classify> searchAll() {
		getSession();
		Query query = session.createQuery("from Classify where del = 0 ");
		return query.list();
	}

	@Override
	public List<Classify> search(Classify classify) {
		getSession();
		String hql = "from Classify where 1 = 1 and del = 0 ";
		if (classify != null) {
			if (classify.getName() != null) {
				hql += " and name like '%" + classify.getName() + "%'";
			}
		}
		Query query = session.createQuery(hql);
		return query.list();
	}

	@Override
	public int insert(Classify classify) {
		getSession();
		int rs = (Integer) session.save(classify);
		return rs;
	}

	@Override
	public Classify searchById(Classify classify) {
		getSession();
		Query query = session.createQuery("from Classify where id=" + classify.getId());
		List<Classify> list = query.list();
		return list.get(0);
	}

	@Override
	public int update(Classify classify) {
		getSession();
		session.update(classify);
		return 1;
	}

	@Override
	public int delete(Classify classify) {
		getSession();
		String hql = "update Classify c set c.del = 1 where id =" + classify.getId();
		Query query = session.createQuery(hql);
		query.executeUpdate();
		return 1;
	}
}
