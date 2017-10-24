package egovframework.hwvn.pd.order.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.hwvn.pd.order.service.PdOrderDefaultVO;
import egovframework.hwvn.pd.order.service.PdOrderManageVO;


/**
 * Order 메뉴에 관한 데이터 접근 클래스를 정의한다.
 * @author PLUS N SOFT 개발팀
 * @since 2015.07.15
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일         수정자           수정내용
 *  -------       ----------    ---------------------------
 *   2015.07.15   개발팀     최초 생성
 *
 * </pre>
 */
@Repository("pdOrderDAO")
public class PdOrderDAO extends EgovComAbstractDAO{

	public PdOrderDAO() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 오더 리스트 메인 페이지 조회
	 * @param ordSearchVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectOrderListMain(PdOrderDefaultVO ordSearchVO) throws Exception{
		return list("pdOrderDAO.selectOrderListMain", ordSearchVO);
	}
	
	/**
	 * 오더 리스트 메인 페이지 조회 카운트
	 * @param ordSearchVO
	 * @return
	 * @throws Exception
	 */
	public int selectOrderListMainCount(PdOrderDefaultVO ordSearchVO) throws Exception{
		return (Integer)select("pdOrderDAO.selectOrderListMainCount", ordSearchVO);
	}
	
	/**
	 * 오더 리스트 상세 페이지 조회
	 * @param ordSearchVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectOrderListDetail(PdOrderDefaultVO ordSearchVO) throws Exception{
		return list("pdOrderDAO.selectOrderListDetail", ordSearchVO);
	}
	
	/**
	 * 오더 리스트 상세 페이지 조회 카운트
	 * @param ordSearchVO
	 * @return
	 * @throws Exception
	 */
	public int selectOrderListDetailCount(PdOrderDefaultVO ordSearchVO) throws Exception{
		return (Integer)select("pdOrderDAO.selectOrderListDetailCount", ordSearchVO);
	}
	
	/**
	 * 모델 리스트 상세
	 * @param ordSearchVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectEtcModelListDesc(PdOrderDefaultVO ordSearchVO) throws Exception{
		return list("pdOrderDAO.selectEtcModelListDesc", ordSearchVO);
	}
	
	/**
	 * 모델 성별 정보를 standard table에서 불러옴
	 * @param ordSearchVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectModelGenderDesc(PdOrderDefaultVO ordSearchVO) throws Exception{
		return list("pdOrderDAO.selectModelGenderDesc", ordSearchVO);
	}
	
	/**
	 * 모델의 신발 폭(width) 정보를 standard table에서 불러옴
	 * @param ordSearchVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectWidthDesc(PdOrderDefaultVO ordSearchVO) throws Exception{
		return list("pdOrderDAO.selectWidthDesc", ordSearchVO);
	}
	
	/**
	 * 오더 상세 등록 저장 로직
	 * @param ordManageVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("deprecation")
	public PdOrderManageVO saveOrderDetailInfo(PdOrderManageVO ordManageVO) throws Exception{
		getSqlMapClient().queryForObject("pdOrderDAO.saveOrderDetailInfo", ordManageVO);
		return ordManageVO;
	}
	
	/**
	 * 오더 리스트의 특정 하나만 select
	 * @param unikey
	 * @return
	 * @throws Exception
	 */
	public PdOrderManageVO selectOneOrderMain(String unikey) throws Exception{
		return (PdOrderManageVO)select("pdOrderDAO.selectOneOrderMain", unikey);
	}
	
	/**
	 * 오더 상세 리스트 수정할 때 특정 하나만 select
	 * @param ordSearchVO
	 * @return
	 * @throws Exception
	 */
	public PdOrderManageVO selectOneOrderDetail(PdOrderDefaultVO ordSearchVO) throws Exception{
		return (PdOrderManageVO)select("pdOrderDAO.selectOneOrderDetail", ordSearchVO);
	}
	
	/**
	 * 오더 상세 리스트 수정 후 저장update
	 * @param ordManageVO
	 * @return
	 * @throws Exception
	 */
	public int updateOneOrderDetail(PdOrderManageVO ordManageVO) throws Exception{
		return (Integer)update("pdOrderDAO.updateOneOrderDetail", ordManageVO);
	}
	
	/**
	 * 오더 메인 수정 UPDATE PROCEDURE
	 * @param ordManageVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("deprecation")
	public PdOrderManageVO updateOneOrderList(PdOrderManageVO ordManageVO) throws Exception{
		getSqlMapClient().queryForObject("pdOrderDAO.updateOneOrderList", ordManageVO);
		return ordManageVO;
	}
	
	/**
	 * 오더 취소(cancel) update
	 * @param ordManageVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("deprecation")
	public PdOrderManageVO updateOrderCancel(PdOrderManageVO ordManageVO) throws Exception{
		getSqlMapClient().queryForObject("pdOrderDAO.updateOrderCancel", ordManageVO);
		return ordManageVO;
	}
	
	/**
	 * 오더 리스트 개별 등록 insert
	 * @param ordManageVO
	 * @return
	 * @throws Exception
	 */
	public String insertOneOrderList(PdOrderManageVO ordManageVO) throws Exception{
		@SuppressWarnings("unused")
		String rtn = (String)insert("pdOrderDAO.insertOneOrderList", ordManageVO);
		return ordManageVO.getUnikey();
	}
	
	/**
	 * 모델 리스트에서 특정 tail의 Component 리스트만 가져오기
	 * @param ordSearchVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectModelComponent(PdOrderDefaultVO ordSearchVO) throws Exception{
		return list("pdOrderDAO.selectModelComponent", ordSearchVO);
	}
	
	/**
	 * 모델 리스트에서 특정  Component의 tail만 가져오기
	 * @param ordSearchVO
	 * @return
	 * @throws Exception
	 */
	public String selectModelGroupTail(PdOrderDefaultVO ordSearchVO) throws Exception{
		return (String)select("pdOrderDAO.selectModelGroupTail", ordSearchVO);
	}
	
	/**
	 * 재단물 입고 저장 처리 로직
	 * @param ordManageVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("deprecation")
	public PdOrderManageVO insertNewAddRoll(PdOrderManageVO ordManageVO) throws Exception{
		getSqlMapClient().queryForObject("pdOrderDAO.insertNewAddRoll", ordManageVO);
		return ordManageVO;
	}
	
	/**
	 * 재단물 Roll 입고 등록 시, Roll size 와 qty(수량)을 임시 테이블에 저장하는 로직
	 * @param ordSearchVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("deprecation")
	public String insertTempRollStateDesc(PdOrderDefaultVO ordSearchVO) throws Exception{
		getSqlMapClient().queryForObject("pdOrderDAO.insertTempRollStateDesc", ordSearchVO);
		return ordSearchVO.getRtn();
	}
	
	/**
	 * 바코드 key 생성을 위해, company2 값과 매칭되는 회사 이니셜 가져오기
	 * @param sDescript
	 * @return
	 * @throws Exception
	 */
	public String selectStandardsDetail(String sDescript) throws Exception{
		return (String)select("pdOrderDAO.selectStandardsDetail", sDescript);
	}
	
}
