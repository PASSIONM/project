<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
	<jsp:include page="admin_menu.jsp"></jsp:include>
	<link href="/project/resources/css/admin_reser.css" rel="stylesheet" id="bootstrap-css">

		<div class="col-md-9">
		<div style="text-align:right;width:100%;display:inline-block;" >
			<div style="display: inline-block;width:16%;text-align:center;">
				<c:set var="total" value="0"></c:set>
				<c:forEach var="i" items="${list2 }">
					<c:set var="total" value="${total + i.state_count }" />
				</c:forEach>
				${total }
			<p>전체</p>
			</div>
			<c:forEach var="i" items="${list2 }">
				<div style="display: inline-block;width:16%;text-align:center;">
			${i.state_count }
			<p>${i.reser_title }</p>
			</div>
			</c:forEach>
		</div>
		<c:forEach var="i" items="${list }">
			<div class="reser_item">
				<div class="reser_profile">
				<input type="hidden" class="reser_num" value="${i.reservation_code}" />
				<input type="hidden" class="reser_guest_id" value="${i.guest_id}" />
				<input type="hidden" class="reser_host_id" value="${i.host_id}" />
				<input type="hidden" class="reser_room_code" value="${i.room_code}" />
				<input type="hidden" class="reser_code" value="${i.reser_code}" />
					<img src="/project/show_img.do?code=${i.host_img_code }" class="reser_img"/>
					${i.host_name }
				</div>
				<div class="reser_profile">
					<img src="/project/show_img.do?code=${i.guest_img_code }" class="reser_img"/>
					${i.guest_name }
				</div>
				<div style=""class="reser_content">
					<p>${i.room_name }<br />
					${i.reservation_start } ~ ${i.reservation_end } ( ${i.reser_day }박 ${i.reser_day+1 }일)</p>
				</div>
				<div class="reser_payment">
					<div style="width:50%;text-align: right">
						<label class="reser_title">${i.reser_title }</label> <br />
						 	<fmt:formatNumber value="${i.room_day * i.reser_day }" pattern="#,###" /> 원<br />
						 	<fmt:formatNumber value="${i.room_day * i.reser_day *0.1}" pattern="#,###" /> 원<br />
				 	</div>
				 	<div style="height:">
				 		
				 	</div>
				</div>
				<div class="show_detail">
					<span class="glyphicon glyphicon-chevron-down" ></span>
				</div>
				<div class="detail">
					<ul >
						<li class="active reser_btn" >예약 정보</li>
						<li class="host_btn">호스트 정보</li>
						<li class="guest_btn">게스트 정보</li>
					</ul>
					<div class="detail_content" style="width:100%;height:170px;">
						<div class="img-div">
							<img src="admin_room_img.do?id=${i.room_code }" style=""/>
						</div>
						<div style="float:left" class="detail_infomation" style="">
							<table class="table table-reser" style="height:170px; margin:0px;">
								<tr>
									<th>숙소명</th>
									<td colspan = "2" class="room_name">${i.room_name }</td>
									<th style="text-align: center"><input type="button" value="숙소 정보 보기" class="form-control" /></th> 
								</tr>
								<tr> 
									<th>입실일</th>
									<td><label class="reser_start">${i.reservation_start }</label> ( <label class="reser_start_day" style="<c:if test="${i.dayofweek_start eq '토' }">color:blue;</c:if><c:if test="${i.dayofweek_start eq '일' }">color:red;</c:if>">${i.dayofweek_start } </label> )</td>
									<th>총 결제 금액</th>
									<td>
									<label class="reser_total">
									<fmt:formatNumber value="${i.room_day * i.reser_day }" pattern="#,###" /> 원
									</label> <br />
									( 1박당 가격 : <label class="room_day"><fmt:formatNumber value="${i.room_day }" pattern="#,###" /> 원</label> / 숙박일수 : <label class="reser_day">${i.reser_day }</label>박 )
									</td>
								</tr>
								<tr>
									<th>퇴실일</th>
									<td><label class="reser_end">${i.reservation_end }</label> ( <label class="reser_end_day" style="<c:if test="${i.dayofweek_end eq '토' }">color:blue;</c:if><c:if test="${i.dayofweek_end eq '일' }">color:red;</c:if>">${i.dayofweek_end }</label> )</td>
									<th>예약금</th>
									<td>
									<label class="reser_price"><fmt:formatNumber value="${i.room_day * i.reser_day *0.1 }" pattern="#,###" /> 원</label><br />
									( 총 결제 금액의 10% )
									</td>
								</tr>
							</table>
							
							<table class="table table_member" style="height:170px;">
								<tr>
									<th >성명</th>
									<td class="name">홍길동</td>
									<th>아이디</th>
									<td class="custom_id">부산</td>									</td> 
								</tr>
								<tr> 
									<th >전화번호</th>
									<td class="phone">01075443593
									
									<th class="bank">이용횟수</th>
									<td class="using">0</td>
								</tr>
								<tr>
									<th colspan="2" style="width:50%"><a href="admin_member_detail.do?id=${i.host_id }" class="form-control member_info">회원 정보 보기</a></th>									
									<th colspan="2" style="width:50%"><input type="button" value="등록된 다른 숙소 보기" class="form-control"/></th>
								</tr>
							</table>
						
						</div>						
						<div style="float:right">
							<input type="button" value="예약신청" class="request btn btn-default btn_state" <c:if test="${i.reser_code } == 0">disabled=disabled</c:if>/><br />
							<input type="button" value="결제진행중"  class="payment btn btn-warning btn_state"<c:if test="${i.reser_code } == 1">disabled=disabled</c:if>/><br />
							<input type="button" value="예약완료"  class="request_finish btn btn-danger btn_state"<c:if test="${i.reser_code } == 2">disabled=disabled</c:if>/><br />
							<input type="button" value="여행중"  class="travel btn btn-info btn_state" <c:if test="${i.reser_code } == 3">disabled=disabled</c:if>/><br />
							<input type="button" value="여행완료"  class="finish btn btn-success btn_state" <c:if test="${i.reser_code } == 4">disabled=disabled</c:if>/>
						</div>
					</div>
				</div>
			</div>	
					<div style="clear: both;"></div>
		</c:forEach>
		</div>

<%-- 
<div style="position:relative">
	<c:forEach var="i" items="${list}" varStatus="j">
	    <div style="border:1px solid" class="help_div">설명 ${j.index }</div>
    </c:forEach>
</div>
 --%>

	</div>
	</div>
</section>
 

	
	<script type="text/javascript" src="/project/resources/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="/project/resources/js/bootstrap.js"></script>
	<script type="text/javascript" src="/project/resources/js/jquery.twbsPagination.js"></script>
	<script>
	function update_state(state,txt,code,idx,ix){
			$.get('Json_update_state.do?state='+state+'&code='+code,function(data){
				if(data == 1){
					var d = parseInt(ix/5);
					console.log(d);
					for(var i = d*5;i<(d+1)*5;i++){
						console.log(i);
						$('.btn_state').eq(i).attr('disabled',false);
					}
						
					if(state == 0){
						$('.request').eq(idx).attr('disabled',true);
						$('.reser_title').eq(idx).text('예약신청');
					}
					else if(state == 1){
						$('.payment').eq(idx).attr('disabled',true);
						$('.reser_title').eq(idx).text('결제진행중');
					}						
					else if(state == 2){
						$('.request_finish').eq(idx).attr('disabled',true);
						$('.reser_title').eq(idx).text('예약완료');
					}						
					else if(state == 3){
						$('.travel').eq(idx).attr('disabled',true);
						$('.reser_title').eq(idx).text('여행중');
					}						
					else if(state == 4){
						$('.finish').eq(idx).attr('disabled',true);
						$('.reser_title').eq(idx).text('여행완료');
					}						
				}else{
					
				}
			})
		
	}
	var numberformat = function(num){
		var str;
		
	num = num+"";
		var len = num.length;
		var idx = num.length%3;
		str = num.substring(0,idx);
		while(idx<len){
			if(str != ""){
				str+=",";
			}
			str+= num.substring(idx,idx+3);
			idx+=3;
		}
		return str;
	}
	
	function reser_detail(code,idx){
		$.get('Json_select_reser.do?code='+code,function(data){					
			$('.room_name').eq(idx).text(data.room_name);
			$('.reser_start').eq(idx).text(data.reservation_start);
			$('.reser_end').eq(idx).text(data.reservation_end);
			$('.reser_start_day').eq(idx).text(data.dayofweek_start);
			$('.reser_end_day').eq(idx).text(data.dayofweek_end);
			$('.reser_start_day').eq(idx).text(data.dayofweek_start);
			$('.reser_total').eq(idx).text(numberformat(data.room_day * data.reser_day) + ' 원');
			$('.room_day').eq(idx).text(numberformat(data.room_day) + ' 원');
			$('.reser_day').eq(idx).text(data.reser_day);
			$('.reser_price').eq(idx).text(numberformat(data.room_day * data.reser_day*0.1) + ' 원');
		})
	}
		$(function(){
			var code = 0;
			$('.show_detail').click(function(){				
				var idx = $(this).index('.show_detail');
				code =$('.reser_num').eq(idx).val();
				var show_class = $('.show_detail span').eq(idx).attr('class');				
				if(show_class == 'glyphicon glyphicon-chevron-down'){
					$('.show_detail span').eq(idx).removeClass('glyphicon-chevron-down');
					$('.show_detail span').eq(idx).addClass('glyphicon-chevron-up');
					$('.reser_item').eq(idx).css('height','280px');
					$('.show_detail').eq(idx).css('height','65px');
					$('.detail').eq(idx).css('display','block');
					var reser_code = $('.reser_code').eq(idx).val();
					var img_w = $('.img-div img').eq(idx).css('width');
					var btn_w = $('.btn_state').eq(idx).css('width');
					var div_w = $('.detail').eq(idx).css('width');
					var width = parseInt(div_w)-(parseInt(img_w)+parseInt(btn_w));
					$('.detail_infomation').eq(idx).css('width',width-1+'px');
					reser_detail(code,idx);
					if(reser_code == 0){						
						$('.request').eq(idx).attr('disabled',true);
					}
					else if(reser_code == 1){						
						$('.payment').eq(idx).attr('disabled',true);
					}
					else if(reser_code == 2){						
						$('.request_finish').eq(idx).attr('disabled',true);
					}
					else if(reser_code == 3){						
						$('.travel').eq(idx).attr('disabled',true);
					}
					else if(reser_code == 4){						
						$('.finish').eq(idx).attr('disabled',true);
					}
						
				}else{
					$('.show_detail span').eq(idx).addClass('glyphicon-chevron-down');
					$('.show_detail span').eq(idx).removeClass('glyphicon-chevron-up');
					$('.reser_item').eq(idx).css('height','65px');
					$('.show_detail').eq(idx).css('height','100%');
					$('.detail').eq(idx).css('display','none');
				}
				
			})
			$(window).resize(function(){
				var img_w = $('.img-div img').css('width');
				var btn_w = $('.btn_state').css('width');
				var div_w = $('.detail').css('width');
				var width = parseInt(div_w)-(parseInt(img_w)+parseInt(btn_w));
				$('.detail_infomation').css('width',width-1+'px');
			})
			//활성화된 메뉴 처리
			$('.reser_menu').addClass("active");
			///
			$('.reser_btn').click(function(){
				var idx = $(this).index('.reser_btn');
				code =$('.reser_num').eq(idx).val();
				var room_code = $('.reser_room_code').eq(idx).val();
				$('.reser_btn').eq(idx).addClass('active');
				$('.host_btn').eq(idx).removeClass('active');
				$('.guest_btn').eq(idx).removeClass('active');
				
				$('.img-div img').eq(idx).attr('src','admin_room_img.do?id='+room_code);
				$('.table_member').eq(idx).css('display','none');
				$('.table-reser').eq(idx).css('display','table');
				
				reser_detail(code,idx);
				
				$('.request').eq(idx).click(function(){
					var ix = $(this).index('.btn_state');
					update_state(0,"예약신청",code,idx,ix);
				})
				$('.payment').eq(idx).click(function(){
					var ix = $(this).index('.btn_state');
					update_state(1,"결제진행중",code,idx,ix);
				})
				$('.request_finish').eq(idx).click(function(){
					var ix = $(this).index('.btn_state');
					
					update_state(2,"예약완료",code,idx,ix);
				})
				$('.travel').eq(idx).click(function(){
					var ix = $(this).index('.btn_state');
					update_state(3,"여행중",code,idx,ix);
				})
				$('.finish').eq(idx).click(function(){
					var ix = $(this).index('.btn_state');
					update_state(4,"여행완료",code,idx,ix);
				})
			})
			
			$('.guest_btn').click(function(){				
				var idx = $(this).index('.guest_btn');
				code =$('.reser_guest_id').eq(idx).val();
				
				$('.reser_btn').eq(idx).removeClass('active');
				$('.host_btn').eq(idx).removeClass('active');
				$('.guest_btn').eq(idx).addClass('active');
				$('.table-reser').eq(idx).css('display','none');
				$('.table_member').eq(idx).css('display','table');
				$('.img-div img').eq(idx).attr('src','admin_show_profile.do?id='+code);
				
				$('.bank').eq(idx).text('이용횟수');
				
				$.get('Json_member_reser.do?id='+code,function(data){
					$('.name').eq(idx).text(data.custom_name);
					$('.custom_id').eq(idx).text(data.custom_id);
					$('.phone').eq(idx).text(data.custom_phone);
					$('.using').eq(idx).text(data.reser_count);
					
				})
			})
			
			$('.host_btn').click(function(){				
				var idx = $(this).index('.host_btn');
				code =$('.reser_host_id').eq(idx).val();
				
				$('.reser_btn').eq(idx).removeClass('active');
				$('.host_btn').eq(idx).addClass('active');
				$('.guest_btn').eq(idx).removeClass('active');
				$('.table-reser').eq(idx).css('display','none');
				$('.table_member').eq(idx).css('display','table');
				$('.img-div img').eq(idx).attr('src','admin_show_profile.do?id='+code);
				
				$('.bank').eq(idx).text('계좌 정보');
				
				$.get('Json_member_reser.do?id='+code,function(data){
					$('.name').eq(idx).text(data.custom_name);
					$('.custom_id').eq(idx).text(data.custom_id);
					$('.phone').eq(idx).text(data.custom_phone);
					$('.using').eq(idx).text(data.bank_name + ' / '+data.custom_cash);
					
				})
			})
		});
							
	
	</script>
</body>
</html>

