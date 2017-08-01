package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import bean.User;
import dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao {
	@Resource
	SessionFactory sessionFactory;

	Session session;

	public void getSession() {
		session = sessionFactory.getCurrentSession();
	}

	@Override
	public List<User> search(User user) {
		getSession();
		Query query = session.createQuery("from User where username= " + user.getUsername()
				 + " and password = " + user.getPassword());
		return query.list();
	}

}
