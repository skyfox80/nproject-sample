package egovframework.hwvn.pd.order.service;

import java.io.Serializable;

public class PdOrderDefaultVO implements Serializable{

	public PdOrderDefaultVO() {
		// TODO Auto-generated constructor stub
	}
	
	private static final long serialVersionUID = -2782974258506027986L;

	/** 검색조건 */
    private String searchCondition = "";

    /** 검색Keyword */
    private String searchKeyword = "";

    /** 검색사용여부 */
    private String searchUseYn = "";

    /** 현재페이지 */
    private int pageIndex = 1;

    /** 페이지갯수 */
    private int pageUnit = 15;

    /** 페이지사이즈 */
    private int pageSize = 15;

    /** firstIndex */
    private int firstIndex = 1;

    /** lastIndex */
    private int lastIndex = 1;

    /** recordCountPerPage */
    private int recordCountPerPage = 10;

    /**  시작 일자 */
    private String fromDate = "";
    
    /**  종료 일자 */
    private String toDate = "";

    
    /** 권한 로그인 ID **/
	private String inCharge;
    
	/** 고유 키 **/
	private String unikey;

	/** 현황 바코드 **/
	private String curStateBarcode;

	/** 생산 공정 바코드 **/
	private String processBarcode;

	/** 입고 바코드 **/
	private String storeinBarcode;

	/** 출고 바코드 **/
	private String releaseBarcode;
	
	/** 재단물 구분키 **/
	private String cutstateKey;
	
	/** 모델 및 부속품 depthcode&**/
	private String depthCode;
	
	/** 모델 및 부속품  꼬리코드 tail  **/
    private String tail;
    
    /** 모델 및 부속품 depth별 상태 1 **/    
    private String tailDepend1;
    
    /** 모델 및 부속품 depth별 상태 2 **/
    private String tailDepend2;
    
    /** 모델 및 부속품 depth별 상태 3 **/
    private String tailDepend3;
    
    /** 모델 및 부속품 depth별 상태 4 **/
    private String tailDepend4;
    
    /** 모델 및 부속품 사용 여부 **/
    private String delFlag;

    /** company1 **/
    private String originCom1;
    
    /** company2 **/
	private String originCom2;
	
	/** modelGroup **/
	private String modelGroup;
	
	/** styleno **/
	private String styleNo;
	
	/** s_state **/
	private String sState;
	
	/**
	 * Roll State 임시 저장용 VO
	 */
	/** roll size(m) 임시 변수 **/
	private String rm1;
	private String rm2;
	private String rm3;
	private String rm4;
	
	/** roll qty 임시 변수 **/
	private String rq1;
	private String rq2;
	private String rq3;
	private String rq4;
	
	/** roll meter sum 임시 변수 **/
	private String rs1;
	private String rs2;
	private String rs3;
	private String rs4;
    
    /** 프로시저 리턴값 **/
	private String rtn;
	
	/**
	 * pd_standardvalue 각 단계별 필드 
	 */
	private String sCode;
	private String sDetail;
	private String sDescript;
	private String stateCode;
	
	
	
	
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
	 * @return the rm1
	 */
	public String getRm1() {
		return rm1;
	}

	/**
	 * @param rm1 the rm1 to set
	 */
	public void setRm1(String rm1) {
		this.rm1 = rm1;
	}

	/**
	 * @return the rm2
	 */
	public String getRm2() {
		return rm2;
	}

	/**
	 * @param rm2 the rm2 to set
	 */
	public void setRm2(String rm2) {
		this.rm2 = rm2;
	}

	/**
	 * @return the rm3
	 */
	public String getRm3() {
		return rm3;
	}

	/**
	 * @param rm3 the rm3 to set
	 */
	public void setRm3(String rm3) {
		this.rm3 = rm3;
	}

	/**
	 * @return the rm4
	 */
	public String getRm4() {
		return rm4;
	}

	/**
	 * @param rm4 the rm4 to set
	 */
	public void setRm4(String rm4) {
		this.rm4 = rm4;
	}

	/**
	 * @return the rq1
	 */
	public String getRq1() {
		return rq1;
	}

	/**
	 * @param rq1 the rq1 to set
	 */
	public void setRq1(String rq1) {
		this.rq1 = rq1;
	}

	/**
	 * @return the rq2
	 */
	public String getRq2() {
		return rq2;
	}

	/**
	 * @param rq2 the rq2 to set
	 */
	public void setRq2(String rq2) {
		this.rq2 = rq2;
	}

	/**
	 * @return the rq3
	 */
	public String getRq3() {
		return rq3;
	}

	/**
	 * @param rq3 the rq3 to set
	 */
	public void setRq3(String rq3) {
		this.rq3 = rq3;
	}

	/**
	 * @return the rq4
	 */
	public String getRq4() {
		return rq4;
	}

	/**
	 * @param rq4 the rq4 to set
	 */
	public void setRq4(String rq4) {
		this.rq4 = rq4;
	}

	/**
	 * @return the rs1
	 */
	public String getRs1() {
		return rs1;
	}

	/**
	 * @param rs1 the rs1 to set
	 */
	public void setRs1(String rs1) {
		this.rs1 = rs1;
	}

	/**
	 * @return the rs2
	 */
	public String getRs2() {
		return rs2;
	}

	/**
	 * @param rs2 the rs2 to set
	 */
	public void setRs2(String rs2) {
		this.rs2 = rs2;
	}

	/**
	 * @return the rs3
	 */
	public String getRs3() {
		return rs3;
	}

	/**
	 * @param rs3 the rs3 to set
	 */
	public void setRs3(String rs3) {
		this.rs3 = rs3;
	}

	/**
	 * @return the rs4
	 */
	public String getRs4() {
		return rs4;
	}

	/**
	 * @param rs4 the rs4 to set
	 */
	public void setRs4(String rs4) {
		this.rs4 = rs4;
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
	 * @return the processBarcode
	 */
	public String getProcessBarcode() {
		return processBarcode;
	}

	/**
	 * @param processBarcode the processBarcode to set
	 */
	public void setProcessBarcode(String processBarcode) {
		this.processBarcode = processBarcode;
	}

	/**
	 * @return the storeinBarcode
	 */
	public String getStoreinBarcode() {
		return storeinBarcode;
	}

	/**
	 * @param storeinBarcode the storeinBarcode to set
	 */
	public void setStoreinBarcode(String storeinBarcode) {
		this.storeinBarcode = storeinBarcode;
	}

	/**
	 * @return the releaseBarcode
	 */
	public String getReleaseBarcode() {
		return releaseBarcode;
	}

	/**
	 * @param releaseBarcode the releaseBarcode to set
	 */
	public void setReleaseBarcode(String releaseBarcode) {
		this.releaseBarcode = releaseBarcode;
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
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	/**
	 * @return the searchCondition
	 */
	public String getSearchCondition() {
		return searchCondition;
	}

	/**
	 * @param searchCondition the searchCondition to set
	 */
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	/**
	 * @return the searchKeyword
	 */
	public String getSearchKeyword() {
		return searchKeyword;
	}

	/**
	 * @param searchKeyword the searchKeyword to set
	 */
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	/**
	 * @return the searchUseYn
	 */
	public String getSearchUseYn() {
		return searchUseYn;
	}

	/**
	 * @param searchUseYn the searchUseYn to set
	 */
	public void setSearchUseYn(String searchUseYn) {
		this.searchUseYn = searchUseYn;
	}

	/**
	 * @return the pageIndex
	 */
	public int getPageIndex() {
		return pageIndex;
	}

	/**
	 * @param pageIndex the pageIndex to set
	 */
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	/**
	 * @return the pageUnit
	 */
	public int getPageUnit() {
		return pageUnit;
	}

	/**
	 * @param pageUnit the pageUnit to set
	 */
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}

	/**
	 * @return the pageSize
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * @param pageSize the pageSize to set
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	/**
	 * @return the firstIndex
	 */
	public int getFirstIndex() {
		return firstIndex;
	}

	/**
	 * @param firstIndex the firstIndex to set
	 */
	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	/**
	 * @return the lastIndex
	 */
	public int getLastIndex() {
		return lastIndex;
	}

	/**
	 * @param lastIndex the lastIndex to set
	 */
	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	/**
	 * @return the recordCountPerPage
	 */
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	/**
	 * @param recordCountPerPage the recordCountPerPage to set
	 */
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	/**
	 * @return the fromDate
	 */
	public String getFromDate() {
		return fromDate;
	}

	/**
	 * @param fromDate the fromDate to set
	 */
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	/**
	 * @return the toDate
	 */
	public String getToDate() {
		return toDate;
	}

	/**
	 * @param toDate the toDate to set
	 */
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
    
    
    

}
