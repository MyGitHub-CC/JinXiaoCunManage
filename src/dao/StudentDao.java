package dao;

import java.util.List;

import bean.Student;

public interface StudentDao {
	public List<Student> search();

	public int add(Student stu);

	public int getCount();

	public List<Student> searchByPage(int begin, int num);
}
