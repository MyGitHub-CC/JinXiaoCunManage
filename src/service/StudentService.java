package service;

import java.util.List;

import bean.Student;

public interface StudentService {

	public List<Student> searchStudents();

	public int add(Student stu);

	public int getCount();

	public List<Student> searchByPage(int begin, int num);
}
