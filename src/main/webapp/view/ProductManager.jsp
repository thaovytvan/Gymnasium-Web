<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language="java" import = "model.bean.Product"%>
    <%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Quản lí sản phẩm</title>
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
         <link href="css/product.css" rel="stylesheet" type="text/css"> 
    <link href="css/all_two.min.css" rel="stylesheet" type="text/css">

    <script src="https://kit.fontawesome.com/8cb7e9dea8.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="admin-page d-flex">
        <div class="sidebar">
            <%@include file="Side-bar.jsp" %>
        </div>
   
        <div class="content">
	        <%
	        ArrayList<Product> productArray = (ArrayList<Product>)request.getAttribute("productArray");
	        int countProduct=0;
	        for(Product product:productArray){
	        	countProduct+=product.getQuanlity();
	        }
	        %>
	        <h1 class='text-center mb-3' style='color: #ff871d'>Quản lý sản phẩm</h1>
			<div id="liveAlertPlaceholder"></div>
	<!-- thong ke -->
			<div class='row d-flex justify-content-center'>
			    <div class='col-md-4 card-overall'>
			        <div class='card shadow' style='border-left: .25rem solid #4e73df!important'>
			            <div class='card-body'>
			                <div class='row no-gutters align-items-center'>
			                    <div class="col">
			                        <div class="title mb-1" style='color: #4e73df'>Số lượng mặt hàng</div>
			                        <div class="number mb-0"><%= productArray.size() %></div>
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
			                        <div class="title mb-1" style='color: #1cc88a'>Sản phẩm trong kho</div>
			                        <div class="number mb-0"><%= countProduct %></div>
			                    </div>
			                    <div class="col-auto">
			                        <i class="fas fa-calendar fa-2x" style='color: #dddfeb'></i>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
	<!--  -->
	<!-- Thêm sản phẩm -->		
				<div class="search">
				  <form action="ProductServlet?action=search" class="form-inline" method="post">
				    <input  type="search" placeholder="Tìm kiếm" name="search" >
				    <button  type="submit" class="normal-circle-btn">
                	<i class="fas fa-search"></i></button>
				  </form>
				</div>

			    <button type="button" class='btn btn-primary btn-add' data-bs-toggle="modal" data-bs-target="#addProduct" >Thêm sản phẩm mới</button>
			    <div class='head-product d-flex justify-content-end mt-3'>
			    <div class=" fade show wrap-shadow" aria-modal="true" id="addProduct">
			        <div class="modal-dialog">
			            <div class="modal-content">
			                <div class="modal-header">
			                    <h5 class="modal-title" id="addProductLabel">Thêm sản phẩm mới</h5>
			                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			                </div>
			                <div class="modal-body">
			                    <form action="ProductServlet?action=add" method='POST'>
			                        <div class='mb-3'>
			                            <label for="name" class="form-label">Vui lòng chọn loại sản phẩm</label>
			                            <select class="form-select" name="type" aria-label="Select type" required>
			                                <option selected disabled>-- Loại sản phẩm --</option>
			                                <option value="1">Thực phẩm dinh dưỡng</option>
			                                <option value="2">Dụng cụ tập luyện</option>
			                            </select>
			                        </div>
			                        <div class='mb-3'>
			                            <label for="name" class="form-label">Tên sản phẩm</label>
			                            <input type="text" class="form-control" name="name" required>
			                        </div>
			                        <div class='mb-3'>
			                            <label for="description" class="form-label">Mô tả sản phẩm</label>
			                            <textarea class="form-control" name="description" rows='3' maxlength='10000' required></textarea>
			                        </div>
			                        <div class='mb-3'>
			                            <label for="image" class="form-label">Hình ảnh sản phẩm</label>
			                            <textarea class="form-control" name="image" rows='3' placeholder='Điền link hình ảnh cho sản phẩm' required></textarea>
			                        </div>
			                        <div class='mb-3'>
			                            <label for="cate1" class="form-label">Tên phân loại</label>
			                            <input type="text" class="form-control" name="cate1" required>
			                        </div>
			                        <div class='mb-3'>
			                            <label for="price1" class="form-label">Giá</label>
			                            <input type="text" class="form-control" name="price1" required>
			                        </div>
			                        <div class='mb-3'>
			                            <label for="quantity1" class="form-label">Số lượng</label>
			                            <input type="text" class="form-control" name="quantity1" required>
			                        </div>
			                        <div class='text-center'>
			                            <button type='submit' class='btn btn-primary mt-3' name='add'>Thêm sản phẩm</button>
			                        </div>
			                    </form>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
		<!-- -->	
		<!-- data -->	
		<table class="table table-striped table-bordered table-hover mt-3" style="overflow-x:auto;">
		    <thead>
		        <tr>
		            <th>ID</th>
		            <th>Tên sản phẩm</th>
		            <th>Loại sản phẩm</th>
		            <th>Hình ảnh</th>
		            <th>Thao tác</th>
		        </tr>
		    </thead>
		    <tbody>
		    	
		    	<%for(int i=0;i<productArray.size();i++){ %>
		            <tr>
		            	<td><%= productArray.get(i).getId() %></td>
		            	<td style="font-weight: 500; color: #ff871d"><%= productArray.get(i).getName() %></td>
		            	<%if (productArray.get(i).getType()==1){%>
		            	<td> Thực phẩm dinh dưỡng</td>
		            	<%}
		            	else{
		            	%>
		            	<td> Dụng cụ tập luyện</td>
		            	<%}%>
		            	<td><img width='100px' src='<%= productArray.get(i).getImage() %>'/></td>
		            	<td>
				            <div class='row d-flex justify-content-center'>
				                <div class='col-lg-6 col-12'>
				                    <a href='ProductServlet?action=update&id=<%= productArray.get(i).getId() %>'><button class='btn btn-success' style='background-color: #1cc88a !important; border-color: #1cc88a !important' name='requestedit'>Sửa<i class='bi bi-pencil-square'></i></button></a>
				                </div>
				                <div class='col-lg-6 col-12'>
				                    <a href='ProductServlet?action=delete&id=<%= productArray.get(i).getId() %>'><button class='btn btn-success' style='background-color: #1cc88a !important; border-color: #1cc88a !important' name='delete'>Xóa<i class='bi bi-pencil-square'></i></button></a>
				                </div>
				            </div>
			            </td>
		            </tr>
        		<%} %>
		    </tbody>
		    
		    
		    
		    
		</table>
	<!--  -->
        </div>    
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
		$(document).ready(function () {
			let addBtn=$('.btn-add');
			
			addBtn.on('click',function(){
				<!--$('.login').hide();-->
				$('#addProduct').show();
				$('.content').css('overflow','hidden');
	
			})

			let closeBtn=$('.btn-close');
			closeBtn.on('click',function(){
				$('#addProduct').hide();
				$('.content').css('overflow-y','auto');
	
			})
	
			
						});
	
	</script>
</body>
</html>