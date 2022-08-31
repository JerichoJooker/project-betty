package com.koreate.betty.domain.board.vo;

import java.sql.Timestamp;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;
@Getter
@Builder
@ToString
public class FreeBoardComment {
	
	private final Integer cno;
	private final Integer freeBno;
	private final String memberId;
	private final String nickname;
	private final String comment;
	private final Integer origin;
	private final Timestamp regdate;
	private final String showboard;		
	
	
}
