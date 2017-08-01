package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import service.OperatorService;
import bean.Operator;

@ParentPackage("struts-default")
@Namespace("")
public class OperatorAction {
	@Autowired
	OperatorService operatorService;

	private List<Operator> operators;
	private Operator operator;

	@Action(value = "operator", results = { @Result(name = "success", location = "/WEB-INF/jsp/operator/operator.jsp") })
	public String operator() {
		operators = operatorService.search(operator);
		return "success";
	}
	
	@Action(value = "operatorAdd")
	public void operatorAdd() {
		int result = operatorService.add(operator);
		if(result > 0){
			try {
				HttpServletResponse response = ServletActionContext.getResponse();
				response.setCharacterEncoding("UTF-8");
				if (result > 0) {
					response.getWriter().write("保存成功！");
				} else {
					response.getWriter().write("保存失败!");
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@Action(value = "operatorById")
	public void operatorById() {
		operator = operatorService.searchById(operator);
		if (operator != null) {
			try {
				HttpServletResponse response = ServletActionContext.getResponse();
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				JSONArray jsonArray = JSONArray.fromObject(operator);
				out.print(jsonArray);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@Action(value = "operatorModify")
	public void operatorModify() {
		int result = operatorService.modify(operator);
		if(result > 0){
			try {
				HttpServletResponse response = ServletActionContext.getResponse();
				response.setCharacterEncoding("UTF-8");
				if (result > 0) {
					response.getWriter().write("保存成功！");
				} else {
					response.getWriter().write("保存失败!");
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@Action(value = "operatorDelete")
	public void operatorDelete() {
		int result = operatorService.delete(operator);
		if(result > 0){
			try {
				HttpServletResponse response = ServletActionContext.getResponse();
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				if (result > 0) {
					out.print("删除成功！");
				} else {
					out.print("删除失败！");
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public List<Operator> getOperators() {
		return operators;
	}

	public void setOperators(List<Operator> operators) {
		this.operators = operators;
	}

	public Operator getOperator() {
		return operator;
	}

	public void setOperator(Operator operator) {
		this.operator = operator;
	}

}
