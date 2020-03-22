<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/admin/echarts.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<link href="${pageContext.request.contextPath}/css/user/common.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/css/bootstrap/bootstrap.min.css"
	rel="stylesheet" />
<title>查询商品库存</title>
</head>
<body>
	<!-- 搜索栏 -->
	<div style="display: flex; flex-direction: row;">
		<div
			style="margin-left: 70%; width: 120px; height: 40px; margin-top: 20px;">
			<select class="form-control" name="id" id="id">
				<option value="1">感冒咳嗽</option>
				<option value="2">皮肤用药</option>
				<option value="3">补肾壮阳</option>
				<option value="4">眼科用药</option>
				<option value="5">肠胃消化</option>
				<option value="6">耳鼻喉用药</option>
				<option value="7">补气养血</option>
				<option value="8">口腔用药</option>
				<option value="9">止痛镇痛</option>
			</select>
		</div>
		<div style="margin-top: 20px; margin-left: 10px;">
			<a href="javascript:location.reload();"><button type="submit"
					class="btn btn-primary">搜索</button></a>
		</div>
	</div>
	<!-- 柱状图容器 -->
	<div id="main" style="width: 100%; height: 400px;"></div>

	<script type="text/javascript">
    $(function() {
        // 初始化
        //var myChart = echarts.init(document.getElementById('main'));
var myChart = echarts.init($('#main')[0]); // 注意：这里init方法的参数的javascript对象，使用jQuery获取标签时，要将jQuery对象转成JavaScript对象；

        // 配置图标参数
        var options = {
            title: {
                text: '商品单价',
                show: true, // 是否显示标题
                subtext: '郑权友',
                textStyle: {
                    fontSize: 18 // 标题文字大小
                }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'shadow'
                }
            },
            legend: {
                data: ['销量']
            },
            // X轴
            xAxis: {
                data: [] // 异步请求时,这里要置空
            },
            // Y轴
            yAxis: {},
            series: [{
                name: '销量',
                type: 'bar', // 设置图表类型为柱状图
                data: [] // 设置纵坐标的刻度(异步请求时,这里要置空)
            }]
        };
        // 给图标设置配置的参数
        myChart.setOption(options);
        myChart.showLoading(); // 显示加载动画
        var id=	$('#id option:selected') .val();
        var url="findCommodityPrice?drugType";
        alert(id);
        $.ajax({
            url: '${pageContext.request.contextPath}/'+url+'='+id+'',
            type: 'post',
            dataType: 'json',
            success: function(data) {
                var names = [];
                var nums = [];
                $.each(data, function(index, obj) {
                    names.push(obj.name);
                    nums.push(obj.price);
                })

                myChart.hideLoading(); // 隐藏加载动画
                myChart.setOption({
                    legend: {
                        data: ['销量']
                    },
                    xAxis: {
                        data: names
                    },
                    series: [{
                        name: '价格',
                        type: 'bar', // 设置图表类型为柱状图
                        data: nums // 设置纵坐标的刻度
                    }]
                });
            }
        });
    });
</script>
</body>
</html>