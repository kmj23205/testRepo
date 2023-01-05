<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>                                         
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">       
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js'></script>         
</head>
<body>
<div class="container d-flex mt-5 justify-content-center">
	<div class="w-75 shadow p-5 rounded border">
		<h3>글상세보기</h3>
		<div class="form-group">
			<label for="subject">번호</label>
			<input type="text" class="form-control" id="bid" 
				name="bid" disabled value="${board.bid}"/>
		</div>

		<div class="form-group">
			<label for="subject">제목</label>
			<input type="text" class="form-control" id="subject" 
				name="subject" disabled value="${board.subject}"/>
		</div>

		<div class="form-group">
			<label for="contents">내용</label>
			<textarea class="form-control" id="contents" 
				name="contents" rows="4" disabled>${board.contents}</textarea>
		</div>
		<div class="form-group">
			<label for="writer">글쓴이</label>
			<input type="text" class="form-control" id="writer" 
				name="writer" disabled value="${board.writer}"/>
		</div>
		<div class="form-group mt-4">
			<button type="submit" id="btn-modify" class="btn btn-primary me-2">수정하기</button>
			<button type="button" id="btn-list" class="btn btn-primary">리스트</button>
		</div>
		
		<!---------------------- 댓글 UI ------------------------->
		<!-- 댓글 버튼 -->
		<div class="mt-4 d-flex justify-content-between">
			<h6><i class="fa fa-comments-o"></i> 댓글</h6>
			<button id="btn-addReply" class="btn btn-sm btn-outline-secondary"
			data-bs-toggle="modal" data-bs-target="#replyModal">새댓글</button>
		</div>
		
		<!-- 댓글 리스트 영역 -->
		<ul class="m-0 p-0 mt-4 replyArea" style="list-style:none">
			<li class="mb-2 p-0">
				<div class="form-control">
					<div class="d-flex justify-content-between">
						<h6><b>홍길동</b></h6><span>2022-12-14 15:50</span>
					</div>
					<p>댓글 테스트 입니다... ...</p>
				</div>
			</li>
			<li class="">
				<div class="form-control">
					<div class="d-flex justify-content-between">
						<h6><b>홍길동</b></h6><span>2022-12-14 15:50</span>
					</div>
					<p>댓글 테스트 입니다... ...</p>
				</div>
			</li>
		</ul><!-- 댓글 리스트 END-->
		
		<!-- pagination 영역 -->
		<ul class="pagination justify-content-center my-5">
		  <li class="page-item">
		  	<a class="page-link" href="">이전</a>
		  </li>
			<li class="page-item ">
				<a class="page-link" href="">1</a>
			</li>
		  <li class="page-item ">
		  	<a class="page-link" href="">다음</a>
		  </li>
		</ul>
		<!-- pagination 영역 -->
		
	</div>
</div>

<!-- The Modal -->
<div class="modal fade" id="replyModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header border-0">
      	<h5 class="modal-title">댓글 달기</h5>
        <button type="button" class="btn-close" 
        	data-bs-dismiss="modal" onclick="clearValue()"></button>
      </div>

      <!-- Modal body -->
      <form>
	      <div class="modal-body p-4">
	      	<div class="mb-3">
		      	<label for="reply_contents" class="">댓글 내용</label>
		      	<textarea class="form-control" id="reply_contents"></textarea>
	      	</div> 
	      	<div class="mb-3">
		      	<label for="replyer" class="">댓글 작성자</label>
				<input type="text" class="form-control" id="replyer" name="replyer"/>
	      	</div> 
	      	<div class="mb-3">
		      	<label for="reply_date" class="">등록일</label>
				<input type="text" class="form-control" id="reply_date" name="reply_date"/>
	      	</div>
	      </div>
	      
	      
	      <!-- Modal footer -->
	      <div class="modal-footer border-0">
	        <button type="button" id="btn-md-modify" class="btn btn-sm btn-primary">수정</button>
	        <button type="button" id="btn-md-remove" class="btn btn-sm btn-danger">삭제</button>
	        <button type="button" id="btn-md-register" class="btn btn-sm btn-primary">등록</button>
	        <button type="button" id="btn-md-close" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
	  </form> 	

    </div>
  </div>
</div>



<script src="/bbs06/resources/js/reply.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var bidVal = '<c:out value="${board.bid}"/>';
		
		// 등록 테스트
/*  		replyFunc.register(
			{bid:bidVal, r_contents:"댓글 테스트입니다...", replyer:"고길동"},
			function(result){
				alert("result : "+result);
			}
		);  */
		
		// 삭제 테스트
/* 		replyFunc.remove(11, function(result){
			console.log(result);
			
			if(result === "success") alert("삭제 성공!!");
		}); */
		
		// 댓글 조회 테스트
/* 		replyFunc.get(5, function(data){
			console.log(data);
		}); */
		
		// 댓글 리스트 가져오기 테스트
/*  		replyFunc.getList({bid:bidVal}, function(list){
			for(var i = 0; i < list.length; i++){
				console.log(list[i]);
			}
		}); */
		
  		/*replyFunc.getList({bid:bidVal, viewPage:2}, function(data){
  			console.log(data); 
  			
  			
			for(var i = 0; i < list.length; i++){
				console.log(list[i]);
			}
  			
		}); */
		
		// 댓글 수정 테스트
/* 		replyFunc.update(
			{rno:8, r_contents:"수정 수정 수정... ..."},
			function(result){
				alert("수정 완료!!");
			}
		); */
		
		// 즉시실행함수 테스트
/* 		var replyFunc = (function(){
			
			function register(reply){
				console.log(reply + ".....");
			}
			
			// cb는 콜백함수
			function register2(reply, cb){
				console.log(reply + ".....");
				cb();
			}
			
			return {
				register : register,
				register2 : register2
			};
		})();
		
		console.log(replyFunc.register("하이"));
		
		console.log(replyFunc.register2("하이", function(){console.log("콜백함수~~~")} )
		); */
		
		// 댓글 리스트
		var replyArea = $(".replyArea");
		
		var viewPage = 1;
		
		displayList(viewPage);
		
/* 		function displayList(){
			replyFunc.getList({bid:bidVal}, function(list){
				var str="";
				
				// 댓글이 없을 경우에 댓글 영역에는 아무것도 출력되지 않도록 처리
				if(list == null || list.length == 0){
					replyArea.html("");
					return;
				}
				
				// 댓글이 있는 경우
				for(var i = 0; i < list.length; i++){
					// data-rno="'+list[i].rno+'"는 댓글번호를 li태그에 data-속성을 이용해서 저장 
					str +='<li class="mb-2 p-0" data-rno="'+list[i].rno+'"><div class="form-control">'
							+'<div class="d-flex justify-content-between">'
							+'<h6><b>'+list[i].replyer+'</b></h6><span>'+replyFunc.showDateTime(list[i].r_date)+'</span></div>'
							+'<p>'+list[i].r_contents+'</p></div></li>';	
				}
				
				replyArea.html(str);
			});
		} */
		
		function displayList(viewPage){
			replyFunc.getList({bid:bidVal, viewPage: viewPage || 1}, 
					function(data){ // data는 repDto를 JSON으로 변환한 데이터
				var str="";
				
				// data.list는 viewPage에 해당하는 댓글 리스트
				var list = data.list;
				
				// 댓글이 없을 경우에 댓글 영역에는 아무것도 출력되지 않도록 처리
				if(list == null || list.length == 0){
					replyArea.html("");
					return;
				}
				
				// 댓글이 있는 경우
				for(var i = 0; i < list.length; i++){
					/* data-rno="'+list[i].rno+'"는 댓글번호를 li태그에 data-속성을 이용해서 저장 */
					str +='<li class="mb-2 p-0" data-rno="'+list[i].rno+'"><div class="form-control">'
							+'<div class="d-flex justify-content-between">'
							+'<h6><b>'+list[i].replyer+'</b></h6><span>'+replyFunc.showDateTime(list[i].r_date)+'</span></div>'
							+'<p>'+list[i].r_contents+'</p></div></li>';	
				}
				
				replyArea.html(str);
				// data안에는 pagination에 필요한 정보(blockStart, blockEnd,...)가 
				// 포함되어 있기 때문에
				// 페이징 처리함수에 인자로 넘겨준다.
				showPgNavi(data);
			});
		}
		
		/// Pagination 로직
		var pageArea = $(".pagination");
		
		function showPgNavi(data){
			console.log(data);
			console.log("blockStart : " + data.blockStart)
			
			var prevPage = data.prevPage;
			var nextPage = data.nextPage;
			var blockStart = data.blockStart;
			var blockEnd = data.blockEnd;
			
			var totalPage = data.totalPage;
			var viewPage = data.viewPage;
			
			var str = "";
			
			// prevPage=0이면 거짓
			if(prevPage){
				str += '<li class="page-item">'
			  		+ '<a class="page-link" href="'+prevPage+'">이전</a></li>';
			}
			
			for(var i = blockStart; i<= blockEnd; i++){
				var active = viewPage == i ? "active":"";
				
				str += '<li class="page-item '+active+'">'
					+ '<a class="page-link" href="'+i+'">'+i+'</a></li>';
			}			
			
			if(blockEnd < totalPage){
				str +='<li class="page-item">'
				  	+ '<a class="page-link" href="'+nextPage+'">다음</a></li>"';	
			}
				
			pageArea.html(str);  
			
		}
		
		pageArea.on("click", "li a", function(e){
			e.preventDefault();
			//$(this)는 a 태그
			var targetPage = $(this).attr("href");
			
			// 클릭했을 때의 페이지 번호가 새롭게 설정
			// viewPage는 전역변수, viewPage는 replyMapper.xml의 #{startIndex}를 결정하는 인자
			viewPage = targetPage;
			
			// 새로 설정된 페이지번호를 매개변수로 넘겨서 댓글 리스트를 출력
			displayList(viewPage);
		})
		
		
		
		///////////////////////// modal ////////////////////////////
		var modal = $(".modal");
		var taReplyContents = $("#reply_contents");
		var ipReplyer = $("#replyer");
		var ipReplyDate = $("#reply_date")
		
		var modBtn=$("#btn-md-modify");
		var delBtn=$("#btn-md-remove");
		var addBtn=$("#btn-md-register");
		
		// 새댓글 추가버튼 click이벤트 발생시 함수 수행
		$("#btn-addReply").on("click", function(e){
			// 기존의 입력된 댓글 삭제하기
			taReplyContents.val("");
			ipReplyer.attr("readonly", false);
			ipReplyer.val("");
			
			//closest()는 가장 가까운 조상을 선택
			ipReplyDate.closest("div").hide(); // date 입력창 감추기
			
			modal.find("button[id != 'btn-md-close']").hide();
			addBtn.show();
		});
		
		// 댓글 등록 버튼
		addBtn.on("click", function(e){
			if(taReplyContents.val() == null || taReplyContents.val().trim()==''){
				alert("댓글을 입력하세요!!");
				taReplyContents.focus();
				return;
			}
			
			if(ipReplyer.val() == null || ipReplyer.val().trim()==''){
				alert("작성자를 입력하세요!!");
				ipReplyer.focus();
				return;
			}
			
			// 댓글 입력 데이터를 JSON형식으로 만들기
			var reply = {
				bid:bidVal,	
				r_contents:taReplyContents.val(),
				replyer : ipReplyer.val()
			};
			
			replyFunc.register(reply, function(result){
				modal.modal("hide"); // 모달 창 감추기
				displayList(); // 댓글 리스트 출력함수 호출
			});
		});
		// 이벤트 위임(delegation) : 제이쿼리에서 on()함수를 이용해서 처리
		// 현재의 ul태그(replyArea클래스)에 이벤트를 주고 실제 이벤트의 대상은 li가 되도록 전가(위임)하는 로직
		// click이벤트가 li로 전가됨. li는 처음에는 존재하지 않기 때문에 이벤트를 줄 수가 없다.
		$(".replyArea").on("click", "li", function(e){
			// 여기서 $(this)는 li가 된다. 이벤트를 위임받은 li를 의미함
			var rno = $(this).data("rno"); // data-rno의 값을 가져오기
			// alert("rno : " + rno);
			
			// reply는 서버에서 전송된 JSON형식의 
			// 댓글 정보(rno, r_contents, replyer, r_date, update_date)
			replyFunc.get(rno, function(reply){
				taReplyContents.val(reply.r_contents);
				ipReplyer.val(reply.replyer).attr("readonly", true);
				ipReplyDate.closest("div").show();
				ipReplyDate.val(reply.r_date).attr("readonly", true);
				
				// 삭제, 수정할 때 rno 얻어오기 위해서 modal 태그에 임시로 저장
				modal.data("rno", reply.rno); // data-rno = 10
				
				modal.find("button[id != 'btn-md-close']").hide();
				modBtn.show();
				delBtn.show();
				
				modal.modal("show");
				
			});
		});
		
		// 수정 이벤트 처리
		modBtn.on("click", function(e){
			// 수정할 댓글 데이터를 JSON 객체로 생성
			var reply = {rno:modal.data("rno"),
				r_contents: taReplyContents.val()}
			
			
			replyFunc.update(reply, function(result){
				//alert(result);
				modal.modal("hide");
				
//				displayList();
				// 여기서 viewPage는 클릭했을 때의 페이지 번호값을 갖고 있음
				displayList(viewPage);
			});
		});
		
		// 삭제 이벤트 처리
		delBtn.on("click", function(e){
			var rno = modal.data("rno");
			
			replyFunc.remove(rno, function(result){
				//alert(result);
				modal.modal("hide");
				
//				displayList();				
				displayList(viewPage);				
			});
		});
		
		
		
		
		
		
		
		
		$("#btn-list").click(() => {
			location.href="<c:url value='/list.do?viewPage=${pDto.viewPage}&searchType=${pDto.searchType}&keyWord=${pDto.keyWord}'/>";
		})
		
		$("#btn-modify").click(() => {
			location.href="<c:url value='/modify.do?bid=${board.bid}&viewPage=${pDto.viewPage}&searchType=${pDto.searchType}&keyWord=${pDto.keyWord}'/>";
		})
	});
</script>

</body>
</html>