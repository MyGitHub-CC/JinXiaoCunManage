package action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import service.UserService;
import bean.User;

@ParentPackage("struts-default")
@Namespace("")
public class UserAction {
	@Autowired
	UserService userService;

	private List<User> list;
	private User user;

	@Action(value = "login", results = { @Result(name = "success", location = "/WEB-INF/jsp/login/login.jsp") })
	public String login() {
		return "success";
	}
	
	@Action(value = "doLogin", results = { @Result(name = "success", location = "/WEB-INF/jsp/index/index.jsp") })
	public String doLogin() {
		list = userService.search(user);
		if(list != null){
			return "success";
		} else {
			return "fail";
		}
	}

	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
