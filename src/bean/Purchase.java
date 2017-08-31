package bean;

import java.util.Set;

public class Purchase {
	private int id;
	private Supplier supplier;
	private double count;
	private String date;
	private String receipt;
	private String note;
	private Operator operator;
	private Set<PurAndPro> purAndPros;
	private int jtFlag;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Supplier getSupplier() {
		return supplier;
	}

	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}

	public double getCount() {
		return count;
	}

	public void setCount(double count) {
		this.count = count;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getReceipt() {
		return receipt;
	}

	public void setReceipt(String receipt) {
		this.receipt = receipt;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Operator getOperator() {
		return operator;
	}

	public void setOperator(Operator operator) {
		this.operator = operator;
	}

	public Set<PurAndPro> getPurAndPros() {
		return purAndPros;
	}

	public void setPurAndPros(Set<PurAndPro> purAndPros) {
		this.purAndPros = purAndPros;
	}

	public int getJtFlag() {
		return jtFlag;
	}

	public void setJtFlag(int jtFlag) {
		this.jtFlag = jtFlag;
	}

	@Override
	public String toString() {
		return "Purchase [id=" + id + ", supplier=" + supplier + ", count="
				+ count + ", date=" + date + ", receipt=" + receipt + ", note="
				+ note + ", operator=" + operator + ", purAndPros="
				+ purAndPros + ", jtFlag=" + jtFlag + "]";
	}

}
