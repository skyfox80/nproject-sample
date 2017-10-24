<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator"
	uri="http://www.springmodules.org/tags/commons-validator"%>
<%@ page import="egovframework.hwvn.com.util.*"%>
<%@ page import="java.io.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ĐƠN HÀNG &gt; DANH SÁCH CHỈNH SỬA &gt; CÔNG TY TNHH HONG WON (ORDER &gt; LIST MODIFY &gt; HONG WON co.,LTD)</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link href="<c:url value='/css/egovframework/hwvn/reset.css'/>"	rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/hwvn/jquery-ui.css'/>"	rel="stylesheet" type="text/css" />
<link href="<c:url value ='/css/egovframework/hwvn/layout.css'/>"	rel="stylesheet" type="text/css" />

<script	src="<c:url value='/js/egovframework/hwvn/jquery-1.8.3.min.js'/>"	type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/jquery-ui.min.js'/>"	type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/jquery.form.js'/>"	type="text/javascript"></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/cal/EgovCalPopup.js' />" ></script>

<script src="<c:url value='/js/egovframework/hwvn/common.js'/>"	type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/hr/hr_header.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/hr/hr_lnb.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/hr/hr_footer.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/hr/hr_pageindex.js'/>" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>

<script type="text/javascript">
$(document).ready(function(){
	if('${message}' != null && '${message}' != ""){
		alert('${message}');
	}
	if('${rtn}' == "1"){
		alert("rtn: "+$('#rtn')+", Thành công (Success)");
	}
	getGender();
	fncCheckAddClassOn();	
});

function fncCheckAddClassOn() {
	$('#ui-datepicker-div').remove();
	$(document.body).on("click",".selectVal > button",function(){
		if(jQuery(this).parent().next().hasClass("on")){
			jQuery(this).parent().next().removeClass("on");
			jQuery(this).parent().removeClass("on");
			jQuery(this).find("em").text("선택 리스트 열기");
		}else{
			jQuery(".selectList").removeClass("on");
			jQuery(this).parent().next().addClass("on");
			jQuery(this).parent().addClass("on");
			jQuery(this).find("em").text("선택 리스트 닫기");
		};
		return false;
	});
}

//<![CDATA[
jQuery(function() {
	jQuery(".datepicker")
			.datepicker(
					{
						dateFormat : "yy-mm-dd",
						showOn : "button",
						buttonImage : "<c:url value='/images/egovframework/hwvn/com/calendar.png'/>",
						buttonImageOnly : true,
						buttonText : "Select date",
						dayNamesMin : [ "Sun", "Mon", "Tue", "Wed", "Thu",
								"Fri", "Sat" ]
					});
})
//]]>
</script>

<script>
function getGender(){
	var hDt = "";
	ajaxUrl = "<c:url value='/pd/order/selectGenderDesc.do'/>?sState=03";
	$.get(ajaxUrl, function(data){
		var cate_data = eval(data);
		for(i=0; i<cate_data.length; i++){
			hDt += "<li><button type='button' id='gen"+i+"' value='"+cate_data[i].sDetail+"' onclick=genName('"+cate_data[i].sDetail+"') >"+cate_data[i].sDetail+"</button></li>";
		}
		$('#gender').html(hDt);
	});
}

function genName(sDetail){
	$('#modelGender').val(sDetail);
}

function modifyOrder(){
		
	var param  = "unikey=${result.unikey}&modelName=${result.modelName}&poDocDate="+$('#poDocDate').val().trim()+"&customerPo='${result.customerPo}'";
	param += "&orderType=${result.orderType}&modelGender=${result.modelGender}&cutGetDate="+$('#cutGetDate').val().trim()+"&shippingDate="+$('#shippingDate').val().trim();
	param += "&instoreSdate="+$('#instoreSdate').val().trim()+"&modelDest=${result.modelDest}&makeLine=${result.makeLine}&grp=${result.grp}&orderQty=${result.orderQty}";
	
	ajaxUrl = "<c:url value='/pd/order/modifyOneOrderMain.do'/>";
	$.ajax({
		type:"POST",
		url:ajaxUrl,
		dataType:"text",
		data:param,
		success: function(data){
			if(data == '1'){
				alert('success!')
				layerClose();
				self.location.reload();
				
			}else{
				alert('inquire');
			}
		},
		 error:function(request,status,error) {
			 //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			 alert("Kiểm tra đường truyền!!\n\nCheck Network!!\n\n인터넷 연결을 확인하세요!!");
	    }
	});
	
	
	
	
}



function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

</script>
</head>

<body>

<div id="layerWrap">
	<div class="layerPop" id="inbox">
		<div class="layerTop">
			<strong>CHỈNH SỬA THÔNG TIN DANH SÁCH ĐƠN HÀNG (MODIFY ORDER LIST INFO)</strong>
			<button type="button" class="layerCloseBtn layerClose" onclick="$('#ui-datepicker-div').remove();"><img src="../../images/egovframework/hwvn/com/close_btn.png" alt="close layer" /></button>
		</div>
		<div class="layerCon layerConBigger">	
			<form name="listfrm" method="post">
				<input type="hidden" id="unikey" name="unikey" value="${unikey}">
				<c:set var="ordManage" value="${result}"/>
				<input type="hidden" id="modelGender" name="modelGender" value="${ordManage.modelGender}">		
				
				<div class="attitudeData">
				
					<fieldset>
						<legend>Attitude Data</legend>
						<table summary="사원코드, 사원명, 부서, 근무조, 출결 등 입력" class="table_popup">
							<caption>근태 현황 수정</caption>
							<colgroup>
								<col width="10%"/>
								<col width="10%"/>
								<col width="10%"/>
								<col width="10%"/>
								<col width="10%"/>
								<col width="10%"/>
							</colgroup>
							<tbody>
								<tr class="row_input">
									<th scope="row" title='COMPANY1' >CTY 1</th>
									<td class="blue" id="originCom1">${ordManage.originCom1}</td>
									
									<th scope="row" title='COMPANY2' >CTY 2</th>
									<td class="blue" id="originCom2">${ordManage.originCom2}</td>
									
									<th scope="row" title='MODEL GROUP' >NHÓM MODEL</th>
									<td class="blue" id="modelGroup">${ordManage.modelGroup}</td>
								</tr>
								
								<tr class="row_input">	
									<th scope="row" title='STYLE NO' >MÃ KIỂU</th>
									<td class="blue" id="styleNo">${ordManage.styleNo}</td>
									
									<th scope="row" title='ORDER NO' >MÃ ĐH</th>
									<td class="blue" id="orderNo">${ordManage.orderNo}</td>
									
									<th scope="row" title='ORDER QTY' >SL ĐH</th>
									<td class="blue" id="orderQty">${ordManage.orderQty} pairs</td>
									<%-- <td><input type="text" name="orderQty" class="w70p" id="orderQty" value="${ordManage.orderQty}" onkeypress="return isNumberKey(event)"> Pairs</td> --%>
								</tr>
							
								<tr class="row_input">	
									<th scope="row" title='CUSTOMER PO' >CUSTOMER PO</th>
									<td class="blue" id="customerPo">${ordManage.customerPo}</td>
									
									<th scope="row" title='ORDER TYPE' >KIỂU ĐH</th>
									<td class="blue" id="orderType">${ordManage.orderType}</td>
									
									<th scope="row" title='GENDER' >G_TÍNH</th>
									<td class="blue" id="modelGender">${ordManage.modelGender}</td>
									<!-- <td>
										<div class="selectWrap w70p">
											<div class="selectVal">
												<span id="gen">SELECT</span>
												<button type="button">
													<em class="blind">SELECT 리스트 열기</em>
												</button>
											</div>
											<ul class="selectList" id="gender">
											</ul>
										</div>
									</td> -->
								</tr>
								
								<tr class="row_input">	
									<th scope="row" title='DESTINATION' >NƠI NHẬN</th>
									<td class="blue" id="modelDest">${ordManage.modelDest}</td>
									
									<th scope="row" title='LINE' >LINE</th>
									<td class="blue" id="makeLine">${ordManage.makeLine}</td>
									
									<th scope="row" title='GRP' >GRP</th>
									<td class="blue" id="grp">${ordManage.grp}</td>
								</tr>
								
								<tr class="row_input">	
									<th scope="row" title='PO DOC DATE' >PO DOC DATE</th>
									<td>
										<div class="dateDouble dateDouble-NoMarginRight">
										
										<fmt:parseDate value="${ordManage.poDocDate}" pattern="yyyyMMdd" var="sample3" scope="page"/>
											<input type="text" title="PO DOC DATE" class="datepicker w70p" name="poDocDate" id="poDocDate"  value='<fmt:formatDate value="${sample3}" pattern="yyyy-MM-dd"/>'/>
										</div>
									</td>
									
									<th scope="row" title='CUT RECEIVE DATE' >NGÀY NHẬN LỆNH CẮT</th>
									<td>
										<div class="dateDouble dateDouble-NoMarginRight">
											<fmt:parseDate value="${ordManage.cutGetDate}" pattern="yyyyMMdd" var="sample2" scope="page"/>
											<input type="text" title="CUT RECEIVE DATE" class="datepicker w70p" name="cutGetDate" id="cutGetDate"  value='<fmt:formatDate value="${sample2}" pattern="yyyy-MM-dd"/>'/>
										</div>
									</td>
									
									<th scope="row" title='OGAC(SHIPPING)' >OGAC(SHIPPING)</th>
									<td>
										<div class="dateDouble dateDouble-NoMarginRight">
											<fmt:parseDate value="${ordManage.shippingDate}" pattern="yyyyMMdd" var="sample1" scope="page"/>
											<input type="text" title="OGAC" class="datepicker w70p" name="shippingDate" id="shippingDate"  value='<fmt:formatDate value="${sample1}" pattern="yyyy-MM-dd"/>'/>
										</div>
									</td>
								</tr>
								
								<tr class="row_input">
									<th scope="row" title='START DATE' >NGÀY BẮT ĐẦU</th>
									<td>
										<div class="dateDouble dateDouble-NoMarginRight">
										<c:out value=""/>
										<fmt:parseDate value="${ordManage.instoreSdate}" pattern="yyyyMMdd" var="sample" scope="page"/>
										 	<input type="text" title="START DATE" class="datepicker w70p" name="instoreSdate" id="instoreSdate"  value='<fmt:formatDate value="${sample}" pattern="yyyy-MM-dd"/>'/>
										</div>
									</td>
									<td colspan="4"></td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</div>
				<div class="layerBtnBoxRight">
					<a type="button" class="btn" id="save1" onclick="modifyOrder()" title="SAVE"><img src="<c:url value='/images/egovframework/hwvn/com/ico12.png'/>" alt="" />LƯU</a>	
					<a type="button" class="btn layerClose" id="back" onclick="$('#ui-datepicker-div').remove();" title="CLOSE"><img src="<c:url value='/images/egovframework/hwvn/com/ico15.png'/>" alt="" />ĐÓNG</a>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>