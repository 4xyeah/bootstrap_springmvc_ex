package org.myweb.domain;

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
}
