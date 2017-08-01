package bean;

import java.util.Set;

public class Sales {
	private int id;
	private Customer customer;
	private double count;
	private String date;
	private String receipt;
	private String note;
	private Operator operator;
	private Set<SalAndPro> salAndPros;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
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

	public Set<SalAndPro> getSalAndPros() {
		return salAndPros;
	}

	public void setSalAndPros(Set<SalAndPro> salAndPros) {
		this.salAndPros = salAndPros;
	}

	@Override
	public String toString() {
		return "Sales [id=" + id + ", customer=" + customer + ", count="
				+ count + ", date=" + date + ", receipt=" + receipt + ", note="
				+ note + ", operator=" + operator + ", salAndPros="
				+ salAndPros + "]";
	}

}
