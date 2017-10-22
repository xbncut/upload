<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="cn.mldn.util.factory.*"%>
<%@ page import="cn.mldn.vo.*"%>
<%@ page import="cn.mldn.service.*"%>
<html>
<head>
<%
	String basePath = request.getScheme() + "://" + 
		request.getServerName() + ":" + request.getServerPort() + 
		request.getContextPath() + "/" ;
%>
<base href="<%=basePath%>"/>
<title>部门管理</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<script type="text/javascript" src="jquery/jquery.min.js"></script>
<script type="text/javascript" src="js/common/mldn_util.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
</head>
<body>
<%!
	public static final String DEPT_LIST_URL = "pages/back/admin/dept/dept_list.jsp" ;
%>
<%
	request.setCharacterEncoding("UTF-8") ;
	Dept vo = new Dept() ;
	vo.setDeptno(Integer.parseInt(request.getParameter("deptno"))) ;
	vo.setDname(request.getParameter("dname")) ;
	vo.setLoc(request.getParameter("loc")) ;
	String msg = "部门修改失败！" ;
	IDeptService deptService = Factory.getServiceInstance("dept.service") ;
	if (deptService.edit(vo)) {
		msg = "部门修改成功！" ;
	}
%>
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<jsp:include page="/pages/plugins/forward.jsp">
					<jsp:param value="<%=msg%>" name="msg"/>
					<jsp:param value="<%=DEPT_LIST_URL%>" name="url"/>
				</jsp:include>
			</div>
		</div>
	</div>
</body>
</html>