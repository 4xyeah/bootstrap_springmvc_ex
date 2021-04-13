package org.myweb.service;

import static org.junit.Assert.assertNotNull;

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
public class BoardServiceTests {
	
	@Setter(onMethod_ = {@Autowired })
	private BoardService service;
	
	@Test
	public void testExist() {
		
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testRegister() {
		
		BoardVO board = new BoardVO();
		board.setBoard_title("testRegister용 새 작성글");
		board.setBoard_content("testRegister용 새 작성글 내용");
		board.setBoard_writer("testRegisterUser");
		
		service.register(board);
		
		log.info("생성된 게시물 번호: " + board.getBoard_no());
	}
	
	@Test
	public void testGetList() {
		//service.getList().forEach(board -> log.info(board));
		service.getList(new Criteria(2, 10)).forEach(board -> log.info(board));
	}
	
	@Test
	public void testGet() {
		log.info(service.get(31L));
	}
	
	@Test
	public void testDelete() {
		log.info("REMOVE RESULT: " + service.remove(31L));
	}
	
	@Test
	public void testUpdate() {
		BoardVO board = service.get(30L);
		
		if(board==null) {
			return;
		}
		
		board.setBoard_title("제목 수정");
		log.info("MODIFY RESULT: " + service.modify(board));
	}
}
