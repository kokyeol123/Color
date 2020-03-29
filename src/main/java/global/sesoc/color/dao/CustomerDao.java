package global.sesoc.color.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.color.vo.Customer;

@Repository
public class CustomerDao {
	@Autowired
	SqlSession session;

	public int signup(Customer customer) {
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		int result = mapper.signup(customer);
		
		return result;
	}

	public Customer selectOne(Customer customer) {
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		Customer c = mapper.selectOne(customer);
		
		return c;
	}

	public void modifyCustomer(Customer customer) {
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		mapper.modifyCustomer(customer);
		
	}

	public void deleteCustomer(String custid) {
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		mapper.deleteCustomer(custid);
		
	}
	
	public void keyalter(String custid) {
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		mapper.keyalter(custid);
		
	}
}
