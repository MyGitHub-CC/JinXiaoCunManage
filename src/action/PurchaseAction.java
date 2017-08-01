package action;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import service.OperatorService;
import service.ProductService;
import service.PurchaseService;
import service.SupplierService;
import bean.MakeOrderNum;
import bean.Operator;
import bean.Product;
import bean.PurAndPro;
import bean.Purchase;
import bean.Supplier;

@ParentPackage("struts-default")
@Namespace("")
public class PurchaseAction {
	@Autowired
	PurchaseService purchaseService;
	@Autowired
	ProductService productService;
	@Autowired
	SupplierService supplierService;
	@Autowired
	OperatorService operatorService;

	private List<Purchase> purchases;
	private List<Product> products;
	private List<Supplier> suppliers;
	private List<Operator> operators;
	private Purchase purchase;
	private Product product;
	private PurAndPro purAndPro;
	private InputStream inputStream;

	@Action(value = "purchaseInput", results = { @Result(name = "success", 
			location = "/WEB-INF/jsp/purchase/purchaseInput.jsp") })
	public String purchaseInput() {
		products = productService.search(product);
		suppliers = supplierService.searchAll();
		operators = operatorService.searchAll();
		return "success";
	}

	@Action(value = "purchaseAdd")
	public void purchaseAdd() {
		MakeOrderNum makeOrderNum = new MakeOrderNum();// 生成订单号
		String receipt = makeOrderNum.makeOrderNum();
		purchase.setReceipt(receipt);
		int result = purchaseService.add(purchase);
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("UTF-8");
			if (result > 0) {
				response.getWriter().write(String.valueOf(result));
			} else {
				response.getWriter().write("保存失败");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Action(value = "purchaseManage", results = { @Result(name = "success", 
			location = "/WEB-INF/jsp/purchase/purchaseManage.jsp") })
	public String purchaseManage() {
		purchases = purchaseService.search(purchase);
		suppliers = supplierService.searchAll();
		return "success";
	}

	@Action(value = "purchaseById", results = { @Result(name = "success", 
			location = "/WEB-INF/jsp/purchase/purchaseById.jsp") })
	public String purchaseById() {
		purchase = purchaseService.searchById(purchase);
		return "success";
	}
	
	@Action(value = "purchaseReturn", results = { @Result(name = "success", 
			location = "/WEB-INF/jsp/purchase/purchaseReturn.jsp") })
	public String purchaseReturn() {
		products = productService.search(product);
		suppliers = supplierService.searchAll();
		operators = operatorService.searchAll();
		return "success";
	}

	public List<Purchase> getPurchases() {
		return purchases;
	}

	public void setPurchases(List<Purchase> purchases) {
		this.purchases = purchases;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public List<Supplier> getSuppliers() {
		return suppliers;
	}

	public void setSuppliers(List<Supplier> suppliers) {
		this.suppliers = suppliers;
	}

	public Purchase getPurchase() {
		return purchase;
	}

	public void setPurchase(Purchase purchase) {
		this.purchase = purchase;
	}

	public PurAndPro getPurAndPro() {
		return purAndPro;
	}

	public void setPurAndPro(PurAndPro purAndPro) {
		this.purAndPro = purAndPro;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public List<Operator> getOperators() {
		return operators;
	}

	public void setOperators(List<Operator> operators) {
		this.operators = operators;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	// @Action(value = "purchaseAdd")
	// public void purchaseAdd() {
	// Set<PurAndPro> purAndPros = new HashSet<PurAndPro>();
	// purAndPros.add(purAndPro);
	// purchase.setPurAndPros(purAndPros);
	// MakeOrderNum makeOrderNum = new MakeOrderNum();// 生成订单号
	// String receipt = makeOrderNum.makeOrderNum();
	// purchase.setReceipt(receipt);
	// int result = purchaseService.add(purchase);
	// Product product = new Product();
	// product.setId(purAndPro.getProduct().getId());
	// product.setInventory(purAndPro.getNum());
	// result = productService.modify(product);
	// try {
	// HttpServletResponse response = ServletActionContext.getResponse();
	// response.setCharacterEncoding("UTF-8");
	// if (result > 0) {
	// response.getWriter().write("保存成功！");
	// } else {
	// response.getWriter().write("保存失败");
	// }
	// } catch (IOException e) {
	// e.printStackTrace();
	// }
	// }
}
