package global.sesoc.color.dao;

import global.sesoc.color.vo.Customer;

public interface CustomerMapper {

	public int signup(Customer customer);

	public Customer selectOne(Customer customer);

	public void modifyCustomer(Customer customer);

	public void deleteCustomer(String custid);
}
