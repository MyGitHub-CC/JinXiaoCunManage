package dao;

import java.util.List;

import bean.Operator;

public interface OperatorDao {

	public List<Operator> searchAll();

	public List<Operator> search(Operator operator);

	public int add(Operator operator);

	public Operator searchById(Operator operator);

	public int update(Operator operator);

	public int delete(Operator operator);

}
