package mc.s1.mapcar.common.api.model;

public class OilVo {
//	TRADE_DT 해당일자
//	PRODCD 제품구분코드
//	PRODNM 제품명
//	PRICE 평균가격
//	DIFF 전일대비 등락값
	
	private String trade_dt;
	private String prodcd;
	private String prodnm;
	private String price;
	private String diff;
	public OilVo() {
		super();
	}
	@Override
	public String toString() {
		return "ApiVo [trade_dt=" + trade_dt + ", prodcd=" + prodcd + ", prodnm=" + prodnm + ", price=" + price
				+ ", diff=" + diff + "]";
	}
	public String getTrade_dt() {
		return trade_dt;
	}
	public void setTrade_dt(String trade_dt) {
		this.trade_dt = trade_dt;
	}
	public String getProdcd() {
		return prodcd;
	}
	public void setProdcd(String prodcd) {
		this.prodcd = prodcd;
	}
	public String getProdnm() {
		return prodnm;
	}
	public void setProdnm(String prodnm) {
		this.prodnm = prodnm;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDiff() {
		return diff;
	}
	public void setDiff(String diff) {
		this.diff = diff;
	}
}
