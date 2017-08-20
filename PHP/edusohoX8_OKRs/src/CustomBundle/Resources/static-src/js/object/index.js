var goalReason = "";
var goalId = "";
var krId = "";
$('.tablebody').on("click", "a", function (event) {
  var clickNode = event.target;
  krId = $(clickNode).attr('data-name');
  if ($(clickNode).attr('id') === 'showKR') {
    goalId = $(clickNode).attr('data-name');
    $('.copyKRs').remove();
    if ($('.copyGoals').find('a#addKR').attr('data-name') !== goalId) {
      $('.copyGoals').remove();
      $.get($(clickNode).attr('data-url'), {}, function (data) {
        goalReason = data.goal['adjustReason'];
        if (data.KRsResult.length > 0) {
          for (var i = 0; i < data.KRsResult.length; i++) {
            var cloneGoal = $('.krs').clone(true);
            cloneGoal.attr('class', 'copyKRs');
            cloneGoal.attr('id', 'krs'+data.KRsResult[i].id);
            cloneGoal.css("display", "");
            cloneGoal.children('td#kr').html(data.KRsResult[i].name);
            cloneGoal.find('a#editKR').attr('data-name', data.KRsResult[i].id);
            cloneGoal.find('a#editKR').attr('data-url', "editKR?KRId="+data.KRsResult[i].id);
            cloneGoal.find('a#adjusteditOKR').attr('data-name', data.KRsResult[i].id);
            $(clickNode).parents('tr').after(cloneGoal);
          }
        } else {
          alert("暂无KR!");
        }
        var copyGoal = $('.goalButton').clone(true);
        copyGoal.attr('class', 'copyGoals');
        copyGoal.attr('id', 'goalButton'+data.goal['id']);
        copyGoal.find('a').attr('data-name', data.goal['id']);
        copyGoal.find('a#addKR').attr('data-url', "addKeyResults?goalId="+data.goal['id']);
        copyGoal.find('a#editGoal').attr('data-url', "editGoal?goalId="+data.goal['id']);
        copyGoal.find('td#goalMessage').html("子目标：" + data.goal['name']);
        copyGoal.css("display", "");
        $(clickNode).parents('tr').after(copyGoal);
      }, 'json');
    } else {
      $('.copyGoals').remove();
    }
  }
  if ($(clickNode).attr('id') === 'adjustaddOKR') {
    goalId = $(clickNode).attr('data-name');
    if (goalReason == '') {
          $('#adjustAdd').modal('show'); 
    } else {
      alert("已调整！");
    }
  }
  if ($(clickNode).attr('id') === 'adjusteditOKR') {
    if (goalReason == '') {
      $('#adjustEdit').modal('show'); 
    } else {
      alert("已调整！");
    }
  }

});

$('#adjustAddOKR').on('click', function () {
  let KRsName = $('#adjustOKRName').val();
  var KRsReason = $('#adjustOKRReason').val();
  if (KRsName != '' && KRsReason != '') {
    $.get('addKrToGoal', {goalId: goalId, krsName:KRsName, krsReason:KRsReason}, function (data) {
      $('#adjustOKRName').val("");
      $('#adjustOKRReason').val("");
      $('#adjustAdd').modal('hide');
      if (data === false) {
        alert('当前时间不可调整添加Kr！');
      } 
    });
  } else {
    alert('信息添加不完整！');
  } 
});

$('#adjustEditOKR').on('click', function () {
  var editKRName = $('#adjusteditOKRName').val();
  var KRsReason = $('#updateOKRReason').val();
  if (editKRName != '' && KRsReason != '') {
    $.get('updateKrToGoal', {krId: krId, krName: editKRName, krsReason:KRsReason}, function (data) {
        $('#adjusteditOKRName').val("");
        $('#adjustEdit').modal('hide');
        if(data === false) {
            alert('当前时间不可调整编辑KR！');
        }
    });
  } else {
    alert('信息添加不完整！');
  }
});

$('#adjustDeleteOKR').on('click', function () {
  var KRsReason = $('#updateOKRReason').val();
  if (KRsReason != '') {
    $.get('deleteKrToGoal', {krId: krId, krsReason:KRsReason}, function (data) {
        $('#editKRName').val("");
        $('#adjustEdit').modal('hide');
        if(data === false) {
            alert('当前时间不可调整删除Kr！');
        }
    });

  } else {
    alert('信息添加不完整！');
  }
});