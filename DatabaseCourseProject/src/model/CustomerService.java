package model;

import java.util.Arrays;

import model.dao.CustomerDAOJdbc;

public class CustomerService {
	private CustomerDAO dao ;
	public CustomerService(CustomerDAO dao) {
		this.dao = dao;
	}
	public static void main(String[] args) {
		CustomerDAO dao = new CustomerDAOJdbc();
		
		CustomerService service = new CustomerService(dao);
		CustomerBean bean = service.login("Alex", "A");
		System.out.println(bean);
		
		
		service.changePassword("Ellen", "EEE", "E");
	}
	public boolean changePassword(String username, String oldPassword, String newPassword) {
		if(newPassword!=null && newPassword.length()!=0) {
			CustomerBean bean = this.login(username, oldPassword);
			if(bean!=null) {
				byte[] temp = newPassword.getBytes();	//使用者輸入byte[]
				return dao.update(temp, bean.getEmail(), bean.getBirth(), username);
			}
		}
		return false;
	}
	public CustomerBean login(String username, String password) {
		if(password!=null && password.length()!=0) {
			CustomerBean bean = dao.select(username);
			if(bean!=null) {	
				byte[] temp = password.getBytes();	//使用者輸入byte[]
				byte[] pass = bean.getPassword();	//資料庫抓出byte[]
				if(Arrays.equals(temp, pass)) {
					return bean;
				}
			}	
		}
		return null;
	}
}
