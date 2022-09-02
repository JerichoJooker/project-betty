<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/header.jsp"%>

<style>
.card {
	min-height: 20rem;
	max-height: 20rem;
	overflow: hidden;
	box-sizing: border-box;
	margin: 0;
}

table {
	table-layout: fixed;
}

table th {
	text-align: center;
}

table td {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	text-align: center;
}
</style>

${chkList}
${rentalList}
${reserveList}
<section>
	<div class="container-md spad">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="row row-cols-md-2">
					<div class="col mb-4">
						<div class="card">
							<div class="row justify-content-around" style="padding:1rem">
									<div class="text-center">
										<img src="${path}/resources/img/member/thumbnail/${user.img}"
											style="width: 10rem" class="img-thumbnail"
											alt="...">
									</div>
									<div>
										<button class="btn btn-danger" onclick="location.href='${path}/members/num'">회원상세</button>
										<div class="row justify-content-center align-items-center h-100">
											${memberCard.premiumGrade}
										</div>
									</div>
							</div>

							<div class="card-body">
								<table class="table table-sm">
									<tr>
										<th>아이디 : </th>
										<td colspan="2">${user.id}</td>
									</tr>
									<tr>
										<th>닉네임 : </th>
										<td colspan="2">${user.nickname}</td>
									</tr>
									<tr>
										<th>이메일 : </th>
										<td colspan="2">${user.email}</td>
									</tr>
								</table>
							</div>
						</div>
					</div>


					<div class="col mb-4">
						<div class="card">
							<div class="card-body" style="padding-top:0">
								<div id="container"></div>
							</div>
						</div>

					</div>


					<div class="col mb-4">
						<div class="card">
							<div class="card-header row justify-content-between">
								<span>대여 상태</span>
								<button class="btn btn-danger"
									onclick="location.href='${path}/members/num/rentals'">대여상세</button>
							</div>
							<div class="card-body">
								<table class="table table-sm">
									<thead class="thead-dark">
										<tr>
											<th>예약</th>
											<th colspan="2">도서</th>
											<th colspan="2">수령예정</th>
										</tr>
									</thead>
									<tr>
										<td></td>
										<td colspan="2">리제로</td>
										<td colspan="2">2022-08-25</td>
									</tr>
									<thead class="thead-dark">
										<tr>
											<th>대여</th>
											<th colspan="2">도서</th>
											<th colspan="2">반납예정</th>
										</tr>
									</thead>
									<tr>
										<td></td>
										<td colspan="2">진격의 거인dddddddddddd</td>
										<td colspan="2">2022-09-05</td>
									</tr>
									<tr>
										<td></td>
										<td colspan="2">진격의 거인</td>
										<td colspan="2">2022-09-05</td>
									</tr>
									<tr>
										<td></td>
										<td colspan="2">진격의 거인</td>
										<td colspan="2">2022-09-05</td>
									</tr>

								</table>
							</div>
						</div>

					</div>

					<div class="col mb-4">
						<div class="card">
							<h5 class="card-header">고객 센터</h5>
							<div class="card-body row justify-content-center" style="padding:2rem">
								<div>
									<h5 class="card-title">이메일문의</h5>
								</div>
								<div class="w-100"></div>
								<div>
									<button type="button" data-toggle="modal" data-target="#moone"
									class="btn btn-danger">
									문의하기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%@include file="/WEB-INF/views/include/footer.jsp"%>

<!-- 고객문의 모달 -->
<div class="modal fade" id="moone" data-backdrop="static" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered"
		role="document">
		<form>
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">고객 문의</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="false">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- session에서 member id 꺼내서 value 에 저장해두면 됨 -->
					<input type="text" value="" hidden>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<div class="input-group-text">작성자</div>
						</div>
						<input type="text" class="form-control" value="{yourName}"
							readonly="readonly">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<div class="input-group-text">제목</div>
						</div>
						<input type="text" class="form-control">
					</div>
					<br />
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<div class="input-group-text">내용</div>
						</div>
						<textarea class="form-control" rows="" cols=""></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" id="inqSubBtn" class="btn btn-primary">전송</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
				</div>
			</div>
		</form>
	</div>
</div>

<script>
$(function(){
	$("#container").simpleCalendar({
	 
		fixedStartDay: 0, // 일요일부터 시작
	    disableEmptyDetails: true, // 빈 공간에 저번 달, 다음 달 표시 해줄?
	     
	    months: ['1월','2월','3월','4월','5월','6월','7월'
	    	 ,'8월','9월','10월','11월','12월'],
	   	days: ['일','월','화','수','목','금','토'],
	   	
	   	events: [{
	   		startDate : new Date(),
	   		endDate : new Date(),
	   		summary : '출석 체크'
	   	},
	   	
	   	{
	   		startDate: new Date(new Date()
        		.setHours(new Date().getHours() + 24))
     			.toDateString(),
       		endDate: new Date(new Date()
	         	.setHours(new Date().getHours() + 25))
	       		.toISOString(),
       		summary: '내일은 금요일'
	   	},
	   	
	   	{
	   		startDate: new Date(new Date()
	      		.setHours(new Date().getHours() - new Date().getHours() - 12, 0))
	    		.toISOString(),
      		endDate: new Date(new Date()
	      		.setHours(new Date().getHours() - new Date().getHours() - 11))
	    		.getTime(),
     		summary: '어제는 수요일'
	   	}] 
		
 	});
});
</script>


<!-- <script>
caleandar(element, events, settings);

var element = caleandar($('#caleandar'));

var events = [
    {'Date': new Date(2016, 6, 7), 'Title': 'Doctor appointment at 3:25pm.'},
    {'Date': new Date(2016, 6, 18), 'Title': 'New Garfield movie comes out!', 'Link': 'https://garfield.com'},
    {'Date': new Date(2016, 6, 27), 'Title': '25 year anniversary', 'Link': 'https://www.google.com.au/#q=anniversary+gifts'},
];

var settings = {
	    Color: 'black',
	    LinkColor: 'black',
	    NavShow: true,
	    NavVertical: false,
	    NavLocation: 'top',
	    DateTimeShow: true,
	    DateTimeFormat: 'mmm, yyyy',
	    DatetimeLocation: 'ko',
	    EventClick: 'none',
	    EventTargetWholeDay: false,
	    DisabledDays: [],
	    ModelChange: model
	};
	
var element = document.getElementById('caleandar');
caleandar(element, events, settings);
</script> -->
