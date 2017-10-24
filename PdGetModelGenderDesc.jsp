<%@ page contentType = "text/html; charset=utf-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %><%@ page errorPage = "/_error/viewErrorMessage.jsp" %><%@ page session = "true" %>[
<c:forEach var="genderlist" items="${genderlist}" varStatus="status"><c:if test="${status.index != 0 }">,</c:if>
{"sDetail":"${genderlist.sDetail}"}
</c:forEach>
]