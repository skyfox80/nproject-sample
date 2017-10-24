package egovframework.hwvn.pd.order.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.hwvn.pd.cut.service.PdCutService;
import egovframework.hwvn.pd.etc.service.PdEtcService;
import egovframework.hwvn.pd.order.service.PdOrderDefaultVO;
import egovframework.hwvn.pd.order.service.PdOrderManageVO;
import egovframework.hwvn.pd.order.service.PdOrderService;
import egovframework.hwvn.pd.produce.service.PdProduceService;
import egovframework.hwvn.pd.release.service.PdReleaseService;
import egovframework.hwvn.pd.statistics.service.PdStatisticsService;
import egovframework.hwvn.pd.warehouse.service.PdWarehouseService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;



/**
 * order 메뉴의 요청을  비지니스 클래스로 전달하고 처리된결과를  해당
 * 웹 화면으로 전달하는  Controller를 정의한다
 * @author PLUS N SOFT 개발팀
 * @since 2015.07.15
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2015.07.15  개발팀          최초 생성
 *
 * </pre>
 */

@Controller
public class PdOrderController {

	public PdOrderController() {
		// TODO Auto-generated constructor stub
	}
	
	/** pdCutService */
	@Resource(name = "pdCutService")
	private PdCutService pdCutService;
	
	/** pdEtcService */
	@Resource(name = "pdEtcService")
	private PdEtcService pdEtcService;

	/** pdOrderService */
	@Resource(name = "pdOrderService")
	private PdOrderService pdOrderService;

	/** pdProduceService */
	@Resource(name = "pdProduceService")
	private PdProduceService pdProduceService;

	/** pdReleaseService */
	@Resource(name = "pdReleaseService")
	private PdReleaseService pdReleaseService;

	/** pdStatisticsService */
	@Resource(name = "pdStatisticsService")
	private PdStatisticsService pdStatisticsService;

	/** pdWarehouseService */
	@Resource(name = "pdWarehouseService")
	private PdWarehouseService pdWarehouseService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** DefaultBeanValidator beanValidator */
	@Autowired
	private DefaultBeanValidator beanValidator;

	private LoginVO user;
	
	
	
	/**
	 * 오더 리스트 메인 페이지 조회 
	 * @param ordSearchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@IncludedInfo(name = "오더 리스트(Order List)", order = 9002, gid = 70)
	@RequestMapping(value = "/pd/order/PdOrderListMain.do")
	public String selectOrderListMain(@ModelAttribute("ordSearchVO") PdOrderDefaultVO ordSearchVO, ModelMap model, HttpServletRequest request) throws Exception {

		/*** Login ID에 매칭되는 리스트만 조회 */
		user =  (LoginVO)request.getSession().getAttribute("loginVO");
		ordSearchVO.setInCharge(user.getId());
		
		/*** pagination setting */
		PaginationInfo paginationInfo = new PaginationInfo();					
		paginationInfo.setCurrentPageNo(ordSearchVO.getPageIndex());			//현재페이지번호
		paginationInfo.setRecordCountPerPage(ordSearchVO.getPageUnit());		//리스트의 레코드(행) 개수 정의
		paginationInfo.setPageSize(ordSearchVO.getPageSize());					//레코드의 Numbering 계산용 size 정의

		ordSearchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		ordSearchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		ordSearchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		model.addAttribute("ordSearchVO", ordSearchVO);
		model.addAttribute("loginVO", user);
		
		int totCnt = pdOrderService.selectOrderListMainCount(ordSearchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		List<?> ordManageList = pdOrderService.selectOrderListMain(ordSearchVO);
		model.addAttribute("resultList", ordManageList);
		model.addAttribute("pageUnit", ordSearchVO.getPageUnit());
		

		return "egovframework/hwvn/pd/order/PdOrderListMain"; 
	}
	
	/**
	 * 
	 * @param ordSearchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@IncludedInfo(name = "오더 리스트(Order List Detail)", order = 9003, gid = 71)
	@RequestMapping(value = "/pd/order/PdOrderListDetail.do")
	public String selectOrderListDetail(@ModelAttribute("ordSearchVO") PdOrderDefaultVO ordSearchVO, ModelMap model, HttpServletRequest request) throws Exception {

		/*** Login ID에 매칭되는 리스트만 조회 */
		user =  (LoginVO)request.getSession().getAttribute("loginVO");
		ordSearchVO.setInCharge(user.getId());
		
		/*** pagination setting */
		PaginationInfo paginationInfo = new PaginationInfo();					
		paginationInfo.setCurrentPageNo(ordSearchVO.getPageIndex());			//현재페이지번호
		paginationInfo.setRecordCountPerPage(ordSearchVO.getPageUnit());		//리스트의 레코드(행) 개수 정의
		paginationInfo.setPageSize(ordSearchVO.getPageSize());					//레코드의 Numbering 계산용 size 정의

		ordSearchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		ordSearchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		ordSearchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		model.addAttribute("ordSearchVO", ordSearchVO);
		model.addAttribute("loginVO", user);
		
		int totCnt = pdOrderService.selectOrderListDetailCount(ordSearchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		List<?> ordManageList = pdOrderService.selectOrderListDetail(ordSearchVO);
		model.addAttribute("resultList", ordManageList);
		model.addAttribute("pageUnit", ordSearchVO.getPageUnit());
		
		return "egovframework/hwvn/pd/order/PdOrderListDetail"; 
	}
	
	/**
	 * 오더 리스트 개별 등록
	 * @param ordSearchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@IncludedInfo(name = "오더 Main 개별 등록", order = 9020, gid = 88)
	@RequestMapping(value = "/pd/order/PdOrderListOneAdd.do")
	public String orderListOneAdd(@ModelAttribute("ordSearchVO") PdOrderDefaultVO ordSearchVO, ModelMap model, HttpServletRequest request) throws Exception {

		return "egovframework/hwvn/pd/order/PdOrderListAdd";	
	}
	
	/**
	 * 모델 리스트에 등록된 정보를 depth별로 select box로 불러오는 함수
	 * @param ordSearchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/pd/order/orderListAddDesc.do")
	public String orderListGetModelDesc(@ModelAttribute("ordSearchVO") PdOrderDefaultVO ordSearchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		try{
			List<?> orderModelList = pdOrderService.selectEtcModelListDesc(ordSearchVO);
			
			model.addAttribute("modelList", orderModelList);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "egovframework/hwvn/pd/order/PdOrderGetModelDesc";	
	}
	
	/**
	 * Model Gender를 standardvalue 테이블에서 불러오는 함수
	 * @param ordSearchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/pd/order/selectGenderDesc.do")
	public String orderListGetGenderDesc(@ModelAttribute("ordSearchVO") PdOrderDefaultVO ordSearchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		try{
			List<?> orderGenderList = pdOrderService.selectModelGenderDesc(ordSearchVO);
			
			model.addAttribute("genderlist", orderGenderList);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "egovframework/hwvn/pd/order/PdGetModelGenderDesc";	
	}
	
	/**
	 * 오더 리스트 등록 처리 후, 입력된 정보의 key 값 가져오기
	 * @param ordSearchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/pd/order/insertOneOrder.do")
	public String insertOneOrderList(@ModelAttribute("ordManageVO") PdOrderManageVO ordManageVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		user =  (LoginVO)request.getSession().getAttribute("loginVO");
		ordManageVO.setInCharge(user.getId());
		
		String unikey = ordManageVO.getOriginCom2() + ordManageVO.getStyleNo() + ordManageVO.getOrderNo();
		ordManageVO.setUnikey(unikey);
		
		ordManageVO.setPoDocDate(ordManageVO.getPoDocDate().replace("-", ""));
		ordManageVO.setCutGetDate(ordManageVO.getCutGetDate().replace("-", ""));
		ordManageVO.setShippingDate(ordManageVO.getShippingDate().replace("-", ""));
		ordManageVO.setInstoreSdate(ordManageVO.getInstoreSdate().replace("-", ""));
		
		String keyRtn = pdOrderService.insertOneOrderList(ordManageVO);
		PdOrderManageVO specOneOrder = pdOrderService.selectOneOrderMain(keyRtn);		
		
		model.addAttribute("seq", specOneOrder.getSeq());
		
		return "egovframework/hwvn/pd/order/PdInsertSelectOrderList";
	}
	
	/**
	 * 오더 Detail 개별 등록
	 * @param ordSearchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@IncludedInfo(name = "오더 Detail 개별 등록", order = 9021, gid = 89)
	@RequestMapping(value = "/pd/order/PdOrderDetailAdd.do")
	public String orderDetailAdd(@ModelAttribute("ordSearchVO") PdOrderDefaultVO ordSearchVO, ModelMap model, HttpServletRequest request) throws Exception {

		String unikey = "SAMHOML1550D-AB141357"; //ordSearchVO.getUnikey();
		model.addAttribute("unikey", unikey);
		return "egovframework/hwvn/pd/order/PdOrderDetailAdd";	
	}
	
	/**
	 * 오더 Detail 개별 수정 화면
	 * @param ordSearchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@IncludedInfo(name = "오더 Detail 개별 수정", order = 9022, gid = 90)
	@RequestMapping(value = "/pd/order/PdOrderDetailModify.do")
	public String orderDetailModify(@ModelAttribute("ordSearchVO") PdOrderDefaultVO ordSearchVO, ModelMap model, HttpServletRequest request) throws Exception {

		String unikey = "SAMHOML1550D-AB141357"; //ordSearchVO.getUnikey();
		model.addAttribute("unikey", unikey);
		
		ordSearchVO.setUnikey(unikey);	//임시로 저장함
		PdOrderManageVO ordManage = pdOrderService.selectOneOrderDetail(ordSearchVO);
		model.addAttribute("result", ordManage);
		
		return "egovframework/hwvn/pd/order/PdOrderDetailModify";	
	}
	
	/**
	 * 오더 Main 개별 수정
	 * @param ordSearchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@IncludedInfo(name = "오더 Main 개별 수정", order = 9023, gid = 91)
	@RequestMapping(value = "/pd/order/PdOrderMainModify.do")
	public String orderMainModify(@ModelAttribute("ordSearchVO") PdOrderDefaultVO ordSearchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		String unikey = "SAMHOML1550D-AB141357"; //ordSearchVO.getUnikey();
		model.addAttribute("unikey", unikey);
		
		PdOrderManageVO referOneOrder = pdOrderService.selectOneOrderMain(unikey);
		model.addAttribute("result", referOneOrder);		
		
		return "egovframework/hwvn/pd/order/PdOrderListModify";
	}
	
	/**
	 * Model Width(NB전용)를 standardvalue 테이블에서 불러오는 함수
	 * @param ordSearchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/pd/order/selectWidthDesc.do")
	public String orderDetailGetWitdhDesc(@ModelAttribute("ordSearchVO") PdOrderDefaultVO ordSearchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		try{
			List<?> orderWidthList = pdOrderService.selectWidthDesc(ordSearchVO);
			
			model.addAttribute("widthlist", orderWidthList);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "egovframework/hwvn/pd/order/PdGetWidthInfoDesc";	
	}
	
	/**
	 * 오더 상세 등록 저장 로직
	 * @param ordManageVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/pd/order/saveOrderDetailInfo.do")
	public String saveOrderDetailInfo(@ModelAttribute("ordManageVO") PdOrderManageVO ordManageVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		user =  (LoginVO)request.getSession().getAttribute("loginVO");
		ordManageVO.setInCharge(user.getId());
		
		try{
			PdOrderManageVO referOneOrder = pdOrderService.selectOneOrderMain(ordManageVO.getUnikey());
			//상세 입고에 적힌 입고수량의 총량과 오더 메인의 입고 총량이 다를 경우
			if(!referOneOrder.getOrderQty().equals(ordManageVO.getOrderQty())){	
				model.addAttribute("message", "Order Qty is not matched!!");
				model.addAttribute("unikey", ordManageVO.getUnikey());
				return "egovframework/hwvn/pd/order/PdOrderDetailAdd";	
			}
			if(!referOneOrder.getOriginCom1().equals("NB")){	//NB가 아니면 width 정보가 없으므로 descript 필드 필요없음
				ordManageVO.setOrderDescript("");
			}
			ordManageVO.setOriginCom1(referOneOrder.getOriginCom1());
			ordManageVO.setOriginCom2(referOneOrder.getOriginCom2());
			ordManageVO.setCustomerPo(referOneOrder.getCustomerPo());
			ordManageVO.setStyleNo(referOneOrder.getStyleNo());
			ordManageVO.setOrderNo(referOneOrder.getOrderNo());
			ordManageVO.setModelGroup(referOneOrder.getModelGroup());
			ordManageVO.setModelName(referOneOrder.getModelName());
			ordManageVO.setPoDocDate(referOneOrder.getPoDocDate());
			ordManageVO.setOrderType(referOneOrder.getOrderType());
			ordManageVO.setModelDest(referOneOrder.getModelDest());
			ordManageVO.setModelGender(referOneOrder.getModelGender());
			
			PdOrderManageVO orderDetailReturn = pdOrderService.saveOrderDetailInfo(ordManageVO);
			
//			System.out.println("리턴값: "+orderDetailReturn.getRtn());
			model.addAttribute("rtn", orderDetailReturn.getRtn());
		}catch(Exception e){
			e.printStackTrace();
			model.addAttribute("message", "SQL Error");
		}
		
		model.addAttribute("unikey", ordManageVO.getUnikey());
		return "egovframework/hwvn/pd/order/PdOrderDetailAdd";	
	}
	
	/**
	 * 오더 상세 리스트에서 수정 후 update 로직
	 * @param ordManageVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/pd/order/modifyOneOrderDetail.do")
	public String updateOneOrderDetail(@ModelAttribute("ordManageVO") PdOrderManageVO ordManageVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		user =  (LoginVO)request.getSession().getAttribute("loginVO");
		ordManageVO.setInCharge(user.getId());
		
		try{
			PdOrderManageVO referOneOrder = pdOrderService.selectOneOrderMain(ordManageVO.getUnikey());
			//상세 입고에 적힌 입고수량의 총량과 오더 메인의 입고 총량이 다를 경우
			if(!referOneOrder.getOrderQty().equals(ordManageVO.getOrderQty())){	
				model.addAttribute("message", "Order Qty is not matched!!");
				model.addAttribute("unikey", ordManageVO.getUnikey());
				return "egovframework/hwvn/pd/order/PdOrderDetailAdd";	
			}
			if(!referOneOrder.getOriginCom1().equals("NB")){	//NB가 아니면 width 정보가 없으므로 descript 필드 필요없음
				ordManageVO.setOrderDescript("");
			}			
			int rtn = pdOrderService.updateOneOrderDetail(ordManageVO);
			
			model.addAttribute("rtn", Integer.toString(rtn));
		}catch(Exception e){
			e.printStackTrace();
			model.addAttribute("message", "SQL Error");
		}
		
		model.addAttribute("unikey", ordManageVO.getUnikey());		
		return "egovframework/hwvn/pd/order/PdOrderDetailModify";	
	}

	/**
	 * 오더 메인 수정 후 update 로직
	 * @param ordManageVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/pd/order/modifyOneOrderMain.do")
	public String updateOneOrderMain(@ModelAttribute("ordManageVO") PdOrderManageVO ordManageVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		user =  (LoginVO)request.getSession().getAttribute("loginVO");
		ordManageVO.setInCharge(user.getId());
		
		ordManageVO.setPoDocDate(ordManageVO.getPoDocDate().replace("-", ""));
		ordManageVO.setCutGetDate(ordManageVO.getCutGetDate().replace("-", ""));
		ordManageVO.setShippingDate(ordManageVO.getShippingDate().replace("-", ""));
		ordManageVO.setInstoreSdate(ordManageVO.getInstoreSdate().replace("-", ""));
		
		try{					
			PdOrderManageVO orderModifyReturn = pdOrderService.updateOneOrderList(ordManageVO);
			
			model.addAttribute("rtn", orderModifyReturn.getRtn());
		}catch(Exception e){
			e.printStackTrace();
			model.addAttribute("message", "SQL Error");
		}
		
		model.addAttribute("unikey", ordManageVO.getUnikey());	
		
		return "egovframework/hwvn/pd/order/PdOrderListModify";	
	}
	
	/**
	 * 오더 Cancel 화면
	 * @param ordSearchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@IncludedInfo(name = "오더 Cancel 화면", order = 9025, gid = 93)
	@RequestMapping(value = "/pd/order/PdCancelOrderList.do")
	public String updateCancelOrderList(@ModelAttribute("ordSearchVO") PdOrderDefaultVO ordSearchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
//		String unikey = ordSearchVO.getUnikey();
		String unikey = "SAMHONB M840V3 GR3 D141358"; //"SAMHOML1550D-AB141357";  //임시 값
		
		model.addAttribute("unikey", unikey);
		return "egovframework/hwvn/pd/order/PdOrderCancel";	
	}
	
	/**
	 * 오더 취소 실행한 후 리턴값 반환
	 * @param ordManageVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/pd/order/updateOrderCancel.do")
	public String updateOrderCancel(@ModelAttribute("ordManageVO") PdOrderManageVO ordManageVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		user =  (LoginVO)request.getSession().getAttribute("loginVO");
		ordManageVO.setInCharge(user.getId());
		
		PdOrderManageVO orderCancelReturn = pdOrderService.updateOrderCancel(ordManageVO);
		
//		System.out.println("리턴값: "+orderCancelReturn.getRtn());
		model.addAttribute("rtn", orderCancelReturn.getRtn());
		
		return "egovframework/hwvn/pd/order/PdOrderCancel";	 
	}
	
	
	/**
	 * 오더 상세 리스트에서 Description 정보를 보여주는 로직
	 * @param ordSearchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@IncludedInfo(name = "오더 Detail Description", order = 9024, gid = 92)
	@RequestMapping(value = "/pd/order/selectOrderDescript.do")
	public String selectOrderDescript(@ModelAttribute("ordSearchVO") PdOrderDefaultVO ordSearchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
//		String unikey = ordSearchVO.getUnikey();
		String unikey = "SAMHOML1550D-AB141357"; //"SAMHONB M840V3 GR3 D141358";  //임시 값
		ordSearchVO.setUnikey(unikey);  //임시값
		
		List<String> descript = new ArrayList<String>();
		PdOrderManageVO ordManageVO = pdOrderService.selectOneOrderDetail(ordSearchVO);
		
		if(ordManageVO != null){
//			System.out.println("11"+ordManageVO.getOrderDescript()+"11");
			if("".equals(ordManageVO.getOrderDescript()) || ordManageVO.getOrderDescript() == null){
				model.addAttribute("descript", "No Description");				
			}else{
				descript = this.parsingDesc(ordManageVO.getOrderDescript());
				model.addAttribute("descript", descript);
			}
		}else{
			model.addAttribute("descript", "No Data");
		}
		return "egovframework/hwvn/pd/order/PdGetOrderDescript";	
	}
	
	/**
	 * 재단물 입고 등록(오더리스트 -> 재단물 현황으로)
	 * @param ordSearchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@IncludedInfo(name = "재단물 입고 등록", order = 9028, gid = 96)
	@RequestMapping(value = "/pd/order/PdOrderCutAdd.do")
	public String insertOrderCutAdd(@ModelAttribute("ordSearchVO") PdOrderDefaultVO ordSearchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		String unikey = ordSearchVO.getUnikey();
		model.addAttribute("unikey", unikey);
		
		PdOrderManageVO referOneOrder = pdOrderService.selectOneOrderMain(unikey);
		model.addAttribute("result", referOneOrder);		
		
		ordSearchVO.setModelGroup(referOneOrder.getModelGroup());
		String modelTail = pdOrderService.selectModelGroupTail(ordSearchVO);
		model.addAttribute("modelTail", modelTail);
		
		return "egovframework/hwvn/pd/order/PdOrderCutAdd";
	}
	
	/**
	 * 재단물 입고 저장 처리 로직
	 * @param ordManageVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/pd/order/newOrderCutAdd.do")
	public String newOrderCutAdd(@ModelAttribute("ordManageVO") PdOrderManageVO ordManageVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		user =  (LoginVO)request.getSession().getAttribute("loginVO");
		ordManageVO.setInCharge(user.getId());
		
		ordManageVO.setReceiveDate(ordManageVO.getReceiveDate().replace("-", ""));
		ordManageVO.setStateCode("I01");	//재단물 입고의 상태 코드: I01
		
		try{		
			PdOrderManageVO rtnManagoVO = pdOrderService.insertNewAddRoll(ordManageVO);
			if(rtnManagoVO.getRtn().equals("1")){
				model.addAttribute("message", "Success!");
			}else{
				model.addAttribute("message", "Proc Error!");
			}
		}catch(Exception e){
			e.printStackTrace();
			model.addAttribute("message", "SQL Error!");
		}		
		
		return "forward:/pd/order/PdOrderListMain.do";
	}
	
	/**
	 * 모델 리스트에서 component 가져오기
	 * @param ordSearchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/pd/order/orderCutAddCompDesc.do")
	public String selectCutAddCompDesc(@ModelAttribute("ordSearchVO") PdOrderDefaultVO ordSearchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		List<?> modelCompoList = pdOrderService.selectModelComponent(ordSearchVO);
		model.addAttribute("modelList", modelCompoList);		
		
		return "egovframework/hwvn/pd/order/PdGetCutCompDesc";
	}
	
	/**
	 * 재단물 Roll 입고 등록 시, Roll size 와 qty(수량)을 임시 테이블에 저장하는 로직
	 * @param ordSearchVO
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/pd/order/insertTempRollStateDesc.do")
	public String insertTempRollStateDesc(@ModelAttribute("ordSearchVO") PdOrderDefaultVO ordSearchVO, ModelMap model, HttpServletRequest request) throws Exception {
		
		user =  (LoginVO)request.getSession().getAttribute("loginVO");
		ordSearchVO.setInCharge(user.getId());
		ordSearchVO.setStateCode("I01");	//재단물 입고의 상태 코드: I01
		
//		String detail = pdOrderService.selectStandardsDetail(ordSearchVO.getOriginCom2());
//		ordSearchVO.setsDetail(detail);
		
		try{
			String result = pdOrderService.insertTempRollStateDesc(ordSearchVO);
			if(result.equals("1")){
				model.addAttribute("return", "Success!");	
			}else{
				model.addAttribute("return", "Error!");
			}
		}catch(Exception e){
			e.printStackTrace();
			model.addAttribute("return", "SQL Error!");
		}
		
		model.addAttribute("result", ordSearchVO);
		return "egovframework/hwvn/pd/order/PdGetTempRollDesc";
	}
	
	
	/**
	 * NB용 Description 파싱해서 List 형식으로 리턴
	 * @param desc
	 * @param length
	 * @return
	 */
	public List<String> parsingDesc(String desc){
		
		List<String> parsedString = new ArrayList<String>();
		if("".equals(desc) || desc == null){
			return parsedString;
		}else{
			String[] parse1 = desc.split(";");
			int len = parse1.length;
			for(int i=0; i<len; i++){
				String[] parse2 = parse1[i].split(",");
				String descNew = "Size: "+parse2[0]+",   Width: "+parse2[1]+",   Qty: "+parse2[2];
				parsedString.add(descNew);
			}
		}		
		return parsedString;
	}
	
}
