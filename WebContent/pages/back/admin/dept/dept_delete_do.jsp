<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
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
	public static final String DEPT_ADD_URL = "pages/back/admin/dept/dept_list.jsp" ;
%>
<%
	request.setCharacterEncoding("UTF-8") ;
	String ids = request.getParameter("ids") ;
	String result [] = ids.split(",") ;
	Set<Integer> setIds = new HashSet<Integer>() ;
	for (int x = 0 ; x < result.length ; x ++) {
		setIds.add(Integer.parseInt(result[x])) ;
	}
	String msg = "部门删除失败！" ;
	IDeptService deptService = Factory.getServiceInstance("dept.service") ;
	if (deptService.delete(setIds)) {
		msg = "部门删除成功！" ;
	}
%>
	<div class="container">
		<div class="row">
			<div class="col-xs-12">
				<jsp:include page="/pages/plugins/forward.jsp">
					<jsp:param value="<%=msg%>" name="msg"/>
					<jsp:param value="<%=DEPT_ADD_URL%>" name="url"/>
				</jsp:include>
			</div>
		</div>
	</div>
</body>
</html>