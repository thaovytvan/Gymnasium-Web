<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import = "model.bean.User"%>

<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
	
    <!-- custom css -->
    <link href="../css/style.css" rel="stylesheet">
    
    <link href="../css/all.min.css" rel="stylesheet">
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript"></script>
    
    
    <title>Quản Lý</title>
    
  </head>
<body>
	<div class="admin-page d-flex">
        <div class="sidebar">
            <%@include file="Side-bar.jsp" %>
        </div>
   
        <div class="content">
        <%ArrayList<User> userArray = (ArrayList<User>)request.getAttribute("userArray");%>
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
                        <div class="number mb-0">aaaa</div>
                    </div>
                    <div class="col-auto">
                        <i class="fas fa-calendar fa-2x" style='color: #dddfeb'></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
            	<td><%= i+1 %></td>
            	<td><%= userArray.get(i).getUsername() %></td>
            	<td><%= userArray.get(i).getEmail() %></td>
            	<td><%= userArray.get(i).getPhonenum() %></td>
            	<td><%= userArray.get(i).getAddress() %></td>
            	<td>
            		<form action="UserServlet?update=<%= userArray.get(i).getId() %>" method='post'>
            			<input type="submit" class="btn btn-primary" value="Cập nhật"></button>
            		</form>
            	</td>
            	<td>
            		<% if(userArray.get(i).getPermission() == -1) {%>
	            		<form action="UserServlet?unban=<%= userArray.get(i).getId() %>" method='post'>
	            			<input type="submit" class="btn btn-primary" value="Hủy cấm"></button>
	            		</form>
            		<%}else{ %>
            			<form action="UserServlet?ban=<%= userArray.get(i).getId() %>" method='post'>
	            			<input type="submit" class="btn btn-primary" value="Cấm"></button>
	            		</form>
            		<%} %>
            	</td>
            	<td>
            		<form action="UserServlet?delete=<%= userArray.get(i).getId() %>" method='post'>
            			<input type="submit" class="btn btn-primary" value="Xóa"></button>
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