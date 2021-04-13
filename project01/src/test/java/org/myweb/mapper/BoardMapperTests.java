package org.myweb.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.myweb.domain.BoardVO;
import org.myweb.domain.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
//	
//	@Test
//	public void testGetList() {
//		mapper.getList().forEach(board -> log.info(board));
//	}
	
	@Test 
	public void testPaging() {
		
		Criteria criteria = new Criteria();
		criteria.setPageNum(3);
		criteria.setAmount(10);
		List<BoardVO> list = mapper.getListWithPaging(criteria);
		
		list.forEach(board -> log.info(board.getBoard_no()));
	}
	
	
//	@Test
//	public void testInsert() {
//		
//		BoardVO board = new BoardVO();
//		board.setBoard_title("새 작성글 제목");
//		board.setBoard_content("새 작성글 내용");
//		board.setBoard_writer("newUser");
//		
//		mapper.insert(board);
//		
//		log.info(board);
//		
//	}
//	
//	@Test
//	public void testInsertSelectKey() {
//		
//		BoardVO board = new BoardVO();
//		board.setBoard_title("새 작성글 제목 SelectKey");
//		board.setBoard_content("새 작성글 내용 SelectKey");
//		board.setBoard_writer("newUser");
//		
//		mapper.insertSelectKey(board);
//		
//		log.info(board);
//		
//	}
//	
//	@Test
//	public void testRead() {
//		
//		// 테이블에 존재하는 게시물 번호로 테스트
//		BoardVO board = mapper.read(26L);
//		
//		log.info(board);;
//		
//	}
//	
//	@Test
//	public void testDelete() {
//		
//		// 삭제할 데이터가 존재하면 1 이상의 숫자 출력
//		// 게시물이 없으면 0 출력
//		log.info("DELETE는 몇 건? " + mapper.delete(26L));
//	}
//	
//	@Test
//	public void testUpdate() {
//		
//		BoardVO board = new BoardVO();
//		
//		board.setBoard_no(29L);
//		board.setBoard_title("수정된 제목");
//		board.setBoard_content("수정된 내용");
//		board.setBoard_writer("userUpdate");
//		
//		int count = mapper.update(board);
//		log.info("UPDATE 몇 건? " + count);
//		
//	}
}
