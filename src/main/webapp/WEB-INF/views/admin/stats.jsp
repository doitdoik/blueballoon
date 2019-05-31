<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.chart{
	margin-top : 30px;
	margin-bottom: 30px;

}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.js"></script>
<!-- 그래프에 사용할 옵션 -->
<script>

'use strict';

window.chartColors = {
	red: 'rgb(255, 99, 132)',
	orange: 'rgb(255, 159, 64)',
	yellow: 'rgb(255, 205, 86)',
	green: 'rgb(75, 192, 192)',
	blue: 'rgb(54, 162, 235)',
	purple: 'rgb(153, 102, 255)',
	grey: 'rgb(201, 203, 207)'
};

(function(global) {
	var MONTHS = [
		'January',
		'February',
		'March',
		'April',
		'May',
		'June',
		'July',
		'August',
		'September',
		'October',
		'November',
		'December'
	];

	var COLORS = [
		'#4dc9f6',
		'#f67019',
		'#f53794',
		'#537bc4',
		'#acc236',
		'#166a8f',
		'#00a950',
		'#58595b',
		'#8549ba'
	];

	var Samples = global.Samples || (global.Samples = {});
	var Color = global.Color;

	Samples.utils = {
		// Adapted from http://indiegamr.com/generate-repeatable-random-numbers-in-js/
		srand: function(seed) {
			this._seed = seed;
		},

		rand: function(min, max) {
			var seed = this._seed;
			min = min === undefined ? 0 : min;
			max = max === undefined ? 1 : max;
			this._seed = (seed * 9301 + 49297) % 233280;
			return min + (this._seed / 233280) * (max - min);
		},

		numbers: function(config) {
			var cfg = config || {};
			var min = cfg.min || 0;
			var max = cfg.max || 1;
			var from = cfg.from || [];
			var count = cfg.count || 8;
			var decimals = cfg.decimals || 8;
			var continuity = cfg.continuity || 1;
			var dfactor = Math.pow(10, decimals) || 0;
			var data = [];
			var i, value;

			for (i = 0; i < count; ++i) {
				value = (from[i] || 0) + this.rand(min, max);
				if (this.rand() <= continuity) {
					data.push(Math.round(dfactor * value) / dfactor);
				} else {
					data.push(null);
				}
			}

			return data;
		},

		labels: function(config) {
			var cfg = config || {};
			var min = cfg.min || 0;
			var max = cfg.max || 100;
			var count = cfg.count || 8;
			var step = (max - min) / count;
			var decimals = cfg.decimals || 8;
			var dfactor = Math.pow(10, decimals) || 0;
			var prefix = cfg.prefix || '';
			var values = [];
			var i;

			for (i = min; i < max; i += step) {
				values.push(prefix + Math.round(dfactor * i) / dfactor);
			}

			return values;
		},

		months: function(config) {
			var cfg = config || {};
			var count = cfg.count || 12;
			var section = cfg.section;
			var values = [];
			var i, value;

			for (i = 0; i < count; ++i) {
				value = MONTHS[Math.ceil(i) % 12];
				values.push(value.substring(0, section));
			}

			return values;
		},

		color: function(index) {
			return COLORS[index % COLORS.length];
		},

		transparentize: function(color, opacity) {
			var alpha = opacity === undefined ? 0.5 : 1 - opacity;
			return Color(color).alpha(alpha).rgbString();
		}
	};

	// DEPRECATED
	window.randomScalingFactor = function() {
		return Math.round(Samples.utils.rand(-100, 100));
	};

	// INITIALIZATION

	Samples.utils.srand(Date.now());

	// Google Analytics
	/* eslint-disable */
	if (document.location.hostname.match(/^(www\.)?chartjs\.org$/)) {
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
		ga('create', 'UA-28909194-3', 'auto');
		ga('send', 'pageview');
	}
	/* eslint-enable */

}(this));

</script>
<!-- 작년/금년 매출 통계 그래프 -->
<script>
$(function() {
	var ctx = document.getElementById('myChart2').getContext('2d');
	$.ajax({
		url:"/blueballoon/admin/stats2",
		method:"get",
		success:function(result) {
			var myChart = new Chart(ctx, {
			    type: 'line',
			    data: {
			        labels: ['1월', '2월', '3월', '4월', '5월', '6월'],
			        datasets: [{
			            label: '백령도 매출액',
			            data: result[0],
			            fill: false,
			            backgroundColor: window.chartColors.blue,
						borderColor: window.chartColors.blue
			        }, 		       
			        {
			            label: '덕적도 매출액',
			            data: result[1],
			            fill: false,
			            backgroundColor: window.chartColors.red,
						borderColor: window.chartColors.red
			        } , 		       
			        {
			            label: '석모도 매출액',
			            data: result[2],
			            fill: false,
			            backgroundColor: window.chartColors.yellow,
						borderColor: window.chartColors.yellow
			        }]
			    },
			    options: {
					responsive: true,
					title: {
						display: true,
						fontSize:20,
						text: '섬별 월 매출액 비교'
					},
					tooltips: {
						mode: 'index',
						intersect: false,
					},
					hover: {
						mode: 'nearest',
						intersect: true
					},
					scales: {
						xAxes: [{
							display: true,
							ticks:{
								fontSize:16 // 1/4~4/4의 크기
							},
							scaleLabel: {
								display: true,
								labelString: '월',
								fontSize:16		// 분기 글자의 크기
							}
						}],
						yAxes: [{
							display: true,
							ticks:{	// y축 최소값 250, 최대값 450, 간격 50, 글자크기 16
								min:250,
								max:450,
								stepSize:50,
								fontSize:16
							},
							scaleLabel: {
								display: true,
								labelString: '매출액',
								fontSize:16		// 매출액 글자의 크기
							}
						}]
					}
				}
			});
		}
	});
})
</script>
<!-- 섬별 이용 비율 그래프 -->
<script>
$(function() {
	var ctx = document.getElementById('myChart3').getContext('2d');
	$.ajax({
		url:"/blueballoon/admin/stats3",
		method:"get",
		success:function(result) {
			console.log(result);
			var config = {
				type: 'doughnut',
				data: {
					datasets: [{
						data: result,
						backgroundColor: [
							window.chartColors.blue,
							window.chartColors.red,
							window.chartColors.yellow,
						],
						label: 'Dataset 1'
					}],
					labels: [

						'백령도',
						'덕적도',
						'석모도'
					]
				},
				options: {
					responsive: true,
					legend: {
						position: 'top',
					},
					title: {
						display: true,
						fontSize:20,
						text: '섬별 이용 비율'
					},
					animation: {
						animateScale: true,
						animateRotate: true
					}
				}
			};
			window.myDoughnut = new Chart(ctx, config);
		}
	});
	
})
</script>
</head>
<div style="width:75%" class="chart">
	<canvas id="myChart"></canvas>
</div>
<div style="width:75%" class="chart">
	<canvas id="myChart2"></canvas>
</div>
<div style="width:75%" class="chart">
	<canvas id="myChart3"></canvas>
</div>
</html>