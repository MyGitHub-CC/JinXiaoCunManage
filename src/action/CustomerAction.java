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

import service.CustomerService;
import bean.Customer;

@ParentPackage("struts-default")
@Namespace("")
public class CustomerAction {
	@Autowired
	CustomerService customerService;

	private List<Customer> customers;
	private Customer customer;

	@Action(value = "customer", results = { @Result(name = "success", location = "/WEB-INF/jsp/customer/customer.jsp") })
	public String customer() {
		customers = customerService.search(customer);
		return "success";
	}
	
	@Action(value = "customerAdd")
	public void customerAdd() {
		int result = customerService.add(customer);
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

	@Action(value = "customerById")
	public void customerById() {
		customer = customerService.searchById(customer);
		if (customer != null) {
			try {
				HttpServletResponse response = ServletActionContext.getResponse();
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				JSONArray jsonArray = JSONArray.fromObject(customer);
				out.print(jsonArray);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@Action(value = "customerModify")
	public void customerModify() {
		int result = customerService.modify(customer);
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
	
	@Action(value = "customerDelete")
	public void customerDelete() {
		int result = customerService.delete(customer);
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
	
	public List<Customer> getCustomers() {
		return customers;
	}

	public void setCustomers(List<Customer> customers) {
		this.customers = customers;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

}
