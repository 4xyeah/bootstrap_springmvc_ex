<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

<main>
<section class="container-fluid px-0">
	<div class="row align-items-center text-center">
		<div class="col-1 col-md-2"></div>
		<div class="col-10 col-md-8 py-5">
			<h1 class="mt-5 text-start table-title">Contact</h1>
			<div class="btnWrap text-center text-md-end">
				<button id="regBtn" type="button" class="btn">write</button>
			</div>
			<table class="table">
				<thead>
					<tr class="row">
						<th class="col-2">No.</th>
						<th class="col-6">Title</th>
						<th class="col-2">Writer</th>
						<th class="col-2">Date</th>
					</tr>
				</thead>
				<!-- jstl을 이용해서 DB에 있는 전체 글 목록 출력  -->
				<!-- 검색 결과를 result로 받아서 결과가 있으면 출력, 없으면 없다는 문구 출력 -->
				<c:choose>
					<c:when test="${fail eq 'fail' }">
						<tbody>
							<tr class="row">
								<td class="col-3"></td>
								<td class="col-6 text-center">검색 결과가 존재하지 않습니다.</td>
								<td class="col-3"></td>
							</tr>
						</tbody>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="board">
							<tbody>
								<tr class="row">
									<td class="col-2"><c:out value="${board.board_no }" /></td>
									<td class="col-6"><a class="move"
										href='<c:out value="${board.board_no }" />'> <c:out
												value="${board.board_title }" />
									</a></td>
									<td class="col-2"><c:out value="${board.board_writer }" /></td>
									<!--  pattern에서 월은 'MM'으로 쓰기! 소문자로 쓰면 이상한 두자리 숫자 나옴 -->
									<td class="col-2"><fmt:formatDate pattern="yyyy-MM-dd"
											value="${board.board_date }" /></td>
								</tr>
							</tbody>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>


			<nav aria-label="page Navigation">
				<ul class="pagination justify-content-center">
					<c:if test="${pageMaker.prev}">
						<li class="page-item disabled"><a class="page-link"
							tabindex="-1" aria-disabled="true"
							href="{pageMaker.startPage -1 }">Previous</a>
					</c:if>

					<c:forEach var="num" begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }">
						<li
							class='page-item ${pageMaker.criteria.pageNum == num? "active":"" }'>
							<a class="page-link" href="${num }">${num }</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next }">
						<li class="page-item next"><a class="page-link"
							href="{pageMaker.endPage +1 }">Next</a></li>
					</c:if>
				</ul>
			</nav>
			<!-- end of pageSection -->


			<div class="row py-2">
				<div class="col-lg-12">
					<form id="searchForm" action="/board/list" method="get">
						<select class="mx-1" name="type">
							<!-- 선택된 option 에 selected를 넣기  -->
							<option value=""
								<c:out value="${pageMaker.criteria.type == null? 'selected':''}"/>>---</option>
							<option value="T"
								<c:out value="${pageMaker.criteria.type eq 'T'? 'selected':''}"/>>제목</option>
							<option value="C"
								<c:out value="${pageMaker.criteria.type eq 'C'? 'selected':''}"/>>내용</option>
							<option value="W"
								<c:out value="${pageMaker.criteria.type eq 'W'? 'selected':''}"/>>작성자</option>
							<option value="TC"
								<c:out value="${pageMaker.criteria.type eq 'TC'? 'selected':''}"/>>제목
								or 내용</option>
							<option value="TW"
								<c:out value="${pageMaker.criteria.type eq 'TW'? 'selected':''}"/>>제목
								or 작성자</option>
							<option value="TWC"
								<c:out value="${pageMaker.criteria.type eq 'TWC'? 'selected':''}"/>>제목
								or 내용 or 작성자</option>
						</select> <input type="text" name="keyword"
							value="<c:out value='${pageMaker.criteria.keyword }'/>">
						<input type="hidden" name="pageNum"
							value="${pageMaker.criteria.pageNum }"> <input
							type="hidden" name="amount" value="${pageMaker.criteria.amount }">
						<input type="hidden" name="type"
							value="<c:out value='${pageMaker.criteria.type}'/>">
						<button class="btn btn-default mx-1">Search</button>
					</form>
				</div>
			</div>
			<!-- end of searchForm -->
		</div>
		<div class="col-1 col-md-2"></div>
	</div>
</section>
</main>
<!-- Modal 영역 -->
<div class="modal fade" tabindex="-1" id="myModal" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel">게시글 처리 완료</h5>
				<button type="button"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">처리가 완료됐습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default">Close</button>
				<!--  <button type="button" class="btn btn-primary">Save changes</button>-->
			</div>
		</div>
		<!-- Modal Content -->
	</div>
	<!-- Modal Dialog -->
</div>
<!-- Modal 끝 -->

<form id="actionForm" action="/board/list" method="get">
	<input type="hidden" name="pageNum"
		value="${pageMaker.criteria.pageNum }"> <input type="hidden"
		name="amount" value="${pageMaker.criteria.amount }"> <input
		type="hidden" name="keyword"
		value="<c:out value='${pageMaker.criteria.keyword }'/>"> <input
		type="hidden" name="type"
		value="<c:out value='${pageMaker.criteria.type}'/>">
</form>

<script>
	document.addEventListener('DOMContentLoaded', function() {
				let result = '<c:out value="${result}"/>';
				let regBtn = document.getElementById('regBtn');
				
				let actionForm = document.getElementById('actionForm');
				let pageLink = document.querySelectorAll('.page-link');
				let moveLink = document.querySelectorAll('.move');
				
				let searchForm = document.querySelector("#searchForm");
				let searchFormBtn = searchForm.querySelector("button");
				let select = searchForm.querySelector('select');
				
				// 검색
				searchFormBtn.addEventListener('click', function(e) {
					history.replaceState({}, null, null);
					let selectedOption = select.options.selectedIndex;
					
					if(!selectedOption) {
						alert("검색 기준을 선택하세요.");
						return false;
					}else if(!searchForm.querySelector('input[name="keyword"]').value) {
						alert("검색할 내용을 입력해주세요.");
						return false;
					}
					
					searchForm.querySelector('input[name="pageNum"]').value = 1;
					e.preventDefault();
					
					searchForm.submit();
					
				});

				function checkModal(result) {
					let modalBody = document.querySelector('.modal-body');
					let modal = document.querySelector('#myModal');
					if (result === '' || history.state)
						return;

					if (parseInt(result) > 0) {
						modalBody.innerHTML = '게시글 ' + parseInt(result)
								+ '번이 등록되었습니다.';
						console.log(modalBody.innerHTML);
						result = '';
					}
					let myModal = new bootstrap.Modal(document.getElementById('myModal'))
					myModal.show();
				}
				
				checkModal(result);

				// window.history 객체를 조작해서 
				// register-> 뒤로가기 -> list 이동시 
				// 모달창 안뜨게 하기
				history.replaceState({}, null, null);

				regBtn.addEventListener('click', function() {
					self.location = '/board/register';
				});
				
				pageLink.forEach(item => {
					
					item.addEventListener('click', function(e) {
						history.replaceState({}, null, null);
						e.preventDefault();
						//console.log(this.getAttribute('href'));
						actionForm.querySelector("input[name='pageNum']").value = this.getAttribute('href');
						actionForm.submit();
					});
				});
				
				// 제목 클릭 후 목록으로 돌아오면
				// 원래 보고있던 목록 페이지로 돌아오게 만들기
				moveLink.forEach(item => {
					
				item.addEventListener('click', function(e) {
					history.replaceState({}, null, null);
					e.preventDefault();
					//console.log(this.getAttribute('href'));
					console.log(actionForm);
					
					let input1 = document.createElement('input');
					input1.setAttribute('type', 'hidden');
					input1.setAttribute('name', 'board_no');
					input1.setAttribute('value', this.getAttribute('href'));
					
					console.log(input1);
					actionForm.append(input1);
 					actionForm.setAttribute('action', '/board/get');
					actionForm.submit();
				});
				});
				
				
				
			});
</script>
</body>
</html>
