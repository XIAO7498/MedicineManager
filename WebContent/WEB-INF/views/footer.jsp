
</body>
<script type="text/javascript" src="scripts/jquery.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="bootstrap/js/tab.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="templet/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="templet/js/jquery.sticky.js"></script>
<script type="text/javascript" src="templet/js/jquery.easing.1.3.min.js"></script>
<script type="text/javascript" src="templet/js/main.js"></script>
<script type="text/javascript" src="templet/js/bxslider.min.js"></script>
<script type="text/javascript" src="templet/js/script.slider.js"></script>
<script type="text/javascript" src="scripts/search.js"></script>
<script type="text/javascript" src="scripts/addToCart.js"></script>
<script type="text/javascript">
	$(function(){
		$(":input[name=minus1]").click(function(){
			var val = $(":input[name=quantity]").val();
			if(val > 1){
				val--;
				$(":input[name=quantity]").val(val);
			}
		})
		$(":input[name=plus1]").click(function(){
			var val = $(":input[name=quantity]").val();
			val++;
			$(":input[name=quantity]").val(val);
		})
	})
</script>
</html>
