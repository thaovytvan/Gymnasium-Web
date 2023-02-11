<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>GYMNASIUM</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<link rel="icon"  href="../images/logo.png">
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/all.min.css">
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
	<script type="text/javascript">
	    $(document).ready(function() {
	    	$('#password, #confirmpassword').keyup(function() {
		    	if($('#password-register').val() == $('#confirmpassword').val()){
		    		$('#message').html('Xác nhận mật khẩu khớp.').css('color', 'green');
		    	}else 
		    	    $('#message').html('Xác nhận mật khẩu không khớp').css('color', 'red');
	    	});
            if($('#mess').text()!=""){
	    		alert($('#mess').text());
	    	}
	    });
	    function Validate(){
	    	if($('#password-register').val() == $('#confirmpassword').val()){
	    		return true;
	    	}else 
	    	    return false;
	    }
	</script>
</head>
<body>
	<%if(request.getSession().getAttribute("mess")!=null){%>
		<span id="mess" hidden><%= request.getSession().getAttribute("mess") %></span>	
		
	<%
		request.getSession().removeAttribute("mess");
	} %>
	<header>
		<div class="containerheader">
			<div class="header-root">
				<div class="header">
					<div class="row">
						<div class="col-5 left">
							<div class="list-item">
								<div class="item active">
									<a href="#">Trang chủ</a>
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
				                			<a href="../CheckLoginServlet">
	        									<button type="button" class="normal-circle-btn">
										            <i class="far fa-user"></i>
										        </button>
    										</a>
	    									<a href="../LogoutServlet">
	        									<button class="normal-circle-btn"><i style="font-size: 20px,margin: 15px 13px" class="fas fa-sign-in"></i></button>
	    									</a>
				                		<%} else{%>
				                			<button class="normal-circle-btn"><i style="font-size: 20px,margin: 15px 13px" class="fas fa-sign-in"></i></button>
				                		<%} %>
				                		</div>
				                	</div>
				                </div>
				            </div>
				        </div>
				    </div>
				</header>
				<div class="wrap-shadow login ">
					<div class="modal-dialog "  >
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="btn-close" ></button>
							</div>						
							<div class="modal-body registration" >
								<div class="logologin">
									<img srcset="../images/logo.png" />
								</div>
								<div>
									<h3 style="text-align: center; font-size: 20px; letter-spacing: 1px; margin-bottom: 20px;">Chào mừng quay trở lại!</h3>
								</div>
								<div>
									<form role="form" method="post" action="../CheckLoginServlet">
										<input class="form-control" type="email" placeholder="Địa chỉ Email" name="email-login" required />
										<input class="form-control" type="password" placeholder="Mật khẩu" name="password-login"
										pattern=".{8,}" title="Nhập 8 kí tự trở lên" required />
										<div sytle="margin-bottom: 20px;">
											<button type="button" data-bs-toggle="modal" data-bs-target="#ForgotPassModal"
											class="linkbtn">Quên mật khẩu ?</button>
										</div>
										<button type="submit" class="loginbtn" value="Sign In" name="signin">ĐĂNG NHẬP</button>
									</form>
								</div>
								<div>
									<p class="boxortheraction">
										Chưa có tài khoản ?
										<button  class="linkbtn">Đăng ký ngay</button>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="wrap-shadow register">
					<div class="modal-dialog ">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="btn-close" ></button>
							</div>
							<div class="modal-body registration">
								<div>
									<h3 style="text-align: center; font-size: 20px; letter-spacing: 1px; margin: 20px 0px;">ĐĂNG KÝ
									</h3>
								</div>
								<div>
									<form role="form" method="post" action="../RegisterServlet">
										<input class="form-control" type="text" placeholder="Tên của bạn" name="username-register"  id ="username-register" required />
										<input class="form-control" type="email" placeholder="Địa chỉ Email" name="email-register" id ="email-register"  required />
										<input class="form-control" type="password" placeholder="Mật khẩu" name="password-register" id="password-register"
										pattern=".{8,}" title="Eight or more characters" required />
										<input class="form-control" type="password" placeholder="Xác nhận mật khẩu" id="confirmpassword"
										name="confirmpassword" pattern=".{8,}" title="Nhập 8 kí tự trở lên" required />
										<span id='message'></span>
										<div class="form-check">
											<input class="form-check-input" type="checkbox" value="" id="registercheckbox" required>
											<label class="form-check-label" for="registercheckbox">
												Tôi đồng ý với các điều khoản của website
											</label>
										</div>
										<button type="submit" class="loginbtn " value="Register" name="register" onclick="return Validate()">ĐĂNG KÝ</button>
									</form>
								</div>
								<div>
									<p class="boxortheraction">
										<button  class="linkbtn returnbtn">Quay lại đăng nhập</button>
									</p>
								</div>
							</div>

						</div>
					</div>
				</div>

				<main >
					<div id="demo" class="carousel slide" data-bs-ride="carousel">

						<!-- Indicators/dots -->
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#demo" data-bs-slide-to="0" class=""></button>
							<button type="button" data-bs-target="#demo" data-bs-slide-to="1" class="active" aria-current="true"></button>
						</div>

						<!-- The slideshow/carousel -->
						<div class="carousel-inner">


							<div class="carousel-item">
								<img src="https://i1-suckhoe.vnecdn.net/2021/02/17/oatmeal-1613533455-3452-1613576240.jpg?w=0&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=0yS7qZh6e2Ze5z0JokcQnA" alt="" class="d-block" style="width: 100vw; height: 90vh; min-width: 800px;">
								<div class="carousel-caption banner">
									<h1>Thực phẩm chức năng</h1>
									<p>Yến mạch, gạo lứt, bột whey cho người tập gym</p>
								</div>
							</div>

							<div class="carousel-item active">
								<img src="https://cdn.shopify.com/s/files/1/0554/5784/1199/files/show1_07c2209f-e281-44cf-acc3-b1e75a1c82e9.png?v=1639556134" alt="" class="d-block" style="width:100vw; height: 90vh; min-width: 800px;">
								<div class="carousel-caption banner">
									<h1>Dụng cụ tập luyện</h1>
									<p>Chuyên dụng cụ tập luyện tại nhà</p>
								</div>
							</div>
						</div>

						<!-- Left and right controls/icons -->
						<button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
							<span class="carousel-control-prev-icon"></span>
						</button>
						<button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
							<span class="carousel-control-next-icon"></span>
						</button>
					</div>
					<div class="awesome-thing">
						<div class="thing">
							<img class="thing-image" src="https://cdn.shopify.com/s/files/1/0554/5784/1199/files/1_1e862949-1c29-4712-878e-b7fa9bf2a7cf.png?v=1639533201" alt="...">
							<h4>
								FRIENDLY SUPPORT
							</h4>
							<p>Hỗ trợ 24/7</p>
						</div>
						<div class="thing">
							<img class="thing-image" src="https://cdn.shopify.com/s/files/1/0554/5784/1199/files/3_4d31e578-9b6d-49ad-a774-fcb2912f74da.png?v=1639533202" alt="...">
							<h4>
								EASY RETURNS
							</h4>
							<p>Trả hàng sau 7 ngày nếu sản phẩm bị lỗi</p>
						</div>
						<div class="thing">
							<img class="thing-image" src="https://cdn.shopify.com/s/files/1/0554/5784/1199/files/4_dc75de55-5f72-4e3e-998a-b7208c2aaed8.png?v=1639533201" alt="...">
							<h4>
								QUALITY GUARANTEED
							</h4>
							<p>Chất lượng được đảm bảo</p>
						</div>
						<div class="thing">
							<img class="thing-image" src="https://cdn.shopify.com/s/files/1/0554/5784/1199/files/2_59cfc1e7-0a9b-44c7-ae33-1525f2950b01.png?v=1639533202" alt="...">
							<h4>
								FREE SHIPPING
							</h4>
							<p>Giao hàng miễn phí</p>
						</div>

					</div>
					<div>
						<div class="ourblog">THỰC PHẨM NỔI BẬT</div>
						<div class="horizontalline"></div>
					</div>    			
					<div class="container image-slider ">



						<div class="rootProduct">
							<div class="wrapProduct">
								<div class="boxImg">
									<div>
										<a href="#" >
											<img src="https://aromagarden.net/wp-content/uploads/2020/06/banh-biscotti-cela.jpg">
										</a>
									</div>
									<div class="groupbtnProduct">
										<form role="form" method="post" action="http://localhost/MVC-PHP/cart/shoppingcart">
											<input type="hidden" name="Id" required="" value="2" >
											<input type="hidden" name="Name" required="" value="Bánh Biscotti Cela" >
											<input type="hidden" name="Price" required="" value="150000" >
											<input type="hidden" name="Image" required="" value="https://aromagarden.net/wp-content/uploads/2020/06/banh-biscotti-cela.jpg " >
											<input type="hidden" name="Point" required="" value="5" >
											<button name="" class="circular-btn" type="button"  >
												<i class="fas fa-cart-plus"></i>
											</button>
										</form>

										<iframe name="addToCart" style="display:none;"></iframe>

										<form>
											<input type="hidden" value="none" >
											<button type="button" class="circular-btn" >
												<i class="fas fa-search"></i>
											</button>
										</form>
									</div>
								</div>
								<div class="content">
									<div>
										<a href="#" >
											Bánh Biscotti Cela <span class="badge" style="background-color: #ff871d; color: #fff; margin-left: 5px;">5
											</span>
										</a>
									</div>
									<div style="margin-top: 10px;">
										<p><span>150.000 VND</span></p>
									</div>
								</div>
							</div>
						</div>


						<div class="rootProduct">
							<div class="wrapProduct">
								<div class="boxImg">
									<div>
										<a href="#" >
											<img src="https://sc04.alicdn.com/kf/Hbecce8deef424ee786dd036a5a3acbdab.jpg">
										</a>
									</div>
									<div class="groupbtnProduct">
										<form role="form" method="post" action="">
											<input type="hidden" name="Id" required="" value="5" >
											<input type="hidden" name="Name" required="" value="Whey Protein" >
											<input type="hidden" name="Price" required="" value="300000" >
											<input type="hidden" name="Image" required="" value="https://sc04.alicdn.com/kf/Hbecce8deef424ee786dd036a5a3acbdab.jpg " >
											<input type="hidden" name="Point" required="" value="5" >
											<button name="" class="circular-btn" type="button"  >
												<i class="fas fa-cart-plus"></i>
											</button>
										</form>

										<iframe name="addToCart" style="display:none;"></iframe>

										<form>
											<input type="hidden" value="none" >
											<button type="button" class="circular-btn" >
												<i class="fas fa-search"></i>
											</button>
										</form>
									</div>
								</div>
								<div class="content">
									<div>
										<a href="#" >
											Whey Protein <span class="badge" style="background-color: #ff871d; color: #fff; margin-left: 5px;">5
											</span>
										</a>
									</div>
									<div style="margin-top: 10px;">
										<p><span>300.000 VND</span></p>
									</div>
								</div>
							</div>
						</div>

						<div class="rootProduct">
							<div class="wrapProduct">
								<div class="boxImg">
									<div>
										<a href="#" >
											<img src="https://product.hstatic.net/1000085429/product/alnatura_500gr_1024x1024.jpg">
										</a>
									</div>
									<div class="groupbtnProduct">
										<form role="form" method="post" action="">
											<input type="hidden" name="Id" required="" value="6" >
											<input type="hidden" name="Name" required="" value="Protein Bar" >
											<input type="hidden" name="Price" required="" value="100000" >
											<input type="hidden" name="Image" required="" value="https://product.hstatic.net/1000085429/product/alnatura_500gr_1024x1024.jpg " >
											<input type="hidden" name="Point" required="" value="0" >
											<button name="" class="circular-btn" type="button"  >
												<i class="fas fa-cart-plus"></i>
											</button>
										</form>

										<iframe name="addToCart" style="display:none;"></iframe>

										<form>
											<input type="hidden" value="none" >
											<button type="button" class="circular-btn" >
												<i class="fas fa-search"></i>
											</button>
										</form>
									</div>
								</div>
								<div class="content">
									<div>
										<a href="#" >
											Protein Bar <span class="badge" style="background-color: #ff871d; color: #fff; margin-left: 5px;">*
											</span>
										</a>
									</div>
									<div style="margin-top: 10px;">
										<p><span>100.000 VND</span></p>
									</div>
								</div>
							</div>
						</div>


						<div class="rootProduct">
							<div class="wrapProduct">
								<div class="boxImg">
									<div>
										<a href="#" >
											<img src="https://product.hstatic.net/200000378871/product/2_f12a454485c04f15b9da4ed19780f4c0_master.png">
										</a>
									</div>
									<div class="groupbtnProduct">
										<form role="form" method="post" action="">
											<input type="hidden" name="Id" required="" value="8" >
											<input type="hidden" name="Name" required="" value="Bánh Biscotti Trà Xanh" >
											<input type="hidden" name="Price" required="" value="219000" >
											<input type="hidden" name="Image" required="" value="https://product.hstatic.net/200000378871/product/2_f12a454485c04f15b9da4ed19780f4c0_master.png" >
											<input type="hidden" name="Point" required="" value="0" >
											<button name="" class="circular-btn" type="button"  >
												<i class="fas fa-cart-plus"></i>
											</button>
										</form>

										<iframe name="addToCart" style="display:none;"></iframe>

										<form>
											<input type="hidden" value="none" >
											<button type="button" class="circular-btn" >
												<i class="fas fa-search"></i>
											</button>
										</form>
									</div>
								</div>
								<div class="content">
									<div>
										<a href="#" >
											Bánh Biscotti Trà Xanh <span class="badge" style="background-color: #ff871d; color: #fff; margin-left: 5px;">*
											</span>
										</a>
									</div>
									<div style="margin-top: 10px;">
										<p><span>219.000 VND</span></p>
									</div>
								</div>
							</div>
						</div>


						<div class="rootProduct">
							<div class="wrapProduct">
								<div class="boxImg">
									<div>
										<a href="#" >
											<img src="https://product.hstatic.net/200000378871/product/granola_bbe831e4e311455eb78b407c490ffeec_master.jpg">
										</a>
									</div>
									<div class="groupbtnProduct">
										<form role="form" method="post" action="">
											<input type="hidden" name="Id" required="" value="1" >
											<input type="hidden" name="Name" required="" value="Ngũ cốc ăn kiêng Granola" >
											<input type="hidden" name="Price" required="" value="200000" >
											<input type="hidden" name="Image" required="" value="https://product.hstatic.net/200000378871/product/granola_bbe831e4e311455eb78b407c490ffeec_master.jpg" >
											<input type="hidden" name="Point" required="" value="5" >
											<button name="" class="circular-btn" type="button"  >
												<i class="fas fa-cart-plus"></i>
											</button>
										</form>

										<iframe name="addToCart" style="display:none;"></iframe>

										<form>
											<input type="hidden" value="none" >
											<button type="button" class="circular-btn" >
												<i class="fas fa-search"></i>
											</button>
										</form>
									</div>
								</div>
								<div class="content">
									<div>
										<a href="#" >
											Ngũ cốc ăn kiêng Granola <span class="badge" style="background-color: #ff871d; color: #fff; margin-left: 5px;">5
											</span>
										</a>
									</div>
									<div style="margin-top: 10px;">
										<p><span>200.000 VND</span></p>
									</div>
								</div>
							</div>
						</div>


						<div class="rootProduct">
							<div class="wrapProduct">
								<div class="boxImg">
									<div>
										<a href="#" >
											<img src="https://aromagarden.net/wp-content/uploads/2020/06/banh-biscotti-cela.jpg">
										</a>
									</div>
									<div class="groupbtnProduct">
										<form role="form" method="post" action="">
											<input type="hidden" name="Id" required="" value="2" >
											<input type="hidden" name="Name" required="" value="Bánh Biscotti Cela" >
											<input type="hidden" name="Price" required="" value="150000" >
											<input type="hidden" name="Image" required="" value="https://aromagarden.net/wp-content/uploads/2020/06/banh-biscotti-cela.jpg " >
											<input type="hidden" name="Point" required="" value="5" >
											<button name="" class="circular-btn" type="button"  >
												<i class="fas fa-cart-plus"></i>
											</button>
										</form>

										<iframe name="addToCart" style="display:none;"></iframe>

										<form>
											<input type="hidden" value="none" >
											<button type="button" class="circular-btn" >
												<i class="fas fa-search"></i>
											</button>
										</form>
									</div>
								</div>
								<div class="content">
									<div>
										<a href="#" >
											Bánh Biscotti Cela <span class="badge" style="background-color: #ff871d; color: #fff; margin-left: 5px;">5
											</span>
										</a>
									</div>
									<div style="margin-top: 10px;">
										<p><span>150.000 VND</span></p>
									</div>
								</div>
							</div>
						</div>


						<div class="rootProduct">
							<div class="wrapProduct">
								<div class="boxImg">
									<div>
										<a href="#" >
											<img src="https://sc04.alicdn.com/kf/Hbecce8deef424ee786dd036a5a3acbdab.jpg">
										</a>
									</div>
									<div class="groupbtnProduct">
										<form role="form" method="post" action="">
											<input type="hidden" name="Id" required="" value="5" >
											<input type="hidden" name="Name" required="" value="Whey Protein" >
											<input type="hidden" name="Price" required="" value="300000" >
											<input type="hidden" name="Image" required="" value="https://sc04.alicdn.com/kf/Hbecce8deef424ee786dd036a5a3acbdab.jpg " >
											<input type="hidden" name="Point" required="" value="5" >
											<button name="" class="circular-btn" type="button"  >
												<i class="fas fa-cart-plus"></i>
											</button>
										</form>

										<iframe name="addToCart" style="display:none;"></iframe>

										<form>
											<input type="hidden" value="none" >
											<button type="button" class="circular-btn" >
												<i class="fas fa-search"></i>
											</button>
										</form>
									</div>
								</div>
								<div class="content">
									<div>
										<a href="#" >
											Whey Protein <span class="badge" style="background-color: #ff871d; color: #fff; margin-left: 5px;">5
											</span>
										</a>
									</div>
									<div style="margin-top: 10px;">
										<p><span>300.000 VND</span></p>
									</div>
								</div>
							</div>
						</div>


						<div class="rootProduct">
							<div class="wrapProduct">
								<div class="boxImg">
									<div>
										<a href="#" >
											<img src="https://product.hstatic.net/1000085429/product/alnatura_500gr_1024x1024.jpg">
										</a>
									</div>
									<div class="groupbtnProduct">
										<form role="form" method="post" action="">
											<input type="hidden" name="Id" required="" value="6" >
											<input type="hidden" name="Name" required="" value="Protein Bar" >
											<input type="hidden" name="Price" required="" value="100000" >
											<input type="hidden" name="Image" required="" value="https://product.hstatic.net/1000085429/product/alnatura_500gr_1024x1024.jpg " >
											<input type="hidden" name="Point" required="" value="0" >
											<button name="" class="circular-btn" type="button"  >
												<i class="fas fa-cart-plus"></i>
											</button>
										</form>

										<iframe name="addToCart" style="display:none;"></iframe>

										<form>
											<input type="hidden" value="none" >
											<button type="button" class="circular-btn" >
												<i class="fas fa-search"></i>
											</button>
										</form>
									</div>
								</div>
								<div class="content">
									<div>
										<a href="#" >
											Protein Bar <span class="badge" style="background-color: #ff871d; color: #fff; margin-left: 5px;">*
											</span>
										</a>
									</div>
									<div style="margin-top: 10px;">
										<p><span>100.000 VND</span></p>
									</div>
								</div>
							</div>
						</div>


						<div class="rootProduct">
							<div class="wrapProduct">
								<div class="boxImg">
									<div>
										<a href="#" >
											<img src="https://product.hstatic.net/200000378871/product/2_f12a454485c04f15b9da4ed19780f4c0_master.png">
										</a>
									</div>
									<div class="groupbtnProduct">
										<form role="form" method="post" action="">
											<input type="hidden" name="Id" required="" value="8" >
											<input type="hidden" name="Name" required="" value="Bánh Biscotti Trà Xanh" >
											<input type="hidden" name="Price" required="" value="219000" >
											<input type="hidden" name="Image" required="" value="https://product.hstatic.net/200000378871/product/2_f12a454485c04f15b9da4ed19780f4c0_master.png" >
											<input type="hidden" name="Point" required="" value="0" >
											<button name="" class="circular-btn" type="button"  >
												<i class="fas fa-cart-plus"></i>
											</button>
										</form>

										<iframe name="addToCart" style="display:none;"></iframe>

										<form>
											<input type="hidden" value="none" >
											<button type="button" class="circular-btn" >
												<i class="fas fa-search"></i>
											</button>
										</form>
									</div>
								</div>
								<div class="content">
									<div>
										<a href="#" >
											Bánh Biscotti Trà Xanh <span class="badge" style="background-color: #ff871d; color: #fff; margin-left: 5px;">*
											</span>
										</a>
									</div>
									<div style="margin-top: 10px;">
										<p><span>219.000 VND</span></p>
									</div>
								</div>
							</div>
						</div>


						<div class="rootProduct">
							<div class="wrapProduct">
								<div class="boxImg">
									<div>
										<a href="#" >
											<img src="https://product.hstatic.net/200000378871/product/granola_bbe831e4e311455eb78b407c490ffeec_master.jpg">
										</a>
									</div>
									<div class="groupbtnProduct">
										<form role="form" method="post" action="">
											<input type="hidden" name="Id" required="" value="1" >
											<input type="hidden" name="Name" required="" value="Ngũ cốc ăn kiêng Granola" >
											<input type="hidden" name="Price" required="" value="200000" >
											<input type="hidden" name="Image" required="" value="https://product.hstatic.net/200000378871/product/granola_bbe831e4e311455eb78b407c490ffeec_master.jpg" >
											<input type="hidden" name="Point" required="" value="5" >
											<button name="" class="circular-btn" type="button"  >
												<i class="fas fa-cart-plus"></i>
											</button>
										</form>

										<iframe name="addToCart" style="display:none;"></iframe>

										<form>
											<input type="hidden" value="none" >
											<button type="button" class="circular-btn" >
												<i class="fas fa-search"></i>
											</button>
										</form>
									</div>
								</div>
								<div class="content">
									<div>
										<a href="#" >
											Ngũ cốc ăn kiêng Granola <span class="badge" style="background-color: #ff871d; color: #fff; margin-left: 5px;">5
											</span>
										</a>
									</div>
									<div style="margin-top: 10px;">
										<p><span>200.000 VND</span></p>
									</div>
								</div>
							</div>
						</div>


						<div class="rootProduct">
							<div class="wrapProduct">
								<div class="boxImg">
									<div>
										<a href="#" >
											<img src="https://aromagarden.net/wp-content/uploads/2020/06/banh-biscotti-cela.jpg">
										</a>
									</div>
									<div class="groupbtnProduct">
										<form role="form" method="post" action="">
											<input type="hidden" name="Id" required="" value="2" t>
											<input type="hidden" name="Name" required="" value="Bánh Biscotti Cela" >
											<input type="hidden" name="Price" required="" value="150000" >
											<input type="hidden" name="Image" required="" value="https://aromagarden.net/wp-content/uploads/2020/06/banh-biscotti-cela.jpg " >
											<input type="hidden" name="Point" required="" value="5" >
											<button name="" class="circular-btn" type="button"  >
												<i class="fas fa-cart-plus"></i>
											</button>
										</form>

										<iframe name="addToCart" style="display:none;"></iframe>

										<form>
											<input type="hidden" value="none" >
											<button type="button" class="circular-btn" >
												<i class="fas fa-search"></i>
											</button>
										</form>
									</div>
								</div>
								<div class="content">
									<div>
										<a href="#" >
											Bánh Biscotti Cela <span class="badge" style="background-color: #ff871d; color: #fff; margin-left: 5px;">5
											</span>
										</a>
									</div>
									<div style="margin-top: 10px;">
										<p><span>150.000 VND</span></p>
									</div>
								</div>
							</div>
						</div>


						<div class="rootProduct">
							<div class="wrapProduct">
								<div class="boxImg">
									<div>
										<a href="#" >
											<img src="https://sc04.alicdn.com/kf/Hbecce8deef424ee786dd036a5a3acbdab.jpg">
										</a>
									</div>
									<div class="groupbtnProduct">
										<form role="form" method="post" action="">
											<input type="hidden" name="Id" required="" value="5" >
											<input type="hidden" name="Name" required="" value="Whey Protein" >
											<input type="hidden" name="Price" required="" value="300000" >
											<input type="hidden" name="Image" required="" value="https://sc04.alicdn.com/kf/Hbecce8deef424ee786dd036a5a3acbdab.jpg " >
											<input type="hidden" name="Point" required="" value="5" >
											<button name="" class="circular-btn" type="button"  >
												<i class="fas fa-cart-plus"></i>
											</button>
										</form>

										<iframe name="addToCart" style="display:none;"></iframe>

										<form>
											<input type="hidden" value="none" >
											<button type="button" class="circular-btn" >
												<i class="fas fa-search"></i>
											</button>
										</form>
									</div>
								</div>
								<div class="content">
									<div>
										<a href="#" >
											Whey Protein <span class="badge" style="background-color: #ff871d; color: #fff; margin-left: 5px;">5
											</span>
										</a>
									</div>
									<div style="margin-top: 10px;">
										<p><span>300.000 VND</span></p>
									</div>
								</div>
							</div>
						</div>


						<div class="rootProduct">
							<div class="wrapProduct">
								<div class="boxImg">
									<div>
										<a href="#" >
											<img src="https://product.hstatic.net/1000085429/product/alnatura_500gr_1024x1024.jpg">
										</a>
									</div>
									<div class="groupbtnProduct">
										<form role="form" method="post" action="">
											<input type="hidden" name="Id" required="" value="6" >
											<input type="hidden" name="Name" required="" value="Protein Bar" >
											<input type="hidden" name="Price" required="" value="100000" >
											<input type="hidden" name="Image" required="" value="https://product.hstatic.net/1000085429/product/alnatura_500gr_1024x1024.jpg " >
											<input type="hidden" name="Point" required="" value="0" >
											<button name="" class="circular-btn" type="button"  >
												<i class="fas fa-cart-plus"></i>
											</button>
										</form>

										<iframe name="addToCart" style="display:none;"></iframe>

										<form>
											<input type="hidden" value="none" >
											<button type="button" class="circular-btn" >
												<i class="fas fa-search"></i>
											</button>
										</form>
									</div>
								</div>
								<div class="content">
									<div>
										<a href="#" >
											Protein Bar <span class="badge" style="background-color: #ff871d; color: #fff; margin-left: 5px;">*
											</span>
										</a>
									</div>
									<div style="margin-top: 10px;">
										<p><span>100.000 VND</span></p>
									</div>
								</div>
							</div>
						</div>

						<div class="rootProduct">
							<div class="wrapProduct">
								<div class="boxImg">
									<div>
										<a href="#">
											<img src="https://product.hstatic.net/200000378871/product/2_f12a454485c04f15b9da4ed19780f4c0_master.png">
										</a>
									</div>
									<div class="groupbtnProduct">
										<form role="form" method="post" action="">
											<input type="hidden" name="Id" required="" value="8" >
											<input type="hidden" name="Name" required="" value="Bánh Biscotti Trà Xanh" >
											<input type="hidden" name="Price" required="" value="219000" >
											<input type="hidden" name="Image" required="" value="https://product.hstatic.net/200000378871/product/2_f12a454485c04f15b9da4ed19780f4c0_master.png" >
											<input type="hidden" name="Point" required="" value="0" >
											<button name="" class="circular-btn" type="button"  >
												<i class="fas fa-cart-plus"></i>
											</button>
										</form>

										<iframe name="addToCart" style="display:none;"></iframe>

										<form>
											<input type="hidden" value="none" >
											<button type="button" class="circular-btn" >
												<i class="fas fa-search"></i>
											</button>
										</form>
									</div>
								</div>
								<div class="content">
									<div>
										<a href="#" >
											Bánh Biscotti Trà Xanh <span class="badge" style="background-color: #ff871d; color: #fff; margin-left: 5px;">*
											</span>
										</a>
									</div>
									<div style="margin-top: 10px;">
										<p><span>219.000 VND</span></p>
									</div>
								</div>
							</div>
						</div>
					</div>


					<div >
						<div class="ourblog ">DỤNG CỤ NỔI BẬT</div>
						<div class="horizontalline"></div>
					</div>  

					<div class="container image-slider">

						<div>
							<div class='rootProduct'>
								<div class='wrapProduct'>
									<div class='boxImg'>
										<div>
											<a href='#'>
												<img src=https://image.made-in-china.com/202f0j00hRpUqEAIaeuj/2-Piece-Set-Seamless-Gym-Clothes-Women-Workout-Clothing-Yoga-Set-Sports-Suit-Female-Fitness-Clothing.jpg></img>
											</a>
										</div>
										<div class='groupbtnProduct'>
											<form method='post' action=''>
												<input type='hidden' name='Id' value='3'/>
												<input type='hidden' name='Name' value='Set Seamless Clothes'/>
												<input type='hidden' name='Price' value='250000'/>
												<input type='hidden' name='Image' value='https://image.made-in-china.com/202f0j00hRpUqEAIaeuj/2-Piece-Set-Seamless-Gym-Clothes-Women-Workout-Clothing-Yoga-Set-Sports-Suit-Female-Fitness-Clothing.jpg'/>
												<input type='hidden' name='Point' value='5'/>
												<button name='' class='circular-btn' type='button'>
													<i class='fas fa-cart-plus'></i>
												</button>
											</form>


											<form>
												<input type='hidden' value='none'/>
												<button type='button' class='circular-btn'>
													<i class='fas fa-search'></i>
												</button>
											</form>
										</div>
									</div>
									<div class='content'>
										<div>
											<a href='#'>
												Set Seamless Clothes <span class='badge' style='background-color: #ff871d; color: #fff; margin-left: 5px;'>5
												</span>
											</a>
										</div>
										<div style='margin-top: 10px;'>
											<p><span>250.000 VND</span></p>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div>
							<div class='rootProduct'>
								<div class='wrapProduct'>
									<div class='boxImg'>
										<div>
											<a href='#'>
												<img src=https://cdn11.bigcommerce.com/s-b12o4d3w60/images/stencil/1280x1280/products/1595/2140/FM-FMATNBRSF_BLU_2__46644.1601379296.jpg?c=2></img>
											</a>
										</div>
										<div class='groupbtnProduct'>
											<form method='post' action=''>
												<input type='hidden' name='Id' value='4'/>
												<input type='hidden' name='Name' value='Fitness Mad Light Blue'/>
												<input type='hidden' name='Price' value='180000'/>
												<input type='hidden' name='Image' value='https://cdn11.bigcommerce.com/s-b12o4d3w60/images/stencil/1280x1280/products/1595/2140/FM-FMATNBRSF_BLU_2__46644.1601379296.jpg?c=2'/>
												<input type='hidden' name='Point' value='5'/>
												<button name='' class='circular-btn' type='button'>
													<i class='fas fa-cart-plus'></i>
												</button>
											</form>


											<form>
												<input type='hidden' value='none'/>
												<button type='button' class='circular-btn'>
													<i class='fas fa-search'></i>
												</button>
											</form>
										</div>
									</div>
									<div class='content'>
										<div>
											<a href='#'>
												Fitness Mad Light Blue <span class='badge' style='background-color: #ff871d; color: #fff; margin-left: 5px;'>5
												</span>
											</a>
										</div>
										<div style='margin-top: 10px;'>
											<p><span>180.000 VND</span></p>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div>
							<div class='rootProduct'>
								<div class='wrapProduct'>
									<div class='boxImg'>
										<div>
											<a href='#'>
												<img src=https://cf.shopee.ph/file/4b0e13e075cdbf2b4d2f16993b79f906 ></img>
											</a>
										</div>
										<div class='groupbtnProduct'>
											<form method='post' action=''>
												<input type='hidden' name='Id' value='7'/>
												<input type='hidden' name='Name' value='Resistance Band'/>
												<input type='hidden' name='Price' value='60000'/>
												<input type='hidden' name='Image' value='https://cf.shopee.ph/file/4b0e13e075cdbf2b4d2f16993b79f906 '/>
												<input type='hidden' name='Point' value='0'/>
												<button name='' class='circular-btn' type='button'>
													<i class='fas fa-cart-plus'></i>
												</button>
											</form>


											<form>
												<input type='hidden' value='none'/>
												<button type='button' class='circular-btn'>
													<i class='fas fa-search'></i>
												</button>
											</form>
										</div>
									</div>
									<div class='content'>
										<div>
											<a href='#'>
												Resistance Band <span class='badge' style='background-color: #ff871d; color: #fff; margin-left: 5px;'>0
												</span>
											</a>
										</div>
										<div style='margin-top: 10px;'>
											<p><span>60.000 VND</span></p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div >
						<div class="ourblog ">BLOG NỔI BẬT</div>
						<div class="horizontalline"></div>
					</div>      
					<div class='container image-slider'>
						<div class='image-item'>
							<div class='image-grid__item'>
								<a href='#' class='grid-item'>
									<div class='grid-item__image' style='background-image: url(https://cdn.shopify.com/s/files/1/0554/5784/1199/articles/blog6_1024x1024.png?v=1639709323)'></div>
									<div class='grid-item__hover'></div>
									<div class='grid-item__name'>Read more</div>
								</a>
							</div>
							<h4 class='image-title'>NEWS</h4>
							<div class='image-description'>
								Hôm nay là ngày tuyệt vời nhất để bắt đầu luyện tập
							</div>
							<div class='image-hr'></div>
							<div class='image-detail'>
								Cho đến đôi khi, nỗi sợ hãi và cục diện kinh tế, nỗi đau của những mũi tên trên khắp thế giới, nhu cầu muốn có mi tự do hoặc xấu xí. Mặc dù vậy, bất động sản thuần túy của các thành viên ...
							</div>
						</div>

						<div class='image-item'>
							<div class='image-grid__item'>
								<a href='#' class='grid-item'>
									<div class='grid-item__image' style='background-image: url(https://cdn.shopify.com/s/files/1/0554/5784/1199/articles/blog5_1024x1024.png?v=1639709301)'></div>
									<div class='grid-item__hover'></div>
									<div class='grid-item__name'>Read more</div>
								</a>
							</div>
							<h4 class='image-title'>NEWS</h4>
							<div class='image-description'>
								Tập thể hình không phải để giỏi hơn người khác
							</div>
							<div class='image-hr'></div>
							<div class='image-detail'>
								Cho đến đôi khi, nỗi sợ hãi và cục diện kinh tế, nỗi đau của những mũi tên trên khắp thế giới, nhu cầu muốn có mi tự do hoặc xấu xí. Mặc dù vậy, bất động sản thuần túy của các thành viên ...
							</div>
						</div>

						<div class='image-item'>
							<div class='image-grid__item'>
								<a href='#' class='grid-item'>
									<div class='grid-item__image' style='background-image: url(https://cdn.shopify.com/s/files/1/0554/5784/1199/articles/blog3_553c7cb8-982a-4e28-a694-2d2a42e9adb0_1024x1024.png?v=1639709275)'></div>
									<div class='grid-item__hover'></div>
									<div class='grid-item__name'>Read more</div>
								</a>
							</div>
							<h4 class='image-title'>NEWS</h4>
							<div class='image-description'>
								Sự kiện Rx-fitness tuần trước
							</div>
							<div class='image-hr'></div>
							<div class='image-detail'>
								Cho đến đôi khi, nỗi sợ hãi và cục diện kinh tế, nỗi đau của những mũi tên trên khắp thế giới, nhu cầu muốn có mi tự do hoặc xấu xí. Mặc dù vậy, bất động sản thuần túy của các thành viên ...
							</div>
						</div>

						<div class='image-item'>
							<div class='image-grid__item'>
								<a href='#' class='grid-item'>
									<div class='grid-item__image' style='background-image: url(https://cdn.shopify.com/s/files/1/0554/5784/1199/articles/blog4_b28dfcca-2a30-4325-824a-02c86a38381f_1024x1024.png?v=1639709240)'></div>
									<div class='grid-item__hover'></div>
									<div class='grid-item__name'>Read more</div>
								</a>
							</div>
							<h4 class='image-title'>NEWS</h4>
							<div class='image-description'>
								Làm thế nào để luyện tập hiệu quả
							</div>
							<div class='image-hr'></div>
							<div class='image-detail'>
								Cho đến đôi khi, nỗi sợ hãi và cục diện kinh tế, nỗi đau của những mũi tên trên khắp thế giới, nhu cầu muốn có mi tự do hoặc xấu xí. Mặc dù vậy, bất động sản thuần túy của các thành viên ...
							</div>
						</div>

						<div class='image-item'>
							<div class='image-grid__item'>
								<a href='#' class='grid-item'>
									<div class='grid-item__image' style='background-image: url(https://cdn.shopify.com/s/files/1/0554/5784/1199/articles/blog2_f0c4728c-b443-49dd-9abd-44773eb908d4_1024x1024.png?v=1639709221)'></div>
									<div class='grid-item__hover'></div>
									<div class='grid-item__name'>Read more</div>
								</a>
							</div>
							<h4 class='image-title'>NEWS</h4>
							<div class='image-description'>
								Làm thế nào để biết đủ hay không?
							</div>
							<div class='image-hr'></div>
							<div class='image-detail'>
								Cho đến đôi khi, nỗi sợ hãi và cục diện kinh tế, nỗi đau của những mũi tên trên khắp thế giới, nhu cầu muốn có mi tự do hoặc xấu xí. Mặc dù vậy, bất động sản thuần túy của các thành viên ...
							</div>
						</div>

						<div class='image-item'>
							<div class='image-grid__item'>
								<a href='#' class='grid-item'>
									<div class='grid-item__image' style='background-image: url(https://cdn.shopify.com/s/files/1/0554/5784/1199/articles/blog1_0d29b473-654a-48d5-902d-1ecdfc32efdf_1024x1024.png?v=1639709165)'></div>
									<div class='grid-item__hover'></div>
									<div class='grid-item__name'>Read more</div>
								</a>
							</div>
							<h4 class='image-title'>NEWS</h4>
							<div class='image-description'>
								Chế độ dinh dưỡng khi luyện tập để giảm cân hiệu quả cho chị em phụ nữ
							</div>
							<div class='image-hr'></div>
							<div class='image-detail'>
								Cho đến đôi khi, nỗi sợ hãi và cục diện kinh tế, nỗi đau của những mũi tên trên khắp thế giới, nhu cầu muốn có mi tự do hoặc xấu xí. Mặc dù vậy, bất động sản thuần túy của các thành viên ...
							</div>
						</div>
					</div>
					<div >
						<div class="ourblog ">E V E N T S</div>
						<div class="horizontalline"></div>
					</div> 
					<div class='container image-slider'>
						<div class='image-item'>
							<div class='image-grid__item'>
								<a href='#' class='grid-item'>
									<div class='grid-item__image' style='background-image: url(http://www.elleman.vn/wp-content/uploads/2017/04/13/Nuoc-hoa-nam-cho-phong-gym-1.jpg)'></div>
									<div class='grid-item__hover'></div>
									<div class='grid-item__name'>Read more</div>
								</a>
							</div>
							<h4 class='image-title'>EVENTS</h4>
							<div class='image-description'>
								Mừng khai trương
							</div>
							<div class='image-hr'></div>
							<div class='image-detail'>
								Donec interdum, metus et hendrerit aliquet, dolor diam sagittis ligula, eget egestas libero turpis vel mi. Etiam ut purus mattis mauris sodales...
							</div>
						</div>

						<div class='image-item'>
							<div class='image-grid__item'>
								<a href='#' class='grid-item'>
									<div class='grid-item__image' style='background-image: url(https://leep.imgix.net/2020/08/lan-dau-tap-gym-image.jpg?auto=compress&fm=pjpg&ixlib=php-1.2.1)'></div>
									<div class='grid-item__hover'></div>
									<div class='grid-item__name'>Read more</div>
								</a>
							</div>
							<h4 class='image-title'>EVENTS</h4>
							<div class='image-description'>
								Sale lớn lên đến 70%
							</div>
							<div class='image-hr'></div>
							<div class='image-detail'>
								Donec interdum, metus et hendrerit aliquet, dolor diam sagittis ligula, eget egestas libero turpis vel mi. Etiam ut purus mattis mauris sodales...
							</div>
						</div>

						<div class='image-item'>
							<div class='image-grid__item'>
								<a href='#' class='grid-item'>
									<div class='grid-item__image' style='background-image: url(https://thethaodonga.com/wp-content/uploads/2022/01/anh-tap-gym-nu-dep-7.png)'></div>
									<div class='grid-item__hover'></div>
									<div class='grid-item__name'>Read more</div>
								</a>
							</div>
							<h4 class='image-title'>EVENTS</h4>
							<div class='image-description'>
								Gym miễn phí cho mọi người
							</div>
							<div class='image-hr'></div>
							<div class='image-detail'>
								Donec interdum, metus et hendrerit aliquet, dolor diam sagittis ligula, eget egestas libero turpis vel mi. Etiam ut purus mattis mauris sodales...
							</div>
						</div>

						<div class='image-item'>
							<div class='image-grid__item'>
								<a href='#' class='grid-item'>
									<div class='grid-item__image' style='background-image: url(https://kenhhomestay.com/wp-content/uploads/2019/08/phong-tap-gym-Can-Tho-1.jpg)'></div>
									<div class='grid-item__hover'></div>
									<div class='grid-item__name'>Read more</div>
								</a>
							</div>
							<h4 class='image-title'>EVENTS</h4>
							<div class='image-description'>
								Cuộc thi vượt chướng ngại vật
							</div>
							<div class='image-hr'></div>
							<div class='image-detail'>
								Donec interdum, metus et hendrerit aliquet, dolor diam sagittis ligula, eget egestas libero turpis vel mi. Etiam ut purus mattis mauris sodales...
							</div>
						</div>
					</div>    
				</main>

				<footer>
					<div class="footer-root">
						<div class="footer-head">
							<div class="content">
								<div class="row">
									<div class="item item1 col-xl-3 col-md-12">
										<div class="box">
											<img src="../images/logo.png"/>
											<p class="p1">
												Sophisticated simplicity for the independent
												mind.
											</p>
											<div class="youremail">
												<input type="text" placeholder="Your email address..."></input>
												<button type="button">
													<i class="fab fa-telegram-plane"></i>
												</button>
											</div>
											<div class="social">
												<button type="button">
													<i class="fab fa-twitter"></i>
												</button>
												<button type="button">
													<i class="fab fa-instagram"></i>
												</button>
												<button type="button">
													<i class="fab fa-facebook"></i>
												</button>
												<button type="button">
													<i class="fab fa-google"></i>
												</button>
											</div>
										</div>
									</div>
									<div class="item col-xl-3 col-md-4">
										<h5>Help &#38; Information</h5>
										<div class="links">
											<ul>
												<li><a href="#">Pagination</a></li>
												<li><a href="#">Terms &#38; Conditions</a></li>
												<li><a href="#">Contact</a></li>
												<li><a href="#">Home page</a></li>
												<li><a href="#">Term of use</a></li>
											</ul>
										</div>
									</div>
									<div class="item col-xl-3 col-md-4">
										<h5>About Us</h5>
										<div class="links">
											<ul>
												<li><a href="#">Help Center</a></li>
												<li><a href="#">Address Store</a></li>
												<li><a href="#">Privacy Policy</a></li>
												<li><a href="#">Receivers &#38; Amplifiers</a></li>
												<li><a href="#">Clothings</a></li>
											</ul>
										</div>
									</div>
									<div class="item col-xl-3 col-md-4">
										<h5>Help &#38; Information</h5>
										<div class="links">
											<ul>
												<li><a href="#">Categories</a></li>
												<li><a href="#">Delivery</a></li>
												<li><a href="#">Legal Notice</a></li>
												<li><a href="#">Documentation</a></li>
												<li><a href="#">Secure payment</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="copyright">
							<div class="content">
								<div class="row">
									<div class="item col-md-6">
										<div class="left">
											<AiFillCopyrightCircle size={20} />
											Copyright &#169; 2022
										</div>
									</div>
									<div class="item col-md-6">
										<div class="list-img">
											<img src="https://cdn.shopify.com/s/files/1/0554/5784/1199/files/pay.png?v=1639542211" alt=""></img>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</footer>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script type="text/javascript">
	$(document).ready(function () {
		let toggleBtn=$('.normal-circle-btn');
		toggleBtn.on('click',function(){
			$('.login').toggle();

		});
		let closeBtn=$('.btn-close');
		closeBtn.on('click',function(){
			$('.login').hide();
			$('.register').hide();
		})

		let linkBtn=$('.linkbtn');
		linkBtn.on('click',function(){
			$('.login').hide();
			$('.register').show();

		})

		let returnBtn=$('.returnbtn');
		returnBtn.on('click',function(){
			$('.login').show();
			$('.register').hide();

		})

		$(".image-slider").not('.slick-initialized').slick({
	        // centerMode: true,
	        centerPadding: "40px",
	        slidesToShow: 4,
	        slidesToScroll: 4,
	        infinite: true,
	        arrows: true,
	        autoplay: true,
	        autoplaySpeed: 1000,
	        dots: true,
	        nextArrow: `<button type='button' class='slick-next pull-left slick-arrow'><i class="fa-solid fa-arrow-right"></i></button>`,
	        prevArrow: `<button type='button' class='slick-prev pull-right slick-arrow'><i class="fa-solid fa-arrow-left"></i></button>`,
	        responsive: [
	        {
	        	breakpoint: 1100,
	        	settings: {
	        		slidesToShow: 3,
	        		centerMode: false,
	        		arrows: false,
	        	},
	        },
	        {
	        	breakpoint: 900,
	        	settings: {
	        		slidesToShow: 2,
	        		centerMode: false,
	        		arrows: false,
	        	},
	        },
	        {
	        	breakpoint: 650,
	        	settings: {
	        		slidesToShow: 1,
	        		arrows: false,
	        		centerMode: false,
	        	},
	        },
	        ],
	    });
					});

</script>

</body>
