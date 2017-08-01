package dao;

import java.util.List;

import bean.User;

public interface UserDao {
	
	public List<User> search(User user);

}
