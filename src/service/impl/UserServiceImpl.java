package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import bean.User;

import service.UserService;
import dao.UserDao;

@Service
public class UserServiceImpl implements UserService {
	@Resource
	UserDao userDao;

	@Override
	public List<User> search(User user) {
		return userDao.search(user);
	}

}
