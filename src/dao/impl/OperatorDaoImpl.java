package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import bean.Operator;
import dao.OperatorDao;

@Repository
public class OperatorDaoImpl implements OperatorDao {
	@Resource
	SessionFactory sessionFactory;

	Session session;

	public void getSession() {
		session = sessionFactory.getCurrentSession();
	}

	@Override
	public List<Operator> searchAll() {
		getSession();
		Query query = session.createQuery("from Operator where del = 0");
		return query.list();
	}

	@Override
	public List<Operator> search(Operator operator) {
		getSession();
		String hql = "from Operator where 1 = 1 and del = 0 ";
		if(operator != null){
			if(operator.getName() != null){
				hql += " and name like '%" + operator.getName() + "%'";
			}
		}
		Query query = session.createQuery(hql);
		return query.list();
	}

	@Override
	public int add(Operator operator) {
		getSession();
		int rs = (Integer) session.save(operator);
		return rs;
	}

	@Override
	public Operator searchById(Operator operator) {
		getSession();
		Query query = session.createQuery("from Operator where id="+ operator.getId());
		List<Operator> list = query.list();
		return list.get(0);
	}

	@Override
	public int update(Operator operator) {
		getSession();
		session.update(operator);
		return 1;
	}

	@Override
	public int delete(Operator operator) {
		getSession();
		String hql = "update Operator o set o.del = 1 where id =" + operator.getId();
		Query query = session.createQuery(hql);
		query.executeUpdate();
		// session.delete(operator);
		return 1;
	}
}
