<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="../common/header.jsp" />
<body>
<div class="container">
	<br />
	 <a class="btn btn-dark btn-lg" href="accounts/create" role="button">Add a account</a>
	 <br />
	 <br />
		<table class="table table-saccounted table-hover">
		 <thead class="thead-dark">
          <tr><th scope="col">Numéro</th>
              <th scope="col">Type</th>
              <th scope="col">Solde</th>
              <th scope="col" colspan="2">Actions</th>
          </tr>
          </thead>
          <tbody>
           <c:forEach var="account" items="${accounts}">
           <tr>
           <td>${account.number}</td>
           <td>${account.type}</td>
           <td>${account.balance}</td>

           <td><a href="accounts/edit/${account.number}" class="btn btn-info">Edit</a>
           <a href="accounts/delete?city=${account.number}" class="btn btn-danger" onclick="if (!(confirm('Are you sure ?'))) return false">Delete</a>

           </td>
           </tr>
           </c:forEach>
           </tbody>
           </table>
</div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>