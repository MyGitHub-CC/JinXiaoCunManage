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

import service.SupplierService;
import bean.Supplier;

@ParentPackage("struts-default")
@Namespace("")
public class SupplierAction {
	@Autowired
	SupplierService supplierService;

	private List<Supplier> suppliers;
	private Supplier supplier;

	@Action(value = "supplier", results = { @Result(name = "success", location = "/WEB-INF/jsp/supplier/supplier.jsp") })
	public String supplier() {
		suppliers = supplierService.search(supplier);
		return "success";
	}
	
	@Action(value = "supplierAdd")
	public void supplierAdd() {
		int result = supplierService.add(supplier);
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

	@Action(value = "supplierById")
	public void supplierById() {
		supplier = supplierService.searchById(supplier);
		if (supplier != null) {
			try {
				HttpServletResponse response = ServletActionContext.getResponse();
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				JSONArray jsonArray = JSONArray.fromObject(supplier);
				out.print(jsonArray);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@Action(value = "supplierModify")
	public void supplierModify() {
		int result = supplierService.modify(supplier);
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
	
	@Action(value = "supplierDelete")
	public void supplierDelete() {
		int result = supplierService.delete(supplier);
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
	
	public List<Supplier> getSuppliers() {
		return suppliers;
	}

	public void setSuppliers(List<Supplier> suppliers) {
		this.suppliers = suppliers;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

}
