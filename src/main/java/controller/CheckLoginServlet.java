package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.User;
import model.bo.UserBO;



@WebServlet("/CheckLoginServlet")
public class CheckLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckLoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String password = req.getParameter("password-login");
		String email = req.getParameter("email-login");
		User user = new User();
		
		if(password== null||email== null) {
			
			user = (User)req.getSession().getAttribute("currentUser");
			
		}else {
			UserBO userBO = new UserBO();
			user = userBO.getUserByPassEmail(email, password);
		}
		if(user.getPassword() == null){
			String mess = "Login khong thanh cong. Sai password, email.";
			req.getSession().setAttribute("mess", mess);
			resp.sendRedirect("view/Homepage.jsp");
		}
		else if(user.getPermission()== -1) {			
			String mess = "Login khong thanh cong. Tai khoan cua ban da bi khoa.";
			req.getSession().setAttribute("mess", mess);
			resp.sendRedirect("view/Homepage.jsp");
		} 
		else if(user.getPermission()== 1){
			String destination = "/UserServlet";
			
			req.getSession().setAttribute("currentUser", user);
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(req, resp);
		}else if(user.getPermission()== 0) {
			String destination = "/UserServlet?action=update&id="+user.getId();
			req.getSession().setAttribute("currentUser", user);
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
			rd.forward(req, resp);
			
		}
	}

}
