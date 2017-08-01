package dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import bean.Customer;
import dao.CustomerDao;

@Repository
public class CustomerDaoImpl implements CustomerDao {
	@Resource
	SessionFactory sessionFactory;

	Session session;

	public void getSession() {
		session = sessionFactory.getCurrentSession();
	}

	@Override
	public List<Customer> searchAll() {
		getSession();
		Query query = session.createQuery("from Customer where del = 0 ");
		return query.list();
	}

	@Override
	public List<Customer> search(Customer customer) {
		getSession();
		String hql = "from Customer where 1 = 1 and del = 0 ";
		if (customer != null) {
			if (customer.getName() != null) {
				hql += " and name like '%" + customer.getName() + "%'";
			}
		}
		Query query = session.createQuery(hql);
		return query.list();
	}

	@Override
	public int insert(Customer customer) {
		getSession();
		int rs = (Integer) session.save(customer);
		return rs;
	}

	@Override
	public Customer searchById(Customer customer) {
		getSession();
		Query query = session.createQuery("from Customer where id=" + customer.getId());
		List<Customer> list = query.list();
		return list.get(0);
	}

	@Override
	public int update(Customer customer) {
		getSession();
		session.update(customer);
		return 1;
	}

	@Override
	public int delete(Customer customer) {
		getSession();
		String hql = "update Customer c set c.del = 1 where id =" + customer.getId();
		Query query = session.createQuery(hql);
		query.executeUpdate();
		//session.delete(customer);
		return 1;
	}
}
