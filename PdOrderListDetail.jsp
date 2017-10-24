<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.com.utl.fcc.service.EgovDateUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko" xml:lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ĐƠN HÀNG &gt; DANH SÁCH CHI TIẾT &gt; CÔNG TY TNHH HONG WON VINA (ORDER &gt; LIST DETAIL &gt; HONG WON VINA co.,LTD)</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link href="<c:url value='/css/egovframework/hwvn/reset.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/hwvn/jquery-ui.css'/>" rel="stylesheet" type="text/css" />
<link href="<c:url value='/css/egovframework/hwvn/layout.css'/>" rel="stylesheet" type="text/css" />
<script src="<c:url value='/js/egovframework/hwvn/jquery-1.8.3.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/jquery-ui.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/common.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/pd/pd_header.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/pd/pd_lnb.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/hwvn_footer.js'/>" type="text/javascript"></script>
<script src="<c:url value='/js/egovframework/hwvn/hr/hr_pageindex.js'/>" type="text/javascript"></script>

<script type="text/javascript">

$(document).ready(function(){
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
	
	$('#pageIndex').val('1');
	f.action="<c:url value='/pd/order/PdOrderListDetail.do'/>";
	f.submit();
}

/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo) {
	f = document.listForm;
	f.target="_self";
	$('#toDate').val($('#todt').val());
	$('#fromDate').val($('#fromdt').val());
	
	$('#pageSize').val($('#pageSize').val());
	$('#pageIndex').val(pageNo);
	$('#pageUnit').val($('#pageUnit').val());
	f.action="<c:url value='/pd/order/PdOrderListDetail.do'/>";
	f.submit();
}

function fnDetailModify(key){
	f = document.listForm;
	f.target="_self";
	$('#unikey').val(key);
	
	f.action="<c:url value='/pd/order/PdOrderDetailModify.do'/>";
	f.submit();
}

function fnViewDetail(key){
	f = document.listForm;
	f.target="_self";
	$('#unikey').val(key);
	
	f.action="<c:url value='/pd/order/selectOrderDescript.do'/>";
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
	
	$('#pageSize').val(listCount);
	$('#pageUnit').val(listCount);
	$('#pageIndex').val('1');
	f.action="<c:url value='/pd/order/PdOrderListDetail.do'/>";
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
})



function orderExcelList(){
	var ajaxUrl = "<c:url value='/pd/order/PdOrderListDetailExcel.do'/>";

	var param = "fromDate="+$('#fromdt').val();
	param += "&toDate="+$('#todt').val();
	param += "&unikey="+'${unikey}';
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
			alert("Lỗi? (error?)");				
 	     }
	});
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
		<script>pd_lnb('order2');</script>
		<!-- left menu:E -->

				<!-- con_body -->
				<div class="conWrap">
					<div>
					
						<form name="listForm" action="${pageContext.request.contextPath}/pd/order/PdOrderListDetail.do" method="post">
							<input type="hidden" name="pageIndex" id="pageIndex" value="<c:if test="${empty ordSearchVO.pageIndex }">1</c:if><c:if test="${!empty ordSearchVO.pageIndex }"><c:out value='${ordSearchVO.pageIndex}'/></c:if>" />
							<input type="hidden" name="pageUnit" id="pageUnit" value="${pageUnit}">
							<input type="hidden" name="pageSize" id="pageSize" value="${pageUnit}">
							<input type="hidden" name="toDate" id="toDate">
							<input type="hidden" name="fromDate" id="fromDate">
							<input type="hidden" name="unikey" id="unikey" value="${unikey}">
						</form>	
							<fieldset>
								<legend>Order List Detail</legend>
								<div class="searchBox">
									<span class="dateDouble"> 
									<input type="text" title="검색 시작일" class="datepicker w100" name="fromdt" id="fromdt"  value="${fromday}" readonly/> ~ 
									<input type="text" title="검색 종료일" class="datepicker w100" name="todt" id="todt" value="${today}" readonly/>
									</span>

									<a href="#" class="btn schBtn" onclick="searching(); return false;"> 
									<img style="transform: translate(0%,20%);" src="<c:url value='/images/egovframework/hwvn/com/ico8.png'/>" class="nmr" alt="검색" /></a>
									
									<div class="fr">
										<a href="#" class="btn" onclick="orderExcelList()"><img src="<c:url value='/images/egovframework/hwvn/com/ico13.png'/>" alt="Excel Down" />DOWN</a>
									</div>
									
								</div>
								<div class="gridTable">
									<div class="tableCount"><span title='Total' >Tổng</span> : ${paginationInfo.totalRecordCount}  / <span title='Page' >Trang</span> : ${ordSearchVO.pageIndex } / ${paginationInfo.totalPageCount }</div>
									<table summary="No,ORDER_NO,STYLE_NO,VSP_DEST,TOTAL,SIZE:2T~16M,MODIFY">
										<caption>Employee Registration</caption>
										<colgroup>
											<col width="2%" />
											<col width="5%" />
											<col width="auto" />
											<col width="5%" />
											<col width="5%" />								
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />			
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />
											<col width="2%" />								
											<col width="4%" />
										</colgroup>
										
										<thead>
											<tr>
												<th scope="col">STT</th>
												<th scope="col">MÃ ĐH</th>
												<th scope="col">MÃ KIỂU</th>
												<th scope="col">VSP_DEST</th>
												<th scope="col">TỔNG</th>
												<th scope="col">1M</th>
												<th scope="col">1T</th>
												<th scope="col">2M</th>
												<th scope="col">2T</th>
												<th scope="col">3M</th>
												<th scope="col">3T</th>
												<th scope="col">4M</th>
												<th scope="col">4T</th>
												<th scope="col">5M</th>
												<th scope="col">5T</th>
												<th scope="col">6M</th>
												<th scope="col">6T</th>
												<th scope="col">7M</th>
												<th scope="col">7T</th>
												<th scope="col">8M</th>
												<th scope="col">8T</th>												
												<th scope="col">9M</th>
												<th scope="col">9T</th>
												<th scope="col">10M</th>
												<th scope="col">10T</th>
												<th scope="col">11M</th>
												<th scope="col">11T</th>
												<th scope="col">12M</th>
												<th scope="col">12T</th>
												<th scope="col">13M</th>
												<th scope="col">13T</th>
												<th scope="col">14M</th>
												<th scope="col">14T</th>
												<th scope="col">15M</th>
												<th scope="col">15T</th>
												<th scope="col">16M</th>
												<th scope="col">16T</th>
												<th scope="col">17M</th>
												<th scope="col">17T</th>
												<th scope="col">18M</th>
												<th scope="col">SỬA</th>
											</tr>
										</thead>
																				
										<thead>
											<tr>
												<th scope="col">No.</th>
												<th scope="col">ORDER_NO</th>
												<th scope="col">STYLE_NO</th>
												<th scope="col">VSP_DEST</th>
												<th scope="col">TOTAL</th>
												<th scope="col">1M</th>
												<th scope="col">1T</th>
												<th scope="col">2M</th>												
												<th scope="col">2T</th>
												<th scope="col">3M</th>
												<th scope="col">3T</th>
												<th scope="col">4M</th>
												<th scope="col">4T</th>
												<th scope="col">5M</th>
												<th scope="col">5T</th>
												<th scope="col">6M</th>
												<th scope="col">6T</th>
												<th scope="col">7M</th>
												<th scope="col">7T</th>
												<th scope="col">8M</th>
												<th scope="col">8T</th>												
												<th scope="col">9M</th>
												<th scope="col">9T</th>
												<th scope="col">10M</th>
												<th scope="col">10T</th>
												<th scope="col">11M</th>
												<th scope="col">11T</th>
												<th scope="col">12M</th>
												<th scope="col">12T</th>
												<th scope="col">13M</th>
												<th scope="col">13T</th>
												<th scope="col">14M</th>
												<th scope="col">14T</th>
												<th scope="col">15M</th>
												<th scope="col">15T</th>
												<th scope="col">16M</th>
												<th scope="col">16T</th>
												<th scope="col">17M</th>
												<th scope="col">17T</th>
												<th scope="col">18M</th>
												<th scope="col">MODIFY</th>
											</tr>
										</thead>
										<tbody>
											<%-- 데이터를 없을때 화면에 메세지를 출력해준다 --%>
											<c:if test="${fn:length(resultList) == 0}">
												<tr>
													<td class="lt_text3" colspan="41"><spring:message code="common.nodata.msg" /></td>
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
												<td class="lt_text3" title="${ordManage.orderNo}" nowrap><c:out value="${ordManage.orderNo}" /></td>
												<td class="lt_text3" title="${ordManage.styleNo}" nowrap><c:out value="${ordManage.styleNo}" /></td>
												<td class="lt_text3" title="${ordManage.modelDest}" nowrap><c:out value="${ordManage.modelDest}" /></td>
												<td class="lt_text3" title="${ordManage.orderQty}" nowrap><c:out value="${ordManage.orderQty}" /> Pair</td>
												<td class="lt_text3" title="${ordManage.s1}" nowrap><c:out value="${ordManage.s1}" /></td>
												<td class="lt_text3" title="${ordManage.s1t}" nowrap><c:out value="${ordManage.s1t}" /></td>
												<td class="lt_text3" title="${ordManage.s2}" nowrap><c:out value="${ordManage.s2}" /></td>												
												<td class="lt_text3" title="${ordManage.s2t}" nowrap><c:out value="${ordManage.s2t}" /></td>
												<td class="lt_text3" title="${ordManage.s3}" nowrap><c:out value="${ordManage.s3}" /></td>
												<td class="lt_text3" title="${ordManage.s3t}" nowrap><c:out value="${ordManage.s3t}" /></td>												
												<td class="lt_text3" title="${ordManage.s4}" nowrap><c:out value="${ordManage.s4}" /></td>
												<td class="lt_text3" title="${ordManage.s4t}" nowrap><c:out value="${ordManage.s4t}" /></td>
												<td class="lt_text3" title="${ordManage.s5}" nowrap><c:out value="${ordManage.s5}" /></td>
												<td class="lt_text3" title="${ordManage.s5t}" nowrap><c:out value="${ordManage.s5t}" /></td>
												<td class="lt_text3" title="${ordManage.s6}" nowrap><c:out value="${ordManage.s6}" /></td>											
												<td class="lt_text3" title="${ordManage.s6t}" nowrap><c:out value="${ordManage.s6t}" /></td>												
												<td class="lt_text3" title="${ordManage.s7}" nowrap><c:out value="${ordManage.s7}" /></td>
												<td class="lt_text3" title="${ordManage.s7t}" nowrap><c:out value="${ordManage.s7t}" /></td>
												<td class="lt_text3" title="${ordManage.s8}" nowrap><c:out value="${ordManage.s8}" /></td>
												<td class="lt_text3" title="${ordManage.s8t}" nowrap><c:out value="${ordManage.s8t}" /></td>
												<td class="lt_text3" title="${ordManage.s9}" nowrap><c:out value="${ordManage.s9}" /></td>
												<td class="lt_text3" title="${ordManage.s9t}" nowrap><c:out value="${ordManage.s9t}" /></td>
												<td class="lt_text3" title="${ordManage.s10}" nowrap><c:out value="${ordManage.s10}" /></td>
												<td class="lt_text3" title="${ordManage.s10t}" nowrap><c:out value="${ordManage.s10t}" /></td>
												<td class="lt_text3" title="${ordManage.s11}" nowrap><c:out value="${ordManage.s11}" /></td>
												<td class="lt_text3" title="${ordManage.s11t}" nowrap><c:out value="${ordManage.s11t}" /></td>
												<td class="lt_text3" title="${ordManage.s12}" nowrap><c:out value="${ordManage.s12}" /></td>
												<td class="lt_text3" title="${ordManage.s12t}" nowrap><c:out value="${ordManage.s12t}" /></td>
												<td class="lt_text3" title="${ordManage.s13}" nowrap><c:out value="${ordManage.s13}" /></td>
												<td class="lt_text3" title="${ordManage.s13t}" nowrap><c:out value="${ordManage.s13t}" /></td>
												<td class="lt_text3" title="${ordManage.s14}" nowrap><c:out value="${ordManage.s14}" /></td>
												<td class="lt_text3" title="${ordManage.s14t}" nowrap><c:out value="${ordManage.s14t}" /></td>
												<td class="lt_text3" title="${ordManage.s15}" nowrap><c:out value="${ordManage.s15}" /></td>
												<td class="lt_text3" title="${ordManage.s15t}" nowrap><c:out value="${ordManage.s15t}" /></td>
												<td class="lt_text3" title="${ordManage.s16}" nowrap><c:out value="${ordManage.s16}" /></td>
												<td class="lt_text3" title="${ordManage.s16t}" nowrap><c:out value="${ordManage.s16t}" /></td>
												<td class="lt_text3" title="${ordManage.s17}" nowrap><c:out value="${ordManage.s17}" /></td>
												<td class="lt_text3" title="${ordManage.s17t}" nowrap><c:out value="${ordManage.s17t}" /></td>
												<td class="lt_text3" title="${ordManage.s18}" nowrap><c:out value="${ordManage.s18}" /></td>												
												<td class="lt_text3" nowrap>
													<%-- <a href="#" class="btn" title="MODIFY" onclick="layerOpen('<c:url value='/pd/order/PdOrderDetailModify.do?unikey=${ordManage.unikey}'/>',jQuery(this),518);return false;">SỬA</a> --%>
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
	<!-- global:E -->
	<iframe name="excelfrm" width="0" height="0" />
</body>
</html>
