/**
 * javaDoc
 *
 * author : 김재현
 * 22.12.14 12:00
 */
 
 var replyFunc = (function(){
 	//댓글 등록 함수
 	function register(reply, cb){
 		$.ajax({
 			type: 'post',
 			url : '/bbs06/replies/new',
 			// 서버에 전송하는 데이터 형식
 			data : JSON.stringify(reply), // JSON객체 --> 문자열(텍스트)
 			contentType: "application/json; charset=utf8",
 			success:function(result){
 				if(cb){
 					cb(result);
 				}
 			},
 			error: function(){alert("요청실패!!");}
 		});
 	}
 	
 	// 댓글 삭제
 	function remove(rno, cb){
 		$.ajax({
 			// 전송방식 : delete
 			type:'delete',
 			url:'/bbs06/replies/'+rno,
 			success:function(delResult){
 				if(cb) cb(delResult);
 			},
 			error:function() {alert("요청실패!!")}
 		});
 	}
 	
 	// 특정 게시글에 대한 댓글 조회
 	// $.get() get방식으로 요청
 	// $.post() post방식으로 요청
 	function get(rno, cb){
 		// .json을 붙여서 json형태로 수신
 		$.get("/bbs06/replies/"+rno+".json", function(result){
 			if(cb) cb(result);
 		}).fail(function(){
 			alert("요청실패!!");
 		});
 	}
 	
 	// 특정 게시글의 댓글 리스트
// 	function getList(param, cb){
// 		var bid = param.bid;
// 		
// 		// $.ajax()이용할 경우에는 dataType을 'json' 설정
// 		$.getJSON("/bbs06/replies/rList/"+bid+".json",
// 			function(result){
// 				if(cb) cb(result);
// 			}).fail(function(){ alert("요청실패!!"); });
// 	}
 	
 	function getList(param, cb){
 		var bid = param.bid;
 		var viewPage = param.viewPage || 1;
 		
 		// $.ajax()이용할 경우에는 dataType을 'json' 설정
 		$.getJSON("/bbs06/replies/rList/"+bid+"/"+viewPage+".json",
 			// result는 컨트롤러에서 보낸 repDto를 JSON형태로 전송된 데이터
 			function(result){
 				if(cb) cb(result);
 			}).fail(function(){ alert("요청실패!!"); });
 	}
 	
 	
 	// 댓글 수정
 	function update(reply, cb){
 		$.ajax({
 			type:'put',
 			url:'/bbs06/replies/'+reply.rno,
 			data: JSON.stringify(reply),
 			contentType: "application/json; charset=utf-8",
 			success: function(result){
 				if(cb) cb(result);
 			},
 			error:function() {alert("요청실패!!");}
 		});
 	}
 	
 	// 댓글 시간/날짜 표시하기
	 function showDateTime(timeValue){
	 	// 현재 시간 구하기
	 	var now = new Date();
	 	
	 	// 현재시간과 댓글 등록시간의 갭을 구하기
	 	var gap = now.getTime() - timeValue; // timeValue:댓글 등록시간
	 	
	 	var rDate = new Date(timeValue); // 댓글 등록시간을 Date객체로 생성
	
	 	
	 	// 갭이 24시간이상이면 날짜를 출력, 24시간 미만이면 시간을 출력
	 	if(gap < (1000 * 60 * 60 * 24)){
	 		var hh = rDate.getHours();// 시간
	 		var mi = rDate.getMinutes(); // 분
	 		var ss = rDate.getSeconds(); // 초
	 		
	 		// 시,분,초가 2자리 이상이면 그대로 출력하고, 1자리이면 앞에 0을 붙여서 출력
	 		// 시분초를 합쳐서 문자열로 리턴
	 		// join()은 배열안에 각 요소들을 합쳐서 문자열로 리턴
	 		return [(hh > 9 ? '' : '0')+hh, ':', (mi > 9 ? '' : '0')+mi,
	 				':', (ss > 9 ? '' : '0')+ss].join('');
	 		
	 	}else{ // gap 24 이상이면 날짜로 출력
	 		var yy = rDate.getFullYear();
	 		var mm = rDate.getMonth() + 1; // 0 --> 1월
	 		var dd = rDate.getDate();
	 		
	 		return [yy, '/', (mm > 9 ? '' : '0')+mm,
	 				'/', (dd > 9 ? '' : '0')+dd].join('');
	 	}
	 }
 	
 	return{
 		register : register,
 		remove : remove,
 		get : get,
 		getList : getList,
 		update : update,
 		showDateTime : showDateTime 
 	};
 	 	
 })();