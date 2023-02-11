<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%if(request.getAttribute("userArray")!=null) {%>
		<script lang="javascript">
			$(document).ready(function() {
				$('#san-pham').removeClass("active");
				$('#thanh-vien').addClass("active");
			});
		</script>
	<%} else { %>
		<script lang="javascript">
			$(document).ready(function() {
				$('#thanh-vien').removeClass("active");
				$('#san-pham').addClass("active");
			});
		</script>
	<%} %>
	<div class="box-logo"><a style="cursor: pointer;" href="">GYMNASIUM</a></div>
      <div class="hiddenbox"><a style="cursor: pointer;" href="">GYM</a></div>
       	<div class="toggle">
          	<i class='fa fa-list-ul' style='color: white'></i>
      	</div>
    	<ul>
     		<li class="list active" id="thanh-vien">
             	<a href="UserServlet">
                 	<i class='fas fa-user-friends'></i>
                   	<span class="title">Quản lý thành viên</span>
             	</a>
          	</li>
         	<li class="list" id="san-pham">
                    <a href="ProductServlet">
                        <i class='fa-solid fa-bag-shopping'></i>
                        <span class="title">Quản lý sản phẩm</span>
                    </a>
                </li>
                <form action="LogoutServlet">
                        <button style="border-radius: 20px; width: 200px; color: #ff871d; margin: 20px 20px;" id='logoutbtn' type='submit' value='Đăng xuất'>
                            <span class="title">Đăng xuất</span>
                        </button>
                </form>
            </ul>		    


</body>
