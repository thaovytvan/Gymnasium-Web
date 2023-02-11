package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.User;

public class UserDAO {
	public ArrayList<User> getAllUser() {
		ArrayList<User> userArray = new ArrayList<User>();
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost/gymnasium";
			Connection con = DriverManager.getConnection(url, "root","");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = stmt.executeQuery("SELECT * FROM user where id != 1");

			while(rs.next()) {
				User u = new User();
				u.setId(rs.getInt("ID"));
				u.setEmail(rs.getString("EMAIL"));
				u.setPassword(rs.getString("PASSWORD"));
				u.setUsername(rs.getNString("USERNAME"));
				u.setAddress(rs.getNString("ADDRESS"));
				u.setImage(rs.getString("IMAGE"));
				u.setPhonenum(rs.getString("PHONENUM"));
				u.setPermission(rs.getInt("PERMISSION"));
				
				userArray.add(u);
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return userArray;
	}
	public User getUserById(String id) {
		User u = new User();
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost/gymnasium";
			Connection con = DriverManager.getConnection(url, "root","");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = stmt.executeQuery("SELECT * FROM user where id = '"+id+"'");
			while(rs.next()) {
				u.setId(rs.getInt("ID"));
				u.setEmail(rs.getString("EMAIL"));
				u.setPassword(rs.getString("PASSWORD"));
				u.setUsername(rs.getNString("USERNAME"));
				u.setAddress(rs.getNString("ADDRESS"));
				u.setImage(rs.getString("IMAGE"));
				u.setPhonenum(rs.getString("PHONENUM"));
				u.setPermission(rs.getInt("PERMISSION"));
				
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return u;
	}
	public User getUserByPassEmail(String email, String password) {
		User u = new User();
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost/gymnasium";
			Connection con = DriverManager.getConnection(url, "root","");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = stmt.executeQuery(
					"SELECT * FROM user where email = '"+email+"' and password = '"+password+"'");
			while(rs.next()) {
				u.setId(rs.getInt("ID"));
				u.setEmail(rs.getString("EMAIL"));
				u.setPassword(rs.getString("PASSWORD"));
				u.setUsername(rs.getNString("USERNAME"));
				u.setAddress(rs.getNString("ADDRESS"));
				u.setImage(rs.getString("IMAGE"));
				u.setPhonenum(rs.getString("PHONENUM"));
				u.setPermission(rs.getInt("PERMISSION"));
				
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return u;
	}
	
	public void updateUser(String id, String username, String address, String phonenum, String email) {
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost/gymnasium";
			Connection con = DriverManager.getConnection(url, "root","");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			stmt.executeUpdate("UPDATE user SET email = '"+email+"',address = N'"+address+"',phonenum = '"+phonenum+"',"
					+ "username = N'"+username+"' WHERE id = "+id);
			
			stmt.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public void updateUser(String id, String address, String phonenum) {
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost/gymnasium";
			Connection con = DriverManager.getConnection(url, "root","");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			stmt.executeUpdate("UPDATE user SET address = N'"+address+"',phonenum = '"+phonenum+"' WHERE id = "+id);
			
			stmt.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public void updatePhonenum(String id,String phonenum) {
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost/gymnasium";
			Connection con = DriverManager.getConnection(url, "root","");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			stmt.executeUpdate("UPDATE user SET phonenum = '"+phonenum+"' WHERE id = "+id);
			
			stmt.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public void updateAddress(String id, String address) {
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost/gymnasium";
			Connection con = DriverManager.getConnection(url, "root","");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			stmt.executeUpdate("UPDATE user SET address = N'"+address+"' WHERE id = "+id);
			
			stmt.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public void changePassword(String id, String password) {
			try {
	
				Class.forName("com.mysql.cj.jdbc.Driver");
				String url = "jdbc:mysql://localhost/gymnasium";
				Connection con = DriverManager.getConnection(url, "root","");
				Statement stmt = con.createStatement();
				stmt.executeUpdate("UPDATE user SET password = '"+password+"' WHERE id = "+id);
				
				stmt.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
	}
	public void setPermisstion(String id, int permission) {
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost/gymnasium";
			Connection con = DriverManager.getConnection(url, "root","");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			stmt.executeUpdate("UPDATE user SET permission = "+permission+" WHERE id = "+id);
			
			stmt.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public void deleteUser(String id) {
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost/gymnasium";
			Connection con = DriverManager.getConnection(url, "root","");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			stmt.executeUpdate("DELETE FROM user WHERE id = "+id);
			
			stmt.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public ArrayList<User> searchUser(String searchinput) {
		ArrayList<User> userArray = new ArrayList<User>();
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost/gymnasium";
			Connection con = DriverManager.getConnection(url, "root","");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = stmt.executeQuery("SELECT * FROM user where id != 1 and (email like '%"+searchinput+
					"%'or address like N'%"+searchinput+"%'or phonenum like '%"+searchinput+"%' or username like N'%"+searchinput+"%')");

			while(rs.next()) {
				User u = new User();
				u.setId(rs.getInt("ID"));
				u.setEmail(rs.getString("EMAIL"));
				u.setPassword(rs.getString("PASSWORD"));
				u.setUsername(rs.getNString("USERNAME"));
				u.setAddress(rs.getNString("ADDRESS"));
				u.setImage(rs.getString("IMAGE"));
				u.setPhonenum(rs.getString("PHONENUM"));
				u.setPermission(rs.getInt("PERMISSION"));
				
				userArray.add(u);
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return userArray;
	}
	public void addUser(String username, String email, String password) {
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost/gymnasium";
			Connection con = DriverManager.getConnection(url, "root","");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			stmt.executeUpdate("INSERT INTO user(username,email,password,permission) VALUES('"+username+"','"+email+"','"+password+"',0)");
			
			stmt.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public boolean isExistUser(String email) {
		boolean result = true;
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost/gymnasium";
			Connection con = DriverManager.getConnection(url, "root","");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = stmt.executeQuery("SELECT * FROM user where email = '"+email+"'");
			
			rs.last();
			if(rs.getRow()==0) {
				result = false;
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			System.out.println(e ) ;
		}
		return result;
	}
}
