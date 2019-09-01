<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>dd</title>
<%-- <jsp:include page="../inc/head.jsp">
		<jsp:param value="Settings" name="title"/>
	</jsp:include>  --%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
</head>
<body>
	<jsp:include page="../inc/header.jsp" />
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<div class="row">
					<div class="col-xs-10">
						<div class="media">
							<div class="media-left media-middle">
								<a href="javascript:" id="profileLink"> <img class="profile"
									src="${pageContext.request.contextPath}${dto.profile}"
									alt="" width="80" height="80" />
								</a>
							</div>
							<div class="media-body">
								<h1 class="media-heading">
									<strong class="user-menu__user-name"><c:out
											value="${name }" default="test" />dasfsd</strong>
								</h1>
								<h3>
									<span class="user-menu__user-id">@${id }</span>
								</h3>
							</div>
						</div>
					</div>

					<div class="col-xs-2">


						<a class="btn btn-default" href="#" role="button">Change
							Password Link</a>

					</div>

				</div>


			</div>


			<div class="panel-body">

				<form class="form-horizontal">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">Nickname</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="Nickname"
								placeholder="Nickname">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="inputEmail3"
								placeholder="Email">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">Day
							of birth</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="DOB"
								placeholder="Day of birth">
						</div>


					</div>
					<div class="row">
						<div class="col-xs-4">

							<form class="form-group" action="#">
								<div class="btn-group dm_range" data-toggle="radio">
									<h3>
										<span class="label label-default">DM RANGE</span>
									</h3>
									<label class="btn btn-primary active"> <input
										type="radio" name="options" id="range_option1" checked>
										Public
									</label> <label class="btn btn-primary"> <input type="radio"
										name="options" id="range_option2"> Private
									</label>
								</div>
							</form>


						</div>
						<div class="col-xs-4">
							<form class="form-group" action="#">
								<div class="btn-group account" data-toggle="radio">
									<h3>
										<span class="label label-default">ACCOUNT</span>
									</h3>
									<label class="btn btn-primary active"> <input
										type="radio" name="options" id="account_option1" checked>
										Public
									</label> <label class="btn btn-primary"> <input type="radio"
										name="options" id="account_option2"> Private
									</label>
								</div>
							</form>
						</div>
						<div class="col-xs-4">

							<form class="form-group" action="#">
								<div class="btn-group theme" data-toggle=""radio"">
									<h3>
										<span class="label label-default">Theme</span>
									</h3>
									<label class="btn btn-primary active"> <input
										type="radio" name="options" id="theme_option1" checked>
										dark theme
									</label> <label class="btn btn-primary"> <input type="radio"
										name="options" id="theme_option2"> rose
									</label> <label class="btn btn-primary"> <input type="radio"
										name="options" id="theme_option3"> sea foam
									</label>
								</div>
							</form>
						</div>
					</div>




					<div class="panel-footer">

						<button type="submit" class="btn btn-primary">Confirm</button>
						<a class="btn btn-danger" href="#" role="button">회원 탈퇴</a>
					</div>

				</form>
			</div>
		</div>
	</div>
<form id="profileForm" action="profile_upload.do" 
	method="post" enctype="multipart/form-data">
	<input type="file" name="profileImage" id="profileImage" 
	accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
</form>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.min.js"></script>
<script>
	//1. 프로파일 링크를 클릭했을때 사진 선택창을 띄운다.
	$("#profileLink").click(function(){
		$("#profileImage").click();
	});

	//2. 이미지를 선택했을때 폼을 강제 제출한다.
	$("#profileImage").on("change", function(){
		$("#profileForm").submit();
	});

	//3. 폼이 제출될때 ajax(요청)로 제출되게 하기 
	// jquery.form.min.js 의 기능 .ajaxForm() ;
	// ajax의 응답은 responseData 로 들어온다.  why? 요청한 곳으로 응답하기 때문이다. 
	$("#profileForm").ajaxForm(function(responseData){
		// responseData => {path:"/upload/xxx.jpg"}
		console.log(responseData);
		//업로드된 이미지가 보이도록 
		var src="${pageContext.request.contextPath}"+
		responseData.path;
		$(".profile").attr("src", src);
	});
</script>

	<jsp:include page="../inc/footer.jsp" />
</body>
</html>