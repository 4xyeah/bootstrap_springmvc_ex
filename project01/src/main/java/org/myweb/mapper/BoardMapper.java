package org.myweb.mapper;

import java.util.List;

import org.myweb.domain.BoardVO;
import org.myweb.domain.Criteria;

public interface BoardMapper {
	public List<BoardVO> getList();
	
	public List<BoardVO> getListWithPaging(Criteria criteria);

	public void insert(BoardVO board);
	
	public Integer insertSelectKey(BoardVO board);
	
	public BoardVO read(Long board_no);
	
	// 몇 건의 데이터가 삭제됐는지 알기 위해서 int type 반환
	public int delete(Long board_no);
	
	public int update(BoardVO board);
	
	public int getTotalData(Criteria criteria);
	
}
