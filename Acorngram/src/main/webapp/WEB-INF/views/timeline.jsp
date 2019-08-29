<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="inc/head.jsp">
		<jsp:param value="타임라인" name="title"/>
		<jsp:param value="timeline" name="css"/>
	</jsp:include>
</head>
<body>
	<jsp:include page="inc/header.jsp" />
						
		<ul>
		<c:if test="${not empty list }">
			<c:forEach var="post" items="list">
				<li>num: ${post.num }</li>
				<li>usercode: ${post.usercode }</li>
				<li>username: ${post.name }</li>				
				<li>@${post.id }</li>
				<li><img src="${post.image }" alt="" width="300"/></li>
				<li>content: ${post.content }</li>
				<li>like: ${post.like_count }</li>		
				<li>regdate: ${post.regdate }</li>
			</c:forEach>
		</c:if>
		</ul>
						
	<div class="container" style="display:flex;flex-wrap:wrap; justify-content:space-between;">
		<!-- template-->
			<article class="post post-${i }">
				<div class="post__header">
					<div class="post__header-left">
						<img src="" alt="" class="post__icon"/>
						<hgroup>
							<h5 class="post__header-name"> ${post.name } </h5>
							<h6 class="post__header-id"> @${post.id } </h6>
						</hgroup>
					</div>
					<div class="post__header-right">
					<c:choose>
						<c:when test="${post.usercode eq usercode }">
							<a href="javascript:deletePost(${i})" role="button" class="post__btn-delete"> <i class="glyphicon glyphicon-trash"></i></a>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="">
								<%-- 이 유저와 팔로우 상태라면 --%>
								<a href="javascript:unfollowToggle(${post.usercode })" role="button" class="post__btn-unfollow" ><i class="glyphicon glyphicon-remove-sign"></i> <span>Unfollow</span> </a>
								</c:when>
								<c:otherwise>
								<a href="javascript:followToggle(${post.usercode })" role="button" class="post__btn-follow"><i class="glyphicon glyphicon-plus-sign"></i> <span>Follow</span> </a>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
					</div>
				</div>
				<div class="post__img" style="
					background-image: url('${pageContext.request.contextPath}/upload/${post.image }')">
				</div>
				<div class="post__info">
					<div class="post__like ">
						<c:choose>
							<c:when test="${post.liked}">
							<%-- 이 게시글에 like 했다면 --%>
								<a href="javascript:likeControl(${i})" class="post__btn-like liked"><i class="glyphicon glyphicon-heart "></i></a>
							</c:when>
							<c:otherwise>
								<a href="javascript:likeControl(${i})" class="post__btn-like"><i class="glyphicon glyphicon-heart-empty "></i></a>
							</c:otherwise>
						</c:choose>
						<span class="count-like">${post.like_count }</span>
					</div>
					
					<div class="post__regdate">
						<time datetime="${post.regdate }"></time>
					</div>
				</div>
				<div class="post__body">
					<h3>${post.name } </h3>
					<p>${post.content }</p>
				</div>
			</article>
		<!--  /template-->
	</div>
	<jsp:include page="inc/footer.jsp" />
</body>
</html>