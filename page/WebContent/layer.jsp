<!DOCTYPE html>

<html>

<head>

    <title>Bootstrap datepicker demo</title>
    <script src = "jquery-3.2.1.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
 <script src="Pikaday-master/pikaday.js"></script>


</head>



<body>
<div class="container">
<input type="text" id="datepicker" value="9 Oct 2014">
<script>
$('#fromDate').datetimepicker({ language : 'ko', // 화면에 출력될 언어를 한국어로 설정한다. 
	pickTime : false, // 사용자로부터 시간 선택을 허용하려면 true를 설정하거나 pickTime 옵션을 생략한다. 
	defalutDate : new Date() // 기본값으로 오늘 날짜를 입력한다. 기본값을 해제하려면 defaultDate 옵션을 생략한다. 
	});
$('#toDate').datetimepicker({ language : 'ko', 
	pickTime : false,
	defalutDate : new Date()
});

    </script>

</body>

</html>

