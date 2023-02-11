<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import = "model.bean.User"%>
<%@ page import="java.util.ArrayList"%>
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
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <link href="css/all.min.css" rel="stylesheet" type="text/css">
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
    
    <title>Quản Lý</title>
    <script type="text/javascript">
	    $(document).ready(function() {
	    	$('#newpass, #confirmpassword').keyup(function() {
		    	if($('#newpass').val() == $('#confirmpassword').val()){
		    		$('#message').html('Mật khẩu mới khớp.').css('color', 'green');
		    	}else 
		    	    $('#message').html('Mật khẩu mới không khớp').css('color', 'red');
	    	});
	    	$("#upLoadButton").hide();
	    	$(document).on('change', '#fileToUpload', function() {
                $("#upLoadButton").show();
            });
            if($('#mess').text()!=""){
	    		alert($('#mess').text());
	    	}
	    });
	    function Validate(){
	    	if($('#newpass').val() == $('#confirmpassword').val()){
	    		return true;
	    	}else 
	    	    return false;
	    }
	</script>
</head>
<body>
	<%if(request.getAttribute("mess")!=null){%>
		<span id="mess" hidden><%= request.getAttribute("mess") %></span>	
	<%}%>

	<%User user = (User)request.getAttribute("user"); %>
	<header>
		<div class="containerheader">
			<div class="header-root">
				<div class="header">
					<div class="row">
						<div class="col-5 left">
							<div class="list-item">
								<div class="item active">
									<a href="HomepageServlet">Trang chủ</a>
								</div>
								<div class="item">
									<a class="dropdown-toggle" href="#" role="button" id="productDropDown" data-bs-toggle="dropdown" aria-expanded="false">Sản phẩm</a>
									<ul class="dropdown-menu" aria-labelledby="productDropDown" id="contentproductDropDown">
										<li class="dropdown-itembox"><a class="dropdown-item" href="#">Thực phẩm chức năng</a></li>
										<li class="dropdown-itembox"><a class="dropdown-item" href="#">Dụng cụ tập luyện</a></li>
									</ul>
								</div>
								<div class="item">
									<a href="#">Thông tin</a>
								</div>
								<div class="item">
									<a href="#">Sự kiện</a>
								</div>
								<div class="item">
									<a href="#">Blog</a>
								</div>
							</div>
						</div>
						<div class="col-2 mid">
								<a style="cursor: pointer;" href="#">
									<div class="box-logo">GYMNASIUM</div>
								</a>
				                </div>
				                <div class="col-5 right">
				                	<div class="usergroup">
				                		<div class="hidden-btn">
				                		<%if(request.getSession().getAttribute("currentUser")!=null){ %>
				                			<a href="#">
        									<button type="button" class="normal-circle-btn">
									            <i class="far fa-user"></i>
									        </button>
    									</a>
				                		<%} else {%>
				                		<button type="button" class="normal-circle-btn">
									            <i class="far fa-user"></i>
									       </button>
    									<%} %>
    										<a href="LogoutServlet">
				                			<button class="normal-circle-btn" name="logout" id="logout"><i style="font-size: 20px;margin: 15px 13px;" class="fas fa-sign-in"></i></button>
				                			</a>
				                		</div>
				                	</div>
				                </div>
				            </div>
				        </div>
				    </div>
				</header>
		<div class="container-xl px-4 mt-4">
		<p style="background: #F0F0F0; color: #fd871d; padding: 8px; margin:0px">Profile</p>
        <hr class="mt-0 mb-4">
        <div class="row">
            
                <!-- Account details card-->
                <div class="card mb-4">
                    <div class="card-header">Chi tiết tài khoản</div>
                    <div class="card-body">
                        <form role="form" method="post" action="UserServlet?action=update-infor&id=<%= user.getId() %>">
                            <!-- Div username-->
                            <div class="mb-3">
                                <label class="small mb-1" for="inputUsername">Tên người dùng</label>
                                <input name="username" class="form-control" id="username" type="text"
                                    placeholder="Tên người dùng" value="<%= user.getUsername() %>" required>
                            </div>
                            
                            <!-- Div address-->
                            <div class="row gx-3 mb-3">
                                <div class="col-md-12">
                                    <label class="small mb-1" for="address">Địa chỉ</label>
                                    <input name="address" class="form-control" id="address" type="text"
                                        placeholder="Địa chỉ" value="<%= user.getAddress() %>" required>
                                </div>
                            </div>
                            
                            <!-- Div email -->
                            <div class="mb-3">
                                <label class="small mb-1" for="inputEmailAddress">Email</label>
                                <input name="email" class="form-control" id="email" type="email" placeholder="Email"
                                    value="<%= user.getEmail() %>" required>
                            </div>
                            
                            <!-- Div phone-->
                            <div class="row gx-3 mb-3">
                                <div class="col-md-12">
                                    <label class="small mb-1" for="phonenum">Số điện thoại</label>
                                    <input name="phonenum" class="form-control" id="phonenum" type="tel"
                                        placeholder="Số điện thoại" value="<%= user.getPhonenum() %>"
                                        pattern="[0-9]{8,}" title="Have more than 8 numbers and don't contain letters"
                                        required>
                                </div>
                            </div>
                            
                            <!-- Save changes button-->
                            <button class="btn btn-primary" type="submit">Lưu thay đổi</button>
                        </form>
                    </div>
                </div>
                <div class="card mb-4">
                    <div class="card-header">Đổi mật khẩu</div>
                    <div class="card-body">
                        <form role="form" method="post" action="UserServlet?action=change-password&id=<%= user.getId() %>">
                            <!-- Form Group (username)-->
                            <div class="mb-3">
                                <label class="small mb-1" for="password">Nhập mật khẩu cũ</label>
                                <input name="password" class="form-control" id="password" type="password"
                                    placeholder="Mật khẩu cũ..." pattern=".{8,}" title="Eight or more characters"
                                    required>
                            </div>
                            <!-- Form Row        -->
                            <div class="row gx-3 mb-3">
                                <!-- Form Group (organization name)-->
                                <div class="col-md-12">
                                    <label class="small mb-1" for="newpass">Nhập mật khẩu mới</label>
                                    <input name="newpass" class="form-control" id="newpass" type="password"
                                        placeholder="Mật khẩu mới..." pattern=".{8,}" title="Eight or more characters"
                                        required>
                                </div>
                                <!-- Form Group (location)-->
                            </div>
                            <!-- Form Group (email address)-->
                            <div class="mb-3">
                                <label class="small mb-1" for="confirmpassword">Nhập lại mật khẩu
                                    mới<span id='message' style="padding-left: 30px"></span></label>
                                <input name="confirmpassword" class="form-control" id="confirmpassword" type="password"
                                    placeholder="Mật khẩu mới..." pattern=".{8,}" title="Eight or more characters"
                                    required>
                            </div>
                            <!-- Save changes button-->
                            <button class="btn btn-primary change-password" type="submit" onclick="return Validate()">Cập nhật mật khẩu</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    
</body>
</html>