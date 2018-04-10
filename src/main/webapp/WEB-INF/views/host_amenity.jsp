<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<!-- 안드로이드 주소창 -->
<meta name="mobile-web-app-capable" content="yes">
<!-- 아이폰 주소창 -->
<meta name="apple-mobile-web-app-capable" content="yes">

<title>호스트 페이지</title>
	<link rel="stylesheet" href="resources/css/bootstrap.css">
	<link rel="stylesheet" href="resources/css/font-awesome.css">
	<link rel="stylesheet" href="resources/css/w3.css">
	<link rel="stylesheet" href="resources/css/host.css">
	<link rel="stylesheet" href="resources/css/checkbox.css">
	<style>
	</style>
</head>
<body>
	<!-- 메뉴바  -->
	<jsp:include page="topbar.jsp"></jsp:include>

	<div class="container1">
		
		<jsp:include page="hostside.jsp"></jsp:include>
		
		<div class="host-main">
			<div class="host-header">
				<h3 class="host-title">편의시설 <small>게스트들에게 회원님의 숙소에 대해서 알려주세요.</small></h3>
			</div>
			<div class="host-content">
				<div class="row">
					<div class="col-md-12 col-lg-10">
						<div class="panel">
							<div class="panel-head">
								<h3 class="panel-title">회원님이 숙소에서 사용할 수 있는 편의시설들을 체크하세요.</h3>
							</div>
							<div class="panel-body">
								<form:form action="#" method="post" modelAttribute="vo">
									<div class="col-lg-3">
										<h3 class="checkbox-title">기본 시설</h3>
										<c:forEach var="tmp" items="${str}">
											<div class="checkbox checkbox-primary">
												<input type="checkbox" value="${tmp}">
												<label name="str[]">${tmp}</label>
											</div>
										</c:forEach>
									</div>
									<hr class="hidden-lg">
									<div class="col-lg-3">
										<h3 class="checkbox-title">추가시설</h3>
										<c:forEach var="tmp" items="${str1}">
											<div class="checkbox checkbox-primary">
												<input type="checkbox" value="${tmp}">
												<label name="str[]">${tmp}</label>
											</div>
										</c:forEach>
									</div>
									<hr class="hidden-lg">
									<div class="col-lg-3">
										<h3 class="checkbox-title">특별시설</h3>
										<c:forEach var="tmp" items="${str2}">
											<div class="checkbox checkbox-primary">
												<input type="checkbox" value="${tmp}">
												<label name="str[]">${tmp}</label>
											</div>
										</c:forEach>
									</div>
									<hr class="hidden-lg">
									<div class="col-lg-3">
										<h3 class="checkbox-title">숙소안전</h3>
										<c:forEach var="tmp" items="${str3}">
											<div class="checkbox checkbox-primary">
												<input type="checkbox" value="${tmp}">
												<label name="str[]">${tmp}</label>
											</div>
										</c:forEach>
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	

	
	
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="resources/js/topbar_menu.js"></script>
	<script src="resources/js/topbar.js"></script>
	<script type="text/javascript">
	</script>
	<script>
 		/* $('.test_div').click(function(){
			var idx = $(this).index('.test_div');
			var val = $('.test_val').eq(idx).val();
			console.log(val);
			
			window.location.href=val;
		})  */
	</script>
</body>
</html>