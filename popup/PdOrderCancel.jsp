<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<%@ page import="egovframework.hwvn.com.util.*"%>
<%@ page import="java.io.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ĐƠN HÀNG &gt; HỦY &gt; CÔNG TY TNHH HONG WON (ORDER &gt; CANCEL &gt; HONG WON co.,LTD)</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link href="<c:url value='/css/egovframework/hwvn/reset.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/hwvn/jquery-ui.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value ='/css/egovframework/hwvn/layout.css'/>" rel="stylesheet" type="text/css" />

<script src="<c:url value='/js/egovframework/hwvn/jquery-1.8.3.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/jquery-ui.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/jquery.form.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/jquery.MultiFile.js'/>" type="text/javascript"></script>

<script src="<c:url value='/js/egovframework/hwvn/common.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/hr/hr_header.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/hr/hr_lnb.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/hr/hr_footer.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/hr/hr_pageindex.js'/>" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script>
	$(document).ready(function() {
		if ('${message}' != null && '${message}' != "") {
			alert('${message}');
		}
		if ('${rtn}' == "1") {
			alert("Thành công (Success)");
		}
		$('#cancelReason').focus();		
	});

	function cancelSave() {
		
		var param = "unikey="+'${unikey}';
		param += "&cancelReason="+$('#cancelReason').val();
		ajaxUrl = "<c:url value='/pd/order/updateOrderCancel.do'/>";
		$.ajax({
			type:"POST",
			url:ajaxUrl,
			dataType:"text",
			data:param,
			success: function(data){
				if(data == "3"){
					alert("Hủy thành công! (Success to Cancel!)");
					location.reload();
					layerClose();
				}else if(data == "2"){
					alert("Có 1 lỗi xảy ra trong quá trình thực hiện! (1 error occurs in Process!)");
					layerClose();
				}else if(data == "4"){
					alert("진행중인 공정이 있어서 삭제 불가!(관리자에게 문의 하십시오)");
					layerClose();
				}else{
					alert("Có 1 lỗi xảy ra trong quá trình thực hiện! (1 error occurs in Process!)");
					layerClose();
				}
				
			},
			error: function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		
		
		
		/*
		f = document.listfrm;

		var comment = $('#cancelReason').val();
		//alert(comment);
		if (comment == '') {
			alert("check comment value!");
		} else {
			f.action = "<c:url value='/pd/order/updateOrderCancel.do'/>";
			f.submit();
		}
		*/
	}
</script>
</head>

<body>

	<div id="layerWrap">
		<div class="layerPop layerPop_down" id="inbox">
			<div class="layerTop">
				<strong>HỦY ĐƠN HÀNG (CANCEL ORDER)</strong>
				<button type="button" class="layerCloseBtn layerClose">
					<img src="../../images/egovframework/hwvn/com/close_btn.png" alt="close layer" />
				</button>
			</div>
			<div class="layerCon layerConBigger">
				<!-- <form name="listfrm" method="post"> -->
					<input type="hidden" id="unikey" name="unikey" value="${unikey}">
						<div class="attitudeData">
							<fieldset>
								<legend>Attitude Data</legend>
								<table summary="사원코드, 사원명, 부서, 근무조, 출결 등 입력" class="table_popup">
									<caption>근태 현황 수정</caption>
									<tbody>
										<tr>
											<th scope="row" title='CANCEL REASON' >LÝ DO HỦY</th>
											<td colspan="5"><input type="text" name="cancelReason" id="cancelReason" class="w100p" onkeypress="if(event.keyCode==13){cancelSave();}"></td>
										</tr>
									</tbody>
								</table>
							</fieldset>
						</div>
						<div class="layerBtnBox">
							<a type="button" class="btn" id="save1" onclick="cancelSave()" title="SAVE"><img src="<c:url value='/images/egovframework/hwvn/com/ico12.png'/>" alt="" />LƯU</a>
							<a type="button" class="btn layerClose" id="back" title="CLOSE"><img src="<c:url value='/images/egovframework/hwvn/com/ico15.png'/>" alt="" />ĐÓNG</a>
						</div>
				<!-- </form> -->
			</div>
		</div>
	</div>
</body>
</html>