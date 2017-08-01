package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import service.OperatorService;
import bean.Operator;
import dao.OperatorDao;

@Service
public class OperatorServiceImpl implements OperatorService {
	@Resource
	OperatorDao operatorDao;

	@Override
	public List<Operator> searchAll() {
		return operatorDao.searchAll();
	}

	@Override
	public List<Operator> search(Operator operator) {
		return operatorDao.search(operator);
	}

	@Override
	public int add(Operator operator) {
		return operatorDao.add(operator);
	}

	@Override
	public Operator searchById(Operator operator) {
		return operatorDao.searchById(operator);
	}

	@Override
	public int modify(Operator operator) {
		return operatorDao.update(operator);
	}

	@Override
	public int delete(Operator operator) {
		return operatorDao.delete(operator);
	}

}
