package global.sesoc.color.util;

public class PageNavigator {
	// 멤버
	private final int countPerPage = 10;	// 한 페이지당 글개수
	private final int pagePerGroup = 5;		// 페이지 그룹
	private int currentPage;		// 현재 페이지
	private int totalRecordCount; 	// 전체 글 개수
	private int totalPageCount;		// 총 페이지수
	private int currentGroup;		// 현재 그룹
	private int startPageGroup;		// 현재 그룹의 첫 페이지
	private int endPageGroup;		// 현재 그룹의 마지막 페이지
	private int startRecord;		// 전체 레코드 중 현재 페이지의 첫 글의 위치

	// srow, erow 계산하지 않고, mybatis의 기능의 RowBounds 사용
	
	// constructor
	public PageNavigator(int currentPage, int totalRecordCount) {
		this.totalRecordCount =  totalRecordCount;
		
		// 전체 글개수 152개라면 ? 총 페이지 16페이지
		// 전체 글개수 150개라면 ? 총 페이지 15 페이지
		totalPageCount = (totalRecordCount + countPerPage - 1) / countPerPage;

		// 현재 페이지 요청 시 계산
		if(currentPage < 1) currentPage = 1;
		if(currentPage > totalPageCount) currentPage = totalPageCount;
		
		this.currentPage = currentPage;
		
		// 현재 그룹 계산
		// 내가 4페이지를 보고있다면 4페이지는 몇번 그룹인가? 0번 그룹 (4-1) / 5
		currentGroup = (currentPage - 1) / pagePerGroup;
		
		// 현재 그룹의 첫 페이지
		startPageGroup = currentGroup * pagePerGroup + 1;
		startPageGroup = startPageGroup < 1 ? 1 : startPageGroup;

		// 현재 그룹의 마지막 페이지
		endPageGroup = startPageGroup + pagePerGroup - 1;
		endPageGroup = endPageGroup < totalPageCount ? endPageGroup : totalPageCount;
	
		// 전체 레코드 중에서 현제 페이지의 첫 글의 위치
		startRecord = (currentPage - 1) * countPerPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalRecordCount() {
		return totalRecordCount;
	}

	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getCurrentGroup() {
		return currentGroup;
	}

	public void setCurrentGroup(int currentGroup) {
		this.currentGroup = currentGroup;
	}

	public int getStartPageGroup() {
		return startPageGroup;
	}

	public void setStartPageGroup(int startPageGroup) {
		this.startPageGroup = startPageGroup;
	}

	public int getEndPageGroup() {
		return endPageGroup;
	}

	public void setEndPageGroup(int endPageGroup) {
		this.endPageGroup = endPageGroup;
	}

	public int getStartRecord() {
		return startRecord;
	}

	public void setStartRecord(int startRecord) {
		this.startRecord = startRecord;
	}

	public int getCountPerPage() {
		return countPerPage;
	}

	public int getPagePerGroup() {
		return pagePerGroup;
	}

	@Override
	public String toString() {
		return "PageNavigator [countPerPage=" + countPerPage + ", pagePerGroup=" + pagePerGroup + ", currentPage="
				+ currentPage + ", totalRecordCount=" + totalRecordCount + ", totalPageCount=" + totalPageCount
				+ ", currentGroup=" + currentGroup + ", startPageGroup=" + startPageGroup + ", endPageGroup="
				+ endPageGroup + ", startRecord=" + startRecord + "]";
	}
}
