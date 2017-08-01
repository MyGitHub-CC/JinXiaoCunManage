package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import service.CustomerService;
import service.OperatorService;
import service.ProductService;
import service.SalesService;
import bean.Customer;
import bean.MakeOrderNum;
import bean.Operator;
import bean.Product;
import bean.SalAndPro;
import bean.Sales;

@ParentPackage("struts-default")
@Namespace("")
public class SalesAction {
	@Autowired
	SalesService salesService;
	@Autowired
	ProductService productService;
	@Autowired
	CustomerService customerService;
	@Autowired
	OperatorService operatorService;

	private List<Sales> salesList;
	private List<Product> products;
	private List<Customer> customers;
	private List<Operator> operators;
	private Sales sales;
	private Product product;
	private SalAndPro salAndPro;

	@Action(value = "salesInput", results = { @Result(name = "success", location = "/WEB-INF/jsp/sales/salesInput.jsp") })
	public String salesInput() {
		products = productService.search(product);
		customers = customerService.searchAll();
		operators = operatorService.searchAll();
		return "success";
	}

	@Action(value = "salesAdd")
	public void salesAdd() {
		MakeOrderNum makeOrderNum = new MakeOrderNum();// 生成订单号
		String receipt = makeOrderNum.makeOrderNum();
		sales.setReceipt(receipt);
		int result = salesService.add(sales);
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

	@Action(value = "salesManage", results = { @Result(name = "success", location = "/WEB-INF/jsp/sales/salesManage.jsp") })
	public String salesManage() {
		salesList = salesService.search(sales);
		customers = customerService.searchAll();
		return "success";
	}

	@Action(value = "salesById", results = { @Result(name = "success", location = "/WEB-INF/jsp/sales/salesById.jsp") })
	public String salesById() {
		sales = salesService.searchById(sales);
		return "success";
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public List<Customer> getCustomers() {
		return customers;
	}

	public void setCustomers(List<Customer> customers) {
		this.customers = customers;
	}

	public Sales getSales() {
		return sales;
	}

	public void setSales(Sales sales) {
		this.sales = sales;
	}

	public SalAndPro getSalAndPro() {
		return salAndPro;
	}

	public void setSalAndPro(SalAndPro salAndPro) {
		this.salAndPro = salAndPro;
	}

	public List<Sales> getSalesList() {
		return salesList;
	}

	public void setSalesList(List<Sales> salesList) {
		this.salesList = salesList;
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

}
