package action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;

import service.ProductService;
import service.SalAndProService;
import bean.Product;
import bean.SalAndPro;

@ParentPackage("struts-default")
@Namespace("")
public class SalAndProAction {
	@Autowired
	SalAndProService salAndProService;
	@Autowired
	ProductService productService;

	private SalAndPro salAndPro;
	private Product product;

	@Action(value = "salAndProAdd")
	public void salAndProAdd() {
		int result = salAndProService.add(salAndPro);
		Product product = new Product();
		product.setId(salAndPro.getProduct().getId());
		product.setInventory(salAndPro.getNum());
		int result2 = productService.modifyBySales(product);
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			if (result > 0 && result2 > 0) {
				response.getWriter().write(String.valueOf(result));
			} else {
				response.getWriter().write("保存失败");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public SalAndPro getSalAndPro() {
		return salAndPro;
	}

	public void setSalAndPro(SalAndPro salAndPro) {
		this.salAndPro = salAndPro;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

}
