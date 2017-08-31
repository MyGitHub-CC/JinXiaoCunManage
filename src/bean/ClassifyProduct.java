package bean;

public class ClassifyProduct {
	private int id;
	private String name;
	private int del;

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

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "ClassifyProduct [id=" + id + ", name=" + name + ", del=" + del
				+ "]";
	}

}
