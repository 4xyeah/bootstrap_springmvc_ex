<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<div class="row align-items-center text-center">
	<div class="col-1 col-md-3"></div>
	<div class="col-10 col-md-6 py-5 text-start ">
		<h1 class="my-5 table-title">Board Modify</h1>

		<form class="row" role="form" action="/board/modify" method="post">
			<div class="col-12">
				<label for="board_no" class="form-label">Board No.</label> <input
					class="form-control" name="board_no"
					value='<c:out value="${board.board_no }"/>' readonly="readonly">
			</div>
			<div class="col-12">
				<label for="board_title" class="form-label">Title</label> <input
					class="form-control" id="board_title" name="board_title"
					value='<c:out value="${board.board_title }"/>'>
			</div>
			<div class="col-12">
				<label for="board_content" class="form-label">Content</label>
				<textarea class="form-control" rows="4" id="board_content"
					name="board_content"><c:out
						value="${board.board_content }" /> </textarea>
			</div>
			<div class="col-12 mb-3">
				<label for="board_writer" class="form-label">Writer</label> <input
					class="form-control" id="board_writer" name="board_writer"
					value='<c:out value="${board.board_writer }"/>' readonly="readonly">
			</div>
			<input type="hidden" name="pageNum"
				value='<c:out value="${criteria.pageNum }"/>'> <input
				type="hidden" name="amount"
				value='<c:out value="${criteria.amount }"/>'>

			<div class="col-12 text-center text-md-start">
				<button type="submit" data-oper='modify'
					class="modifyBtn btn btn-default bg-dark text-white">Modify</button>
				<button type="submit" data-oper='remove'
					class="deleteBtn btn btn-default bg-dark text-white">Delete</button>
				<button type="submit" data-oper='list'
					class="listBtn btn btn-default bg-dark text-white">List</button>
			</div>
		</form>
	</div>
	<!-- end of form body-->
	<div class="col-1 col-md-3"></div>
</div>
</section>
</main>
<script>
document.addEventListener('DOMContentLoaded', function() {
		let formObj = document.querySelector('form');
		
		let btns = document.querySelectorAll('button');
		
		Array.from(btns).forEach(btn => {
			btn.addEventListener('click', function(e) {
				e.preventDefault();
				
				let operation = this.getAttribute('data-oper');
				console.log(operation);
				
				if (operation === 'remove')
					formObj.setAttribute('action', '/board/remove');
				else if (operation === 'list') {
					// list로 이동
					formObj.setAttribute('action', '/board/list');
					formObj.setAttribute('method', 'get');
					
					let pageNumEl = Object.assign(document.querySelector("input[name='pageNum']"));
					let amountEl = Object.assign(document.querySelector("input[name='amount']"));
					
					console.log(pageNumEl);
					console.log(amountEl);
					// Jquery empty() 메서드 -> vanilaJS
					while ( formObj.firstChild ) { 
						formObj.removeChild( formObj.firstChild ); 
					}
					
					formObj.append(pageNumEl);
					formObj.append(amountEl);

				}
				formObj.submit();
			});
		});
	});
</script>
</body>
</html>