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

import service.ClassifyService;
import service.ProductService;
import service.PurAndProService;
import service.SalAndProService;
import bean.Classify;
import bean.Product;
import bean.PurAndPro;
import bean.SalAndPro;

@ParentPackage("struts-default")
@Namespace("")
public class ProductAction {
	@Autowired
	ProductService productService;
	@Autowired
	ClassifyService classifyService;
	@Autowired
	PurAndProService purAndProService;
	@Autowired
	SalAndProService salAndProService;

	private Product product;
	private PurAndPro purAndPro;
	private List<Product> products;
	private List<Classify> classifys;
	private List<PurAndPro> purAndPros;
	private List<SalAndPro> salAndPros;

	@Action(value = "productInventory", results = { @Result(name = "success", location = "/WEB-INF/jsp/product/productInventory.jsp") })
	public String productInventory() {
		products = productService.search(product);
		return "success";
	}

	@Action(value = "productRecord", results = { @Result(name = "success", location = "/WEB-INF/jsp/product/productRecord.jsp") })
	public String productRecord() {
		purAndPros = purAndProService.searchByProId(product);
		salAndPros = salAndProService.searchByProId(product);
		return "success";
	}

	@Action(value = "product", results = { @Result(name = "success", location = "/WEB-INF/jsp/product/product.jsp") })
	public String product() {
		products = productService.search(product);
		classifys = classifyService.searchAll();
		return "success";
	}

	@Action(value = "productAdd")
	public void productAdd() {
		int result = productService.add(product);
		if (result > 0) {
			try {
				HttpServletResponse response = ServletActionContext
						.getResponse();
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

	@Action(value = "productById")
	public void productById() {
		product = productService.searchById(product);
		if (product != null) {
			try {
				HttpServletResponse response = ServletActionContext
						.getResponse();
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				JSONArray jsonArray = JSONArray.fromObject(product);
				out.print(jsonArray);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@Action(value = "productModify")
	public void productModify() {
		int result = productService.modify(product);
		if (result > 0) {
			try {
				HttpServletResponse response = ServletActionContext
						.getResponse();
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

	@Action(value = "productDelete")
	public void productDelete() {
		int result = productService.delete(product);
		if (result > 0) {
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

	@Action(value = "productAssembly", results = { @Result(name = "success", location = "/WEB-INF/jsp/product/productAssembly.jsp") })
	public String productAssembly() {
		return "success";
	}

	@Action(value = "productSplit", results = { @Result(name = "success", location = "/WEB-INF/jsp/product/productSplit.jsp") })
	public String productSplit() {
		return "success";
	}

	public PurAndPro getPurAndPro() {
		return purAndPro;
	}

	public void setPurAndPro(PurAndPro purAndPro) {
		this.purAndPro = purAndPro;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public List<PurAndPro> getPurAndPros() {
		return purAndPros;
	}

	public void setPurAndPros(List<PurAndPro> purAndPros) {
		this.purAndPros = purAndPros;
	}

	public List<SalAndPro> getSalAndPros() {
		return salAndPros;
	}

	public void setSalAndPros(List<SalAndPro> salAndPros) {
		this.salAndPros = salAndPros;
	}

	public List<Classify> getClassifys() {
		return classifys;
	}

	public void setClassifys(List<Classify> classifys) {
		this.classifys = classifys;
	}

}
