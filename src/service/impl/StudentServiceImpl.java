package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import service.StudentService;
import bean.Student;

import dao.StudentDao;

@Service
public class StudentServiceImpl implements StudentService {
	@Resource
	StudentDao studentDao;

	@Override
	public List<Student> searchStudents() {

		return studentDao.search();

	}

	public int add(Student stu) {
		return studentDao.add(stu);
	}

	@Override
	public int getCount() {

		return studentDao.getCount();

	}

	public List<Student> searchByPage(int begin, int num) {
		return studentDao.searchByPage(begin, num);

	}
}
