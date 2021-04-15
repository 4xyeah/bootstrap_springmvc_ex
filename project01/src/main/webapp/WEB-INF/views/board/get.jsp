<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<div class="row align-items-center text-center">
	<div class="col-1 col-md-3"></div>
	<div class="col-10 col-md-6 py-5 text-start ">
		<h1 class="my-5 table-title">Board Read</h1>
		<div class="col-12">
			<label for="board_no" class="form-label">Board No.</label> <input
				class="form-control" name="board_no"
				value='<c:out value="${board.board_no }"/>' readonly="readonly">
		</div>
		<div class="col-12">
			<label for="board_title" class="form-label">Title</label> <input
				class="form-control" id="board_title" name="board_title"
				value='<c:out value="${board.board_title }"/>' readonly="readonly">
		</div>
		<div class="col-12">
			<label for="board_content" class="form-label">Content</label>
			<textarea class="form-control" rows="4" id="board_content"
				name="board_content" readonly="readonly"><c:out
					value="${board.board_content }" /> </textarea>
		</div>
		<div class="col-12 mb-3">
			<label for="board_writer" class="form-label">Writer</label> <input
				class="form-control" id="board_writer" name="board_writer"
				value='<c:out value="${board.board_writer }"/>' readonly="readonly">
		</div>
		<div class="col-12">
			<button data-oper='modify'
				class="modifyBtn btn btn-default bg-dark text-white">Modify</button>
			<button data-oper='list'
				class="listBtn btn btn-default bg-dark text-white">List</button>
		</div>

		<!-- form 처리 -->
		<form id="operForm" action="/board/modify" method="get">
			<input type="hidden" id="board_no" name="board_no" value='<c:out value="${board.board_no }"/>'>
			<input type="hidden" name="pageNum" value='<c:out value="${criteria.pageNum }"/>'>
			<input type="hidden" name="amount" value='<c:out value="${criteria.amount }"/>'>
			<input type="hidden" name="keyword" value='<c:out value="${criteria.keyword }"/>'>
			<input type="hidden" name="type" value='<c:out value="${criteria.type }"/>'>
		</form>
	</div>
	<!-- end of form body-->
	<div class="col-1 col-md-3"></div>
</div>
</section>
</main>
<script>
	/* 	const modifyBtn = document.querySelector('.modifyBtn');
	 const listBtn = document.querySelector('.listBtn');

	 modifyBtn.onclick = function() {
	 location.href = '/board/modify?board_no=<c:out value="${board.board_no}"/>';
	 };

	 listBtn.onclick = function() {
	 location.href = '/board/list';
	 }; */

	 document.addEventListener('DOMContentLoaded', function() {

		let operForm = document.querySelector('#operForm');
		let modifyBtn = document.querySelector('button[data-oper="modify"]');
		let listBtn = document.querySelector('button[data-oper="list"]');
	
		modifyBtn.addEventListener('click', function(e) {
			operForm.setAttribute('action', '/board/modify');
			operForm.submit();
		});

		listBtn.addEventListener('click', function(e) {

			operForm.removeChild(document.querySelector('#board_no'));
			operForm.setAttribute('action', '/board/list');
			operForm.submit();
		});

	})
</script>
</body>
</html>