package egovframework.hwvn.pd.order.service;

import java.util.List;

public interface PdOrderService {
	
	/**
	 * 오더 리스트 메인 페이지 조회
	 * @param ordSearchVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectOrderListMain(PdOrderDefaultVO ordSearchVO) throws Exception;
	
	/**
	 * 오더 리스트 메인 조회 카운트
	 * @param ordSearchVO
	 * @return
	 * @throws Exception
	 */
	public int selectOrderListMainCount(PdOrderDefaultVO ordSearchVO) throws Exception;
	
	/**
	 * 오더 리스트 상세 페이지 조회
	 * @param ordSearchVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectOrderListDetail(PdOrderDefaultVO ordSearchVO) throws Exception;
	
	/**
	 * 오더 리스트 상세 조회 카운트
	 * @param ordSearchVO
	 * @return
	 * @throws Exception
	 */
	public int selectOrderListDetailCount(PdOrderDefaultVO ordSearchVO) throws Exception;
	
	/**
	 * 모델리스트 상세
	 * @param ordSearchVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectEtcModelListDesc(PdOrderDefaultVO ordSearchVO) throws Exception;
	
	
	/**
	 * 모델 성별 정보를 standard table에서 불러옴
	 * @param ordSearchVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectModelGenderDesc(PdOrderDefaultVO ordSearchVO) throws Exception;
	
	/**
	 * 모델의 신발 폭(width) 정보를 standard table에서 불러옴
	 * @param ordSearchVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectWidthDesc(PdOrderDefaultVO ordSearchVO) throws Exception;
	
	/**
	 * 오더 상세 등록 저장 로직
	 * @param ordManageVO
	 * @return
	 * @throws Exception
	 */
	public PdOrderManageVO saveOrderDetailInfo(PdOrderManageVO ordManageVO) throws Exception;
	
	/**
	 * 오더 리스트의 특정 하나만 select
	 * @param unikey
	 * @return
	 * @throws Exception
	 */
	public PdOrderManageVO selectOneOrderMain(String unikey) throws Exception;
	
	/**
	 * 오더 상세 리스트 수정할 때 특정 하나만 select
	 * @param ordSearchVO
	 * @return
	 * @throws Exception
	 */
	public PdOrderManageVO selectOneOrderDetail(PdOrderDefaultVO ordSearchVO) throws Exception;
	
	/**
	 * 오더 상세 리스트 수정 후 저장update
	 * @param ordManageVO
	 * @return
	 * @throws Exception
	 */
	public int updateOneOrderDetail(PdOrderManageVO ordManageVO) throws Exception;
	
	/**
	 * 오더 메인 수정 UPDATE PROCEDURE
	 * @param ordManageVO
	 * @return
	 * @throws Exception
	 */
	public PdOrderManageVO updateOneOrderList(PdOrderManageVO ordManageVO) throws Exception;
	
	/**
	 * 오더 취소(cancel) update
	 * @param ordManageVO
	 * @return
	 * @throws Exception
	 */
	public PdOrderManageVO updateOrderCancel(PdOrderManageVO ordManageVO) throws Exception;
	
	/**
	 * 오더 리스트 개별 등록 insert
	 * @param ordManageVO
	 * @return
	 * @throws Exception
	 */
	public String insertOneOrderList(PdOrderManageVO ordManageVO) throws Exception;
	
	/**
	 * 모델 리스트에서 특정 tail의 Component 리스트만 가져오기
	 * @param ordSearchVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectModelComponent(PdOrderDefaultVO ordSearchVO) throws Exception;
	
	/**
	 * 모델 리스트에서 특정  Component의 tail만 가져오기
	 * @param ordSearchVO
	 * @return
	 * @throws Exception
	 */
	public String selectModelGroupTail(PdOrderDefaultVO ordSearchVO) throws Exception;
	
	/**
	 * 재단물 입고 저장 처리 로직
	 * @param ordManageVO
	 * @return
	 * @throws Exception
	 */
	public PdOrderManageVO insertNewAddRoll(PdOrderManageVO ordManageVO) throws Exception;
	
	/**
	 * 재단물 Roll 입고 등록 시, Roll size 와 qty(수량)을 임시 테이블에 저장하는 로직
	 * @param ordSearchVO
	 * @return
	 * @throws Exception
	 */
	public String insertTempRollStateDesc(PdOrderDefaultVO ordSearchVO) throws Exception;
	
	/**
	 * 바코드 key 생성을 위해, company2 값과 매칭되는 회사 이니셜 가져오기
	 * @param sDescript
	 * @return
	 * @throws Exception
	 */
	public String selectStandardsDetail(String sDescript) throws Exception;
	
	
}
