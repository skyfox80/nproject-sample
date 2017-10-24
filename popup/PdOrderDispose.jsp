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
<title>ĐƠN HÀNG &gt; XỬ LÝ &gt; CÔNG TY TNHH HONG WON (ORDER &gt; DISPOSITION &gt; HONG WON co.,LTD)</title>
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
	var text = $('#cancelReason').val();
	if(text == ''){alert('Bạn phải điền vào lý do!\n\n(You must fill in the reason!)'); return;}
	
	var param = "unikey="+'${unikey}'+"&note="+text;
	ajaxUrl = "<c:url value='/pd/order/PdOrderDisposeProc.do'/>";
	$.ajax({
		type:"POST",
		url:ajaxUrl,
		dataType:"text",
		data:param,
		success: function(data){
			if(data == "1"){
				alert("Xử lý thành công! (Success to dispose!)");
				location.reload();
				layerClose();
			}else{
				alert("Có lỗi xảy ra trong quá trình thực hiện! (errors occur in process!)");
				layerClose();
			}
			
		},
		error: function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}
</script>
</head>

<body>

	<div id="layerWrap">
		<div class="layerPop layerPop_down" id="inbox">
			<div class="layerTop">
				<strong>XỬ LÝ ĐƠN HÀNG (DISPOSE OF ORDER REMAIN)</strong>
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
								<table summary="" class="table_popup">
									<caption>오더 잔량 처분 사유 입력</caption>
									<tbody>
										<tr>
											<th scope="row" title='CANCEL REASON' >LÝ DO XỬ LÝ</th>
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