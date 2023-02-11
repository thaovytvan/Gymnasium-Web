package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.User;
import model.bo.UserBO;

@WebServlet("/UserServlet")
public class UserSeverlet extends HttpServlet{

	UserBO userBO = new UserBO();
	private static final long serialVersionUID = 1L;
	String destination = null;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		if(req.getQueryString()==null || req.getParameter("searchinput")!=null) {
			
			UserManager(req, resp);
		}else {
			String id = req.getParameter("id");
			String action = req.getParameter("action");
			switch (action) {
			case "update": {
				
				openUpdateUserPage(req,resp,id);
				break;
			}
			case "update-infor":{
				updateUser(req,resp,id);
				break;
			}
			case "update-phone-address":{
				updatePhoneAddress(req,resp,id);
				break;
			}
			case "change-password":{
				changePassword(req,resp,id);
				break;
			}
			case "ban":{
				setPermission(req,resp,id,-1);
				break;
			}
			case "unban":{
				setPermission(req,resp,id,0);
				break;
			}
			case "delete":{
				deleteUser(req,resp,id);
				break;
			}
			default:
				
				break;
			}
		}
		
	}
	protected void openUpdateUserPage(HttpServletRequest req, HttpServletResponse resp, String id) throws ServletException, IOException {
		User user = userBO.getUserById(id);
		req.setAttribute("user", user);
		
		destination= "/view/UserInfor.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
		rd.forward(req, resp);
	}
	protected void updateUser(HttpServletRequest req, HttpServletResponse resp, String id) throws ServletException, IOException {
		String email = req.getParameter("email").trim();
		String phonenum = req.getParameter("phonenum").trim();
		String address = new String(req.getParameter("address").trim().getBytes("iso-8859-1"), "utf-8");
		String username = new String(req.getParameter("username").trim().getBytes("iso-8859-1"), "utf-8");
		
		userBO.updateUser(id, username, address, phonenum, email);
		String mess = "Cap nhat thanh cong.";
		req.setAttribute("mess", mess);
		
		openUpdateUserPage(req,resp,id);
	}
	protected void updatePhoneAddress(HttpServletRequest req, HttpServletResponse resp, String id) throws ServletException, IOException {
		if(req.getParameter("phonenum")== null && req.getParameter("address")== null) {}
		else if(req.getParameter("phonenum")== "" && req.getParameter("address")== "") {}
		else if(req.getParameter("address")==null || req.getParameter("address")== ""){
			String phonenum = req.getParameter("phonenum");
			userBO.updatePhonenum(id, phonenum);
		}else if(req.getParameter("phonenum")==null || req.getParameter("phonenum")== "")
		{
			String address = address = new String(req.getParameter("address").trim().getBytes("iso-8859-1"), "utf-8");
			userBO.updateAddress(id, address);
		}else {
			String phonenum = req.getParameter("phonenum");
			String address = address = new String(req.getParameter("address").trim().getBytes("iso-8859-1"), "utf-8");
			userBO.updateUser(id, address, phonenum);
		}
		UserManager(req,resp);
	}
	protected void changePassword(HttpServletRequest req, HttpServletResponse resp, String id) throws ServletException, IOException {
		String newpass = req.getParameter("newpass").trim();
		String password = req.getParameter("password").trim();
		
		User user = userBO.getUserById(id);
		if(user.getPassword().trim().equals(password)) {
			userBO.changePassword(id, newpass);
			String mess = "Doi mat khau thanh cong";
			req.setAttribute("mess", mess);
		}
		else{
			String mess = "Doi mat khau khong thanh cong. Sai mat khau cu.";
			req.setAttribute("mess", mess);
		}
		
		openUpdateUserPage(req,resp,id);
	}
	protected void setPermission(HttpServletRequest req, HttpServletResponse resp, String id, int permisstion) throws ServletException, IOException {
		userBO.setPermission(id, permisstion);
		UserManager(req, resp);
	}
	protected void deleteUser(HttpServletRequest req, HttpServletResponse resp, String id) throws ServletException, IOException {
		userBO.deleteUser(id);
		UserManager(req, resp);
	}
	protected void UserManager(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ArrayList<User> userArray = new ArrayList<User>();
		
		if(req.getParameter("searchinput")== null) {
			userArray = userBO.getAllUser();
		}else {
			String searchinput =  new String(req.getParameter("searchinput").trim().getBytes("iso-8859-1"), "utf-8");
			
			userArray = userBO.searchUser(searchinput);
			req.setAttribute("searchinput", searchinput);
		}
		
		req.setAttribute("userArray", userArray);
		destination= "/view/UserManager.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
		rd.forward(req, resp);
	}
}
