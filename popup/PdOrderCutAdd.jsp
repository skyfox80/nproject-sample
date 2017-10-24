<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>ĐƠN HÀNG &gt; THÊM LỆNH CẮT &gt; CÔNG TY TNHH HONG WON VINA (ORDER &gt; CUT ADD &gt; HONG WON VINA co.,LTD)</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link href="<c:url value='/css/egovframework/hwvn/reset.css'/>"	rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/hwvn/jquery-ui.css'/>"	rel="stylesheet" type="text/css" />
<link href="<c:url value ='/css/egovframework/hwvn/layout.css'/>"	rel="stylesheet" type="text/css" />

<script	src="<c:url value='/js/egovframework/hwvn/jquery-1.8.3.min.js'/>"	type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/jquery-ui.min.js'/>"	type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/jquery.form.js'/>"	type="text/javascript"></script>
<script	src="<c:url value='/js/egovframework/hwvn/jquery.MultiFile.js'/>"	type="text/javascript"></script>

<script src="<c:url value='/js/egovframework/hwvn/common_notLayer.js'/>"	type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/hr/hr_header.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/hr/hr_lnb.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/hr/hr_footer.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/hr/hr_pageindex.js'/>" type="text/javascript"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<script>
$(document).ready(function(){
	fncCheckAddClassOn();
	$('#ui-datepicker-div').remove();
	$('#oNo').focus();	
});

function fncCheckAddClassOn() {
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
});

function depth8(tail){
	var hDt = "";
	ajaxUrl = "<c:url value='/pd/order/orderCutAddCompDesc.do'/>?depthCode=8&tailDepend3="+tail;
	$.get(ajaxUrl, function(data){
		var cate_data = eval(data);
		for(i=0; i<cate_data.length; i++){
			hDt += "<li><button type='button' id='dep8"+i+"' value='"+cate_data[i].registerName+"' onclick=depth88($('#dep8"+i+"').val()) >"+cate_data[i].registerName+"</button></li>";
		}
		$('#compo2').html(hDt);
	});
}

function depth88(value){
	$('#component').val(value);
}

function rollSum(){
	var summary = 0;
	
	var rm1 = $('#rollMeter1').val()=='' ? 0 : parseInt($('#rollMeter1').val());
	var rm2 = $('#rollMeter2').val()=='' ? 0 : parseInt($('#rollMeter2').val());
	var rm3 = $('#rollMeter3').val()=='' ? 0 : parseInt($('#rollMeter3').val());
	var rm4 = $('#rollMeter4').val()=='' ? 0 : parseInt($('#rollMeter4').val());
	var rm5 = $('#rollMeter5').val()=='' ? 0 : parseInt($('#rollMeter5').val());
	
	var rq1 = $('#rollQty1').val()=='' ? 0 : parseInt($('#rollQty1').val());
	var rq2 = $('#rollQty2').val()=='' ? 0 : parseInt($('#rollQty2').val());
	var rq3 = $('#rollQty3').val()=='' ? 0 : parseInt($('#rollQty3').val());
	var rq4 = $('#rollQty4').val()=='' ? 0 : parseInt($('#rollQty4').val());
	var rq5 = $('#rollQty5').val()=='' ? 0 : parseInt($('#rollQty5').val());
	
	var rs1 = rm1*rq1;
	var rs2 = rm2*rq2;
	var rs3 = rm3*rq3;
	var rs4 = rm4*rq4;
	var rs5 = rm5*rq5;
	summary = rs1+rs2+rs3+rs4+rs5;
	
	$('#rollSum1').val(rs1);
	$('#rollSum2').val(rs2);
	$('#rollSum3').val(rs3);
	$('#rollSum4').val(rs4);
	$('#rollSum5').val(rs5);
	$('#receiveRollMeter').val(summary);
	
	var url = "";
	if(rs1 != 0){
		url += "<c:url value='/pd/order/insertTempRollStateDesc.do'/>?originCom2="+$('#originCom2').val()+"&rm1="+rm1+"&rq1="+rq1+"&rs1="+rs1;
	}
	if(rs2 != 0){
		url += "&rm2="+rm2+"&rq2="+rq2+"&rs2="+rs2;
	}
	if(rs3 != 0){
		url += "&rm3="+rm3+"&rq3="+rq3+"&rs3="+rs3;
	}
	if(rs4 != 0){
		url += "&rm4="+rm4+"&rq4="+rq4+"&rs4="+rs4;
	}
	if(rs5 != 0){
		url += "&rm5="+rm5+"&rq5="+rq5+"&rs5="+rs5;
	}
	$.get(url, function(data){
		alert(data);
	});
}

function rollSave(){
	
	if($('#receiveRollMeter').val()=='' || $('#component').val()=='' || $('#receiveDate').val()==''){
		alert("Click nút TỔNG hoặc điền vào tất cả các ô!! (Click SUM button OR Fill ALL the box!!)");
	}else{
		var param = "unikey="+$('#unikey').val()+"&originCom2="+$('#originCom2').val();
		param +="&styleNo="+$('#styleNo').val()+"&orderNo="+$('#orderNo').val()+"&modelGroup="+$('#modelGroup').val();
		param +="&component="+$('#component').val()+"&modelName="+$('#modelName').val()+"&modelGender="+$('#modelGender').val();
		param +="&receiveRollMeter="+$('#receiveRollMeter').val()+"&defectReason="+$('#defectReason').val()+"&receiveDate="+$('#receiveDate').val();
		param +="&defectRollMeter="+$('#defectRollMeter').val();
		
		ajaxUrl = "<c:url value='/pd/order/newOrderCutAdd.do'/>";
		$.ajax({
			type:"POST",
			url:ajaxUrl,
			dataType:"text",
			data:param,
			success:function(data){
				//alert(data);
				if(data == "1"){
					alert("Thành công (Success)");
					location.reload();
					layerClose();
					
				}else if(data == "2" ){
					alert("Lỗi! (Proc Error!)");
					location.reload();
					layerClose();
				}else if(data == "3" ){
					alert("Lỗi tạo mã vạch! (Barcode Create Error!)");
					location.reload();
					layerClose();
				}else{
					alert("Lỗi SQL! (SQL Error!)");
					location.reload();
					layerClose();
				}
				
			},
			error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}	
	
	
	
}

function fnSrchOrdNo(){
	f = document.listfrm;
	
	var param = "orderNo="+$('#oNo').val();
	
	ajaxUrl = "<c:url value='/pd/order/selectOneOrderInfo.do'/>";
	$.ajax({
		type:"POST",
		url:ajaxUrl,
		dataType:"text",
		data:param,
		success:function(data){
			//alert(data);
			var parsed = eval(data);
			if(parsed[0].unikey == ''){alert("Wrong Order No!!");}
			
			if(parsed[0].originCom2 == "0000"){
				alert("Hãy đăng ký CÔNG TY 2!!!(Please Register COMPANY2!!!)");
				return;
			}
							
			if(parsed[0].modelGroup == "0000"){
				alert("Hãy đăng ký MODEL!!!(Please Register MODEL!!!)");
				return;
			}
			
			if(parsed[0].styleNo == "0000"){
				alert("Hãy đăng ký KIỂU!!!(Please Register STYLE!!!)");
				return;
			}
			
			
			
			
			$('#Com2').text(parsed[0].originCom2);
			$('#originCom2').val(parsed[0].originCom2);
			$('#mGroup').text(parsed[0].modelGroup);
			$('#modelGroup').val(parsed[0].modelGroup);
			$('#styNo').text(parsed[0].styleNo);
			$('#styleNo').val(parsed[0].styleNo);
			$('#ordNo').text(parsed[0].orderNo);
			$('#orderNo').val(parsed[0].orderNo);
			f.orderNo.value = parsed[0].orderNo;
			f.unikey.value = parsed[0].unikey;
			f.originCom2.value = parsed[0].originCom2;
			$('#unikey').val(parsed[0].unikey);
			$('#modelName').val(parsed[0].modelName);
			$('#modelGender').val(parsed[0].modelGender);
			
			depth8(parsed[0].tail);
		},
		error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
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
			<strong>THÊM LỆNH CẮT (ADD CUT)</strong>
			<button type="button" class="layerCloseBtn layerClose" onclick="$('#ui-datepicker-div').remove();"><img src="../../images/egovframework/hwvn/com/close_btn.png" alt="close layer" /></button>
		</div>
		<div class="layerCon layerConBigger">			
		<form name="listfrm" method="post">
		<input type="hidden" id="component" name="component" >
		<input type="hidden" id="unikey" name="unikey" >
		<input type="hidden" id="modelName" name="modelName" >
		<input type="hidden" id="modelGender" name="modelGender" >
		<input type="hidden" id="originCom2" name="originCom2" >
		<input type="hidden" id="modelGroup" name="modelGroup" >
		<input type="hidden" id="styleNo" name="styleNo" >
		<input type="hidden" id="orderNo" name="orderNo" >
		<input type="hidden" id="defectReason" name="defectReason" value="">
		<input type="hidden" id="defectRollMeter" name="defectRollMeter" value="">
						<div class="searchBox searchBox_popup">
					<div class="head_popup_first">
						<span><strong title='ORDER NO' >MÃ ĐH :</strong> 
							<input type="text" title="검색어 입력" name="oNo" id="oNo" value="" size="10"	onkeypress="if(event.keyCode==13){fnSrchOrdNo();}" />  
							<a href="#" class="btn" onclick="fnSrchOrdNo();">
							<img style="transform: translate(0%, 20%);"	src="<c:url value='/images/egovframework/hwvn/com/ico8.png'/>"	class="nmr" alt="검색" />
							</a>
						</span>
					</div>	
					<div class="head_popup_second"><span class="head_popup_title" title='COMPANY2' >CTY 2 :</span><span id="Com2" class="head_popup_content blue"></span></div>
					<div class="head_popup_second_long"><span class="head_popup_title" title='MODEL GROUP' >NHÓM MODEL :</span><span id="mGroup" class="head_popup_content blue"></span></div>
					<div class="head_popup_second"><span class="head_popup_title" title='STYLE NO' >MÃ HÀNG :</span><span id="styNo" class="head_popup_content blue"></span></div>
				</div>
				<div class="clear"></div>
				<div class="searchBox searchBox_popup">
					<div class="head_popup_first"><span class="head_popup_title" title='COMPONENT' >CHI TIẾT :</span>
						<span class="head_popup_content blue">
							<div class="selectWrap w130">
								<div class="selectVal">
									<span id="compo">SELECT</span>
									<button type="button">
										<em class="blind">SELECT 리스트 열기</em>
									</button>
								</div>
								<ul class="selectList" id="compo2">
								</ul>
							</div>
						</span>
					</div>
					<div class="head_popup_second_long"><span class="head_popup_title" title='RECEIVE DATE' >NGÀY NHẬN :</span><span class="head_popup_content blue"><div class="dateDouble dateDouble-NoMarginRight"><input type="text" title="RECEIVE DATE" class="datepicker w100" name="receiveDate" id="receiveDate"  value="${today}" readonly/></div></span></div>
				</div>
				<div class="attitudeData">
					
						<fieldset>
							<legend>Attitude Data</legend>
							<table class="table_popup" summary="">
								<caption>근태 현황 수정</caption>
								<colgroup>
									<col width="15%"/>
									<col width="15%"/>
									<col width="5%"/>
									<col width="15%"/>
									<col width="5%"/>
									<col width="15%"/>
									<col width="10%"/>
									<col width="5%"/>
									<col width="10%"/>
								</colgroup>
								<tbody>
									<tr>
										<th scope="row" title='No' >STT</th>
										<th scope="row" title='ROLL METER(m)' >MÉT/CUỘN</th>
										<th scope="row"></th>
										<th scope="row" title='ROLL QTY' >SL CUỘN</th>
										<th scope="row"></th>
										<th scope="row" title='METER SUM(m)' >TỔNG(m)</th>
										<th scope="row" title='BTN' >NÚT</th>
										<th scope="row" colspan="2" title='TOTAL METER(m)' >TỔNG SỐ MÉT(m)</th>
									</tr>
									<tr>
										<td class="text_center">(1)</td>
										<td class="text_center">
											<input type="text" name="rollMeter1" id="rollMeter1" onkeypress="return isNumberKey(event)">
										</td>
										<td class="text_center">x</td>
										<td class="text_center">
											<input type="text" name="rollQty1" id="rollQty1" onkeypress="return isNumberKey(event)">
										</td>
										<td class="text_center">=</td>
										<td class="text_center">
											<input type="text" name="rollSum1" id="rollSum1" readonly>
										</td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td class="text_center">(2)</td>
										<td class="text_center">
											<input type="text" name="rollMeter2" id="rollMeter2" onkeypress="return isNumberKey(event)">
										</td>
										<td class="text_center">x</td>
										<td class="text_center">
											<input type="text" name="rollQty2" id="rollQty2" onkeypress="return isNumberKey(event)">
										</td>
										<td class="text_center">=</td>
										<td class="text_center">
											<input type="text" name="rollSum2" id="rollSum2" readonly>
										</td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td class="text_center">(3)</td>
										<td class="text_center">
											<input type="text" name="rollMeter3" id="rollMeter3" onkeypress="return isNumberKey(event)">
										</td>
										<td class="text_center">x</td>
										<td class="text_center">
											<input type="text" name="rollQty3" id="rollQty3" onkeypress="return isNumberKey(event)">
										</td>
										<td class="text_center">=</td>
										<td class="text_center">
											<input type="text" name="rollSum3" id="rollSum3" readonly>
										</td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td class="text_center">(4)</td>
										<td class="text_center">
											<input type="text" name="rollMeter4" id="rollMeter4" onkeypress="return isNumberKey(event)">
										</td>
										<td class="text_center">x</td>
										<td class="text_center">
											<input type="text" name="rollQty4" id="rollQty4" onkeypress="return isNumberKey(event)">
										</td>
										<td class="text_center">=</td>
										<td class="text_center">
											<input type="text" name="rollSum4" id="rollSum4" readonly>
										</td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td class="text_center">(5)</td>
										<td class="text_center">
											<input type="text" name="rollMeter5" id="rollMeter5" onkeypress="return isNumberKey(event)">
										</td>
										<td class="text_center">x</td>
										<td class="text_center">
											<input type="text" name="rollQty5" id="rollQty5" onkeypress="return isNumberKey(event)">
										</td>
										<td class="text_center">=</td>
										<td class="text_center">
											<input type="text" name="rollSum5" id="rollSum5" readonly>
										</td>
										<td class="text_center">
											<a type="button" class="btn" id="save1" onclick="rollSum()" title="SUM"><img src="<c:url value='/images/egovframework/hwvn/com/btns/icon_sum.png'/>"	alt="" />TỔNG</a>
										</td>
										<td colspan="2">
											<input type="text" name="receiveRollMeter" id="receiveRollMeter" readonly>
										</td>
										
									</tr>
								
									<!-- <tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<th scope="row" align="center" title='DEFECT REASON' >LÝ DO LỖI</th>
										<td align="center" colspan="4"><input type="text" name="defectReason" id="defectReason" class="w100p"></td>
										
										<th scope="row" align="center" title='DEFECT ROLL METER(m)' >SỐ MÉT LỖI</th>
										<td align="center" colspan="2"><input type="text" name="defectRollMeter" id="defectRollMeter" onkeypress="return isNumberKey(event)"></td>
										<td></td>				
									</tr> -->
								</tbody>
							</table>
						</fieldset>
					</div>
				<div class="layerBtnBoxRight">
					<a type="button" class="btn" id="save2" onclick="rollSave()" title="SAVE"><img src="<c:url value='/images/egovframework/hwvn/com/ico12.png'/>" alt="" />LƯU</a>
					<a type="button" class="btn layerClose" id="back" onclick="$('#ui-datepicker-div').remove();" title="CLOSE"><img src="<c:url value='/images/egovframework/hwvn/com/ico15.png'/>" alt="" />ĐÓNG</a>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>