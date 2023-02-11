package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.UserBO;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = req.getParameter("username-register");
		String email = req.getParameter("email-register");
		String password = req.getParameter("password-register");
		
		
		UserBO userBO = new UserBO();
		String mess="";
		if(!userBO.isExistUser(email)) {
			userBO.addUser(username,email,password);
			mess = "Dang ky tai khoan thanh cong.";
		}else {
			mess = "Dang ky khong thanh cong. Email nay da ton tai. Vui long nhap email khac.";
		}
		req.getSession().setAttribute("mess", mess);
		resp.sendRedirect("view/Homepage.jsp");
	}
}
