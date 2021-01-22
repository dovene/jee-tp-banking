<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<jsp:include page="../common/header.jsp" />
 <body>
 <div class="container">
 <div class="row justify-content-md-center">
    <h2>Add a new Operation</h2>
  </div>
      <form:form action="#" modelAttribute="operation" method="post">
        <div class="form-group col-md-6">
                 <label for="datepicker">Date</label>
                 <fmt:formatDate value="${operation.date}" pattern="dd/MM/yyyy" var="theDate" />
                 <form:input type="text" path="date" value="${theDate}" placeholder="input operation date" id="datepicker" cssClass="form-control"/>
        </div>

         <div class="form-group col-md-6">
               <label for "type"> Type</label>
                 <form:select path="type" id="type" cssClass="form-control">
                     <form:option value="-1">Sélectionner le type</form:option>
                 <form:options items="${operationsType}"/>
                 </form:select>
           </div>

         <div class="form-group col-md-6">
                  <label for="amount">Montant</label>
                   <form:input type="number" path="amount" placeholder="input operation amount" id="amount" cssClass="form-control"/>
         </div>

         <div class="form-group col-md-6">
               <label for "accountNumber"> Compte</label>
                 <form:select path="account.number" id="accountNumber" cssClass="form-control">
                     <form:option value="-1">Sélectionner le compte</form:option>
                 <form:options items="${accounts}" itemLabel="number" itemValue="number" />
                 </form:select>
           </div>

       	  <div class="form-group col-md-6">
          <button type="submit" class="btn btn-primary">Submit</button>
          </div>
      </form:form>

        <script>
          $(function () {
          $("#datepicker").datepicker();
          });
        </script>

     </body>
</html>
