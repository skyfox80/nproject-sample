<%@ page contentType = "text/html; charset=utf-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %><%@ page errorPage = "/_error/viewErrorMessage.jsp" %><%@ page session = "true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ĐƠN HÀNG &gt; DANH SÁCH MÔ TẢ &gt; CÔNG TY TNHH HONG WON VINA (ORDER &gt; LIST DESCRIPT &gt; HONG WON VINA co.,LTD)</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link href="<c:url value='/css/egovframework/hwvn/reset.css'/>"	rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/hwvn/jquery-ui.css'/>"	rel="stylesheet" type="text/css" />
<link href="<c:url value ='/css/egovframework/hwvn/layout.css'/>"	rel="stylesheet" type="text/css" />

<script	src="<c:url value='/js/egovframework/hwvn/jquery-1.8.3.min.js'/>"	type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/jquery-ui.min.js'/>"	type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/jquery.form.js'/>"	type="text/javascript"></script>
<script	src="<c:url value='/js/egovframework/hwvn/jquery.MultiFile.js'/>"	type="text/javascript"></script>

<script src="<c:url value='/js/egovframework/hwvn/common.js'/>"	type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/hr/hr_header.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/hr/hr_lnb.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/hr/hr_footer.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/hr/hr_pageindex.js'/>" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>

</head>

<body>
<div id="layerWrap">
	<div class="layerPop" id="inbox">
		<div class="layerTop">
			<strong title='DETAIL' >CHI TIẾT</strong>
			<button type="button" class="layerCloseBtn layerClose"><img src="../../images/egovframework/hwvn/com/close_btn.png" alt="close layer" /></button>
		</div>
		<div class="layerCon layerConSmaller">
			<div class="attitudeData">
				<fieldset>
					<legend>Attitude Data</legend>
					<table summary="Components View" class="table_popup">
						<caption>Detail Components</caption>
						<tbody>
							<c:forEach var="descript" items="${descript}" varStatus="status">
								<tr><td class="text_center">["${descript}"]</td></tr>
							</c:forEach>
						</tbody>
					</table>
				</fieldset>
			</div>
			<div class="layerBtnBox">
				<a type="button" class="btn layerClose" id="back" title="CLOSE"><img src="<c:url value='/images/egovframework/hwvn/com/ico15.png'/>" alt="" />ĐÓNG</a>
			</div>
		</div>
	</div>
</div>

</body>
</html>