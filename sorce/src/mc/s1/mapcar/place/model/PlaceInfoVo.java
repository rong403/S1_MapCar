package mc.s1.mapcar.place.model;

import java.util.List;

import mc.s1.mapcar.review.model.ReviewVo;


public class PlaceInfoVo {
//	P_NO	VARCHAR2(20 BYTE)
//	P_NAME	VARCHAR2(111 BYTE)
//	P_ROAD_NO	VARCHAR2(100 BYTE)
//	P_ADDRESS	VARCHAR2(100 BYTE)
//	P_INFO	VARCHAR2(500 BYTE)
//	P_TYPE	VARCHAR2(10 BYTE)
//	P_VAL	VARCHAR2(10 BYTE)
//	P_NUMBER	NUMBER
//	P_UNIT	VARCHAR2(10 BYTE)
//	PLACE_NO	NUMBER
	
	private String p_no;
	private String p_name;
	private String p_road_no;
	private String p_address;
	private String p_info;
	private String p_type;
	private String p_val;
	private int p_number;
	private String p_unit;
	private int place_no;
	
	private List<PlaceBookmarkVo> placebookmarklist;
	private List<PlaceImageVo> placeimagelist;
	private List<OpeVo> opelist;
	private List<ChargeVo> chargelist;
	private List<ReviewVo> reviewlist;
	
	public PlaceInfoVo() {
		super();
	}
	@Override
	public String toString() {
		return "PlaceInfoVo [p_no=" + p_no + ", p_name=" + p_name + ", p_road_no=" + p_road_no + ", p_address="
				+ p_address + ", p_info=" + p_info + ", p_type=" + p_type + ", p_val=" + p_val + ", p_number="
				+ p_number + ", p_unit=" + p_unit + ", place_no=" + place_no + ", placebookmarklist="
				+ placebookmarklist + ", placeimagelist=" + placeimagelist + ", opelist=" + opelist + ", chargelist="
				+ chargelist + ", reviewlist=" + reviewlist + "]";
	}
	public String getP_no() {
		return p_no;
	}
	public void setP_no(String p_no) {
		this.p_no = p_no;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_road_no() {
		return p_road_no;
	}
	public void setP_road_no(String p_road_no) {
		this.p_road_no = p_road_no;
	}
	public String getP_address() {
		return p_address;
	}
	public void setP_address(String p_address) {
		this.p_address = p_address;
	}
	public String getP_info() {
		return p_info;
	}
	public void setP_info(String p_info) {
		this.p_info = p_info;
	}
	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	public String getP_val() {
		return p_val;
	}
	public void setP_val(String p_val) {
		this.p_val = p_val;
	}
	public int getP_number() {
		return p_number;
	}
	public void setP_number(int p_number) {
		this.p_number = p_number;
	}
	public String getP_unit() {
		return p_unit;
	}
	public void setP_unit(String p_unit) {
		this.p_unit = p_unit;
	}
	public int getPlace_no() {
		return place_no;
	}
	public void setPlace_no(int place_no) {
		this.place_no = place_no;
	}
	public List<PlaceBookmarkVo> getPlacebookmarklist() {
		return placebookmarklist;
	}
	public void setPlacebookmarklist(List<PlaceBookmarkVo> placebookmarklist) {
		this.placebookmarklist = placebookmarklist;
	}
	public List<PlaceImageVo> getPlaceimagelist() {
		return placeimagelist;
	}
	public void setPlaceimagelist(List<PlaceImageVo> placeimagelist) {
		this.placeimagelist = placeimagelist;
	}
	public List<OpeVo> getOpelist() {
		return opelist;
	}
	public void setOpelist(List<OpeVo> opelist) {
		this.opelist = opelist;
	}
	public List<ChargeVo> getChargelist() {
		return chargelist;
	}
	public void setChargelist(List<ChargeVo> chargelist) {
		this.chargelist = chargelist;
	}
	public List<ReviewVo> getReviewlist() {
		return reviewlist;
	}
	public void setReviewlist(List<ReviewVo> reviewlist) {
		this.reviewlist = reviewlist;
	}
}
