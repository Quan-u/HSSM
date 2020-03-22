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
	<!-- 饼状图容器 -->
	<div id="pid-div" style="width: 100%; height: 550px;"></div>

	<script type="text/javascript">
        $(function (){
            //var echarts = echarts.init($('#pid-div')[0]);
            var myChart = echarts.init($('#pid-div')[0]);
            var option = {
                title : {
                    text: '商品库存',
                    subtext: '郑权友',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: []
                },
                series : [
                    {
                        name: '访问来源',
                        type: 'pie',
                        radius : '60%', // 饼状图的大小
                        center: ['50%', '60%'], // 饼状图的位置
                        data:[
                            /*{value:335, name:'直接访问'},
                            {value:310, name:'邮件营销'},
                            {value:234, name:'联盟广告'},
                            {value:135, name:'视频广告'},
                            {value:1548, name:'搜索引擎'}*/
                        ],
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };
            //上面 var option可以换置
            myChart.setOption(option);
            myChart.showLoading(); // 显示动画
            var id=	$('#id option:selected') .val();
            var url="findCommodityStocks?drugType";
            alert(id);
            $.ajax({
                url: '${pageContext.request.contextPath}/'+url+'='+id+'',
                type: 'post',
                dataType: 'json',
                success: function(data) {
                    var names = [];
                    var nums = [];
                    $.each(data, function(index, obj) {//两个参数，第一个参数表示遍历的数组的下标，第二个参数表示下标对应的值  结果：0 值，1 值，2 值
                        names.push(obj.name);
                        nums.push({name:obj.name, value:obj.num});
                    })
 
                    myChart.hideLoading(); // 隐藏加载动画
                    myChart.setOption({
                        legend: {
                            data: names
                        },
                        series: [{
                            name: '库存',
                            type: 'pie', // 设置图表类型为柱状图
                            data:  nums // 设置纵坐标的刻度
                        }]
                    });
                }
            });
        });
        

</script>
</body>
</html>