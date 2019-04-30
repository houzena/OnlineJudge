<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*" import="com.domain.*"%>
<jsp:include   page="head.jsp" flush="true"/>

<div class="jumbotron" style="background-color: snow">
<center>
<form class="form-inline" role="form">
    <div class="form-group">
    题目编号：
    <input type="text" class="form-control" id="pid" placeholder="id.." size="4">
    用户名：
    <input type="text" class="form-control" id="puser" placeholder="user.." size="4">
    语言：
    <select class="form-control" name="language" >
        <option value="-1">ALL</option>
        <option value="0">C/C++</option>
        <option value="1">Java</option>
        <option value="2">Python</option>
    </select>
    结果：
    <select class="form-control" name="jresult" >
        <option value="-1">ALL</option>
        <option value="0">正确</option>
        <option value="1">答案错误</option>
        <option value="2">时间超限</option>
        <option value="3">内存超限</option>
        <option value="4">运行时错误</option>
        <option value="5">格式错误</option>
        <option value="6">系统异常</option>
    </select>
    &nbsp;
    <button type="submit" class="btn btn-default">查找</button>
    </div>
</form>
</center>
<table class="table table-hover">
<thead>
    <th width="10%">运行编号</th>
    <th width="10%">用户名</th>
    <th width="10%x">问题</th>
    <th width="10%">结果</th>
    <th width="10%">内存</th>
    <th width="10%">耗时</th>
    <th width="10%">语言</th>
    <th width="10%">代码长度</th>
    <th width="20%">提交时间</th>
</thead>
<%
	if(request.getAttribute("list")!=null)
	{
		List<Judge> list = (List<Judge>)request.getAttribute("list");
		for(int i = 0;i < list.size();i++)
		{
			Judge judge = list.get(i);
%>
<tbody>
    <tr>
        <td><%=judge.getJudge_id() %></td>
        <td><%=judge.getUser_id() %></td>
        <td><%=judge.getProblem_id() %></td>
        <td><span class="btn btn-success">正确</span></td>
        <td><%=judge.getSpace() %></td>
        <td><%=judge.getTime() %></td>
        <td>C++</td>
        <td><%=judge.getCode().length()%>B</td>
        <td><%=judge.getJudge_date() %></td>
    </tr>

</tbody>
<%
		}
	}
%>
</table>
</div>
<center>
<div id="footer" class="center">
    CopyRight by <a href="#">houzena</a> 2018
</div>
</center>
</div>
</body>
</html>