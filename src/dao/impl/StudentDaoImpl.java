package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import bean.Student;
import dao.StudentDao;

@Repository
public class StudentDaoImpl implements StudentDao {
	@Resource
	SessionFactory sessionFactory;

	Session session;

	public void getSession() {
		session = sessionFactory.getCurrentSession();
	}

	@Override
	public List<Student> search() {
		getSession();
		Query query = session.createQuery("from Student");
		return query.list();
	}

	public int add(Student stu) {
		getSession();
		return (Integer) session.save(stu);
	}

	public int getCount() {
		getSession();
		Query query = session.createQuery("select count(s) from Student s");
		Long count = (Long) query.uniqueResult();
		return count.intValue();
	}

	public List<Student> searchByPage(int begin, int num) {
		getSession();
		Query query = session.createQuery("from Student");
		query.setFirstResult(begin);
		query.setMaxResults(num);
		List<Student> list = query.list();
		return list;
	}

}
