<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<c:set var="path" value="/resources" />
<c:set var="default_img" value="${path}/assets/img/default_image.jpg" />

<!-- Main -->
<main id="content">

	<sec:authorize access="isAnonymous()">
		<!-- Main Notice -->
		<section id="mainNotice" class="mainNotice">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 container">
						<div class="notice_box">
							<div class="title pt-5 pb-3">팔로우 목록 관리하기</div>
							<div class="cont pt-2 pb-2 ml-5 mr-5">지금 바로 트위치 계정을 사이트와
								연동하여 여러분의 스트리머 목록을 관리하고, 서비스를 이용하세요!</div>
							<div class="row">
								<div class="btn-group col-6 container pt-4 pb-5">
									<button type="button" class="btn btn-outline-primary"
										onclick="location.href='/auth/register/gettoken'">회원가입</button>
									<button type="button" class="btn btn-outline-secondary"
										onclick="location.href='/auth/login'">로그인</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</sec:authorize>

	<sec:authorize access="isAuthenticated()">
		<!-- Sort Button List -->
		<section id="about" class="about">
			<div class="container">

				<div class="row">
					<div class="col-4 btn-danger p-3 text-sm-center listBtn"
						title="관리목록 다시보기">관리목록 다시보기</div>
					<div class="col-4 btn-dark p-3 text-sm-center listBtn"
						title="팔로우 다시보기">관리목록 라이브</div>
					<div class="col-4 btn-primary p-3 text-sm-center listBtn"
						title="관리목록 인기클립">관리목록 인기클립</div>
				</div>

			</div>
		</section>
		<!-- End About Section -->

		<!-- Video List -->
		<section id="services" class="services">
			<div class="container">
				<div class="recent_video">
					<div class="section-title">
						<h2>관리목록 다시보기</h2>
					</div>
					<div class="col-3 btn-danger p-3 text-sm-center addMore m-auto">더 보기</div>
				</div>
				<div class="recent_live displayNone">
					<div class="section-title">
						<h2>관리목록 라이브</h2>
					</div>
					<div class="col-3 btn-danger p-3 text-sm-center addMore m-auto">더 보기</div>
				</div>
				<div class="recent_clip displayNone">
					<div class="section-title">
						<h2>관리목록 인기클립</h2>
					</div>
					<div class="col-3 btn-danger p-3 text-sm-center addMore m-auto">더 보기</div>
				</div>
			</div>
		</section>
	</sec:authorize>
</main>
<!-- End #main -->
<script>

	document.addEventListener("DOMContentLoaded", function(){

		// 관리목록 다시보기 데이터 요청
		async function request_getMyRecentVideoNext(body) {
			// 메인 헤드 슬라이더의 데이터 값 가져오기
			ajaxAwait('/home/request/getMyRecentVideo', 'POST', body, (res) => {
				// console.log('라이브 비디오 가져오기 선언')
				console.log('관리목록 다시보기 데이터 요청')
				console.log(JSON.parse(res))
			})


/*			let response = fetch('/home/request/getMyRecentVideo/next', {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json;charset=utf-8'
				},
				body : body
			}).then(function(res){
				res.json()
						.then(result => { // 결과값을 json 객체로 받아옴
							// console.log(result)
							if(result !== 'error') {
								for(let i=0;i<result.length;i++) recent_video_data.push(result[i])
								recent_video_data.sort((a,b) => {return Date.parse(b.created_at) < Date.parse(a.created_at) ? -1 : 1})
							}
						})
						.catch(resB => {
							console.log('catch :: ', resB);
						})
			}).catch(function(res){
				console.log('catch res :: ' , res)
			})*/
		} // 관리목록 다시보기 더보기 데이터 요청
		request_getMyRecentVideoNext('none');



		// 관리목록 라이브 데이터 요청

		// 관리목록 인기클립 데이터 요청

	});
	//
/*	async function manageVideoToggle(data) {
		let response = await fetch('/manage/video/toggle', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json;charset=utf-8'
			},
			body : data
		}).then(res => {
			res.text().then(text => {
				console.log(text)
			})
		})
		.catch(res => {
			console.log('catch res :: ' , res)
		})
	}   // 다시보기를 관리목록에 추가/삭제

	async function manageFollowToggle(data) {
		let response = await fetch('/manage/follow/toggle', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json;charset=utf-8'
			},
			body : data
		}).then(res => {
			res.text().then(text => {
				console.log(text)
			})
		})
				.catch(res => {
					console.log('catch res :: ' , res)
				})
	}   // 스트리머를 관리목록에 추가/삭제*/

</script>