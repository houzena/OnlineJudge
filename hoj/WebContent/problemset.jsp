<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>hoj</title>
<meta charset="utf-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="jquery-2.1.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/check.js"></script>
</head>

<body style="background-color:wheat">
<div class="container">
<!-- 登录模态框（Modal） -->
<div class="modal fade" id="LoginModal" tabindex="-1" role="dialog" 
    aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
              <div class="modal-header">
                 <button type="button" class="close" 
                    data-dismiss="modal" aria-hidden="true">
                       &times;            </button>
                 <h4 class="modal-title" id="myModalLabel">
                    Welcome!           </h4>
              </div>
              <form class="form-horizontal" role="form" method="POST" id="loginform" action="index.jsp" onsubmit="return loginsubmit();">
              <div class="modal-body">
                    <div class="form-group">
                            <label class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-6">
                               <input type="text" class="form-control" name="user_id" id="login_name" maxlength="20">
                            </div>
                    </div>
                    <div class="form-group">
                            <label class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-6">
                               <input type="password" class="form-control" name="password" id="passwd0" maxlength="20">
                            </div>
                    </div>
                    <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-6">
                               <div class="checkbox">
                                  <label>
                                     <input type="checkbox"> 请记住我  </label>
                               </div>
                            </div>
                    </div>
                    <div class="col-sm-offset-2 "  id="div_login_check"></div>
                    
              </div>
              <div class="modal-footer">
                 <input type="button" class="btn btn-default" 
                    data-dismiss="modal" value="关闭"></input>
                 <input type="submit" class="btn btn-primary" value="登录"></input>
              </div>
              </form> 
        </div>
           <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>

<!-- 注册模态框（Modal） -->
<div class="modal fade" id="SignModal" tabindex="-1" role="dialog" 
    aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
              <div class="modal-header">
                 <button type="button" class="close" 
                    data-dismiss="modal" aria-hidden="true">
                       &times;            </button>
                 <h4 class="modal-title" id="myModalLabel">
                    Welcome!           </h4>
              </div>
              <form class="form-horizontal" role="form" method="POST" id="signform" action="index.jsp"  onsubmit="return signsubmit();">
              <div class="modal-body">
                    <div class="form-group">
                            <label class="col-sm-2 control-label">用户名</label>
                            <div class="col-sm-6">
                               <input type="text" class="form-control" name="user_id" placeholder="*" id="sign_name"maxlength="20">
                            </div>
                    </div>
                    <div class="form-group">
                            <label class="col-sm-2 control-label" >昵称</label>
                            <div class="col-sm-6">
                               <input type="text" class="form-control" name="nick"  placeholder="*" id="sign_nickname"maxlength="20">
                            </div>
                    </div>
                    <div class="form-group">
                            <label class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-6">
                               <input type="password" class="form-control" name="password" id="passwd1" maxlength="20">
                            </div>
                            
                    </div>
                    <div class="form-group">
                            <label class="col-sm-2 control-label">再次输入</label>
                            <div class="col-sm-6">
                               <input type="password" class="form-control" name="password2" id="passwd2" onblur="checkRePasswd()" maxlength="20">
                            </div>
                            <span  id="span_repasswd"></span>
                    </div>
                    <div class="form-group">
                            <label class="col-sm-2 control-label">学校</label>
                            <div class="col-sm-6">
                               <input type="text" class="form-control" name="school" id="school">
                            </div>
                    </div>
                    <div class="form-group">
                            <label class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-6">
                               <input type="text" class="form-control" name="email" id="email" placeholder="*">
                            </div>
                    </div>
                    <div class="col-sm-offset-2 "  id="div_sign_check"></div>             
              </div>
              <div class="modal-footer">
                 <input type="button" class="btn btn-default" 
                    data-dismiss="modal" value="关闭"></input>
                 <input type="submit" class="btn btn-primary" value="注册"></input>
              </div>
              </form> 
        </div>
           <!-- /.modal-content -->
    </div>
    <!-- /.modal -->
</div>

<nav class="navbar navbar-default" role="navigation">
    <div class="navbar-header">
        <a class="navbar-brand" >在线评测</a>
    </div>
    <div>
        <ul class="nav navbar-nav">
            <li><a href="index.jsp"><span class="glyphicon glyphicon-home"></span>首页</a></li>
            <li><a href="problemset.html"><span class="glyphicon glyphicon-th-list"></span>题集</a></li>
            <li><a href="total-rank.html"><span class="glyphicon glyphicon-signal"></span>总榜</a></li>
            <li><a href="contestlist.html"><span class="glyphicon glyphicon-flag"></span>比赛</a></li>
            <li><a href="status.html"><span class="glyphicon glyphicon-ok-circle"></span>判题队列</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
        <% 
        	if(request.getParameter("user_id")!=null&&request.getMethod()!="GET")
        	{
        		session.setAttribute("user_id", request.getParameter("user_id"));
        		out.write("user:"+request.getParameter("user_id"));
        	}
        	else if(session.getAttribute("user_id")!=null)
        	{	out.write("<li><a href=\"#\"><span class=\"glyphicon glyphicon-user\"></span>&nbsp");
        		out.write("<font color=\"orange\"> "+session.getAttribute("user_id")+"</font></a></li>");
        	}
        	else
           {
        		out.write("<li><a href=\"#LoginModal\" data-toggle=\"modal\">登录</a></li>");
        		out.write("<li><a href=\"#SignModal\" data-toggle=\"modal\">注册</a></li>");
           }
       	   
		 %>
            &nbsp;&nbsp;&nbsp;
        </ul>
    </div>

</nav>
<div class="row" >
<div class="col-xs-9" style="padding: 15px;">

<div class="panel panel-default">
<div class="panel-heading">
    <h2 class="panel-title">题库</h2>
</div>
<table class="table table-striped">
    <thead>
        <tr>
            <th width="80">ID</th>
            <th class="header">Name</th>
            <th width="100">正确</th>
            <th width="100">提交</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>1001</td>
            <td><a href="#">A+B</a></td>
            <td>1</td>
            <td>3</td>
        </tr>
      
    </tbody>
</table>
</div>
<center>
<ul class="pagination">
    <li><a href="#">&laquo;</a></li>
    <li><a href="#">1</a></li>
    <li><a href="#">2</a></li>
    <li><a href="#">3</a></li>
    <li><a href="#">4</a></li>
    <li><a href="#">5</a></li>
    <li><a href="#">&raquo;</a></li>
</ul>
</center>
</div>

<div class="col-xs-3" style="padding: 15px;">
<div class="panel panel-default">
    <div class="panel-heading">
        <h2 class="panel-title">分类</h2>
    </div>
    <ul class="nav nav-pills nav-stacked">
        <li><a href="#">数据结构</a></li>
        <li><a href="#">动态规划</a></li>
        <li><a href="#">数论</a></li>
        <li><a href="#">图论</a></li>
        <li><a href="#">搜索</a></li>
    </ul>
</div>
</div>
</div>
<center>
<div id="footer" class="center">
    CopyRight by <a href="#">houzena</a> 2018
</div>
</center>
</div>
</body>
</html>