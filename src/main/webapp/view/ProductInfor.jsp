<%@page import="model.bean.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="uft-8">
<meta charset="utf-8">
	<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon"  href="images/logo.png">
    <!-- Bootstrap CSS -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- custom css -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript"></script>
    <link href="css/Homepage-style.css" rel="stylesheet" type="text/css">
    <link href="css/product.css" rel="stylesheet">
    <link href="css/all_two.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/8cb7e9dea8.js" crossorigin="anonymous"></script>
<title>Update</title>
</head>
<body>
	<div class="admin-page d-flex">
        <div class="sidebar">
            <%@include file="Side-bar.jsp" %>
        </div>
        <div class="content">
        	<% Product product = (Product)request.getAttribute("productUpdate"); %>
			<h1 class='text-center mb-3' style='color: #ff871d'>Quản lý sản phẩm</h1>
			<div id="liveAlertPlaceholder"></div>
			<div class='row d-flex align-items-center'>
			    <div class='col-md-4 col-12 mt-5'>
			        <img src='<%= product.getImage() %>' width='100%' style='border-radius: 10px'>
			    </div>
			    <div class='col-md-8 col-12'>
			        <form action="ProductServlet?action=updateProduct" method='POST'>
			        	<input type='hidden' name='product_id_update' value='<%= product.getId() %>'>
			            <h5 class='text-center mb-3' style='color: #ff871d'>Chỉnh sửa sản phẩm</h5>
			            <div class='mb-3'>
			                <label for="name" class="form-label">Tên sản phẩm</label>
			                <input type="text" class="form-control" name="name" value='<%= product.getName() %>' required>
			            </div>
			            <div class='mb-3'>
			                <label for="description" class="form-label">Mô tả sản phẩm</label>
			                <textarea class="form-control" name="description" rows='3' maxlength='10000' value='<%= product.getDesciption() %>' required><%= product.getDesciption() %></textarea>
			            </div>
			            <div class='mb-3'>
			                <label for="image" class="form-label">Hình ảnh sản phẩm</label>
			                <textarea class="form-control" name="image" rows='2' required><%= product.getImage() %></textarea>
			            </div>
			            <div class='mb-3'>
			                <label for="cate1" class="form-label">Tên phân loại</label>
			                <input type="text" class="form-control" name="cate1" value='<%= product.getCategory()  %>' required>
			            </div>
			            <div class='mb-3'>
			                <label for="price1" class="form-label">Giá</label>
			                <input type="text" class="form-control" name="price1" value='<%= product.getPrice() %>' required>
			            </div>
			            <div class='mb-3'>
			                <label for="quantity1" class="form-label">Số lượng</label>
			                <input type="text" class="form-control" name="quantity1" value='<%= product.getQuanlity() %>' required>
			            </div>
			            <div class='text-center'>
			                <button type='submit' class='btn btn-primary mt-3' name='edit'>Lưu thay đổi</button>
			            </div>
			        </form>
			    </div>
			</div>
        </div>
     </div>
</body>
</html>