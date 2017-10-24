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
<title>THÊM ĐƠN HÀNG (ADD NEW ORDER LIST)</title>
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
	$(document).keydown(function(){
		if(event.keyCode == 116){
			//alert("refresh!");
			event.preventDefault();
			//window.location.href = window.location.pathname + window.location.search;
		} else if(event.keyCode == 8){
			//alert("back!");
			if (!$('input').is(":focus")){
				event.preventDefault();	
			}
		} else if(event.keyCode == 27){
			layerClose();
		}
	});
	
	depth1();
	gender();
	$('#orderType').css('color','gray');

});

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

function depth1(){
	var hDt = "";
	ajaxUrl = "<c:url value='/pd/order/orderListAddDesc.do'/>?depthCode=1";
	$.get(ajaxUrl, function(data){
		var cate_data = eval(data);
		for(i=0; i<cate_data.length; i++){
			hDt += "<li><button type='button' id='dep1"+i+"' value='"+cate_data[i].registerName+"' onclick=depth2("+cate_data[i].tail+",$('#dep1"+i+"').val()) >"+cate_data[i].registerName+"</button></li>";
		}
		$('#select1').html(hDt);
		$('#select2').text('');
	});
}

function depth2(depth1, name){
	$('#dp1').val(name);
	var hDt = "";
	ajaxUrl = "<c:url value='/pd/order/orderListAddDesc.do'/>?depthCode=2&tailDepend1="+depth1;
	$.get(ajaxUrl, function(data){
		var cate_data = eval(data);
		for(i=0; i<cate_data.length; i++){
			hDt += "<li><button type='button' id='dep2"+i+"' value='"+cate_data[i].registerName+"' onclick=depth3("+depth1+","+cate_data[i].tail+",$('#dep2"+i+"').val()) >"+cate_data[i].registerName+"</button></li>";
		}
		$('#select2').html(hDt);
		$('#companyhead2').text('SELECT');
		$('#companyhead3').text('SELECT');
		$('#companyhead4').text('SELECT');
		$('#dep2').val('');
		$('#dep3').val('');
		$('#dep4').val('');
		
	});
}

function depth3(depth1, depth2, name){
	$('#dp2').val(name);
	var hDt = "";
	ajaxUrl = "<c:url value='/pd/order/orderListAddDesc.do'/>?depthCode=3&tailDepend1="+depth1+"&tailDepend2="+depth2;
	$.get(ajaxUrl, function(data){
		var cate_data = eval(data);
		for(i=0;i<cate_data.length;i++){
				hDt += "<li><button type='button' id='dep3"+i+"' value='"+cate_data[i].registerName+"' onclick=depth4("+depth1+","+depth2+","+cate_data[i].tail+",$('#dep3"+i+"').val()) >"+cate_data[i].registerName+"</button></li>";
		}
		$('#select3').html(hDt);
		$('#companyhead3').text('SELECT');
		$('#companyhead4').text('SELECT');
		$('#dep3').val('');
		$('#dep4').val('');
	});
}

function depth4(depth1, depth2, depth3, name){
	$('#dp3').val(name);
	var hDt = "";
	ajaxUrl = "<c:url value='/pd/order/orderListAddDesc.do'/>?depthCode=4&tailDepend1="+depth1+"&tailDepend2="+depth2+"&tailDepend3="+depth3;
	$.get(ajaxUrl, function(data){
		var cate_data = eval(data);
		for(i=0;i<cate_data.length;i++){
			hDt += "<li><button type='button' id='dep4"+i+"' value='"+cate_data[i].registerName+"'  onclick=setDepth4($('#dep4"+i+"').val());>"+cate_data[i].registerName+"</button></li>";
		}
		$('#select4').html(hDt);
		$('#companyhead4').text('SELECT');
		$('#dep4').val('');
	});
}

function setDepth4(registerName){
	$('#dp4').val(registerName);
}

function gender(){
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

function listResult(){
	
	if(!formCheck()){
		return;
	}
	var str="Bạn có muốn lưu không? (Do you want to save?)";
	if(!confirm(str)){
		return;
	}
	
	var hDt = "";
	var n = 1;
	var dp1 = $('#dp1').val();
	var dp2 = $('#dp2').val();
	var dp3 = $('#dp3').val();
	var dp4 = $('#dp4').val();

	var orderNo = $('#orderNo').val();
	var orderQty = $('#orderQty').val();
	var customerPo = $('#customerPo').val();
	var orderType = $('#orderType').val();
	var modelGender = $('#modelGender').val();
	var modelDest = $('#modelDest').val();
	var makeLine = $('#makeLine').val();
	var grp = $('#grp').val();

	var poDocDate = $('#poDocDate').val();			
	var cutGetDate = $('#cutGetDate').val();		
	var shippingDate = $('#shippingDate').val();	
	var instoreSdate = $('#instoreSdate').val();	
	
	var num = $('#num').val();
	if(num == null||num == ""){
		num = 0;
	}
	num =  parseInt(num) + parseInt(n);
	$('#num').val(num);
	
	var orderChk = $('#orderSum').val();
	
	

	var param = "originCom1="+dp1+"&originCom2="+dp2+"&modelGroup="+dp3+"&styleNo="+dp4+"&orderNo="+orderNo+"&orderQty="+orderQty+"&customerPo="+customerPo+"&orderType="+orderType+"&modelGender="+modelGender+"&modelDest="+modelDest+"&makeLine="+makeLine+"&grp="+grp+"&poDocDate="+poDocDate+"&cutGetDate="+cutGetDate+"&shippingDate="+shippingDate+"&instoreSdate="+instoreSdate;

	ajaxUrl = "<c:url value='/pd/order/insertOneOrder.do'/>";
	$.ajax({
		type:"POST",
		url:ajaxUrl,
		dataType:"text",
		data:param,
		success: function(data){
			var seq = data;
			if(seq != "00"){
				var h = "";
				hDt += "<tr id='ord"+num+"'><td align='center'>"+num+"</td><td align='center' title='"+dp1+"'>"+dp1+"</td><td align='center' title='"+dp2+"'>"+dp2+"</td><td align='center' title='"+dp3+"'>"+dp3+"</td><td align='center' title='"+dp4+"'>"+dp4+"</td><td align='center' title='"+orderNo+"'>"+orderNo+"</td>";
				hDt += "<td align='center' title='"+orderQty+"'>"+orderQty+"</td><td align='center' title='"+customerPo+"'>"+customerPo+"</td><td align='center' title='"+orderType+"'>"+orderType+"</td><td align='center' title='"+modelGender+"'>"+modelGender+"</td><td align='center' title='"+modelDest+"'>"+modelDest+"</td><td align='center' title='"+makeLine+"'>"+makeLine+"</td><td align='center' title='"+grp+"'>"+grp+"</td>";
				hDt += "<td align='center' title='"+poDocDate+"'>"+poDocDate+"</td><td align='center' title='"+cutGetDate+"'>"+cutGetDate+"</td><td align='center' title='"+shippingDate+"'>"+shippingDate+"</td><td align='center' title='"+instoreSdate+"'>"+instoreSdate+"</td>";
				hDt += "<td align='center' title='Xóa'><button type='button' class='btn' id='btn1' onclick=delOrder('"+seq+"','"+num+"','"+orderNo+"')><img src=<c:url value='/images/egovframework/hwvn/com/ico7.png'/>	alt='Delete' />D</button></td></tr>";
				h = $('#sumlist').val()+hDt;
				/*
				var cate_data = eval(data);
				for(i=0; i<cate_data.length; i++){
					hDt += "<tr><td>"+(i+1)+"</td><td>"+cate_data[i].originCom1+"</td><td>"+cate_data[i].originCom2+"</td><td>"+cate_data[i].modelGroup+"</td><td>"+cate_data[i].styleNo+"</td><td>"+cate_data[i].orderNo+"</td><td>"+cate_data[i].orderQty+"</td><td>"+cate_data[i].customerPo+"</td><td>"+cate_data[i].orderType+"</td><td>"+cate_data[i].modelGender+"</td><td>"+cate_data[i].modelDest+"</td><td>"+cate_data[i].makeLine+"</td><td>"+cate_data[i].grp+"</td>";
					hDt += "<td>"+cate_data[i].poDocDate+"</td><td>"+cate_data[i].cutGetDate+"</td><td>"+cate_data[i].shippingDate+"</td><td>"+cate_data[i].instoreSdate+"</td><td><button type='button' class='btn' id='btn1' ><img src=<c:url value='/images/egovframework/hwvn/com/ico4.png'/>	alt='' />DEL</button></td></tr>";
				}
				*/
				$('#listRecord').html(h);
				$('#sumlist').val(h);
				delp = $('#delpart').val();
				var delhide = delp.split(",");
				
				for(i=0;i<delhide.length;i++){
					$('#ord'+delhide[i]).hide();
				}
				$('#companyhead1').text("SELECT");
				$('#companyhead2').text("SELECT");          
				$('#companyhead3').text("SELECT");          
				$('#companyhead4').text("SELECT");          
				$('#gen').text("SELECT");          
				$('#orderNo').val('');
				$('#orderQty').val('');
				$('#customerPo').val('');
				//$('#orderType').val('');
				$('#modelDest').val('');
				$('#makeLine').val('');
				$('#grp').val('');
				$('#poDocDate').val('');
				$('#cutGetDate').val('');
				$('#shippingDate').val('');
				//$('#instoreSdate').val('');
			}else{
				alert("Chỉ một mã đơn hàng thôi (only one orderNo)");
				return;
			}
		},
		error: function(request, status, error){
			alert("Mã (Code):"+request.status+"\n"+"Tin nhắn (Message):"+request.responseText+"\n"+"Lỗi (Error):"+error);
		}
	});
}

function formCheck(){
	
	
	
	if($('#companyhead1').text() == "SELECT" || $('#companyhead1').text() == ""){
		alert("Chọn công ty 1 (CHOOSE COMPANY1)");
		$('#companyhead1').focus();
		return false;
	}
	
	if($('#companyhead2').text() == "SELECT" || $('#companyhead2').text() == ""){
		alert("Chọn công ty 2 (CHOOSE COMPANY2)");
		$('#companyhead2').focus();
		return false;
	}
	
	if($('#companyhead3').text() == "SELECT" || $('#companyhead3').text() == ""){
		alert("Chọn công ty 3 (CHOOSE COMPANY3)");
		$('#companyhead3').focus();
		return false;
	}
	
	if($('#companyhead4').text() == "SELECT" || $('#companyhead4').text() == ""){
		alert("Chọn công ty 4 (CHOOSE COMPANY4)");
		$('#companyhead4').focus();
		return false;
	}
	
	if($('#orderNo').val() == "" || $('#orderNo').val() == null){
		alert("Điền vào tất cả các ô (Fill in the ALL!!)");
		$('#orderNo').focus();
		return false;
	}
	
	if($('#orderQty').val() == "" || $('#orderQty').val() == null){
		alert("Điền vào tất cả các ô (Fill in the ALL!!)");
		$('#orderQty').focus();
		return false;
	}
	
	if($('#customerPo').val() == "" || $('#customerPo').val() == null){
		alert("Điền vào tất cả các ô (Fill in the ALL!!)");
		$('#customerPo').focus();
		return false;
	}
	
	if($('#orderType').val() == "EX)TF" || $('#orderType').val() == "" || $('#orderType').val() == null){
		alert("Điền vào tất cả các ô (Fill in the ALL!!)");
		$('#orderType').focus();
		return false;
	}
	
	if($('#gen').text() == "SELECT" || $('#gen').text() == ""){
		alert("Chọn giới tính (CHOOSE GENDER)");
		$('#gen').focus();
		return false;
	}
	
	if($('#modelDest').val() == "" || $('#modelDest').val() == null){
		alert("Điền vào tất cả các ô (Fill in the ALL!!)");
		$('#modelDest').focus();
		return false;
	}
	
	if($('#makeLine').val() == "" || $('#makeLine').val() == null){
		alert("Điền vào tất cả các ô (Fill in the ALL!!)");
		$('#makeLine').focus();
		return false;
	}
	
	if($('#grp').val() == "" || $('#grp').val() == null){
		alert("Điền vào tất cả các ô (Fill in the ALL!!)");
		$('#grp').focus();
		return false;
	}
	
	if($('#poDocDate').val() == "" || $('#poDocDate').val() == null){
		alert("Điền vào tất cả các ô (Fill in the ALL!!)");
		$('#poDocDate').focus();
		return false;
	}
	
	if($('#cutGetDate').val() == "" || $('#cutGetDate').val() == null){
		alert("Điền vào tất cả các ô (Fill in the ALL!!)");
		$('#cutGetDate').focus();
		return false;
	}
	
	if($('#shippingDate').val() == "" || $('#shippingDate').val() == null){
		alert("Điền vào tất cả các ô (Fill in the ALL!!)");
		$('#shippingDate').focus();
		return false;
	}
	
	if($('#instoreSdate').val() == "" || $('#instoreSdate').val() == null){
		alert("Điền vào tất cả các ô (Fill in the ALL!!)");
		$('#instoreSdate').focus();
		return false;
	}
	
	return true;
}


function delOrder(key, num, orderNo){
	
	var str = "XÓA? (DELETE?)";
	if(confirm(str)){
	
		var param = "seq="+key+"&orderNo="+orderNo;
		var sumnum = "";
		var orderSum = "";
		ajaxUrl = "<c:url value='/pd/order/deleteAddList.do'/>";
		$.ajax({
			type:"POST",
			url:ajaxUrl,
			dataType:"text",
			data:param,
			success: function(data){
				if(data == "1"){
					$('#ord'+num).hide();
					if($('#delpart').val() == ""){
						sumnum += $('#delpart').val() + num;
						
					}else{
						sumnum += $('#delpart').val() +","+ num;
					}
					
					$('#delpart').val(sumnum); 
				
				}
			},
			 error:function(request,status,error) {
				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
		});
	}
	
}

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

function reset(){
	self.location = "<c:url value='/pd/order/PdOrderListOneAdd.do'/>";	
}

function orderclose(){
	if (confirm("Bạn có muốn hoàn tất thêm đơn hàng không? (Do you want to complete?)")){	
	 window.opener.document.location.href = "<c:url value='/pd/order/PdOrderListMain.do'/>";  
	 window.close();
	}
}
</script>

<script language='javascript'>
/* 새로고침 막기 펑션 시작 */
function noEvent() {
    if (event.keyCode == 116) {
        event.keyCode= 2;
        return false;
    }
    else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))
    {
        return false;
    }
}
document.onkeydown = noEvent;
/* 새로고침 막기 펑션 끝 */
</script>

</head>

<body oncontextmenu="return false">
<div id="layerWrap">
	<div class="windowPop" id="inbox">
		<div class="layerCon">
		<form>
		<input type="hidden" id="dp1">
		<input type="hidden" id="dp2">
		<input type="hidden" id="dp3">
		<input type="hidden" id="dp4">
		<input type="hidden" id="modelGender">
		<input type="hidden" id="sumlist">
		<input type="hidden" id="num">	
		<input type="hidden" id="delpart">
				<div class="attitudeData">
					<fieldset>
						<legend>Attitude Data</legend>
						<table summary="사원코드, 사원명, 부서, 근무조, 출결 등 입력" class="table_popup">
							<caption>근태 현황 수정</caption>
							<colgroup>
								<col width="10%"/>
								<col width="15%"/>
								<col width="10%"/>
								<col width="15%"/>
								<col width="10%"/>
								<col width="15%"/>
							</colgroup>
							<tbody>
								<tr>
									<th scope="row" title='COMPANY1' >CTY 1</th>
									<td>
										<div class="selectWrap w92p">
											<div class="selectVal">
												<span id="companyhead1">SELECT</span>
												<button type="button">
													<em class="blind">SELECT 리스트 열기</em>
												</button>
											</div>
											<ul class="selectList" id="select1">
											</ul>
										</div>
									</td>
									
									<th scope="row" title='COMPANY2' >CTY 2</th>
									<td>
										<div class="selectWrap w92p">
											<div class="selectVal">
												<span id="companyhead2">SELECT</span>
												<button type="button">
													<em class="blind">SELECT 리스트 열기</em>
												</button>
											</div>
											<ul class="selectList" id="select2">
											</ul>
										</div>
									</td>
									
									<th scope="row" title='MODEL GROUP' >NHÓM MODEL</th>
									<td>
										<div class="selectWrap w92p">
											<div class="selectVal">
												<span id="companyhead3">SELECT</span>
												<button type="button">
													<em class="blind">SELECT 리스트 열기</em>
												</button>
											</div>
											<ul class="selectList" id="select3">
											</ul>
										</div>
									</td>
								</tr>
								
								<tr>
									<th scope="row" title='STYLE NO' >MÃ HÀNG</th>
									<td>
										<div class="selectWrap w92p">
											<div class="selectVal">
												<span id="companyhead4">SELECT</span>
												<button type="button">
													<em class="blind">SELECT 리스트 열기</em>
												</button>
											</div>
											<ul class="selectList" id="select4">
											</ul>
										</div>
									</td>
									
									<th scope="row" title='ORDER NO' >MÃ ĐH</th>
									<td><input type="text" name="orderNo" class="w92p" id="orderNo" onkeypress="return isNumberKey(event)"></td>
									
									<th scope="row" title='ORDER QTY' >SL ĐH</th>
									<td><input type="text" name="orderQty" class="w130" id="orderQty" onkeypress="return isNumberKey(event)"> Đôi</td>
								</tr>

								<tr>
									<th scope="row" title='CUSTOMER PO' >CUSTOMER PO</th>
									<td><input type="text" name="customerPo" class="w92p" id="customerPo" onkeypress="return isNumberKey(event)"></td>
									
									<th scope="row" title='ORDER TYPE' >LOẠI ĐH</th>
									<td><input type="text" name="orderType" class="w92p" id="orderType" onfocus="this.value=''" maxlength="5" value="FT"></td>
									
									<th scope="row" title='GENDER' >G_TÍNH</th>
									<td>
										<div class="selectWrap w92p">
											<div class="selectVal">
												<span id="gen">SELECT</span>
												<button type="button">
													<em class="blind">SELECT 리스트 열기</em>
												</button>
											</div>
											<ul class="selectList" id="gender">
											</ul>
										</div>
									</td>
								</tr>
								
								<tr>
									<th scope="row" title='DESTINATION' >VSP_DEST</th>
									<td><input type="text" name="modelDest" class="w92p" id="modelDest" ></td>
									
									<th scope="row" title='LINE' >LINE</th>
									<td><input type="text" name="makeLine" class="w92p" id="makeLine" maxlength="8"></td>
									
									<th scope="row" title='GRP' >GRP</th>
									<td><input type="text" name="grp" class="w92p" id="grp" maxlength="4"></td>
								</tr>

								<tr>
									<th scope="row" title='PO DOC DATE' >PO DOC DATE</th>
									<td>
										<div class="dateDouble dateDouble-NoMarginRight">
											<input type="text" title="PO DOC DATE" class="datepicker w70p" name="poDocDate" id="poDocDate"  value="" readonly/>
										</div>
									</td>
									
									<th scope="row" title='CUT RECEIVE DATE' >NGÀY NHẬN LỆNH CẮT</th>
									<td>
										<div class="dateDouble dateDouble-NoMarginRight">
											<input type="text" title="CUT RECEIVE DATE" class="datepicker w70p" name="cutGetDate" id="cutGetDate"  value="" readonly/>
										</div>
									</td>
									
									<th scope="row" title='OGAC(SHIPPING)' >OGAC(SHIPPING)</th>
									<td>
										<div class="dateDouble dateDouble-NoMarginRight">
											<input type="text" title="OGAC" class="datepicker w70p" name="shippingDate" id="shippingDate"  value="" readonly/>
										</div>
									</td>
								</tr>
								
								<tr>
									<th scope="row" title='L DATE' >NGÀY CUỐI</th>
									<td>
										<div class="dateDouble dateDouble-NoMarginRight">
											<input type="text" title="LASTING DATE" class="datepicker w70p" name="instoreSdate" id="instoreSdate"  value="${today}" readonly/>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</fieldset>
					<div class="layerBtnBoxRight">
						<a type="button" class="btn" id="save1" onclick="listResult()" title="SAVE"><img src="<c:url value='/images/egovframework/hwvn/com/ico12.png'/>" alt="Save" />LƯU</a>
					</div>
			
			
					<div class="gridTable">
						<div class="tableCount">
							<span title='Total' >Tổng</span>	: ${paginationInfo.totalRecordCount}
						</div>
						<table summary="">
							<caption></caption>
							<colgroup>
								<col width="3%">
								<col width="4%">
								<col width="4%">
								<col width="6%">
								<col width="auto">
								<col width="7%">
								<col width="7%">
								<col width="7%">
								<col width="6%">
								<col width="5%">
								<col width="6%">
								<col width="4%">
								<col width="3%">
								<col width="7%">
								<col width="6%">
								<col width="6%">
								<col width="7%">
								<col width="6%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">STT</th>
									<th scope="col">CTY1</th>
									<th scope="col">CTY2</th>
									<th scope="col">MODEL</th>
									<th scope="col">MÃ HÀNG</th>
									<th scope="col">MÃ ĐH</th>
									<th scope="col">SL ĐH</th>
									<th scope="col">MÃ KHÁCH HÀNG</th>
									<th scope="col">LOẠI ĐH</th>
									<th scope="col">G_TÍNH</th>
									<th scope="col">VSP_DEST</th>
									<th scope="col">LINE</th>
									<th scope="col">GRP</th>
									<th scope="col">POdocDATE</th>
									<th scope="col">NGÀY CẮT</th>
									<th scope="col">OGAC</th>
									<th scope="col">NGÀY CUỐI</th>
									<th scope="col">XÓA</th>
								</tr>
							</thead>
							<thead>
								<tr>
									<th scope="col">No.</th>
									<th scope="col">COM1</th>
									<th scope="col">COM2</th>
									<th scope="col">MODEL</th>
									<th scope="col">STYLE NO</th>
									<th scope="col">ORDER NO</th>
									<th scope="col">ORDER QTY</th>
									<th scope="col">CUST PO</th>
									<th scope="col">ORDER TP</th>
									<th scope="col">GENDER</th>
									<th scope="col">DEST</th>
									<th scope="col">LINE</th>
									<th scope="col">GRP</th>
									<th scope="col">POdocDATE</th>
									<th scope="col">CUT DATE</th>
									<th scope="col">OGAC</th>
									<th scope="col">L DATE</th>
									<th scope="col">DEL</th>
								</tr>
							</thead>
							<tbody id="listRecord">
				
							</tbody>
						</table>
						<div class="layerBtnBoxRight">
							<a type="button" class="btn" id="back" onclick="orderclose();" title="COMPLETE"><img src="<c:url value='/images/egovframework/hwvn/com/btns/icon_etc.png'/>" alt="Complete" />HOÀN TẤT</a>
						</div>						
					</div>
					
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>