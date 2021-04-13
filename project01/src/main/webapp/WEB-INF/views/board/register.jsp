<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<div class="row align-items-center text-center">
	<div class="col-1 col-md-3"></div>
	<div class="col-10 col-md-6 py-5 text-start ">
		<h1 class="my-5 table-title">Board Register</h1>
		<form class="row g-3" role="form" action="/board/register"
			method="post">
			<div class="col-12">
				<label for="board_title" class="form-label">Title</label> <input
					class="form-control" id="board_title" name="board_title">
			</div>
			<div class="col-12">
				<label for="board_content" class="form-label">Content</label>
				<textarea class="form-control" rows="4" id="board_content" name="board_content"></textarea>
			</div>
			<div class="col-12">
				<label for="board_writer" class="form-label">Writer</label> <input
					class="form-control" id="board_writer" name="board_writer">
			</div>
			<div class="col-12">
				<button type="submit" class="btn btn-primary">Submit</button>
				<button type="reset" class="btn btn-secondary">Reset</button>
			</div>
		</form>
	</div>
	<!-- end of form body-->
	<div class="col-1 col-md-3"></div>
</div>
</section>
</main>
</body>
</html>