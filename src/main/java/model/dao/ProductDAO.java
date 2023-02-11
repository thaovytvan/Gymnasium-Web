package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Product;

public class ProductDAO {

	public ArrayList<Product> getAllProducts() {
		ArrayList<Product> productArray = new ArrayList<Product>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/gymnasium";
			Connection con = DriverManager.getConnection(url, "root","");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT product.ID, NAME, TYPE, IMAGE, DESCRIPTION, PRICE, QUANTITY, CATEGORY "
					+ "FROM product, productimage, productcategory "
					+ "WHERE product.ID = productimage.ID and product.ID=productcategory.PRODUCTID and productimage.choose='1' ");
			while(rs.next()) {
				Product u = new Product();
				u.setId(rs.getInt("ID"));
				u.setName(rs.getString("NAME"));
				u.setType(rs.getInt("TYPE"));
				u.setDesciption(rs.getString("DESCRIPTION"));
				u.setImage(rs.getString("IMAGE"));
				u.setPrice(rs.getInt("PRICE"));
				u.setQuanlity(rs.getInt("QUANTITY"));
				u.setCategory(rs.getString("CATEGORY"));
				productArray.add(u);
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			System.err.println(e);
		}
		return productArray;
	}
	public Product getProduct(int id) {
		ArrayList<Product> productArray = getAllProducts();
		for (Product product : productArray) {
			if(product.getId()==id) return product;
		}
		return null;
	}
	public int countProduct() {
		int count = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/gymnasium";
			Connection con = DriverManager.getConnection(url, "root","");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT SUM(QUANTITY) FROM productcategory");
			while(rs.next()) {
				count = rs.getInt(1);
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			System.err.println(e);
		}
		return count;
	}
	public void deleteProduct(int id) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/gymnasium";
			Connection con = DriverManager.getConnection(url, "root","");
			Statement stmt = con.createStatement();
			stmt.executeUpdate("DELETE FROM product WHERE ID = " + String.valueOf(id));
			stmt.executeUpdate("DELETE FROM productcategory WHERE PRODUCTID = " + String.valueOf(id));
			stmt.close();
		} catch (Exception e) {
			System.err.println(e);
		}
	}
	
	public void updateProduct(int id,String name,String description,String img,String category,int price,int quantity) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/gymnasium";
			Connection con = DriverManager.getConnection(url, "root","");
			Statement stmt = con.createStatement();
			stmt.executeUpdate("UPDATE productcategory set CATEGORY = N'"+category+"', PRICE="+String.valueOf(price)+", QUANTITY="+String.valueOf(quantity)+" WHERE PRODUCTID = "+String.valueOf(id));
			stmt.executeUpdate("UPDATE product set NAME = N'"+name+"', DESCRIPTION = N'"+description+"' WHERE ID = " + String.valueOf(id));
			stmt.executeUpdate("UPDATE productimage set IMAGE = '"+img+"' WHERE ID = '"+String.valueOf(id)+"' AND choose ='1'");
			stmt.close();
		} catch (Exception e) {
			System.err.println(e);
		}
	}
	public void addProduct(String type,String name,String description,String img,String category,int price,int quantity) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/gymnasium";
			Connection con = DriverManager.getConnection(url, "root","");
			Statement stmt = con.createStatement();
			stmt.executeUpdate("INSERT INTO product (NAME, TYPE, DESCRIPTION) VALUES('N"+name+"', "+type+", 'N"+description+"')");
			ResultSet rs = stmt.executeQuery("SELECT ID FROM product ORDER BY ID DESC LIMIT 1");
			if(rs.next()) {
				String id = new String(String.valueOf(rs.getInt("ID")));
				stmt.executeUpdate(" INSERT INTO productcategory (CATEGORY, PRICE, QUANTITY, PRODUCTID) VALUES ( N'"+category+"', "+String.valueOf(price)+", "+String.valueOf(quantity)+","+id+")");
				stmt.executeUpdate("INSERT into productimage VALUES("+id+", '"+img+"',1)");
			}
			stmt.close();
		} catch (Exception e) {
			System.err.println(e);
		}
	}
	public ArrayList<Product> search(String search) {
		ArrayList<Product> productArray = new ArrayList<Product>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/gymnasium";
			Connection con = DriverManager.getConnection(url, "root","");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM("
					+ "	SELECT product.ID, NAME, TYPE, IMAGE, DESCRIPTION, PRICE, QUANTITY, CATEGORY FROM productimage, productcategory, product WHERE product.ID = 	productimage.ID and product.ID=productcategory.PRODUCTID and productimage.choose='1'"
					+ ") as allpro WHERE NAME LIKE N'%"+search+"%' Or TYPE=("
					+ "	CASE"
					+ "    	WHEN 'Thực phẩm chức năng' Like N'%"+search+"%' THEN 1"
					+ "    	ELSE 0"
					+ "    END "
					+ ")"
					+ "OR TYPE=("
					+ "	CASE"
					+ "    	WHEN 'Dụng cụ tập luyện' Like N'%"+search+"%' THEN 2"
					+ "    	ELSE 0"
					+ "    END "
					+ ")");
			while(rs.next()) {
				Product u = new Product();
				u.setId(rs.getInt("ID"));
				u.setName(rs.getString("NAME"));
				u.setType(rs.getInt("TYPE"));
				u.setDesciption(rs.getString("DESCRIPTION"));
				u.setImage(rs.getString("IMAGE"));
				u.setPrice(rs.getInt("PRICE"));
				u.setQuanlity(rs.getInt("QUANTITY"));
				u.setCategory(rs.getString("CATEGORY"));
				productArray.add(u);
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			System.err.println(e);
		}
		return productArray;
	}
}
