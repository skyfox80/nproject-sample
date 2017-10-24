<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.com.utl.fcc.service.EgovDateUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko" xml:lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ĐƠN HÀNG &gt; DANH SÁCH CHÍNH &gt; CÔNG TY TNHH HONG WON VINA (ORDER &gt; LIST MAIN &gt; HONG WON VINA co.,LTD)</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link href="<c:url value='/css/egovframework/hwvn/reset.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/hwvn/jquery-ui.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/hwvn/layout.css'/>" rel="stylesheet" type="text/css" />

<script	src="<c:url value='/js/egovframework/hwvn/jquery-1.8.3.min.js'/>"	type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/jquery-ui.min.js'/>"	type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/jquery.form.js'/>"	type="text/javascript"></script>
<script	src="<c:url value='/js/egovframework/hwvn/jquery.MultiFile.js'/>"	type="text/javascript"></script>

<script src="<c:url value='/js/egovframework/hwvn/common.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/pd/pd_header.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/pd/pd_lnb.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/hwvn_footer.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/hr/hr_pageindex.js'/>" type="text/javascript"></script>

<script type="text/javascript">

$(document).ready(function(){
	if('${message}' != null && '${message}' != ""){
		alert('${message}');
	}
	$('#listview').text('${pageUnit}');  
	
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
});


function searching(){
	f = document.listForm;
	f.target="_self";
	$('#toDate').val($('#todt').val());
	$('#fromDate').val($('#fromdt').val());
	$('#orderNo').val($('#serchName').val());
	
	$('#pageIndex').val('1');
	f.action="<c:url value='/pd/order/PdOrderListMain.do'/>";
	f.submit();	
}

function fnOrdDetail(key){
	f = document.listForm;
	f.target="_self";
	$('#toDate').val($('#todt').val());
	$('#fromDate').val($('#fromdt').val());
	$('#unikey').val(key);
	
	$('#pageIndex').val('1');
	f.action="<c:url value='/pd/order/PdOrderListDetail.do'/>";
	f.submit();	
}

function fnOrderModify(key){
	f = document.listForm;
	f.target="formpopup";
	$('#unikey').val(key);
	f.action="<c:url value='/pd/order/PdOrderMainModify.do'/>";
	window.open("", "formpopup", "width=1000,height=600");
	f.submit();
	}

function fnDetailAdd(key){
	f = document.listForm;
	f.target="formpopup";
	$('#unikey').val(key);
	
	f.action="<c:url value='/pd/order/PdOrderDetailAdd.do'/>";
	window.open("", "formpopup", "width=1000,height=600");
	f.submit();	
}

function fnOrdNew(){
	f = document.listForm;
	f.target="formpopup";
	f.action="<c:url value='/pd/order/PdOrderListOneAdd.do'/>";
	window.open("", "formpopup", "width=1000,height=600");
	f.submit();
}

function fnOrdCancel(e){
	var msg = "Bạn muốn HỦY không? (Do you want to CANCEL?)";
	if(confirm(msg)){
		f = document.listForm;
		f.target="_self";
		
		var values = '';
		$('input:checkbox[name=issueChk]:checked').each(function(i,value){
			if(i == 0){
	    		values = values + this.value;
	    	}else{
	    		values = values +","+ this.value;	
	    	}
		});
		
		if(values == ''){
			alert("Hãy đánh dấu vào ô chọn (Please choose checkbox)");
			return;
		}else{
			$('#unikey').val(values);
			//alert($('#unikey').val());
		}
		layerOpen('<c:url value='/pd/order/PdCancelOrderList.do'/>?unikey='+values,jQuery(e),518);return false;
	}
}
/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo) {
	f = document.listForm;
	f.target="_self";
	$('#toDate').val($('#todt').val());
	$('#fromDate').val($('#fromdt').val());
	$('#orderNo').val($('#serchName').val());
	
	$('#pageSize').val($('#pageSize').val());
	$('#pageIndex').val(pageNo);
	$('#pageUnit').val($('#pageUnit').val());
	f.action="<c:url value='/pd/order/PdOrderListMain.do'/>";
	f.submit();
}



/* ********************************************************
 * List View 카운트 변경 화면 호출 함수
 ******************************************************** */
function fncListview(listCount){
	f = document.listForm;
	f.target="_self";
	$('#toDate').val($('#todt').val());
	$('#fromDate').val($('#fromdt').val());
	$('#orderNo').val($('#serchName').val());
	
	$('#pageSize').val(listCount);
	$('#pageUnit').val(listCount);
	$('#pageIndex').val('1');
	f.action="<c:url value='/pd/order/PdOrderListMain.do'/>";
	f.submit();
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

//엑셀파일 업로드  
function fileUploadPreview(thisObj) {
	
	
	var upperCase = $('#agentInstallFile').val().toUpperCase(); 
	var fileName = '';
	var str = "Bạn có muốn upload không? (Do you want to upload?)"; 
	if(!confirm(str)){
		return;
	}
	
	
	if(upperCase.indexOf("XLSX") < 1 ){
		alert("Chỉ file excel xlsx thôi (Only xlsx file)");
		return;	
	}
	
	
	 $('#uploadfrm').attr("action","<c:url value='/upload/execupload.jsp'/>");
	 $('#uploadfrm').ajaxForm({
       beforeSubmit : function(data,form,option) {
           //validation체크 
           //막기위해서는 return false를 잡아주면됨
           return true;
       },
       success : function(response,status) {
           //성공후 서버에서 받은 데이터 처리
           layerOpen('/hwvn/upload/ProgressingPopup.jsp',jQuery('body'),518);
           uploadinsert(response);
         //  alert(response.toString());
         
       },
       error : function() {
           //에러발생을 위한 code페이지
           alert("error");
       }
   }).submit();  
	
	
}

function uploadinsert(fileName){
	 var param = "fileName="+fileName;
		var ajaxUrl = "<c:url value='/pd/order/insertOrder.do'/>";
		$.ajax({
			type:"POST",
			url:ajaxUrl,
			dataType:"json",
			data:param,
			success: function(data){
				var cate_data = eval(data);
				if(cate_data[0].rescode == "0000"){
				 	alert("total : "+cate_data[0].resMsg+" SAVE");
					location.reload();	
					layerClose();
				}else{
					alert(cate_data[0].resMsg);
					location.reload();	
					layerClose();
				}
			},
			error:function(request,status,error) {
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    alert("Hãy đánh dấu chọn file Excel (Please check the Excel file)");
				layerClose();
	        }
		});
}

function orderExcelList(){
	var ajaxUrl = "<c:url value='/pd/order/PdOrderListMainExcel.do'/>";

	var param = "fromDate="+$('#fromdt').val();
	param += "&toDate="+$('#todt').val();
	param += "&orderNo="+$('#orderNo').val();
	param += "&originCom2="+$('#originCom2').val();
	param += "&pageSize="+$('#pageSize').val();
	param += "&pageUnit="+$('#pageUnit').val();
	param += "&pageIndex="+$('#pageIndex').val();
	
	$.ajax({
		type:"POST",
		url:ajaxUrl,
		data:param,
		success: function(data){
			open("/hwvn/upload/execview.jsp?fileName="+data,"","toolbar=1, status=1, scrollbars=yes, location=1, menubar=1, ,resizable=1, width=800, height=600");				
		},
		 error:function(e) {
			alert("error?");				
 	     }
	});
}

function copySelectionText(){
	var copysuccess // var to check whether execCommand successfully executed
	try{
		copysuccess = document.execCommand("copy"); // run command to copy selected text to clipboard
	} catch(e){
		copysuccess = false;
	}
	return copysuccess;
}

function copyText(e) {
	var doc = document;
	var text = e;
	var range;
	var selection;    
	if (doc.body.createTextRange) {
	    range = document.body.createTextRange();
	    range.moveToElementText(text);
	    range.select();
	} else if (window.getSelection) {
	    selection = window.getSelection();        
	    range = document.createRange();
	    range.selectNodeContents(text);
	    selection.removeAllRanges();
	    selection.addRange(range);
	}
	var copysuccess = copySelectionText();
	$(".btn").removeClass("on");
	$(e).addClass("on");
}


</script>
</head>
<body>
<input type="hidden" name="inCharge" id="inCharge" value="${loginVO.id}">
<input type="hidden" name="userSe" id="userSe" value="${loginVO.userSe}">
	<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
	<!-- global -->
	<div id="globalWrap" class="navi_type1">
		<!-- header -->
		<script>pd_header($('#userSe').val(),'${loginVO.id}','top1');</script>
		<!-- header:E -->

		<!-- content -->
		<div id="container">
			<div>

		<!-- left menu -->
		<script>pd_lnb('order1');</script>
		<!-- left menu:E -->

				<!-- con_body -->
				<div class="conWrap">
					<div>
					
						<form name="listForm" action="${pageContext.request.contextPath}/pd/order/PdOrderListMain.do" method="post">
							<input type="hidden" name="pageIndex" id="pageIndex" value="<c:if test="${empty ordSearchVO.pageIndex }">1</c:if><c:if test="${!empty ordSearchVO.pageIndex }"><c:out value='${ordSearchVO.pageIndex}'/></c:if>" />
							<input type="hidden" name="pageUnit" id="pageUnit" value="${pageUnit}">
							<input type="hidden" name="pageSize" id="pageSize" value="${pageUnit}">
							<input type="hidden" name="toDate" id="toDate">
							<input type="hidden" name="fromDate" id="fromDate">
							<input type="hidden" name="unikey" id="unikey">
							<input type="hidden" name="originCom2" id="originCom2" value="${originCom2}">
							<input type="hidden" name="orderNo" id="orderNo">	
						</form>	
							<fieldset>
								<legend>Order List Main</legend>
								<div class="searchBox">
									<span class="dateDouble"> 
									<input type="text" title="검색 시작일" class="datepicker w100" name="fromdt" id="fromdt"  value="${fromday}" readonly/> ~ 
									<input type="text" title="검색 종료일" class="datepicker w100" name="todt" id="todt" value="${today}" readonly/>
									</span>
									
									<div class="selectWrap w130">
										<div class="selectVal"><span id="company">SELECT</span><button type="button"><em class="blind">SELECT 리스트 열기</em></button></div>
										<ul class="selectList">
										<li><button type="button" id="com" value="" onclick="$('#originCom2').val('')">SELECT</button></li>
										<c:forEach var="pdCom2" items="${company2}" varStatus="status">
											<li><button type="button" id="company${status.index}" value="${pdCom2.originCom2}" onclick="$('#originCom2').val('${pdCom2.originCom2}')">${pdCom2.originCom2}</button></li>
										</c:forEach>	
										</ul>
									</div>
									  
									<span title='Order No, Model' >Mã ĐH, Model:
									<input type="text" title="검색어 입력" name="serchName" id="serchName" value="${orderNo}" onkeypress="if(event.keyCode==13){searching();}">									
									</span>
										<a href="#" class="btn schBtn" onclick="searching(); return false;"> 
										<img style="transform: translate(0%,20%);" src="<c:url value='/images/egovframework/hwvn/com/ico8.png'/>" class="nmr" alt="검색" /></a>
									
									<div class="fr">
										<a href="#" class="btn"	onclick="fnOrdNew()" style="margin-right:10px;" title="NEW" ><img src="<c:url value='/images/egovframework/hwvn/com/ico9.png'/>" alt="NEW ADD" />THÊM</a>
										<a href="#" class="btn fr" style="margin-right:10px;" onclick="orderExcelList()" title="DOWN" ><img src="<c:url value='/images/egovframework/hwvn/com/ico13.png'/>" alt="Excel Down" />DOWN</a>
										<%-- <a href="#" class="btn fr" onclick="fnOrdCancel()" style="margin-right:10px;"><img src="<c:url value='/images/egovframework/hwvn/com/ico7.png'/>" alt="CANCEL" />CANCEL</a> --%>
										<a href="#" class="btn fr" onclick="fnOrdCancel(this)" style="margin-right:10px;" title="CANCEL" ><img src="<c:url value='/images/egovframework/hwvn/com/ico7.png'/>" alt="CANCEL" />HỦY</a>
										<form name="uploadfrm" id="uploadfrm" method="post" enctype="multipart/form-data" class="fr">
											<a type="button" class="btn fl imgAdd" id="imgbtn" title="UPLOAD"  onclick="return false;" style="margin-right:10px;"><img src="<c:url value='/images/egovframework/hwvn/com/ico13.png'/>" alt="" />UPLOAD</a>
											<input type="file" name="agentInstallFile" id="agentInstallFile" class="imgSelect" data-maxsize="1024" onchange="fileUploadPreview(this);" /> 
											<input type="hidden" name="imghidden" id="imghidden" />
										</form>
									</div>
									
								</div>
								<div class="gridTable">
									<div class="tableCount"><span title='Total' >Tổng</span> : ${paginationInfo.totalRecordCount}  / <span title='Page' >Trang</span> : ${ordSearchVO.pageIndex } / ${paginationInfo.totalPageCount }</div>
									<table summary="No, code, name, department,근무조,시작시간,종료시간">
										<caption>Employee Registration</caption>
										<colgroup>
											<col width="3%">
											<col width="2%">
											<col width="3%">
											<col width="4%">
											<col width="5%">																						
											<col width="7%">
											<col width="7%">
											<col width="6%">
											<col width="auto">
											<col width="5%">
											<col width="6%">
											<col width="6%">
											<col width="6%">
											<col width="6%">
											<%-- <col width="6%"> --%>
											<col width="6%">
											<col width="7%">
											<col width="7%">
										</colgroup>

										<thead>
											<tr>
												<th scope="col">STT</th>
												<th scope="col"><input type="checkbox" class="allChk" title="전체SELECT" /></th>
												<th scope="col">LINE</th>
												<th scope="col">G TÍNH</th>
												<th scope="col">LOẠI ĐH</th>
												<th scope="col">CTY2</th>
												<th scope="col">MÃ KHÁCH HÀNG</th>
												<th scope="col">MÃ ĐH</th>
												<th scope="col">MÃ KIỂU</th>
												<th scope="col">SL ĐẶT</th>
												<th scope="col">SL CÒN</th>
												<th scope="col">NGÀY CẮT</th>
												<th scope="col">VSP DEST</th>
												<th scope="col">OGAC</th>
												<!-- <th scope="col">NGÀY CUỐI</th> -->
												<th scope="col">SỬA</th>
												<th scope="col">CHI TIẾT</th>
												<th scope="col">XỬ LÝ SL CÒN</th>
											</tr>
										</thead>

										<thead>
											<tr>
												<th scope="col">No.</th>
												<th scope="col"><input type="checkbox" class="allChk" title="전체SELECT" /></th>
												<th scope="col">LINE</th>
												<th scope="col">GEND</th>
												<th scope="col">ORD TYPE</th>
												<th scope="col">COM2</th>
												<th scope="col">CUSTOMER PO</th>
												<th scope="col">ORDER NO</th>
												<th scope="col">STYLE NO</th>
												<th scope="col">ORD QTY</th>
												<th scope="col">REMAIN QTY</th>
												<th scope="col">CUT DATE</th>
												<th scope="col">VSP DEST</th>
												<th scope="col">OGAC</th>
												<!-- <th scope="col">L DATE</th> -->
												<th scope="col">MODIFY</th>
												<th scope="col">DETAIL</th>											
												<th scope="col">DISPOSITION</th>
											</tr>
										</thead>
										<tbody>
											<%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
											<c:if test="${fn:length(resultList) == 0}">
												<tr>
													<td class="lt_text3" colspan="17"><spring:message code="common.nodata.msg" /></td>
												</tr>
											</c:if>
											<c:forEach var="ordManage" items="${resultList}" varStatus="status">
												<c:if test="${status.count %2==0}">
													<tr class="even" >
												</c:if>
												<c:if test="${status.count %2==1}">
													<tr >
												</c:if>
												<td class="lt_text3" align="center" nowrap><c:out value="${(ordSearchVO.pageIndex - 1) * ordSearchVO.pageSize + status.count}"/></td>
												<td class="lt_text3" nowrap><input type="checkbox" id="issueChk" name="issueChk" title="행 SELECT" value="${ordManage.unikey}"/></td>
												<td title="<c:out value="${ordManage.makeLine}" />" ><c:out value="${ordManage.makeLine}" /></td>
												<td title="<c:out value="${ordManage.modelGender}" />" ><c:out value="${ordManage.modelGender}" /></td>
												<td title="<c:out value="${ordManage.orderType}" />" ><c:out value="${ordManage.orderType}" /></td>
												<td title="<c:out value="${ordManage.originCom2}" />" ><c:out value="${ordManage.originCom2}" /></td>
												<%-- <td title="<c:out value="${ordManage.poDocDate}" />" ><c:if test="${!empty ordManage.poDocDate}">
													<c:out value="${fn:substring(ordManage.poDocDate,0,4)}-${fn:substring(ordManage.poDocDate,4,6)}-${fn:substring(ordManage.poDocDate,6,8)}"/></c:if>
												</td> --%>
												<td title="<c:out value="${ordManage.customerPo}" />" ><c:out value="${ordManage.customerPo}" /></td>
												<td title="<c:out value="${ordManage.orderNo}" />" ><span class="btn" onclick="copyText(this);"><c:out value="${ordManage.orderNo}" /></span></td>
												<td><a href="#" class="btn_link" title="<c:out value="${ordManage.styleNo}" />"  onclick="fnOrdDetail('${ordManage.unikey}');"><c:out value="${ordManage.styleNo}" /></a></td>
												<td title="<c:out value="${ordManage.orderQty}" />" ><c:out value="${ordManage.orderQty}" /></td>
												<td title="<c:out value="${ordManage.orderRemainQty}" />" ><c:out value="${ordManage.orderRemainQty}" /></td>
												<td title="<c:out value="${ordManage.cutGetDate}" />" ><c:if test="${!empty ordManage.cutGetDate}">
													<c:out value="${fn:substring(ordManage.cutGetDate,0,4)}-${fn:substring(ordManage.cutGetDate,4,6)}-${fn:substring(ordManage.cutGetDate,6,8)}"/></c:if>
												</td>
												<td title="<c:out value="${ordManage.modelDest}" />" ><c:out value="${ordManage.modelDest}" /></td>
												<td title="<c:out value="${ordManage.shippingDate}" />" ><c:if test="${!empty ordManage.shippingDate}">
													<c:out value="${fn:substring(ordManage.shippingDate,0,4)}-${fn:substring(ordManage.shippingDate,4,6)}-${fn:substring(ordManage.shippingDate,6,8)}"/></c:if>
												</td>
												<%-- 
												<td title="<c:out value="${ordManage.instoreSdate}" />" ><c:if test="${!empty ordManage.instoreSdate}">
													<c:out value="${fn:substring(ordManage.instoreSdate,0,4)}-${fn:substring(ordManage.instoreSdate,4,6)}-${fn:substring(ordManage.instoreSdate,6,8)}"/></c:if>
												</td>
												 --%>
												<td class="lt_text3" nowrap>
													<%-- <a href="#"  class="btn"  onclick="fnOrderModify('${ordManage.unikey}')">MODIFY</a> --%>
													<%-- <c:if test="${ordManage.orderDetail != 'Y'}"> --%>
													<a href="#"  class="btn"  title="MODIFY" onclick="layerOpen('<c:url value='/pd/order/PdOrderMainModify.do?unikey=${ordManage.unikey}'/>',jQuery(this),518);return false;"><img src="<c:url value='/images/egovframework/hwvn/com/ico3.gif'/>" alt="modify(수정)" />SỬA</a>
													<%-- </c:if> --%>
												</td>
												<td class="lt_text3" nowrap>
													<c:if test="${ordManage.orderDetail != 'Y'}">
													<%-- <a href="#"  class="btn"  onclick="fnDetailAdd('${ordManage.unikey}')">ADD</a> --%>
													<a href="#" class="btn" title="ADD DETAIL" onclick="layerOpen('<c:url value='/pd/order/PdOrderDetailAdd.do?unikey=${ordManage.unikey}'/>',jQuery(this),518);return false;"><img src="<c:url value='/images/egovframework/hwvn/com/ico9.png'/>" alt="Detail Add(디테일등록)" />CHI TIẾT</a>
													</c:if>
												</td>
												<td class="lt_text3" nowrap>
													<c:if test="${ordManage.orderRemainQty != '0'}">
													<a href="#" class="btn" title="DISPOSITION" onclick="layerOpen('<c:url value='/pd/order/PdOrderDispose.do?unikey=${ordManage.unikey}'/>',jQuery(this),518);return false;"><img src="<c:url value='/images/egovframework/hwvn/com/ico7.png'/>" alt="Disposition(오더 처분)" />XỬ LÝ</a>
													</c:if>
												</td>
												</tr>
											</c:forEach>

										</tbody>
									</table>
			<c:if test="${!empty ordSearchVO.pageIndex }">
				<div class="pageing">
					<div>
						<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
					</div>
				<!-- pageindex menu -->
					<script>hr_pageindex('1');</script>
				<!-- pageindex menu:E -->
				</div>
			</c:if>
								</div>
							</fieldset>
						
					</div>
				</div>
				<!-- con_body:E -->
			</div>
		<!-- content:E -->

		<!-- footer -->
			<script>hr_footer('1');</script>
		<!-- footer:E -->
		</div>
	</div>
	<!-- global:E -->
	<iframe name="excelfrm" width="0" height="0" />
</body>
</html>
