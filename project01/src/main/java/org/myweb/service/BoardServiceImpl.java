package org.myweb.service;

import java.util.List;

import org.myweb.domain.BoardVO;
import org.myweb.domain.Criteria;
import org.myweb.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.*;
import lombok.extern.log4j.Log4j;

@Log4j
@Service // 비즈니스 영역을 담당하는 객체임을 표시
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	
	// 스프링 4.3 이상부터 단일 파라미터를 받는 생성자는
	// 필요한 파라미터 자동 주입 가능
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Override
	public void register(BoardVO board) {
		log.info("register................" + board);
		
		mapper.insertSelectKey(board);
		
	}

	@Override
	public BoardVO get(Long board_no) {
		log.info("get..............." + board_no);
		return mapper.read(board_no);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("modify.............." + board);
		
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long board_no) {
		log.info("remove.............." + board_no);
		return mapper.delete(board_no) == 1;
	}

	@Override
	public List<BoardVO> getList(Criteria criteria) {
		log.info("getList with criteria: " + criteria);
		return mapper.getListWithPaging(criteria);
	}

	@Override
	public int getTotalData(Criteria criteria) {
		log.info("getTotalDataCount");
		
		return mapper.getTotalData(criteria);
	}
	
	
}
