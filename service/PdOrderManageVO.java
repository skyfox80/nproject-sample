package egovframework.hwvn.pd.order.service;

import java.io.Serializable;
import java.util.List;

public class PdOrderManageVO implements Serializable{

	public PdOrderManageVO() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * ORDER 메뉴 목록
	 */
	List<PdOrderManageVO> orderManageList;

	/**
	 * pd_orderlist 테이블 fields
	 */
	/** 고유 키 **/
	private String unikey;
	
	/** 1차 고객 회사**/
	private String originCom1;
	
	/** 2차 고객 회사 **/
	private String originCom2;
	
	/** 고객 구매오더 **/
	private String customerPo;
	
	/** 스타일 넘버 **/
	private String styleNo;
	
	/** 오더 넘버 **/
	private String orderNo;
	
	/** 모델 그룹(대분류) **/
	private String modelGroup;
	
	/** 제품 모델명 **/
	private String modelName;
	
	/** PO 문서 날짜 **/
	private String poDocDate;
	
	/** 오더 타입 **/
	private String orderType;
	
	/** 제품 성별 구분 **/
	private String modelGender;
	
	/** 재단 인수 날짜 **/
	private String cutGetDate;
	
	/** 선적 날짜 **/
	private String shippingDate;
	
	/** 입고 시작 날짜 **/
	private String instoreSdate;
	
	/** 제품 도착지 **/
	private String modelDest;
	
	/** 오더 취소 사이즈(폭) **/
	private String cancelWidth;
	
	/** 제조 라인 **/
	private String makeLine;
	
	/** GRP **/
	private String grp;
	
	/** 오더 취소 코드 **/
	private String orderCancel;
	
	/** 오더 취소 날짜 **/
	private String cancelDate;
	
	/** 오더 취소 사유 **/
	private String cancelReason;
	
	/** 오더 취소 담당자 **/
	private String cancelIncharge;
	
	/**
	 * pd_delivery 테이블 fields (중복 필드 없이)
	 */
	/** 현황 바코드 **/
	private String curStateBarcode;
	
	/** 오더 수량 **/
	private String orderQty;
	
	/** 인수 합계량 **/
	private String receiveQtySum;
	
	/** 인수 날짜 **/
	private String receiveDate;
	
	/** 인수 수량 **/
	private String receiveQty;
	
	/** 오더 잔량 **/
	private String orderRemainQty;
	
	/** 납품 날짜 **/
	private String deliverDate;
	
	/** 납품 수량 **/
	private String deliverQty;
	
	/** 일일 납품량 **/
	private String dailyDeliverQty;
	
	/** 납품 총량 **/
	private String deliverQtySum;
	
	/** 총 잔량 **/
	private String remainQtySum;
	
	/** 완료 일자 **/
	private String orderFinishDate;
	
	/** SET 여부 **/
	private String setFlag;
	
	/** 취소(삭제) 코드 **/
	private String deleteCode;
	
	/** 입고 불량 수량(세트 입고) **/
	private String defectSetQty;
	
	/** 입고 불량 사유(세트 입고) **/
	private String defectSetReason;
	
	/** 제품 SIZE 전체(2T ~ 16) **/
	private String s2t;
	private String s3;
	private String s3t;
	private String s4;
	private String s4t;
	private String s5;
	private String s5t;
	private String s6;
	private String s6t;
	private String s7;
	private String s7t;
	private String s8;
	private String s8t;
	private String s9;
	private String s9t;
	private String s10;
	private String s10t;
	private String s11;
	private String s11t;
	private String s12;
	private String s12t;
	private String s13;
	private String s13t;
	private String s14;
	private String s14t;
	private String s15;
	private String s15t;
	private String s16;
	
	private String size;
	
	/** 비고 **/
	private String note;
	
	/** 권한 로그인 ID **/
	private String inCharge;
	
	/** 오더 상세 설명 **/
	private String orderDescript;
	
	/** 오더 상세 등록 여부 **/
	private String orderDetail;
	
	/**
	 * pd_standardvalue 각 단계별 필드 
	 */
	private String sState;
	private String sCode;
	private String sDetail;
	private String sDescript;
	private String stateCode;
	
	/**
	 * pd_modelregister 테이블 fields 
	 */
	/** 코드별 depth **/
	private String depthCode;
	
	/** 등록 이름 **/
	private String registerName;
	
	/** 꼬리 **/
	private String tail;
	
	/** 꼬리 종속 1,2,3,4 **/
	private String tailDepend1;
	private String tailDepend2;
	private String tailDepend3;
	private String tailDepend4;
	
	/** 삭제 Flag **/
	private String delFlag;
	
	/** 프로시저 결과값 **/
	private String rtn;
	
	/** 테이블의 seq **/
	private int seq;
	
	/**
	 * pd_releasecut 테이블 fields (중복 필드 없이)
	 */
	/** 재단물 출고 날짜 **/
	private String releaseDate;
	
	/** 재단물 출고 수량 **/
	private String releaseQty;
	
	/** 재단물 출고 상세 설명 **/
	private String releaseDescript;

	/**
	 * pd_defectcut 테이블 fields (중복 필드 없이)
	 */
	/** 불량 롤 미터 **/
	private String defectRollMeter;
	
	/** 불량 사유 **/
	private String defectReason;
	
	/** 불량 원단 입고일 **/
	private String defectDate;
	
	/** 불량 상세 설명 **/
	private String defectDescript;

	
	/**
	 * pd_cutstate 테이블 fields (중복 필드 없이)
	 */
	/** 재단물 구분키 **/
	private String cutstateKey;
	
	/** 인수 롤 총미터 **/
	private String receiveRollMeter;
	
	/** 남은 롤 미터 **/
	private String remainRollMeter;
	
	/** 완료 일자 **/
	private String finishDate;
	
	
	/**
	 * pd_rollstate 테이블 fields (중복 필드 없이)
	 */
	/** roll meter (롤 사이즈 단위) **/
	private String rollMeter;
	
	/** roll 수량 (롤 사이즈별 입고 수량) **/
	private String rollQty;
	
	/** 데이터 생성 날짜 **/
	private String createDate;
	
	/** 부품명 **/
	private String component;
	
	
	
	
	/**
	 * @return the component
	 */
	public String getComponent() {
		return component;
	}

	/**
	 * @param component the component to set
	 */
	public void setComponent(String component) {
		this.component = component;
	}

	/**
	 * @return the releaseDate
	 */
	public String getReleaseDate() {
		return releaseDate;
	}

	/**
	 * @param releaseDate the releaseDate to set
	 */
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	/**
	 * @return the releaseQty
	 */
	public String getReleaseQty() {
		return releaseQty;
	}

	/**
	 * @param releaseQty the releaseQty to set
	 */
	public void setReleaseQty(String releaseQty) {
		this.releaseQty = releaseQty;
	}

	/**
	 * @return the releaseDescript
	 */
	public String getReleaseDescript() {
		return releaseDescript;
	}

	/**
	 * @param releaseDescript the releaseDescript to set
	 */
	public void setReleaseDescript(String releaseDescript) {
		this.releaseDescript = releaseDescript;
	}

	/**
	 * @return the defectRollMeter
	 */
	public String getDefectRollMeter() {
		return defectRollMeter;
	}

	/**
	 * @param defectRollMeter the defectRollMeter to set
	 */
	public void setDefectRollMeter(String defectRollMeter) {
		this.defectRollMeter = defectRollMeter;
	}

	/**
	 * @return the defectReason
	 */
	public String getDefectReason() {
		return defectReason;
	}

	/**
	 * @param defectReason the defectReason to set
	 */
	public void setDefectReason(String defectReason) {
		this.defectReason = defectReason;
	}

	/**
	 * @return the defectDate
	 */
	public String getDefectDate() {
		return defectDate;
	}

	/**
	 * @param defectDate the defectDate to set
	 */
	public void setDefectDate(String defectDate) {
		this.defectDate = defectDate;
	}

	/**
	 * @return the defectDescript
	 */
	public String getDefectDescript() {
		return defectDescript;
	}

	/**
	 * @param defectDescript the defectDescript to set
	 */
	public void setDefectDescript(String defectDescript) {
		this.defectDescript = defectDescript;
	}

	/**
	 * @return the cutstateKey
	 */
	public String getCutstateKey() {
		return cutstateKey;
	}

	/**
	 * @param cutstateKey the cutstateKey to set
	 */
	public void setCutstateKey(String cutstateKey) {
		this.cutstateKey = cutstateKey;
	}

	/**
	 * @return the receiveRollMeter
	 */
	public String getReceiveRollMeter() {
		return receiveRollMeter;
	}

	/**
	 * @param receiveRollMeter the receiveRollMeter to set
	 */
	public void setReceiveRollMeter(String receiveRollMeter) {
		this.receiveRollMeter = receiveRollMeter;
	}

	/**
	 * @return the remainRollMeter
	 */
	public String getRemainRollMeter() {
		return remainRollMeter;
	}

	/**
	 * @param remainRollMeter the remainRollMeter to set
	 */
	public void setRemainRollMeter(String remainRollMeter) {
		this.remainRollMeter = remainRollMeter;
	}

	/**
	 * @return the finishDate
	 */
	public String getFinishDate() {
		return finishDate;
	}

	/**
	 * @param finishDate the finishDate to set
	 */
	public void setFinishDate(String finishDate) {
		this.finishDate = finishDate;
	}

	/**
	 * @return the rollMeter
	 */
	public String getRollMeter() {
		return rollMeter;
	}

	/**
	 * @param rollMeter the rollMeter to set
	 */
	public void setRollMeter(String rollMeter) {
		this.rollMeter = rollMeter;
	}

	/**
	 * @return the rollQty
	 */
	public String getRollQty() {
		return rollQty;
	}

	/**
	 * @param rollQty the rollQty to set
	 */
	public void setRollQty(String rollQty) {
		this.rollQty = rollQty;
	}

	/**
	 * @return the createDate
	 */
	public String getCreateDate() {
		return createDate;
	}

	/**
	 * @param createDate the createDate to set
	 */
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	/**
	 * @return the seq
	 */
	public int getSeq() {
		return seq;
	}

	/**
	 * @param seq the seq to set
	 */
	public void setSeq(int seq) {
		this.seq = seq;
	}

	/**
	 * @return the rtn
	 */
	public String getRtn() {
		return rtn;
	}

	/**
	 * @param rtn the rtn to set
	 */
	public void setRtn(String rtn) {
		this.rtn = rtn;
	}

	/**
	 * @return the depthCode
	 */
	public String getDepthCode() {
		return depthCode;
	}

	/**
	 * @param depthCode the depthCode to set
	 */
	public void setDepthCode(String depthCode) {
		this.depthCode = depthCode;
	}

	/**
	 * @return the registerName
	 */
	public String getRegisterName() {
		return registerName;
	}

	/**
	 * @param registerName the registerName to set
	 */
	public void setRegisterName(String registerName) {
		this.registerName = registerName;
	}

	/**
	 * @return the tail
	 */
	public String getTail() {
		return tail;
	}

	/**
	 * @param tail the tail to set
	 */
	public void setTail(String tail) {
		this.tail = tail;
	}

	/**
	 * @return the tailDepend1
	 */
	public String getTailDepend1() {
		return tailDepend1;
	}

	/**
	 * @param tailDepend1 the tailDepend1 to set
	 */
	public void setTailDepend1(String tailDepend1) {
		this.tailDepend1 = tailDepend1;
	}

	/**
	 * @return the tailDepend2
	 */
	public String getTailDepend2() {
		return tailDepend2;
	}

	/**
	 * @param tailDepend2 the tailDepend2 to set
	 */
	public void setTailDepend2(String tailDepend2) {
		this.tailDepend2 = tailDepend2;
	}

	/**
	 * @return the tailDepend3
	 */
	public String getTailDepend3() {
		return tailDepend3;
	}

	/**
	 * @param tailDepend3 the tailDepend3 to set
	 */
	public void setTailDepend3(String tailDepend3) {
		this.tailDepend3 = tailDepend3;
	}

	/**
	 * @return the tailDepend4
	 */
	public String getTailDepend4() {
		return tailDepend4;
	}

	/**
	 * @param tailDepend4 the tailDepend4 to set
	 */
	public void setTailDepend4(String tailDepend4) {
		this.tailDepend4 = tailDepend4;
	}

	/**
	 * @return the delFlag
	 */
	public String getDelFlag() {
		return delFlag;
	}

	/**
	 * @param delFlag the delFlag to set
	 */
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	/**
	 * @return the sState
	 */
	public String getsState() {
		return sState;
	}

	/**
	 * @param sState the sState to set
	 */
	public void setsState(String sState) {
		this.sState = sState;
	}

	/**
	 * @return the sCode
	 */
	public String getsCode() {
		return sCode;
	}

	/**
	 * @param sCode the sCode to set
	 */
	public void setsCode(String sCode) {
		this.sCode = sCode;
	}

	/**
	 * @return the sDetail
	 */
	public String getsDetail() {
		return sDetail;
	}

	/**
	 * @param sDetail the sDetail to set
	 */
	public void setsDetail(String sDetail) {
		this.sDetail = sDetail;
	}

	/**
	 * @return the sDescript
	 */
	public String getsDescript() {
		return sDescript;
	}

	/**
	 * @param sDescript the sDescript to set
	 */
	public void setsDescript(String sDescript) {
		this.sDescript = sDescript;
	}

	/**
	 * @return the stateCode
	 */
	public String getStateCode() {
		return stateCode;
	}

	/**
	 * @param stateCode the stateCode to set
	 */
	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}

	/**
	 * @return the setFlag
	 */
	public String getSetFlag() {
		return setFlag;
	}

	/**
	 * @param setFlag the setFlag to set
	 */
	public void setSetFlag(String setFlag) {
		this.setFlag = setFlag;
	}

	/**
	 * @return the deleteCode
	 */
	public String getDeleteCode() {
		return deleteCode;
	}

	/**
	 * @param deleteCode the deleteCode to set
	 */
	public void setDeleteCode(String deleteCode) {
		this.deleteCode = deleteCode;
	}

	/**
	 * @return the defectSetQty
	 */
	public String getDefectSetQty() {
		return defectSetQty;
	}

	/**
	 * @param defectSetQty the defectSetQty to set
	 */
	public void setDefectSetQty(String defectSetQty) {
		this.defectSetQty = defectSetQty;
	}

	/**
	 * @return the defectSetReason
	 */
	public String getDefectSetReason() {
		return defectSetReason;
	}

	/**
	 * @param defectSetReason the defectSetReason to set
	 */
	public void setDefectSetReason(String defectSetReason) {
		this.defectSetReason = defectSetReason;
	}

	/**
	 * @return the orderDetail
	 */
	public String getOrderDetail() {
		return orderDetail;
	}

	/**
	 * @param orderDetail the orderDetail to set
	 */
	public void setOrderDetail(String orderDetail) {
		this.orderDetail = orderDetail;
	}

	/**
	 * @return the orderDescript
	 */
	public String getOrderDescript() {
		return orderDescript;
	}

	/**
	 * @param orderDescript the orderDescript to set
	 */
	public void setOrderDescript(String orderDescript) {
		this.orderDescript = orderDescript;
	}

	/**
	 * @return the inCharge
	 */
	public String getInCharge() {
		return inCharge;
	}

	/**
	 * @param inCharge the inCharge to set
	 */
	public void setInCharge(String inCharge) {
		this.inCharge = inCharge;
	}

	/**
	 * @return the size
	 */
	public String getSize() {
		return size;
	}

	/**
	 * @param size the size to set
	 */
	public void setSize(String size) {
		this.size = size;
	}

	/**
	 * @return the note
	 */
	public String getNote() {
		return note;
	}

	/**
	 * @param note the note to set
	 */
	public void setNote(String note) {
		this.note = note;
	}

	/**
	 * @return the s2t
	 */
	public String getS2t() {
		return s2t;
	}

	/**
	 * @param s2t the s2t to set
	 */
	public void setS2t(String s2t) {
		this.s2t = s2t;
	}

	/**
	 * @return the s3
	 */
	public String getS3() {
		return s3;
	}

	/**
	 * @param s3 the s3 to set
	 */
	public void setS3(String s3) {
		this.s3 = s3;
	}

	/**
	 * @return the s3t
	 */
	public String getS3t() {
		return s3t;
	}

	/**
	 * @param s3t the s3t to set
	 */
	public void setS3t(String s3t) {
		this.s3t = s3t;
	}

	/**
	 * @return the s4
	 */
	public String getS4() {
		return s4;
	}

	/**
	 * @param s4 the s4 to set
	 */
	public void setS4(String s4) {
		this.s4 = s4;
	}

	/**
	 * @return the s4t
	 */
	public String getS4t() {
		return s4t;
	}

	/**
	 * @param s4t the s4t to set
	 */
	public void setS4t(String s4t) {
		this.s4t = s4t;
	}

	/**
	 * @return the s5
	 */
	public String getS5() {
		return s5;
	}

	/**
	 * @param s5 the s5 to set
	 */
	public void setS5(String s5) {
		this.s5 = s5;
	}

	/**
	 * @return the s5t
	 */
	public String getS5t() {
		return s5t;
	}

	/**
	 * @param s5t the s5t to set
	 */
	public void setS5t(String s5t) {
		this.s5t = s5t;
	}

	/**
	 * @return the s6
	 */
	public String getS6() {
		return s6;
	}

	/**
	 * @param s6 the s6 to set
	 */
	public void setS6(String s6) {
		this.s6 = s6;
	}

	/**
	 * @return the s6t
	 */
	public String getS6t() {
		return s6t;
	}

	/**
	 * @param s6t the s6t to set
	 */
	public void setS6t(String s6t) {
		this.s6t = s6t;
	}

	/**
	 * @return the s7
	 */
	public String getS7() {
		return s7;
	}

	/**
	 * @param s7 the s7 to set
	 */
	public void setS7(String s7) {
		this.s7 = s7;
	}

	/**
	 * @return the s7t
	 */
	public String getS7t() {
		return s7t;
	}

	/**
	 * @param s7t the s7t to set
	 */
	public void setS7t(String s7t) {
		this.s7t = s7t;
	}

	/**
	 * @return the s8
	 */
	public String getS8() {
		return s8;
	}

	/**
	 * @param s8 the s8 to set
	 */
	public void setS8(String s8) {
		this.s8 = s8;
	}

	/**
	 * @return the s8t
	 */
	public String getS8t() {
		return s8t;
	}

	/**
	 * @param s8t the s8t to set
	 */
	public void setS8t(String s8t) {
		this.s8t = s8t;
	}

	/**
	 * @return the s9
	 */
	public String getS9() {
		return s9;
	}

	/**
	 * @param s9 the s9 to set
	 */
	public void setS9(String s9) {
		this.s9 = s9;
	}

	/**
	 * @return the s9t
	 */
	public String getS9t() {
		return s9t;
	}

	/**
	 * @param s9t the s9t to set
	 */
	public void setS9t(String s9t) {
		this.s9t = s9t;
	}

	/**
	 * @return the s10
	 */
	public String getS10() {
		return s10;
	}

	/**
	 * @param s10 the s10 to set
	 */
	public void setS10(String s10) {
		this.s10 = s10;
	}

	/**
	 * @return the s10t
	 */
	public String getS10t() {
		return s10t;
	}

	/**
	 * @param s10t the s10t to set
	 */
	public void setS10t(String s10t) {
		this.s10t = s10t;
	}

	/**
	 * @return the s11
	 */
	public String getS11() {
		return s11;
	}

	/**
	 * @param s11 the s11 to set
	 */
	public void setS11(String s11) {
		this.s11 = s11;
	}

	/**
	 * @return the s11t
	 */
	public String getS11t() {
		return s11t;
	}

	/**
	 * @param s11t the s11t to set
	 */
	public void setS11t(String s11t) {
		this.s11t = s11t;
	}

	/**
	 * @return the s12
	 */
	public String getS12() {
		return s12;
	}

	/**
	 * @param s12 the s12 to set
	 */
	public void setS12(String s12) {
		this.s12 = s12;
	}

	/**
	 * @return the s12t
	 */
	public String getS12t() {
		return s12t;
	}

	/**
	 * @param s12t the s12t to set
	 */
	public void setS12t(String s12t) {
		this.s12t = s12t;
	}

	/**
	 * @return the s13
	 */
	public String getS13() {
		return s13;
	}

	/**
	 * @param s13 the s13 to set
	 */
	public void setS13(String s13) {
		this.s13 = s13;
	}

	/**
	 * @return the s13t
	 */
	public String getS13t() {
		return s13t;
	}

	/**
	 * @param s13t the s13t to set
	 */
	public void setS13t(String s13t) {
		this.s13t = s13t;
	}

	/**
	 * @return the s14
	 */
	public String getS14() {
		return s14;
	}

	/**
	 * @param s14 the s14 to set
	 */
	public void setS14(String s14) {
		this.s14 = s14;
	}

	/**
	 * @return the s14t
	 */
	public String getS14t() {
		return s14t;
	}

	/**
	 * @param s14t the s14t to set
	 */
	public void setS14t(String s14t) {
		this.s14t = s14t;
	}

	/**
	 * @return the s15
	 */
	public String getS15() {
		return s15;
	}

	/**
	 * @param s15 the s15 to set
	 */
	public void setS15(String s15) {
		this.s15 = s15;
	}

	/**
	 * @return the s15t
	 */
	public String getS15t() {
		return s15t;
	}

	/**
	 * @param s15t the s15t to set
	 */
	public void setS15t(String s15t) {
		this.s15t = s15t;
	}

	/**
	 * @return the s16
	 */
	public String getS16() {
		return s16;
	}

	/**
	 * @param s16 the s16 to set
	 */
	public void setS16(String s16) {
		this.s16 = s16;
	}

	/**
	 * @return the unikey
	 */
	public String getUnikey() {
		return unikey;
	}

	/**
	 * @param unikey the unikey to set
	 */
	public void setUnikey(String unikey) {
		this.unikey = unikey;
	}

	/**
	 * @return the originCom1
	 */
	public String getOriginCom1() {
		return originCom1;
	}

	/**
	 * @param originCom1 the originCom1 to set
	 */
	public void setOriginCom1(String originCom1) {
		this.originCom1 = originCom1;
	}

	/**
	 * @return the originCom2
	 */
	public String getOriginCom2() {
		return originCom2;
	}

	/**
	 * @param originCom2 the originCom2 to set
	 */
	public void setOriginCom2(String originCom2) {
		this.originCom2 = originCom2;
	}

	/**
	 * @return the customerPo
	 */
	public String getCustomerPo() {
		return customerPo;
	}

	/**
	 * @param customerPo the customerPo to set
	 */
	public void setCustomerPo(String customerPo) {
		this.customerPo = customerPo;
	}

	/**
	 * @return the styleNo
	 */
	public String getStyleNo() {
		return styleNo;
	}

	/**
	 * @param styleNo the styleNo to set
	 */
	public void setStyleNo(String styleNo) {
		this.styleNo = styleNo;
	}

	/**
	 * @return the orderNo
	 */
	public String getOrderNo() {
		return orderNo;
	}

	/**
	 * @param orderNo the orderNo to set
	 */
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	/**
	 * @return the modelGroup
	 */
	public String getModelGroup() {
		return modelGroup;
	}

	/**
	 * @param modelGroup the modelGroup to set
	 */
	public void setModelGroup(String modelGroup) {
		this.modelGroup = modelGroup;
	}

	/**
	 * @return the modelName
	 */
	public String getModelName() {
		return modelName;
	}

	/**
	 * @param modelName the modelName to set
	 */
	public void setModelName(String modelName) {
		this.modelName = modelName;
	}

	/**
	 * @return the poDocDate
	 */
	public String getPoDocDate() {
		return poDocDate;
	}

	/**
	 * @param poDocDate the poDocDate to set
	 */
	public void setPoDocDate(String poDocDate) {
		this.poDocDate = poDocDate;
	}

	/**
	 * @return the orderType
	 */
	public String getOrderType() {
		return orderType;
	}

	/**
	 * @param orderType the orderType to set
	 */
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	/**
	 * @return the modelGender
	 */
	public String getModelGender() {
		return modelGender;
	}

	/**
	 * @param modelGender the modelGender to set
	 */
	public void setModelGender(String modelGender) {
		this.modelGender = modelGender;
	}

	/**
	 * @return the cutGetDate
	 */
	public String getCutGetDate() {
		return cutGetDate;
	}

	/**
	 * @param cutGetDate the cutGetDate to set
	 */
	public void setCutGetDate(String cutGetDate) {
		this.cutGetDate = cutGetDate;
	}

	/**
	 * @return the shippingDate
	 */
	public String getShippingDate() {
		return shippingDate;
	}

	/**
	 * @param shippingDate the shippingDate to set
	 */
	public void setShippingDate(String shippingDate) {
		this.shippingDate = shippingDate;
	}

	/**
	 * @return the instoreSdate
	 */
	public String getInstoreSdate() {
		return instoreSdate;
	}

	/**
	 * @param instoreSdate the instoreSdate to set
	 */
	public void setInstoreSdate(String instoreSdate) {
		this.instoreSdate = instoreSdate;
	}

	/**
	 * @return the modelDest
	 */
	public String getModelDest() {
		return modelDest;
	}

	/**
	 * @param modelDest the modelDest to set
	 */
	public void setModelDest(String modelDest) {
		this.modelDest = modelDest;
	}

	/**
	 * @return the cancelWidth
	 */
	public String getCancelWidth() {
		return cancelWidth;
	}

	/**
	 * @param cancelWidth the cancelWidth to set
	 */
	public void setCancelWidth(String cancelWidth) {
		this.cancelWidth = cancelWidth;
	}

	/**
	 * @return the makeLine
	 */
	public String getMakeLine() {
		return makeLine;
	}

	/**
	 * @param makeLine the makeLine to set
	 */
	public void setMakeLine(String makeLine) {
		this.makeLine = makeLine;
	}

	/**
	 * @return the grp
	 */
	public String getGrp() {
		return grp;
	}

	/**
	 * @param grp the grp to set
	 */
	public void setGrp(String grp) {
		this.grp = grp;
	}

	/**
	 * @return the orderCancel
	 */
	public String getOrderCancel() {
		return orderCancel;
	}

	/**
	 * @param orderCancel the orderCancel to set
	 */
	public void setOrderCancel(String orderCancel) {
		this.orderCancel = orderCancel;
	}

	/**
	 * @return the cancelDate
	 */
	public String getCancelDate() {
		return cancelDate;
	}

	/**
	 * @param cancelDate the cancelDate to set
	 */
	public void setCancelDate(String cancelDate) {
		this.cancelDate = cancelDate;
	}

	/**
	 * @return the cancelReason
	 */
	public String getCancelReason() {
		return cancelReason;
	}

	/**
	 * @param cancelReason the cancelReason to set
	 */
	public void setCancelReason(String cancelReason) {
		this.cancelReason = cancelReason;
	}

	/**
	 * @return the cancelIncharge
	 */
	public String getCancelIncharge() {
		return cancelIncharge;
	}

	/**
	 * @param cancelIncharge the cancelIncharge to set
	 */
	public void setCancelIncharge(String cancelIncharge) {
		this.cancelIncharge = cancelIncharge;
	}

	/**
	 * @return the curStateBarcode
	 */
	public String getCurStateBarcode() {
		return curStateBarcode;
	}

	/**
	 * @param curStateBarcode the curStateBarcode to set
	 */
	public void setCurStateBarcode(String curStateBarcode) {
		this.curStateBarcode = curStateBarcode;
	}

	/**
	 * @return the orderQty
	 */
	public String getOrderQty() {
		return orderQty;
	}

	/**
	 * @param orderQty the orderQty to set
	 */
	public void setOrderQty(String orderQty) {
		this.orderQty = orderQty;
	}

	/**
	 * @return the receiveQtySum
	 */
	public String getReceiveQtySum() {
		return receiveQtySum;
	}

	/**
	 * @param receiveQtySum the receiveQtySum to set
	 */
	public void setReceiveQtySum(String receiveQtySum) {
		this.receiveQtySum = receiveQtySum;
	}

	/**
	 * @return the receiveDate
	 */
	public String getReceiveDate() {
		return receiveDate;
	}

	/**
	 * @param receiveDate the receiveDate to set
	 */
	public void setReceiveDate(String receiveDate) {
		this.receiveDate = receiveDate;
	}

	/**
	 * @return the receiveQty
	 */
	public String getReceiveQty() {
		return receiveQty;
	}

	/**
	 * @param receiveQty the receiveQty to set
	 */
	public void setReceiveQty(String receiveQty) {
		this.receiveQty = receiveQty;
	}

	/**
	 * @return the orderRemainQty
	 */
	public String getOrderRemainQty() {
		return orderRemainQty;
	}

	/**
	 * @param orderRemainQty the orderRemainQty to set
	 */
	public void setOrderRemainQty(String orderRemainQty) {
		this.orderRemainQty = orderRemainQty;
	}

	/**
	 * @return the deliverDate
	 */
	public String getDeliverDate() {
		return deliverDate;
	}

	/**
	 * @param deliverDate the deliverDate to set
	 */
	public void setDeliverDate(String deliverDate) {
		this.deliverDate = deliverDate;
	}

	/**
	 * @return the deliverQty
	 */
	public String getDeliverQty() {
		return deliverQty;
	}

	/**
	 * @param deliverQty the deliverQty to set
	 */
	public void setDeliverQty(String deliverQty) {
		this.deliverQty = deliverQty;
	}

	/**
	 * @return the dailyDeliverQty
	 */
	public String getDailyDeliverQty() {
		return dailyDeliverQty;
	}

	/**
	 * @param dailyDeliverQty the dailyDeliverQty to set
	 */
	public void setDailyDeliverQty(String dailyDeliverQty) {
		this.dailyDeliverQty = dailyDeliverQty;
	}

	/**
	 * @return the deliverQtySum
	 */
	public String getDeliverQtySum() {
		return deliverQtySum;
	}

	/**
	 * @param deliverQtySum the deliverQtySum to set
	 */
	public void setDeliverQtySum(String deliverQtySum) {
		this.deliverQtySum = deliverQtySum;
	}

	/**
	 * @return the remainQtySum
	 */
	public String getRemainQtySum() {
		return remainQtySum;
	}

	/**
	 * @param remainQtySum the remainQtySum to set
	 */
	public void setRemainQtySum(String remainQtySum) {
		this.remainQtySum = remainQtySum;
	}

	/**
	 * @return the orderFinishDate
	 */
	public String getOrderFinishDate() {
		return orderFinishDate;
	}

	/**
	 * @param orderFinishDate the orderFinishDate to set
	 */
	public void setOrderFinishDate(String orderFinishDate) {
		this.orderFinishDate = orderFinishDate;
	}

	/**
	 * @return the orderManageList
	 */
	public List<PdOrderManageVO> getOrderManageList() {
		return orderManageList;
	}

	/**
	 * @param orderManageList the orderManageList to set
	 */
	public void setOrderManageList(List<PdOrderManageVO> orderManageList) {
		this.orderManageList = orderManageList;
	}

	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

}
