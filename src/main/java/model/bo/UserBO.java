package model.bo;

import java.util.ArrayList;

import model.bean.User;
import model.dao.UserDAO;

public class UserBO {
	UserDAO userDAO = new UserDAO();
	public ArrayList<User> getAllUser(){
		return userDAO.getAllUser();
	}
	public User getUserById(String id){
		return userDAO.getUserById(id);
	}
	public void updateUser(String id, String username, String address, String phonenum, String email) {
		userDAO.updateUser(id, username, address, phonenum, email);
	}
	public void updateUser(String id,  String address, String phonenum) {
		userDAO.updateUser(id, address, phonenum);
	}
	public void updatePhonenum(String id, String phonenum) {
		userDAO.updatePhonenum(id, phonenum);
	}
	public void updateAddress(String id,  String address) {
		userDAO.updateAddress(id, address);
	}
	public void changePassword(String id, String password) {
		userDAO.changePassword(id, password);
	}
	public void setPermission(String id, int permission) {
		userDAO.setPermisstion(id, permission);
	}
	public void deleteUser(String id) {
		userDAO.deleteUser(id);
	}
	public ArrayList<User> searchUser(String searchinput){
		return userDAO.searchUser(searchinput);
	}
	public User getUserByPassEmail(String email, String password) {
		return userDAO.getUserByPassEmail(email, password);
	}
	public boolean isExistUser(String email) {
		return userDAO.isExistUser(email);
	}
	public void addUser(String username, String email, String paswword) {
		userDAO.addUser(username,email,paswword);
	}
}
