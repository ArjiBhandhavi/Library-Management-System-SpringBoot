<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<c:if test="${msg ne null }">
<div class="alert alert-success text-center mt-2">
    <strong>${msg }</strong>
</div>
</c:if>
<c:if test="${error ne null }">
<div class="alert alert-danger text-center mt-2">
    <strong>${error }</strong>
</div>
</c:if>