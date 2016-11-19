package model;

import java.util.ArrayList;
import java.util.List;

import model.dao.ProductDAOJdbc;

public class ProductService {
	private ProductDAO dao;
	public ProductService(ProductDAO dao) {
		this.dao = dao;
	}
	
	public List<ProductBean> select(ProductBean bean) {
		List<ProductBean> result = null;
		if(bean!=null && bean.getId()!=0) {
			ProductBean temp = dao.select(bean.getId());
			if(temp!=null) {
				result = new ArrayList<ProductBean>();
				result.add(temp);
			}
		} else {
			result = dao.select(); 
		}
		return result;
	}
	public ProductBean insert(ProductBean bean) {
		ProductBean result = null;
		if(bean!=null) {
			result = dao.insert(bean);
		}
		return result;
	}
	public ProductBean update(ProductBean bean) {
		ProductBean result = null;
		if(bean!=null) {
			result = dao.update(bean.getName(), bean.getPrice(),
					bean.getMake(), bean.getExpire(), bean.getId());
		}
		return result;
	}
	public boolean delete(ProductBean bean) {
		boolean result = false;
		if(bean!=null) {
			System.out.println("In_delete");
			result = dao.delete(bean.getId());
		}
		return result;
	}
	public static void main(String[] args) {
		ProductService service = new ProductService(new ProductDAOJdbc());
		List<ProductBean> beans = service.select(null);
		System.out.println("beans="+beans);
	}
}
