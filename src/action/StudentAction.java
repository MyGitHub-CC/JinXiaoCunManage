package action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import service.StudentService;
import bean.Student;

@ParentPackage("struts-default")
@Namespace("")
public class StudentAction {
	@Autowired
	StudentService studentService;

	private List<Student> list;
	private Student stu;

	@Action(value = "show", results = { @Result(name = "success", location = "/WEB-INF/jsp/students.jsp") })
	public String show() {
		list = studentService.searchStudents();

		return "success";
	}

	@Action(value = "showAdd", results = { @Result(name = "success", location = "/WEB-INF/jsp/add.jsp") })
	public String showAdd() {
		return "success";
	}

	@Action(value = "doAdd", results = { @Result(name = "success", location = "show", type = "redirect") })
	public String doAdd() {
		studentService.add(stu);
		return "success";
	}

	public List<Student> getList() {
		return list;
	}

	public void setList(List<Student> list) {
		this.list = list;
	}

	public Student getStu() {
		return stu;
	}

	public void setStu(Student stu) {
		this.stu = stu;
	}

}
