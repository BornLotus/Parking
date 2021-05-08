<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();//获取项目名称
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登陆</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/Style/Login.css" />
<script type="text/javascript" src="Script/jquery-1.10.1.js"></script>
<script type="text/javascript" src="Script/yanzheng.js"></script>
<script type="text/javascript">
	$(function()
	{
		$(document).on("click",".a_reg",function()
		{
			$(".model").fadeIn();
		});
		
		$(document).on("click",".a_close",function()
		{
			$(".model").fadeOut();
		});
	});
	
	function checkPwd()
	{
		if($("[name=user_pwd1]").val()!=$("[name=re_pwd]").val())
		{
			alert("两次输入密码不一致~~~");
			return false;
		}
		else
		{
			return true;
		}
	};
	 
	//a为true时，表单可以提交
    var a = true;
    //表单提交
    function checkinput(){
        return a;
    }
    $(function(){
        var show_num = [];
        draw(show_num);
        $("#canvas").on('click',function(){
            draw(show_num);
        })
        // 点击登录,校验验证码
        $("#clickin").click('click',function(){
            var val = $("#verify-code").val().toLowerCase();
            var num = show_num.join("");
            if(val==''){
                alert('请输入验证码！');
                a= false;
                return;
            }else if(val == num){
                a=true;
                return;
            }else{
                alert('验证码错误！请重新输入！');
                a= false;
                return;
            }
        });
        $("#reset-btn").click('click',function(){
            $('.inp').val('');
        })
    });
</script>
</head>
<body>
	<nav>
		停车管理
	</nav>
	<div>
		<div class="wrapLogin">
		    <div class="loginPanel">
		    	<form action="<%=path %>/LoginHandle" method="post" onsubmit="return checkinput();">
		    		<h2>智能化停车场管理系统</h2>
			       	<p><label>账&nbsp;&nbsp;&nbsp;&nbsp;号：</label><input type="text" class="inp" name="user_id" value="SAdmin" placeholder="请输入用户ID"/></p>
			        <p><label>密&nbsp;&nbsp;&nbsp;&nbsp;码：</label><input type="password" class="inp" name="user_pwd" value=""  placeholder="请输入密码"/></p>
			        <p><label>验证码： </label><input id="verify-code" class="inp" name="verify" placeholder="请输入验证码,不区分大小写"  /></p>
			        <canvas id="canvas" width="100" height="30"></canvas>
			        <p class="btn"><input type="submit" class="btnLogin" value="登陆"  id="clickin" /><input id="reset-btn" type="button" class="btnCancel" value="重置" /></p>
		       	</form>
		     </div>
      </div>
	</div>
	<div>
	
	</div>
		<!-- loginPanel End -->
</body>
</html>