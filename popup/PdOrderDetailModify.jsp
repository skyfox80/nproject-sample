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
<title>ĐƠN HÀNG &gt; CHỈNH SỬA &gt; CÔNG TY TNHH HONG WON VINA (ORDER &gt; MODIFY &gt; HONG WON VINA co.,LTD)</title>
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
<script>
$(document).ready(function(){
	if('${message}' != null && '${message}' != ""){
		alert('${message}');
	}
	if('${rtn}' == "1"){
		alert("rtn: "+$('#rtn')+", Thành công (Success)");
	}
	getWidth();
	fncCheckAddClassOn();	
	fncEmptySummary();
});

function fncEmptySummary(){
	   $('#s1').focus(function(){$('#orderQty').val('');});
	   $('#s1t').focus(function(){$('#orderQty').val('');});
	   $('#s2').focus(function(){$('#orderQty').val('');});
	   $('#s2t').focus(function(){$('#orderQty').val('');});
	   $('#s3').focus(function(){$('#orderQty').val('');});
	   $('#s3t').focus(function(){$('#orderQty').val('');});
	   $('#s4').focus(function(){$('#orderQty').val('');});
	   $('#s4t').focus(function(){$('#orderQty').val('');});
	   $('#s5').focus(function(){$('#orderQty').val('');});
	   $('#s5t').focus(function(){$('#orderQty').val('');});
	   $('#s6').focus(function(){$('#orderQty').val('');});
	   $('#s6t').focus(function(){$('#orderQty').val('');});
	   $('#s7').focus(function(){$('#orderQty').val('');});
	   $('#s7t').focus(function(){$('#orderQty').val('');});
	   $('#s8').focus(function(){$('#orderQty').val('');});
	   $('#s8t').focus(function(){$('#orderQty').val('');});
	   $('#s9').focus(function(){$('#orderQty').val('');});
	   $('#s9t').focus(function(){$('#orderQty').val('');});
	   $('#s10').focus(function(){$('#orderQty').val('');});
	   $('#s10t').focus(function(){$('#orderQty').val('');});
	   $('#s11').focus(function(){$('#orderQty').val('');});
	   $('#s11t').focus(function(){$('#orderQty').val('');});
	   $('#s12').focus(function(){$('#orderQty').val('');});
	   $('#s12t').focus(function(){$('#orderQty').val('');});
	   $('#s13').focus(function(){$('#orderQty').val('');});
	   $('#s13t').focus(function(){$('#orderQty').val('');});
	   $('#s14').focus(function(){$('#orderQty').val('');});
	   $('#s14t').focus(function(){$('#orderQty').val('');});
	   $('#s15').focus(function(){$('#orderQty').val('');});
	   $('#s15t').focus(function(){$('#orderQty').val('');});
	   $('#s16').focus(function(){$('#orderQty').val('');});
	   $('#s16t').focus(function(){$('#orderQty').val('');});
	   $('#s17').focus(function(){$('#orderQty').val('');});
	   $('#s17t').focus(function(){$('#orderQty').val('');});
	   $('#s18').focus(function(){$('#orderQty').val('');});
	}

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

function getWidth(){
	var hDt = "";
	ajaxUrl = "<c:url value='/pd/order/selectWidthDesc.do'/>?sState=05";
	$.get(ajaxUrl, function(data){
		var cate_data = eval(data);
		for(j=1; j<=31; j++){
			for(i=0; i<cate_data.length; i++){
				hDt += "<li><button type='button' id='wit"+i+j+"' value='"+cate_data[i].sDetail+"' onclick=widthName("+j+",'"+cate_data[i].sDetail+"') >"+cate_data[i].sDetail+"</button></li>";
			}
			if(j==1){$('#width1').html(hDt);}	else if(j==2){$('#width2').html(hDt);}	else if(j==3){$('#width3').html(hDt);}
			else if(j==4){$('#width4').html(hDt);}	else if(j==5){$('#width5').html(hDt);}	else if(j==6){$('#width6').html(hDt);}
			else if(j==7){$('#width7').html(hDt);}	else if(j==8){$('#width8').html(hDt);}	else if(j==9){$('#width9').html(hDt);}
			else if(j==10){$('#width10').html(hDt);}	else if(j==11){$('#width11').html(hDt);}	else if(j==12){$('#width12').html(hDt);}
			else if(j==13){$('#width13').html(hDt);}	else if(j==14){$('#width14').html(hDt);}	else if(j==15){$('#width15').html(hDt);}
			else if(j==16){$('#width16').html(hDt);}	else if(j==17){$('#width17').html(hDt);}	else if(j==18){$('#width18').html(hDt);}
			else if(j==19){$('#width19').html(hDt);}	else if(j==20){$('#width20').html(hDt);}	else if(j==21){$('#width21').html(hDt);}
			else if(j==22){$('#width22').html(hDt);}	else if(j==23){$('#width23').html(hDt);}	else if(j==24){$('#width24').html(hDt);}
			else if(j==25){$('#width25').html(hDt);}	else if(j==26){$('#width26').html(hDt);}	else if(j==27){$('#width27').html(hDt);}
			else if(j==28){$('#width28').html(hDt);}	else if(j==29){$('#width29').html(hDt);}	else if(j==30){$('#width30').html(hDt);}			
			else if(j==31){$('#width31').html(hDt);}	else if(j==32){$('#width32').html(hDt);}	else if(j==33){$('#width33').html(hDt);}
			else if(j==34){$('#width34').html(hDt);}
			else{$('#width35').html(hDt);}
			hDt = "";
		}
	});
}

function widthName(widpos, width){
	if(widpos==1){$('#w1').val(width);}	else if(widpos==2){$('#w2').val(width);}	else if(widpos==3){$('#w3').val(width);}
	else if(widpos==4){$('#w4').val(width);}	else if(widpos==5){$('#w5').val(width);}	else if(widpos==6){$('#w6').val(width);}
	else if(widpos==7){$('#w7').val(width);}	else if(widpos==8){$('#w8').val(width);}	else if(widpos==9){$('#w9').val(width);}
	else if(widpos==10){$('#w10').val(width);}	else if(widpos==11){$('#w11').val(width);}	else if(widpos==12){$('#w12').val(width);}
	else if(widpos==13){$('#w13').val(width);}	else if(widpos==14){$('#w14').val(width);}	else if(widpos==15){$('#w15').val(width);}
	else if(widpos==16){$('#w16').val(width);}	else if(widpos==17){$('#w17').val(width);}	else if(widpos==18){$('#w18').val(width);}
	else if(widpos==19){$('#w19').val(width);}	else if(widpos==20){$('#w20').val(width);}	else if(widpos==21){$('#w21').val(width);}
	else if(widpos==22){$('#w22').val(width);}	else if(widpos==23){$('#w23').val(width);}	else if(widpos==24){$('#w24').val(width);}
	else if(widpos==25){$('#w25').val(width);}	else if(widpos==26){$('#w26').val(width);}	else if(widpos==27){$('#w27').val(width);}
	else if(widpos==28){$('#w28').val(width);}	else if(widpos==29){$('#w29').val(width);}	else if(widpos==30){$('#w30').val(width);}	
	else if(widpos==31){$('#w31').val(width);}	else if(widpos==32){$('#w32').val(width);}	else if(widpos==33){$('#w33').val(width);}
	else if(widpos==31){$('#w34').val(width);}
	else{$('#w35').val(width);}
}

function qtySum(){
	var summary = 0;		var descript = "";
	
	var s1 = $('#s1').val()=='' ? 0 : parseInt($('#s1').val());	
	var s2 = $('#s1t').val()=='' ? 0 : parseInt($('#s1t').val());	
	var s3 = $('#s2').val()=='' ? 0 : parseInt($('#s2').val());	
	var s4 = $('#s2t').val()=='' ? 0 : parseInt($('#s2t').val());	
	var s5 = $('#s3').val()=='' ? 0 : parseInt($('#s3').val());	
	var s6 = $('#s3t').val()=='' ? 0 : parseInt($('#s3t').val());
	var s7 = $('#s4').val()=='' ? 0 : parseInt($('#s4').val());	
	var s8 = $('#s4t').val()=='' ? 0 : parseInt($('#s4t').val());	
	var s9 = $('#s5').val()=='' ? 0 : parseInt($('#s5').val());
	var s10 = $('#s5t').val()=='' ? 0 : parseInt($('#s5t').val());	
	var s11 = $('#s6').val()=='' ? 0 : parseInt($('#s6').val());	
	var s12 = $('#s6t').val()=='' ? 0 : parseInt($('#s6t').val());
	var s13 = $('#s7').val()=='' ? 0 : parseInt($('#s7').val());	
	var s14 = $('#s7t').val()=='' ? 0 : parseInt($('#s7t').val());	
	var s15 = $('#s8').val()=='' ? 0 : parseInt($('#s8').val());
	var s16 = $('#s8t').val()=='' ? 0 : parseInt($('#s8t').val());	
	var s17 = $('#s9').val()=='' ? 0 : parseInt($('#s9').val());	
	var s18 = $('#s9t').val()=='' ? 0 : parseInt($('#s9t').val());
	var s19 = $('#s10').val()=='' ? 0 : parseInt($('#s10').val());	
	var s20 = $('#s10t').val()=='' ? 0 : parseInt($('#s10t').val());	
	var s21 = $('#s11').val()=='' ? 0 : parseInt($('#s11').val());
	var s22 = $('#s11t').val()=='' ? 0 : parseInt($('#s11t').val());	
	var s23 = $('#s12').val()=='' ? 0 : parseInt($('#s12').val());	
	var s24 = $('#s12t').val()=='' ? 0 : parseInt($('#s12t').val());
	var s25 = $('#s13').val()=='' ? 0 : parseInt($('#s13').val());	
	var s26 = $('#s13t').val()=='' ? 0 : parseInt($('#s13t').val());	
	var s27 = $('#s14').val()=='' ? 0 : parseInt($('#s14').val());
	var s28 = $('#s14t').val()=='' ? 0 : parseInt($('#s14t').val());	
	var s29 = $('#s15').val()=='' ? 0 : parseInt($('#s15').val());	
	var s30 = $('#s15t').val()=='' ? 0 : parseInt($('#s15t').val());
	var s31 = $('#s16').val()=='' ? 0 : parseInt($('#s16').val());
	var s32 = $('#s16t').val()=='' ? 0 : parseInt($('#s16t').val());
	var s33 = $('#s17').val()=='' ? 0 : parseInt($('#s17').val());
	var s34 = $('#s17t').val()=='' ? 0 : parseInt($('#s17t').val());
	var s35 = $('#s18').val()=='' ? 0 : parseInt($('#s18').val());
	
	summary = s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31+s32+s33+s34+s35;
	$('#orderQty').val(summary);
	
	if(s1 != 0){descript += "1M,"+$('#w1').val()+","+s1+";";}
	if(s2 != 0){descript += "1T,"+$('#w2').val()+","+s2+";";}
	if(s3 != 0){descript += "2M,"+$('#w3').val()+","+s3+";";}
	if(s4 != 0){descript += "2T,"+$('#w4').val()+","+s4+";";}
	if(s5 != 0){descript += "3M,"+$('#w5').val()+","+s5+";";}
	if(s6 != 0){descript += "3T,"+$('#w6').val()+","+s6+";";}
	if(s7 != 0){descript += "4M,"+$('#w7').val()+","+s7+";";}
	if(s8 != 0){descript += "4T,"+$('#w8').val()+","+s8+";";}
	if(s9 != 0){descript += "5M,"+$('#w9').val()+","+s9+";";}
	if(s10 != 0){descript += "5T,"+$('#w10').val()+","+s10+";";}
	if(s11 != 0){descript += "6M,"+$('#w11').val()+","+s11+";";}
	if(s12 != 0){descript += "6T,"+$('#w12').val()+","+s12+";";}
	if(s13 != 0){descript += "7M,"+$('#w13').val()+","+s13+";";}
	if(s14 != 0){descript += "7T,"+$('#w14').val()+","+s14+";";}
	if(s15 != 0){descript += "8M,"+$('#w15').val()+","+s15+";";}
	if(s16 != 0){descript += "8T,"+$('#w16').val()+","+s16+";";}
	if(s17 != 0){descript += "9M,"+$('#w17').val()+","+s17+";";}
	if(s18 != 0){descript += "9T,"+$('#w18').val()+","+s18+";";}
	if(s19 != 0){descript += "10M,"+$('#w19').val()+","+s19+";";}
	if(s20 != 0){descript += "10T,"+$('#w20').val()+","+s20+";";}
	if(s21 != 0){descript += "11M,"+$('#w21').val()+","+s21+";";}
	if(s22 != 0){descript += "11T,"+$('#w22').val()+","+s22+";";}
	if(s23 != 0){descript += "12M,"+$('#w23').val()+","+s23+";";}
	if(s24 != 0){descript += "12T,"+$('#w24').val()+","+s24+";";}
	if(s25 != 0){descript += "13M,"+$('#w25').val()+","+s25+";";}
	if(s26 != 0){descript += "13T,"+$('#w26').val()+","+s26+";";}
	if(s27 != 0){descript += "14M,"+$('#w27').val()+","+s27+";";}
	if(s28 != 0){descript += "14T,"+$('#w28').val()+","+s28+";";}
	if(s29 != 0){descript += "15M,"+$('#w29').val()+","+s29+";";}
	if(s30 != 0){descript += "15T,"+$('#w30').val()+","+s30+";";}
	if(s31 != 0){descript += "16M,"+$('#w31').val()+","+s31+";";}
	if(s32 != 0){descript += "16T,"+$('#w32').val()+","+s32+";";}
	if(s33 != 0){descript += "17M,"+$('#w33').val()+","+s33+";";}
	if(s34 != 0){descript += "17T,"+$('#w34').val()+","+s34+";";}
	if(s35 != 0){descript += "18M,"+$('#w35').val()+","+s35+";";}

	//$('#orderDescript').val(descript);
}

function reseting(){
	$('#s1').val('');	$('#s1t').val('');	$('#s2').val('');		
	$('#s2t').val('');	$('#s3').val('');	$('#s3t').val('');	$('#s4').val('');	$('#s4t').val('');	$('#s5').val('');
	$('#s5t').val('');	$('#s6').val('');	$('#s6t').val('');	$('#s7').val('');	$('#s7t').val('');	$('#s8').val('');
	$('#s8t').val('');	$('#s9').val('');	$('#s9t').val('');	$('#s10').val('');	$('#s10t').val('');	$('#s11').val('');
	$('#s11t').val('');	$('#s12').val('');	$('#s12t').val('');	$('#s13').val('');	$('#s13t').val('');	$('#s14').val('');
	$('#s14t').val('');	$('#s15').val('');	$('#s15t').val('');	$('#s16').val('');	
	$('#s16t').val('');	$('#s17').val('');	$('#s17t').val('');	$('#s18').val('');
	$('#orderQty').val('');	$('#orderDescript').val('');
}

function detailSave(){
	
	if($('#orderQty').val()==''){
		alert("Click vào nút SUM! (click SUM button!!)");
	} else if ($('#orderQty').val()!=${orderQtyView}) {
		alert("Không trùng khớp với số lượng đặt hàng !!!Order Qty is not matched!!!");
	}else{
		var ajaxUrl = "<c:url value='/pd/order/modifyOneOrderDetail.do'/>";
	
		var param = "unikey="+$('#unikey').val();
		param +="&orderQty="+$('#orderQty').val()+"&orderDescript"+$('#orderDescript').val();
		param +="&s1="+$('#s1').val()+"&s1t="+$('#s1t').val()+"&s2="+$('#s2').val()+"&s2t="+$('#s2t').val();
		param +="&s3="+$('#s3').val()+"&s3t="+$('#s3t').val()+"&s4="+$('#s4').val()+"&s4t="+$('#s4t').val()+"&s5="+$('#s5').val()+"&s5t="+$('#s5t').val()+"&s6="+$('#s6').val()+"&s6t="+$('#s6t').val()+"&s7="+$('#s7').val();
		param +="&s7t="+ $('#s7t').val()+"&s8="+$('#s8').val()+"&s8t="+$('#s8t').val()+"&s9="+$('#s9').val()+"&s9t="+$('#s9t').val();
		param +="&s10="+$('#s10').val()+"&s10t="+$('#s10t').val()+"&s11="+$('#s11').val()+"&s11t="+$('#s11t').val()+"&s12="+$('#s12').val();
		param +="&s12t="+$('#s12t').val()+"&s13="+$('#s13').val()+"&s13t="+$('#s13t').val()+"&s14="+$('#s14').val()+"&s14t="+$('#s14t').val();
		param +="&s15="+$('#s15').val()+"&s15t="+$('#s15t').val()+"&s16="+$('#s16').val()+"&s16t="+$('#s16t').val()+"&s17="+$('#s17').val()+"&s17t="+$('#s17t').val()+"&s18="+$('#s18').val();
		
		$.ajax({
			type:"POST",
			url:ajaxUrl,
			data:param,
			success: function(data){
				alert("success");
				location.reload();
				layerClose();
			},
			 error:function(e) {
				alert("Lỗi? (error?)");				
	 	     }
		});
	}
	
	
	/*
	f = document.listfrm;
	if($('#orderQty').val()==''){
		alert("Click nút TỔNG!! (Click SUM button!!)");
	} else if ($('#orderQty').val()!=${orderQtyView}) {
		alert("Số lượng đặt hàng không trùng khớp!!! (Order Qty is not matched!!!)");
	} else{
		f.action="<c:url value='/pd/order/modifyOneOrderDetail.do'/>";
		f.submit();
	}	
	*/
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
	<div class="layerPop layerPop_down" id="inbox">
		<div class="layerTop">
			<strong>CHỈNH SỬA DANH SÁCH ĐƠN HÀNG (MODIFY ORDER LIST DETAIL)</strong>
			<button type="button" class="layerCloseBtn layerClose"><img src="../../images/egovframework/hwvn/com/close_btn.png" alt="close layer" /></button>
		</div>
		<div class="layerCon layerConBigger">	
		
		<form name="listfrm" method="post">
		<c:set var="ordManage" value="${result}"/>
		<input type="hidden" id="unikey" name="unikey" value="${unikey}">
		<input type="hidden" id="w1"><input type="hidden" id="w2"><input type="hidden" id="w3"><input type="hidden" id="w4">
		<input type="hidden" id="w5"><input type="hidden" id="w6"><input type="hidden" id="w7"><input type="hidden" id="w8">
		<input type="hidden" id="w9"><input type="hidden" id="w10"><input type="hidden" id="w11"><input type="hidden" id="w12">
		<input type="hidden" id="w13"><input type="hidden" id="w14"><input type="hidden" id="w15"><input type="hidden" id="w16">
		<input type="hidden" id="w17"><input type="hidden" id="w18"><input type="hidden" id="w19"><input type="hidden" id="w20">
		<input type="hidden" id="w21"><input type="hidden" id="w22"><input type="hidden" id="w23"><input type="hidden" id="w24">
		<input type="hidden" id="w25"><input type="hidden" id="w26"><input type="hidden" id="w27"><input type="hidden" id="w28">
		<input type="hidden" id="w29"><input type="hidden" id="w30"><input type="hidden" id="w31">				
		<input type="hidden" id="w32"><input type="hidden" id="w33"><input type="hidden" id="w34"><input type="hidden" id="w35">				

				<div class="searchBox searchBox_popup">
					<div class="head_popup_second"><span class="head_popup_title" title='ORDER QTY' >Số lượng đặt hàng : </span><span id="orderQtyView" class="head_popup_content blue">${orderQtyView}</span></div>
				</div>
				<div class="attitudeData">
					<fieldset>
						<legend>Attitude Data</legend>
						<table summary="사원코드, 사원명, 부서, 근무조, 출결 등 입력" class="table_popup">
							<caption>근태 현황 수정</caption>
							<tbody>
								<tr>
									<th scope="row">SIZE</th>
									<th scope="row">1M</th>
									<th scope="row">1T</th>
									<th scope="row">2M</th>									
									<th scope="row">2T</th>
									<th scope="row">3M</th>
									<th scope="row">3T</th>
									<th scope="row">4M</th>
								</tr>

								<tr>
									<th scope="row" title='QTY(pairs)' >SỐ LƯỢNG (đôi)</th>
									<td><input type="text" class="w98p" name="s1" id="s1" onkeypress="return isNumberKey(event)" value="${ordManage.s1}"></td>
									<td><input type="text" class="w98p" name="s1t" id="s1t" onkeypress="return isNumberKey(event)" value="${ordManage.s1t}"></td>
									<td><input type="text" class="w98p" name="s2" id="s2" onkeypress="return isNumberKey(event)" value="${ordManage.s2}"></td>									
									<td><input type="text" class="w98p" name="s2t" id="s2t" onkeypress="return isNumberKey(event)" value="${ordManage.s2t}"></td>
									<td><input type="text" class="w98p" name="s3" id="s3" onkeypress="return isNumberKey(event)" value="${ordManage.s3}"></td>
									<td><input type="text" class="w98p" name="s3t" id="s3t" onkeypress="return isNumberKey(event)" value="${ordManage.s3t}"></td>
									<td><input type="text" class="w98p" name="s4" id="s4" onkeypress="return isNumberKey(event)" value="${ordManage.s4}"></td>
								</tr>
								
								<tr>
									<th scope="row">SIZE</th>
									<th scope="row">4T</th>
									<th scope="row">5M</th>
									<th scope="row">5T</th>									
									<th scope="row">6M</th>
									<th scope="row">6T</th>
									<th scope="row">7M</th>
									<th scope="row">7T</th>
								</tr>

								<tr>
									<th scope="row" title='QTY(pairs)' >SỐ LƯỢNG (đôi)</th>
									<td><input type="text" class="w98p" name="s4t" id="s4t" onkeypress="return isNumberKey(event)" value="${ordManage.s4t}"></td>
									<td><input type="text" class="w98p" name="s5" id="s5" onkeypress="return isNumberKey(event)" value="${ordManage.s5}"></td>
									<td><input type="text" class="w98p" name="s5t" id="s5t" onkeypress="return isNumberKey(event)" value="${ordManage.s5t}"></td>									
									<td><input type="text" class="w98p" name="s6" id="s6" onkeypress="return isNumberKey(event)" value="${ordManage.s6}"></td>
									<td><input type="text" class="w98p" name="s6t" id="s6t" onkeypress="return isNumberKey(event)" value="${ordManage.s6t}"></td>
									<td><input type="text" class="w98p" name="s7" id="s7" onkeypress="return isNumberKey(event)" value="${ordManage.s7}"></td>
									<td><input type="text" class="w98p" name="s7t" id="s7t" onkeypress="return isNumberKey(event)" value="${ordManage.s7t}"></td>
								</tr>
								
								<tr>
									<th scope="row">SIZE</th>
									<th scope="row">8M</th>
									<th scope="row">8T</th>
									<th scope="row">9M</th>									
									<th scope="row">9T</th>
									<th scope="row">10M</th>
									<th scope="row">10T</th>
									<th scope="row">11M</th>
								</tr>

								<tr>
									<th scope="row" title='QTY(pairs)' >SỐ LƯỢNG (đôi)</th>
									<td><input type="text" class="w98p" name="s8" id="s8" onkeypress="return isNumberKey(event)" value="${ordManage.s8}"></td>
									<td><input type="text" class="w98p" name="s8t" id="s8t" onkeypress="return isNumberKey(event)" value="${ordManage.s8t}"></td>
									<td><input type="text" class="w98p" name="s9" id="s9" onkeypress="return isNumberKey(event)" value="${ordManage.s9}"></td>									
									<td><input type="text" class="w98p" name="s9t" id="s9t" onkeypress="return isNumberKey(event)" value="${ordManage.s9t}"></td>
									<td><input type="text" class="w98p" name="s10" id="s10" onkeypress="return isNumberKey(event)" value="${ordManage.s10}"></td>
									<td><input type="text" class="w98p" name="s10t" id="s10t" onkeypress="return isNumberKey(event)" value="${ordManage.s10t}"></td>
									<td><input type="text" class="w98p" name="s11" id="s11" onkeypress="return isNumberKey(event)" value="${ordManage.s11}"></td>
								</tr>
								
								<tr>
									<th scope="row">SIZE</th>
									<th scope="row">11T</th>
									<th scope="row">12M</th>
									<th scope="row">12T</th>									
									<th scope="row">13M</th>
									<th scope="row">13T</th>
									<th scope="row">14M</th>
									<th scope="row">14T</th>
								</tr>
								<tr>
									<th scope="row" title='QTY(pairs)' >SỐ LƯỢNG (đôi)</th>
									<td><input type="text" class="w98p" name="s11t" id="s11t" onkeypress="return isNumberKey(event)" value="${ordManage.s11t}"></td>
									<td><input type="text" class="w98p" name="s12" id="s12" onkeypress="return isNumberKey(event)" value="${ordManage.s12}"></td>
									<td><input type="text" class="w98p" name="s12t" id="s12t" onkeypress="return isNumberKey(event)" value="${ordManage.s12t}"></td>									
									<td><input type="text" class="w98p" name="s13" id="s13" onkeypress="return isNumberKey(event)" value="${ordManage.s13}"></td>
									<td><input type="text" class="w98p" name="s13t" id="s13t" onkeypress="return isNumberKey(event)" value="${ordManage.s13t}"></td>
									<td><input type="text" class="w98p" name="s14" id="s14" onkeypress="return isNumberKey(event)" value="${ordManage.s14}"></td>
									<td><input type="text" class="w98p" name="s14t" id="s14t" onkeypress="return isNumberKey(event)" value="${ordManage.s14t}"></td>
								</tr>
								
								<tr>
									<th scope="row">SIZE</th>
									<th scope="row">15M</th>
									<th scope="row">15T</th>
									<th scope="row">16M</th>
									<th scope="row">16T</th>
									<th scope="row">17M</th>
									<th scope="row">17T</th>
									<th scope="row">18M</th>										
								</tr>

								<tr>
									<th scope="row" title='QTY(pairs)' >SỐ LƯỢNG (đôi)</th>
									<td><input type="text" class="w98p" name="s15" id="s15" onkeypress="return isNumberKey(event)" value="${ordManage.s15}"></td>
									<td><input type="text" class="w98p" name="s15t" id="s15t" onkeypress="return isNumberKey(event)" value="${ordManage.s15t}"></td>
									<td><input type="text" class="w98p" name="s16" id="s16" onkeypress="return isNumberKey(event)" value="${ordManage.s16}"></td>
									<td><input type="text" class="w98p" name="s16t" id="s16t" onkeypress="return isNumberKey(event)" value="${ordManage.s16t}"></td>
									<td><input type="text" class="w98p" name="s17" id="s17" onkeypress="return isNumberKey(event)" value="${ordManage.s17}"></td>
									<td><input type="text" class="w98p" name="s17t" id="s17t" onkeypress="return isNumberKey(event)" value="${ordManage.s17t}"></td>
									<td><input type="text" class="w98p" name="s18" id="s18" onkeypress="return isNumberKey(event)" value="${ordManage.s18}"></td>								
								</tr>
								
								<tr>
									<th scope="row"></th>
									<th scope="row"></th>
									<th scope="row"></th>
									<th scope="row"></th>
									<th scope="row"></th>
									<th scope="row"></th>
									<th colspan="2"></th>									
								</tr>

								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
																
								<tr>
									<th scope="row" class="bg_d3bc9e" title='Tính Tổng(QTY SUMMARY)' >SL TỔNG CỘNG</th>
									<td><input type="text" class="w98p" name="orderQty" id="orderQty" readonly="readonly"></td>
									<td><a type="button" class="btn" id="save1" onclick="qtySum()" title="SUM"><img src="<c:url value='/images/egovframework/hwvn/com/btns/icon_sum.png'/>"	alt="" />TỔNG</a></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</div>
				
				<div class="layerBtnBoxRight">
					<a type="button" class="btn" id="reset" onclick="reseting()" title="RESET"><img src="<c:url value='/images/egovframework/hwvn/com/btns/icon_reset_1.png'/>"	alt="" />LÀM MỚI</a>
					<a type="button" class="btn" id="save1" onclick="detailSave()" title="SAVE"><img src="<c:url value='/images/egovframework/hwvn/com/ico12.png'/>" alt="" />LƯU</a>	
					<a type="button" class="btn layerClose" id="back" title="CLOSE"><img src="<c:url value='/images/egovframework/hwvn/com/ico15.png'/>" alt="" />ĐÓNG</a>
				</div>
				
				
				
			</form>
		</div>
	</div>
</div>

</body>
</html>