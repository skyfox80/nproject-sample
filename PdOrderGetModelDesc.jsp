<%@ page contentType = "text/html; charset=utf-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %><%@ page errorPage = "/_error/viewErrorMessage.jsp" %><%@ page session = "true" %>
[
<c:forEach var="modelList" items="${modelList}" varStatus="status"><c:if test="${status.index != 0 }">,</c:if>
{"registerName":"${modelList.registerName }","tail":"${modelList.tail }","tailDepend1":"${modelList.tailDepend1 }","tailDepend2":"${modelList.tailDepend2 }","tailDepend3":"${modelList.tailDepend3 }","tailDepend4":"${modelList.tailDepend4 }"}
</c:forEach>
]