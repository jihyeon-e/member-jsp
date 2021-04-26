package imageboard.bean;

import lombok.Data;

@Data
public class ImageboardPaging { //한페이지 당 3개씩
	private int currentPage;	//<a>태그 사용하지 말고 <span onclick="imageboardPaging()">
	private int pageBlock;		//태그와 자바스크립트 함수 사용하기
	private int pageSize;
	private int totalA;
	private StringBuffer pagingHTML;
	
	public void makePagingHTML(){
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize; //총페이지 수
		int startPage = (currentPage-1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if(endPage > totalP) endPage = totalP;
		
		if(startPage > pageBlock)
			pagingHTML.append("<span id='paging' onclick='imageboardPaging("+(startPage-1)+")'>이전</span>");
		
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage) {
				pagingHTML.append("<span id='currentPaging' onclick='imageboardPaging("+i+")'>"+i+"</span>");
			} else {
				pagingHTML.append("<span id='paging' onclick='imageboardPaging("+i+")'>"+i+"</span>");
			}
		}
		
		if(endPage < totalP)
	         pagingHTML.append("<span id='paging' onclick='imageboardPaging("+(endPage+1)+")'>다음</span>");
	}
}
