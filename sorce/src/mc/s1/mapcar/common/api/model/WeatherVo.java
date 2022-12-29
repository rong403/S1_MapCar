package mc.s1.mapcar.common.api.model;

public class WeatherVo {
//	numOfRows	한 페이지 결과 수
//	pageNo	페이지 번호
//	totalCount	데이터 총 개수
//	resultCode	응답메시지 코드
//	resultMsg	응답메시지 내용
//	dataType	데이터 타입
	
//	baseDate	발표일자
//	baseTime	발표시각
//	fcstDate	예보일자
//	fcstTime	예보시각
//	category	자료구분문자
//	fcstValue	예보 값
//	nx	예보지점 X 좌표
//	ny	예보지점 Y 좌표
	private String baseDate;
	private String baseTime;
	private String fcstDate;
	private String fcstTime;
	private String category;
	private String fcstValue;
	private String nx;
	private String ny;
	public WeatherVo() {
		super();
	}
	@Override
	public String toString() {
		return "WeatherVo [baseDate=" + baseDate + ", baseTime=" + baseTime + ", fcstDate=" + fcstDate + ", fcstTime="
				+ fcstTime + ", category=" + category + ", fcstValue=" + fcstValue + ", nx=" + nx + ", ny=" + ny + "]";
	}
	public String getBaseDate() {
		return baseDate;
	}
	public void setBaseDate(String baseDate) {
		this.baseDate = baseDate;
	}
	public String getBaseTime() {
		return baseTime;
	}
	public void setBaseTime(String baseTime) {
		this.baseTime = baseTime;
	}
	public String getFcstDate() {
		return fcstDate;
	}
	public void setFcstDate(String fcstDate) {
		this.fcstDate = fcstDate;
	}
	public String getFcstTime() {
		return fcstTime;
	}
	public void setFcstTime(String fcstTime) {
		this.fcstTime = fcstTime;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getFcstValue() {
		return fcstValue;
	}
	public void setFcstValue(String fcstValue) {
		this.fcstValue = fcstValue;
	}
	public String getNx() {
		return nx;
	}
	public void setNx(String nx) {
		this.nx = nx;
	}
	public String getNy() {
		return ny;
	}
	public void setNy(String ny) {
		this.ny = ny;
	}
}
