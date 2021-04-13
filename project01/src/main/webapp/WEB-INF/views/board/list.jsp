<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<main>
<section class="container-fluid px-0">
	<div class="row align-items-center text-center">
		<div class="col-1 col-md-2"></div>
		<div class="col-10 col-md-8 py-5">
			<h1 class="mt-5 text-start table-title">Contact</h1>
			<table class="table">
				<thead>
					<tr>
						<th>No.</th>
						<th colspan="10">Title</th>
						<th>Writer</th>
						<th>Date</th>
					</tr>
				</thead>
				<!-- jstl을 이용해서 DB에 있는 전체 글 목록 출력  -->
				<c:forEach items="${list}" var="board">
					<tbody>
						<tr>
							<td><c:out value="${board.board_no }" /></td>
							<td colspan="10"><a
								href='/board/get?board_no=<c:out value="${board.board_no }" />'><c:out
										value="${board.board_title }" /></a></td>
							<td><c:out value="${board.board_writer }" /></td>
							<!--  pattern에서 월은 'MM'으로 쓰기! 소문자로 쓰면 이상한 두자리 숫자 나옴 -->
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.board_date }" /></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>

			<nav class="pull-right" aria-label="page Navigation">
				<ul class="pagination justify-content-center">
					<c:if test="${pageMaker.prev}">
						<li class="page-item disabled"><a
							 class="page-link" tabindex="-1" aria-disabled="true" href="{pageMaker.startPage -1 }">Previous</a>
					</c:if>

					<c:forEach var="num" begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }">
						<li class='page-item ${pageMaker.criteria.pageNum == num? "active":"" }'>
						<a
							 class="page-link" href="${num }">${num }</a></li>
					</c:forEach>

					<c:if test="${pageMaker.next }">
						<li class="page-item next"><a  class="page-link" href="{pageMaker.endPage +1 }">Next</a></li>
					</c:if>
				</ul>
			</nav>
			<!-- end of pageSection -->

			<div class="btnWrap text-center text-md-end">
				<button id="regBtn" type="button" class="btn btn-xs btn-primary">write</button>
			</div>
		</div>
		<div class="col-1 col-md-2"></div>
	</div>
</section>
</main>
<!-- Modal 영역 -->
<div class="modal fade" tabindex="-1" id="myModal" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel">게시글 처리 완료</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">처리가 완료됐습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
		<!-- Modal Content -->
	</div>
	<!-- Modal Dialog -->
</div>
<!-- Modal 끝 -->
<script>
	$(document).ready(
			function() {
				let result = '<c:out value="${result}"/>';
				let regBtn = document.getElementById('regBtn');

				checkModal(result);

				// window.history 객체를 조작해서 
				// register-> 뒤로가기 -> list 이동시 
				// 모달창 안뜨게 하기
				history.replaceState({}, null, null);

				function checkModal(result) {
					let modalBody = document.querySelector('.modal-body');
					let modal = document.getElementById('myModal')
					if (result === '' || history.state)
						return;

					if (parseInt(result) > 0) {
						modalBody.innerHTML = '게시글 ' + parseInt(result)
								+ '번이 등록되었습니다.';
						console.log(modalBody.innerHTML);
						result = '';
					}
					$(modal).modal('show');
				}

				regBtn.onclick = function() {
					self.location = '/board/register';
				};
			});
</script>
</body>
</html>