package service;

import java.util.List;

import bean.Operator;

public interface OperatorService {

	public List<Operator> searchAll();
	
	public List<Operator> search(Operator operator);

	public int add(Operator operator);

	public Operator searchById(Operator operator);

	public int modify(Operator operator);

	public int delete(Operator operator);

}
