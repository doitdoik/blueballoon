package com.icia.blueballoon.util.paging;


public class PagingUtil {
	public static Pagination getPagination(int page, int count) {
		int size = 10;		// 페이지 당 글의 개수
		int block = 5;	// 페이지 번호의 개수
		// 1페이지 - sR : 1	, eR : 10
		// 2페이지 - sR : 11, eR : 20
		int startRow = (page-1) * size + 1;
		int endRow = startRow + size - 1;
		endRow = (endRow>count) ? count : endRow;
		// block이 5일때
		// 1~5페이지		블록번호 0
		// 6~10페이지		블록번호 1
		// 11~15페이지		블록번호 2
		int blockNumber = (page-1)/block;
		int startPage = blockNumber * block + 1;
		int endPage = startPage + block - 1;
		int countOfPage = count/size + 1;
		endPage = (endPage>countOfPage) ? countOfPage : endPage;
		
		int prev = startPage - 1;
		int next = endPage + 1;
		if(endPage == countOfPage)
			next = 0; 
		
		return Pagination.builder().startPage(startPage).endPage(endPage).startRow(startRow).endRow(endRow).prev(prev).next(next).page(page).build();
	}
}
