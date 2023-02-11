<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import = "model.bean.User"%>

<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon"  href="images/logo.png">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
	
    <!-- custom css -->
    <link href="css/Homepage-style.css" rel="stylesheet" type="text/css">
    <link href="css/all.min.css" rel="stylesheet" type="text/css">
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
    
    <title>Quản Lý</title>
  </head>
<body>
	<%
	 	ArrayList<User> userArray = (ArrayList<User>)request.getAttribute("userArray");
	   	int baned = 0;
	    for(User u:userArray){
	 		if(u.getPermission()==-1){
	        	baned++;
	        }
	    }
	    String searchinput="";
	    if(request.getAttribute("searchinput")!=null){
	    	searchinput = (String)request.getAttribute("searchinput");
	    }
	%>   	

	<div class="admin-page d-flex">
        <div class="sidebar">
            <%@include file="Side-bar.jsp" %>
        </div>
        <div class="content">
	        <h1 class='text-center mb-3' style='color: #ff871d'>Quản lý thành viên</h1>
			<div class='row d-flex justify-content-center'>
			    <div class='col-md-4 card-overall'>
			        <div class='card shadow' style='border-left: .25rem solid #4e73df!important'>
			            <div class='card-body'>
			                <div class='row no-gutters align-items-center'>
			                    <div class="col">
			                        <div class="title mb-1" style='color: #4e73df'>Số thành viên hiện tại</div>
			                        <div class="number mb-0"><%= userArray.size() %></div>
			                    </div>
			                    <div class="col-auto">
			                        <i class="fas fa-calendar fa-2x" style='color: #dddfeb'></i>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			    <div class='col-md-4 card-overall'>
			        <div class='card shadow' style='border-left: .25rem solid #1cc88a!important'>
			            <div class='card-body'>
			                <div class='row no-gutters align-items-center'>
			                    <div class="col">
			                        <div class="title mb-1" style='color: #1cc88a'>Số thành viên bị cấm hiện tại</div>
			                        <div class="number mb-0"><%= baned %></div>
			                    </div>
			                    <div class="col-auto">
			                        <i class="fas fa-calendar fa-2x" style='color: #dddfeb'></i>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
			
			<div class="search">
			<form action="UserServlet?action=search">
				<input type="text" name="searchinput" id="searchinput" 
				value="<%= searchinput %>" placeholder="Tìm kiếm" autoComplete="off" />
           		<button type="submit" class="normal-circle-btn">
                	<i class="fas fa-search"></i>
           		</button>
			</form>
            </div>
            
			<div class="table-data">
				
				<table class="table">
			        <thead>
			            <tr>
			                <th>#</th>
			                <th>Tên người dùng</th>
			                <th>Email</th>
			                <th>Số điện thoại</th>
			                <th>Địa chỉ</th>
			                <th>Cập nhật thông tin</th>
			                <th>Cấm thành viên</th>
			                <th>Xóa thành viên</th>
			            </tr>
			        </thead>
			        <tbody class="table-body">
			        <%for(int i=0;i<userArray.size();i++){ %>
			            <tr>
			            	<form action="UserServlet?action=update-phone-address&id=<%= userArray.get(i).getId() %>" method='post'>
			            	<td><%= i+2 %></td>
			            	<td><%= userArray.get(i).getUsername() %></td>
			            	<td><%= userArray.get(i).getEmail() %></td>
			            	 <%if(userArray.get(i).getPhonenum() != null && userArray.get(i).getPhonenum() != ""){ %>
			            	 	<td><%= userArray.get(i).getPhonenum() %></td>
			            	 <%} else {%>
			            	 	<td><input type="text" name="phonenum" pattern="[0-9]{8,}" title="Have more than 8 numbers and don't contain letters"></td>
			            	<%} %>
			            	<%if(userArray.get(i).getAddress() != null && userArray.get(i).getAddress()!=""){ %>
			            	 	<td><%= userArray.get(i).getAddress() %></td>
			            	 <%} else {%>
			            	 	<td><input type="text" name="address"></td>
			            	<%} %>
			            	
			            	<td>
			            			<%if(userArray.get(i).getPhonenum() == null || userArray.get(i).getAddress()== null
			            			|| userArray.get(i).getPhonenum() == "" || userArray.get(i).getAddress()==""){ %>
			            				<input type="submit" class="btn btn-primary" value="Cập nhật">
			            			<%} else { %>
			            				<input type="submit" class="btn btn-primary" value="Cập nhật" disabled>
			            				<%} %>
			            		</form>
			            	</td>
			            	<td>
			            		<% if(userArray.get(i).getPermission() == -1) {%>
				            		<form action="UserServlet?action=unban&id=<%= userArray.get(i).getId() %>" method='post'>
				            			<input type="submit" class="btn btn-danger" value="Hủy cấm">
				            		</form>
			            		<%}else{ %>
			            			<form action="UserServlet?action=ban&id=<%= userArray.get(i).getId() %>" method='post'>
				            			<input type="submit" class="btn btn-danger" value="Cấm">
				            		</form>
			            		<%} %>
			            	</td>
			            	<td>
			            		<form action="UserServlet?action=delete&id=<%= userArray.get(i).getId() %>" method='post'>
			            			<input type="submit" class="btn btn-danger" 
			            			onclick="return confirm('Bạn có chắn chắn xóa tài khoản của thành viên này không?')" value="Xóa">
			            		</form>
			            	</td>
			            </tr>
			        <%} %>
			        </tbody>
			
			    </table>
			</div>
        </div>    
    </div>
</body>
</html>