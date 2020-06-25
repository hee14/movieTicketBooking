<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>일정 관리</title>
	
	<link href="../css/fullcalendar.min.css" rel="stylesheet" />
	<link href="../css/fullcalendar.print.min.css" rel="stylesheet" media="print"/>
	<script src="../js/moment.min.js"></script>
	<script src="../js/jquery-1.10.1.min.js" type="text/javascript"></script>
	<script src="../js/jquery.bpopup.min.js" type="text/javascript"></script>
	<script src="../js/fullcalendar.min.js"></script>
	<script src="../js/ko.js"></script>
	
	<script>
		$(document).ready(function() {
			$('#calendar').fullCalendar({
				editable: true,
				navLinks: true,
				eventLimit: true,
				locale: "ko"
			});
		});
		
		function addSchedule() {
			
			var htmlsContents = "";
			htmlsContents += "<div style='width:100%; height:30px'><div style='width:30%; float:left; padding-left:30px'>일정 명칭</div><div style='width:60%;float:right'><input type='text' id='calendar_title' value='' style='width:120px'></div></div>";
			htmlsContents += "<div style='width:100%; height:30px'><div style='width:30%; float:left; padding-left:30px'>시작 날짜</div><div style='width:60%;float:right'><input type='date' id='calendar_start1' value='' style='width:120px'> <input type='time' id='calendar_start2' value='' style='width:120px'></div></div>";
			htmlsContents += "<div style='width:100%; height:30px'><div style='width:30%; float:left; padding-left:30px'>마침 날짜</div><div style='width:60%;float:right'><input type='date' id='calendar_end1' value='' style='width:120px'> <input type='time' id='calendar_end2' value='' style='width:120px'></div></div>";
			htmlsContents += "<div style='width:100%; text-align:center; height:30px; margin-bottom:15px; margin-top:10px'><button onclick=\"javascript:saveSchedule();\">저장하기</button></div>";
			openPopup("일정 등록", htmlsContents, 500);
		}
		Í
		function openPopup(subject, contents, widths) {
			$("#alert_subject").html(subject);
			$("#alert_contents").html(contents);
			openMessage("winAlert", widths)
		}
		
		function saveSchedule() {
			
			var calendar_title = $("#calendar_title").val();
			var calendar_start1 = $("#calendar_start1").val();
			var calendar_start2 = $("#calendar_start2").val();
			var calendar_end1 = $("#calendar_end1").val();
			var calendar_end2 = $("#calendar_end2").val();
			
			if(!calendar_title) {
				alert("일정 명칭을 입력해주세요.");
				
				return false;
			}
			if(!calendar_start1) {
				alert("시작 날짜를 입력해주세요.");
				
				return false;
			}
			if(!calendar_start2) {
				alert("시작 날짜를 입력해주세요.");
				
				return false;
			}
			if(!calendar_end1) {
				alert("마침 날짜를 입력해주세요.");
				
				return false;
			}
			if(!calendar_end2) {
				alert("마침 날짜를 입력해주세요.");
				
				return false;
			}
			
			//값이 모두 입력되었을 경우
			$.ajax({
				type: 'POST',
				url: "calendarPro",
				data: {calendar_title: calendar_title, 
					calendar_start: calendar_start1+calendar_start2,
					calendar_end: calendar_end1+calendar_end2},
				cache: false,
				async: false
			});
			
			closeMessage('winAlert');
			alert("정상 저장되었습니다.");
			$('#calendar').fullCalendar("refetchEvents");
			
			/* 
			//값이 모두 입력되었을 경우
			$.ajax({
				type: 'POST',
				url: "calendarPro",
				data: {calendar_title: calendar_title, 
					calendar_start: calendar_start1+calendar_start2,
					calendar_end: calendar_end1+calendar_end2},
				cache: false,
				async: false
			}).done(function(result) {
				if(result == "OK") {
					closeMessage('winAlert');
					alert("정상 저장되었습니다.");
					$('#calendar').fullCalendar("refetchEvents");
				}
			}); 
			
			
			
			
			closeMessage('winAlert');
			alert("정상 저장되었습니다.");
			$('#calendar').fullCalendar("refetchEvents"); */
			
		}
		
		function openMessage(IDS, widths) {
			$('#'+IDS).css("width", widths+"px");
			$('#'+IDS).bPopup();
		}
		
		function closeMessage(IDS) {
			$('#'+IDS).bPopup().close();
		}
	</script>
</head>
<body>
	<div style="max-width:900px; margin: 0 auto; height:30px">
		<div style="float:right">
			<button onclick="javascript:addSchedule();">일정 등록</button>
		</div>
	</div>

	<div id="calendar" style="max-width:900px; margin: 0 auto;">
	
	</div>
	
	<div class="box box-success" style="width:500px; display:none; background-color:white" id="winAlert">
		<div class="box-header with-border" style="background-color:white; padding-left:15px">
			<h3 class="box-title" id="alert_subject" style="background-color:white"></h3>
		</div> <!-- /box-header -->
		<div class="box-body with-border" id="alert_contents" style="font-size:15px; background-color:white">
		</div> <!-- /box-body -->
	</div> <!-- /box -->
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>