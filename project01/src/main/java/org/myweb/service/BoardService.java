package org.myweb.service;

import java.util.List;

import org.myweb.domain.BoardVO;
import org.myweb.domain.Criteria;

public interface BoardService {
	public void register(BoardVO board);
	
	public BoardVO get(Long board_no);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long board_no);
	
	//public List<BoardVO> getList();
	
	public List<BoardVO> getList(Criteria criteria);
	
	public int getTotalData(Criteria criteria);
}
