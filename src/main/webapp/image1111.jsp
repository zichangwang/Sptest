<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <script type="text/javascript" src="js/jquery-2.1.0.js" ></script>
  <body>
		<div class="">
			<div class="list">
				<div class="item">
					<div class="item-content">
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="javascript:;" class="file">上传照片
							<input type="file" id="upload" name="xlimage" accept="image/*">
						</a>
					</div>
				</div>
			</div>
			<div class="item-inquiry">
				<label style="color: #999999;">参考样例</label>
				<img id="pictures" class="img_wrap" src="">
			</div>
		</div>
	</body>
	<script>
		var demo_h5_upload_ops = {
			init: function() {
				this.eventBind();
			},
			eventBind: function() {
				var that = this;
				$("#upload").change(function() {
					if(this.files[0].size>15360){
						alert("上传文件大小不能超过15kb");
						$("#upload").val("");
						return;
					}
					var reader = new FileReader();
					reader.onload = function(e) {
						that.compress(this.result);
					};
					reader.readAsDataURL(this.files[0]);
				});
			},
			compress: function(res) {
				var that = this;
				var img = new Image(),
					maxH = 300;
				img.onload = function() {
					var cvs = document.createElement('canvas'),
						ctx = cvs.getContext('2d');
					if(img.height!="413"||img.width!="295"){
						alert("上传图片宽高不符合标准！");
						$("#upload").val("");
						$(".img_wrap").hide();
						return;
					}
					if (img.height > maxH) {
						img.width *= maxH / img.height;
						img.height = maxH;
					}
					cvs.width = img.width;
					cvs.height = img.height;
					ctx.clearRect(0, 0, cvs.width, cvs.height);
					ctx.drawImage(img, 0, 0, img.width, img.height);
					var dataUrl = cvs.toDataURL('image/jpeg', 1);
					$(".img_wrap").attr("src", dataUrl);
					$(".img_wrap").attr("width", img.width);
					$(".img_wrap").attr("height", img.height);
					$(".img_wrap").show();
				};
				img.src = res;
			},
			upload: function(image_data) {
				/*这里写上次方法,图片流是base64_encode的*/
			}
		};
		$(document).ready(function() {
			demo_h5_upload_ops.init();
		});
	</script>
</html>
