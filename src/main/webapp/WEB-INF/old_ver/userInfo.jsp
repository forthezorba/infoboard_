<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="layoutTag" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<layoutTag:layout>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>UserInfo</title>
</head>
<body>

<div class="wrapper" style="display:flex;">
<%@include file="side.jsp" %>

 <div class="container"  style="margin:0;">
    <div class="col-xs-12" style="margin:15px auto;">
        <label style="font-size:20px;"><span class="glyphicon glyphicon-list-alt"></span>정보</label>
    </div>
    
    <div class="col-xs-6">
        <table class="table table-hover">
            <tr class="table-light">
                <th>ID</th>
                <th>NAME</th>
            </tr>
            <tr>
                <td>
                <sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.username"/>
				</sec:authorize>
                </td>
                <td>
                ${user.name}
                </td>
            </tr>
        </table>
    </div>
</div>
 </div>
 
</body>
</html>
 
</layoutTag:layout>


