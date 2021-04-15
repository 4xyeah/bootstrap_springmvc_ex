package org.myweb.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.*;

@Getter
@Setter
@ToString
public class Criteria {

	private int pageNum;
	private int amount;

	private String type;
	private String keyword;

	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	// MyBatis 동적태그 활용을 위한 메서드
	// 조건 검색 처리용
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
	
	
	// 링크 생성 기능
	// queryParam() 메서드를 이용해서 필요한 파라미터를 수비게 추가할 수 있음
	// 한글처리도 신경쓰지 않아도 됨
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		
		return builder.toUriString();
		
	}
}
