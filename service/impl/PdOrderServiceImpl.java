package egovframework.hwvn.pd.order.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.hwvn.pd.order.service.PdOrderDefaultVO;
import egovframework.hwvn.pd.order.service.PdOrderManageVO;
import egovframework.hwvn.pd.order.service.PdOrderService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


/**
 * Order 메뉴에 관한 비지니스 클래스를 정의한다.
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

@Service("pdOrderService")
public class PdOrderServiceImpl extends EgovAbstractServiceImpl implements PdOrderService {

	public PdOrderServiceImpl() {
		// TODO Auto-generated constructor stub
	}
	
	/** pdOrderDAO */
	@Resource(name = "pdOrderDAO")
	private PdOrderDAO pdOrderDAO;
	
	
	/**
	 * 오더 리스트 메인 페이지 조회
	 */
	@Override
	public List<?> selectOrderListMain(PdOrderDefaultVO ordSearchVO) throws Exception{
		
		List<?> result = pdOrderDAO.selectOrderListMain(ordSearchVO);
		return result;
	}

	/**
	 * 오더 리스트 메인 조회 카운트
	 */
	@Override
	public int selectOrderListMainCount(PdOrderDefaultVO ordSearchVO) throws Exception{
				
		return pdOrderDAO.selectOrderListMainCount(ordSearchVO);
	}
	
	/**
	 * 오더 리스트 상세 페이지 조회
	 */
	@Override
	public List<?> selectOrderListDetail(PdOrderDefaultVO ordSearchVO) throws Exception{
		
		List<?> result = pdOrderDAO.selectOrderListDetail(ordSearchVO);
		return result;
	}

	/**
	 * 오더 리스트 상세 조회 카운트
	 */
	@Override
	public int selectOrderListDetailCount(PdOrderDefaultVO ordSearchVO) throws Exception{
				
		return pdOrderDAO.selectOrderListDetailCount(ordSearchVO);
	}
	
	/**
	 * 모델 리스트 상세
	 */
	@Override
	public List<?> selectEtcModelListDesc(PdOrderDefaultVO ordSearchVO) throws Exception{
		
		return pdOrderDAO.selectEtcModelListDesc(ordSearchVO);
	}
	
	/**
	 * 모델 성별 정보를 standard table에서 불러옴
	 */
	@Override
	public List<?> selectModelGenderDesc(PdOrderDefaultVO ordSearchVO) throws Exception{
		
		return pdOrderDAO.selectModelGenderDesc(ordSearchVO);
	}
	
	/**
	 * 모델의 신발 폭(width) 정보를 standard table에서 불러옴
	 */
	@Override
	public List<?> selectWidthDesc(PdOrderDefaultVO ordSearchVO) throws Exception{
		
		return pdOrderDAO.selectWidthDesc(ordSearchVO);
	}
	
	/**
	 * 오더 상세 등록 저장 로직
	 */
	@Override
	public PdOrderManageVO saveOrderDetailInfo(PdOrderManageVO ordManageVO) throws Exception{
		return pdOrderDAO.saveOrderDetailInfo(ordManageVO);
	}
	
	/**
	 * 오더 리스트의 특정 하나만 select
	 * @param unikey
	 * @return
	 * @throws Exception
	 */
	@Override
	public PdOrderManageVO selectOneOrderMain(String unikey) throws Exception{
		return (PdOrderManageVO)pdOrderDAO.selectOneOrderMain(unikey);
	}
	
	/**
	 * 오더 상세 리스트 수정할 때 특정 하나만 select
	 */
	@Override
	public PdOrderManageVO selectOneOrderDetail(PdOrderDefaultVO ordSearchVO) throws Exception{
		return (PdOrderManageVO)pdOrderDAO.selectOneOrderDetail(ordSearchVO);
	}
	
	/**
	 * 오더 상세 리스트 수정 후 저장update
	 */
	@Override
	public int updateOneOrderDetail(PdOrderManageVO ordManageVO) throws Exception{
		return pdOrderDAO.updateOneOrderDetail(ordManageVO);
	}
	
	/**
	 * 오더 메인 수정 UPDATE PROCEDURE
	 * @param ordManageVO
	 * @return
	 * @throws Exception
	 */
	@Override
	public PdOrderManageVO updateOneOrderList(PdOrderManageVO ordManageVO) throws Exception{
		return pdOrderDAO.updateOneOrderList(ordManageVO);
	}
	
	/**
	 * 오더 취소 (cancel) update
	 * @param ordManageVO
	 * @return
	 * @throws Exception
	 */
	@Override
	public PdOrderManageVO updateOrderCancel(PdOrderManageVO ordManageVO) throws Exception{
		return pdOrderDAO.updateOrderCancel(ordManageVO);
	}
	
	/**
	 * 오더 리스트 개별 등록 insert
	 */
	@Override
	public String insertOneOrderList(PdOrderManageVO ordManageVO) throws Exception{
		return pdOrderDAO.insertOneOrderList(ordManageVO);
	}
	
	/**
	 * 모델 리스트에서 특정 tail의 Component 리스트만 가져오기
	 */
	@Override
	public List<?> selectModelComponent(PdOrderDefaultVO ordSearchVO) throws Exception{		
		return pdOrderDAO.selectModelComponent(ordSearchVO);
	}
	
	/**
	 * 모델 리스트에서 특정  Component의 tail만 가져오기
	 * @param ordSearchVO
	 * @return
	 * @throws Exception
	 */
	@Override
	public String selectModelGroupTail(PdOrderDefaultVO ordSearchVO) throws Exception{		
		return pdOrderDAO.selectModelGroupTail(ordSearchVO);
	}
	
	/**
	 * 재단물 입고 저장 처리 로직
	 */
	@Override
	public PdOrderManageVO insertNewAddRoll(PdOrderManageVO ordManageVO) throws Exception{
		return pdOrderDAO.insertNewAddRoll(ordManageVO);
	}
	
	/**
	 * 재단물 Roll 입고 등록 시, Roll size 와 qty(수량)을 임시 테이블에 저장하는 로직
	 */
	@Override
	public String insertTempRollStateDesc(PdOrderDefaultVO ordSearchVO) throws Exception{		
		return pdOrderDAO.insertTempRollStateDesc(ordSearchVO);
	}
	
	/**
	 * 바코드 key 생성을 위해, company2 값과 매칭되는 회사 이니셜 가져오기
	 */
	@Override
	public String selectStandardsDetail(String sDescript) throws Exception{		
		return pdOrderDAO.selectStandardsDetail(sDescript);
	}
	
}
