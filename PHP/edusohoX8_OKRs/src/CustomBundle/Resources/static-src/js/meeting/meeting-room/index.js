var meetingRoomStatistic = function (element) {
  let myChart = echarts.init(document.getElementById('meeting-room-situation'));

  myChart.showLoading();

  return $.post(element.attr('data-url'),function (data) {

    console.log(data);

    var dataObj = JSON.parse(data);

    let days = ['18:00～深夜','17:30~18:00','17:00~17:30','16:30~17:00','16:00~16:30','15:30~16:00','15:00~15:30','14:30~15:00','14:00~14:30','13:30~14:00','13:00~13:30','12:30~13:00','12:00~12:30','11:30~12:00','11:00~11:30','10:30~11:00','10:00~10:30','9:30~10:00','9:00~9:30'];

    data = dataObj.data.map(function (item) {
      return [item[1], item[0], item[2] || '-', item[3]];
    });

    let option = {
      tooltip: {
        position: 'top',
        formatter: function (data) {
          let str = data['name']+':'+data['value'][3];
          return str;
        }
      },
      animation: true,
      grid: {
        height: '75%',
      },
      xAxis: {
        type: 'category',
        position:'top',
        data: dataObj.meetingRooms,
        splitArea: {
          show: true
        },
        axisLabel: {
          interval:0,
          rotate:40
        }
      },
      yAxis: {
        type: 'category',
        data: days,
        splitArea: {
          show: true
        }
      },
      visualMap: {
        min: 1,
        calculable: true,
        orient: 'horizontal',
        left: 'center',
        bottom: '5%',
        show: false
      },
      series: [{
        name: 'Punch Card',
        type: 'heatmap',
        data: data,
        label: {
          normal: {
            show: true,
            formatter: function (data) {
              return(data['value'][3]);
            }
          }
        },
        itemStyle: {
          emphasis: {
            shadowBlur: 10,
            shadowColor: 'rgba(0, 0, 0, 0.5)'
          }

        }
      }]
    };

    myChart.hideLoading();
    myChart.setOption(option);
  })

}

var element = $('#meeting-room-situation');
meetingRoomStatistic(element);

$(".dropdown-menu").on('click','a',function () {
  var element = $(this);
  meetingRoomStatistic(element);
})