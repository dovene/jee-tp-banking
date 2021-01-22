<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="../common/header.jsp" />
<body>
<div class="container">
	 <br />
     	 <a class="btn btn-dark btn-lg" href="operations/create">Add an operation</a></h3>
		 <br />
    	 <br />
    		<table class="table table-striped table-hover">
    		 <thead class="thead-dark">
        <tr><th>Number</th><th>Date</th><th>Type</th><th>Compte</th><th>Montant</th><th colspan="2">Actions</th></tr>
         </thead>
          <tbody>
           <c:forEach var="operation" items="${operations}">
           <tr>
           <td>${operation.number}</td>

            <fmt:formatDate value="${operation.date}" var="formattedDate"
             type="date" pattern="dd/MM/yyyy" />
            <td>${formattedDate}</td>

           <td>${operation.type}</td>
           <td>${operation.account.number}</td>
           <td>${operation.amount}</td>
           <td><a href="operations/edit/${operation.number}" class="btn btn-info">Edit</a>
           <a href="operations/delete?number=${operation.number}" class="btn btn-danger" onclick="if (!(confirm('Are you sure ?'))) return false">Delete</a>
           </td>
           </tr>
           </c:forEach>
           </tbody>
           </table>
</div>
</body>
</html>