<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<jsp:include page="../common/header.jsp" />
<body>
<div class="container">
<div class="row justify-content-md-center">
   <h2>Add a new account</h2>
 </div>
      <form:form action="#" modelAttribute="account" method="post">
         <div class="form-group col-md-6">
         <label for "number">Number</label>
         <form:input type="text" path="number" placeholder="input account number" id="number" cssClass="form-control"/>
         </div>

          <div class="form-group col-md-6">
          <label for="balance">Balance</label>
           <form:input type="number" path="balance" placeholder="input account balance" id="balance" cssClass="form-control"/>
          </div>

          <div class="form-group col-md-6">
          <label for="type">Type</label>
           <form:input type="text" path="type" placeholder="input account type" id="type" cssClass="form-control"/>
          </div>

       	  <div class="form-group col-md-6">
          <button type="submit" class="btn btn-primary">Submit</button>
          </div>
      </form:form>
     </div>
 <jsp:include page="../common/footer.jsp" />
  <script>
    $(function () {
    $("#datepicker").datepicker();
    });
  </script>
</body>
</html>
