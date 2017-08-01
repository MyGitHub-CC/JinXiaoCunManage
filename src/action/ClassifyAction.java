package action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

@ParentPackage("struts-default")
@Namespace("")
public class ClassifyAction {

	@Action(value = "classifyProduct", results = { @Result(name = "success", location = "/WEB-INF/jsp/classify/classifyProduct.jsp") })
	public String index() {
		return "success";
	}
	
	@Action(value = "classifyCustomer", results = { @Result(name = "success", location = "/WEB-INF/jsp/classify/classifyCustomer.jsp") })
	public String classifyCustomer() {
		return "success";
	}
	
	@Action(value = "classifySupplier", results = { @Result(name = "success", location = "/WEB-INF/jsp/classify/classifySupplier.jsp") })
	public String classifySupplier() {
		return "success";
	}

}
