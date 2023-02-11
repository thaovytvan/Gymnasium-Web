package model.bo;

import java.util.ArrayList;

import model.bean.Product;
import model.dao.ProductDAO;


public class ProductBO {
	ProductDAO productDAO = new ProductDAO();
	public ArrayList<Product> getAllProducts(){
		return productDAO.getAllProducts();
	}
	public int countProduct() {
		return productDAO.countProduct();
	}
	public void deleteProduct(int id) {
		productDAO.deleteProduct(id);
	}
	public Product getProduct(int id) {
		return productDAO.getProduct(id);
	}
	public void updateProduct(int id,String name,String description,String img,String category,int price,int quantity) {
		productDAO.updateProduct(id, name, description, img, category, price,quantity);
	}
	public void addProduct(String type,String name,String description,String img,String category,int price,int quantity) {
		productDAO.addProduct(type, name, description, img, category, price,quantity);
	}
	public ArrayList<Product> search(String search){
		return productDAO.search(search);
	}
	public ProductBO() {
		// TODO Auto-generated constructor stub
	}

}
