<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="daterangepicker/daterangepicker.css" />
	<script type="text/javascript" src="daterangepicker/jquery.min.js" ></script>
	<script type="text/javascript" src="daterangepicker/bootstrap.min.js" ></script>
	<script type="text/javascript" src="daterangepicker/moment.js" ></script>
	<script type="text/javascript" src="daterangepicker/daterangepicker.js" ></script>
	<script type="text/javascript">
		$(function() {
		    $('#config-demo').daterangepicker({
		        applyClass : 'btn-sm btn-success',
		        cancelClass : 'btn-sm btn-default',
		        locale: {
		            applyLabel: '确认',
		            cancelLabel: '取消',
		            fromLabel : '起始时间',
		            toLabel : '结束时间',
		            customRangeLabel : '自定义',
		            firstDay : 1
		        },
		        ranges : {
		            //'最近1小时': [moment().subtract('hours',1), moment()],
		            '今日': [moment().startOf('day'), moment()],
		            '昨日': [moment().subtract('days', 1).startOf('day'), moment().subtract('days', 1).endOf('day')],
		            '最近7日': [moment().subtract('days', 6), moment()],
		            '最近30日': [moment().subtract('days', 29), moment()],
		            '本月': [moment().startOf("month"),moment().endOf("month")],
		            '上个月': [moment().subtract(1,"month").startOf("month"),moment().subtract(1,"month").endOf("month")]
		        },
		        opens : 'left',    // 日期选择框的弹出位置
		        separator : ' 至 ',
		        showWeekNumbers : true,     // 是否显示第几周
		         
		        //maxDate : moment(),           // 最大时间
		        format: 'YYYY-MM-DD'
		 
		    }, function(start, end, label) { // 格式化日期显示框
		        $('#beginTime').val(start.format('YYYY-MM-DD'));
		        $('#endTime').val(end.format('YYYY-MM-DD'));
		    })
		    .next().on('click', function(){
		        $(this).prev().focus();
		    });
		});
		 
	</script>
	
    <style type="text/css">
      .demo { position: relative; }
      .demo i {
        position: absolute; bottom: 10px; right: 24px; top: auto; cursor: pointer;
      }
    </style>
</head>
<body>
	 <div class="col-md-4 col-md-offset-2 demo">
       <h4>Your Date Range Picker</h4>
       <input type="text" id="config-demo" class="form-control">
       <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
     </div>
</body>
</html>