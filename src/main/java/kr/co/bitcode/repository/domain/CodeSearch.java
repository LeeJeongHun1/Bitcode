package kr.co.bitcode.repository.domain;

public class CodeSearch {
	private String searchInput;
	private int searchOption;
	private int pageNo =1;
	private int begin;
	private int end;
	private int listSize = 10;
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getBegin() {
		return (pageNo -1) * listSize ;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public int getEnd() {
		return pageNo * listSize + 1;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getSearchInput() {
		return searchInput;
	}
	public void setSearchInput(String searchInput) {
		this.searchInput = searchInput;
	}
	public int getSearchOption() {
		return searchOption;
	}
	public void setSearchOption(int searchOption) {
		this.searchOption = searchOption;
	}

}
