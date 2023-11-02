package com.choongang.s202350103.htService;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
// @Data 이것만 써줘도 된다.
public class Paging { // 이클립스 och16을 보면 페이징 작업을 리스트 페이지내에 썻는데 모듈화를 위해서 따로 만들면 이걸 아무때나 가져다가 쓸 수 있다.
	private int currentPage = 1;  private int rowPage=5;
	private int start;			  private int end;
									//초기값 : null
	public Paging(int total, String currentPage1) {
		
		if(currentPage1 != null) {
			this.currentPage = Integer.parseInt(currentPage1); // 2
		}
		//         1					10
		start = (currentPage - 1) * rowPage + 1;  // 시작시1    11
		end   = start + rowPage - 1;              // 시작시10   20
						  // 			25		   /  10
	}
}
