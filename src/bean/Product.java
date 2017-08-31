package bean;

public class Product {
	private int id;
	private String name;
	private String unit;
	private ClassifyProduct classifyProduct;
	private double inventory;
	private String note;
	private String del;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public ClassifyProduct getClassifyProduct() {
		return classifyProduct;
	}

	public void setClassifyProduct(ClassifyProduct classifyProduct) {
		this.classifyProduct = classifyProduct;
	}

	public double getInventory() {
		return inventory;
	}

	public void setInventory(double inventory) {
		this.inventory = inventory;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", unit=" + unit
				+ ", classifyProduct=" + classifyProduct + ", inventory="
				+ inventory + ", note=" + note + ", del=" + del + "]";
	}

}
