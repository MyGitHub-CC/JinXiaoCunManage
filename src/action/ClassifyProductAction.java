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

import service.ClassifyProductService;
import bean.ClassifyProduct;

@ParentPackage("struts-default")
@Namespace("")
public class ClassifyProductAction {
	@Autowired
	ClassifyProductService classifyProductService;

	List<ClassifyProduct> classifyProducts;
	ClassifyProduct classifyProduct;

	@Action(value = "classifyProduct", results = { @Result(name = "success", location = "/WEB-INF/jsp/classify/classifyProduct.jsp") })
	public String classifyProduct() {
		classifyProducts = classifyProductService.search(classifyProduct);
		return "success";
	}

	@Action(value = "classifyProductAdd")
	public void classifyProductAdd() {
		int result = classifyProductService.add(classifyProduct);
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

	@Action(value = "classifyProductById")
	public void classifyProductById() {
		classifyProduct = classifyProductService.searchById(classifyProduct);
		if (classifyProduct != null) {
			try {
				HttpServletResponse response = ServletActionContext.getResponse();
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				JSONArray jsonArray = JSONArray.fromObject(classifyProduct);
				out.print(jsonArray);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@Action(value = "classifyProductModify")
	public void classifyProductModify() {
		int result = classifyProductService.modify(classifyProduct);
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

	@Action(value = "classifyProductDelete")
	public void classifyProductDelete() {
		int result = classifyProductService.delete(classifyProduct);
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

	public List<ClassifyProduct> getClassifyProducts() {
		return classifyProducts;
	}

	public void setClassifyProducts(List<ClassifyProduct> classifyProducts) {
		this.classifyProducts = classifyProducts;
	}

	public ClassifyProduct getClassifyProduct() {
		return classifyProduct;
	}

	public void setClassifyProduct(ClassifyProduct classifyProduct) {
		this.classifyProduct = classifyProduct;
	}

}
