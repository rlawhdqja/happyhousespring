<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Framework Project</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="shortcut icon" href="img/favicon.ico">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/apt.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body> --%>
	<div class="container">
		<header id="index_header" class="jumbotron text-center mb-1">
			<h4>행복한 우리 집</h4> 
		</header>
		<!-- nav start -->
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark rounded">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" href="#">Home</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
						동네 정보
					</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">APT 매매</a>
						<a class="dropdown-item" href="#">APT 전월세</a>
						<a class="dropdown-item" href="#">주택 매매</a>
						<a class="dropdown-item" href="#">주택 전월세</a>
						<a class="dropdown-item" href="#">상권 정보</a>
						<a class="dropdown-item" href="#">환경 정보</a>
					</div>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Notice</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">News</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Contact</a>
				</li>
			</ul>
		</nav>

		<section id="index_section">
			<div class="card col-sm-12 mt-1" style="min-height: 850px;">
				<div class="card-body">
					시도 : 
					<select id="sido">
						<option value="0">선택</option>
					</select>
					구군 : 
					<select id="gugun">
						<option value="0">선택</option>
					</select>
					읍면동 : 
					<select id="dong">
						<option value="0">선택</option>
					</select>
					<button type="button" id="aptSearchBtn">검색</button>
					<table class="table mt-2">
						<colgroup>
							<col width="100">
							<col width="150">
							<col width="*">
							<col width="120">
							<col width="120">
						</colgroup>	
						<thead>
							<tr>
								<th>번호</th>
								<th>아파트이름</th>
								<th class="text-center">주소</th>
								<th>건축연도</th>
								<th>최근거래금액</th>
							</tr>
						</thead>
						<tbody id="searchResult"></tbody>
					</table>
				<div id="map" style="width:100%;height:500px;"></div>
				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=51561b6386d69db8c73b6de420ab8e2a&libraries=services"></script>
				<script type="text/javascript" src="js/map.js"></script>
				<script type="text/javascript">
				let colorArr = ['table-primary','table-success','table-danger'];
<<<<<<< HEAD
				$(document).ready(function(){					
					$.get(root + "/aptlist/sido"
=======
				$(document).ready(function(){
					$.get("${root}/map/sido"
>>>>>>> branch 'master' of https://lab.ssafy.com/rlawhd011/happyhousespring.git
						,function(data, status){
							alert( "success" );
							$.each(data, function(index, vo) {
								$("#sido").append("<option value='"+vo.sidoCode+"'>"+vo.sidoName+"</option>");
							});
						}
						, "json"
					);
				});
				$(document).on("change", "#sido", function() {
					$.get("${root}/map/gugun"
							,{sido: $("#sido").val()}
							,function(data, status){
								$("#gugun").empty();
								$("#gugun").append('<option value="0">선택</option>');
								$.each(data, function(index, vo) {
									$("#gugun").append("<option value='"+vo.gugunCode+"'>"+vo.gugunName+"</option>");
								});
							}
							, "json"
					);
				});
				$(document).on("change", "#gugun", function() {
					$.get("${root}/map/dong"
							,{gugun: $("#gugun").val()}
							,function(data, status){
								$("#dong").empty();
								$("#dong").append('<option value="0">선택</option>');
								$.each(data, function(index, vo) {
									$("#dong").append("<option value='"+vo.dongCode+"'>"+vo.dongName+"</option>");
								});
							}
							, "json"
					);
				});
				$(document).on("change", "#dong", function() {
					$.get("${root}/map/apt"
							,{dong: $("#dong").val()}
							,function(data, status){
								$("tbody").empty();
								$.each(data, function(index, vo) {
									let str = `
										<tr class="${colorArr[index%3]}">
										<td>${vo.aptCode}</td>
										<td>${vo.aptName}</td>
										<td>${vo.sidoName} ${vo.gugunName} ${vo.dongName} ${vo.jibun}</td>
										<td>${vo.buildYear}</td>
										<td>${vo.recentPrice}</td>
									</tr>
									`;
									$("tbody").append(str);
								});
								displayMarkers(data);
							}
							, "json"
					);
				});
				
				$(document).on("click", "#aptSearchBtn", function() {
					var param = {
							serviceKey:'JFeJjXuOHCHNliQOrWRhcItFOi53gVdy8F/o6YPTSOBzY0niGKmUQqQDjwFltmi1H3i/3/0Kw6mheHw5qL/+fg==',
							pageNo:encodeURIComponent('1'),
							numOfRows:encodeURIComponent('100'),
							LAWD_CD:encodeURIComponent($("#gugun").val()),
							DEAL_YMD:encodeURIComponent('202110')
					};
					$.get('http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev'
							,param
							,function(data, status){
								var items = $(data).find('item');
								var jsonArray = new Array();
								items.each(function() {
									var jsonObj	= new Object();
									jsonObj.aptCode = $(this).find('일련번호').text();
									jsonObj.aptName = $(this).find('아파트').text();
									jsonObj.dongCode = $(this).find('법정동읍면동코드').text();
									//jsonObj.dongName = $(this).find('').text();
									//jsonObj.sidoName = $(this).find('').text();
									//jsonObj.gugunName = $(this).find('').text();
									jsonObj.buildYear = $(this).find('건축년도').text();
									jsonObj.jibun = $(this).find('지번').text();
									jsonObj.recentPirce = $(this).find('거래금액').text();
										
									jsonObj = JSON.stringify(jsonObj);
									//String 형태로 파싱한 객체를 다시 json으로 변환
									jsonArray.push(JSON.parse(jsonObj));
								});
								console.log(jsonArray);
								//displayMarkers(jsonArray);
							}
							, "xml"
					);
					/* var xhr = new XMLHttpRequest();
					var url = 'http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev';
					var queryParams = '?' + encodeURIComponent('serviceKey') + '='+encodeURIComponent(' API KEY ');
					queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); 
					queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); 
					queryParams += '&' + encodeURIComponent('LAWD_CD') + '=' + encodeURIComponent($("#gugun").val()); 
					queryParams += '&' + encodeURIComponent('DEAL_YMD') + '=' + encodeURIComponent('202110'); 
					xhr.open('GET', url + queryParams);
					xhr.onreadystatechange = function () {
					    if (this.readyState == 4) {
					    	console.log(this.responseXML);
					        alert('Status: '+this.status+'nHeaders: '+JSON.stringify(this.getAllResponseHeaders())+'nBody: '+this.responseText);
					    }
					};

					xhr.send(''); */
				});
				</script>
				</div>
			</div>
		</section>
	</div>
</body>
</html>