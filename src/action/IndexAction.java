package action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

@ParentPackage("struts-default")
@Namespace("")
public class IndexAction {

	@Action(value = "index", results = { @Result(name = "success", location = "/WEB-INF/jsp/index/index.jsp") })
	public String index() {
		return "success";
	}

}
