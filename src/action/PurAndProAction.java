package action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.springframework.beans.factory.annotation.Autowired;

import service.ProductService;
import service.PurAndProService;
import bean.Product;
import bean.PurAndPro;

@ParentPackage("struts-default")
@Namespace("")
public class PurAndProAction {
	@Autowired
	PurAndProService purAndProService;
	@Autowired
	ProductService productService;

	private PurAndPro purAndPro;
	private Product product;

	@Action(value = "purAndProAdd")
	public void purAndProAdd() {
		int result = purAndProService.add(purAndPro);
		Product product = new Product();
		product.setId(purAndPro.getProduct().getId());
		product.setInventory(purAndPro.getNum());
		int result2 = productService.modifyByPurchase(product);
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

}
