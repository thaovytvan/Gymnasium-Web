package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Product;
import model.bean.User;
import model.bo.ProductBO;
import model.bo.UserBO;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet{

	public ProductServlet() {
		// TODO Auto-generated constructor stub
	}
	private static final long serialVersionUID = 1L;
	private ProductBO productBO = new ProductBO();
	private String destination = null;
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String actionString = req.getParameter("action");
			switch (actionString) {
				case "update": {
					update(req, resp);
					break;
				}
				case "delete": {
					delete(req, resp);	
					break;
				}
				default:
					
			}
		} catch (NullPointerException e) {
			home(req, resp, null);
		}
//		try {
////			
////			else {
////				doPost(req, resp);
////			}
////			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
////			rd.forward(req, resp);
//		} catch (Exception e) {
//			System.out.println(e);
//		}
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String actionString = req.getParameter("action");
		switch (actionString) {
		case "updateProduct": {
			updateProduct(req, resp);
			break;
		}
		case "add": {
			add(req, resp);
			break;
		}
		case "search": {
			search(req, resp);
			break;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + actionString);
		}
	}
	public void home(HttpServletRequest req, HttpServletResponse resp, String message) throws ServletException, IOException {
		ArrayList<Product> productArray = new ArrayList<Product>();
		productArray = productBO.getAllProducts();
		req.setAttribute("productArray", productArray);
		req.setAttribute("countProduct", productBO.countProduct());
		if(message!=null) {
			req.setAttribute("message", message);
		}
		destination= "/view/ProductManager.jsp";
		req.getRequestDispatcher(destination).forward(req, resp);
	}
	public void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Product product = productBO.getProduct(Integer.valueOf(req.getParameter("id")));
		req.setAttribute("productUpdate", product);
		destination= "/view/ProductInfor.jsp";
		req.getRequestDispatcher(destination).forward(req, resp);
	}
	public void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("delete");
		productBO.deleteProduct(Integer.valueOf(req.getParameter("id")));
		home(req, resp, "Da xoa thanh cong!");
	}
	public void updateProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.valueOf(req.getParameter("product_id_update"));
		String name = new String(req.getParameter("name").trim().getBytes("iso-8859-1"), "utf-8");
		String description = new String(req.getParameter("description").trim().getBytes("iso-8859-1"), "utf-8");
		String img = req.getParameter("image");
		String category = new String(req.getParameter("cate1").trim().getBytes("iso-8859-1"), "utf-8");
		int price = Integer.valueOf(req.getParameter("price1"));
		int quantity = Integer.valueOf(req.getParameter("quantity1"));
		productBO.updateProduct(id, name, description, img, category, price, quantity);
		home(req, resp, "Cap nhat thanh cong!");
	}
	public void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String type = req.getParameter("type");
		String name = new String(req.getParameter("name").trim().getBytes("iso-8859-1"), "utf-8");
		String description = new String(req.getParameter("description").trim().getBytes("iso-8859-1"), "utf-8");
		String img = req.getParameter("image");
		String category = new String(req.getParameter("cate1").trim().getBytes("iso-8859-1"), "utf-8");
		int price = Integer.valueOf(req.getParameter("price1"));
		int quantity = Integer.valueOf(req.getParameter("quantity1"));
		productBO.addProduct(type, name, description, img, category, price, quantity);
		home(req, resp, "Da them thanh cong!");
	}
	public void search(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String search=new String(req.getParameter("search").trim().getBytes("iso-8859-1"), "utf-8");
		ArrayList<Product> productArray = new ArrayList<Product>();
		productArray=productBO.search(search);
		req.setAttribute("productArray", productArray);
		destination= "/view/ProductManager.jsp";
		req.getRequestDispatcher(destination).forward(req, resp);
	}
}
