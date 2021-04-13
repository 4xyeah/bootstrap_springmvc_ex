package org.myweb.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long board_no;
	private String board_title;
	private String board_content;
	private String board_writer;
	private Date board_date;
	
}
