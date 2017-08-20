$('#addNewGoal').on('click', function () {
  var goalName = $('#goalName').val();
  if (goalName !== null) {
    $.post($('#addNewGoal').attr('data-url'), {goalName: goalName}, function (data) {
      if (data === false) {
        alert('当前时间不可增加子目标！');
      } else {
        window.location.reload();
      }
    });
  }
});

$('#editNewGoal').on('click', function () {
  var editGoalName = $('#goalName').val();
  if (editGoalName !== null) {
    $.post($('#editNewGoal').attr('data-url'), {goalName: editGoalName}, function (data) {
      if (data === false) {
        alert('当前时间不可修改子目标！');
      } else {
        window.location.reload();
      }
    });
  }
});

$('#deleteGoal').on('click', function () {
  $.post($('#deleteGoal').attr('data-url'), {}, function (data) {
    if (data) {
      window.location.reload();
    } else {
      alert('当前时间不可删除子目标！');
    }
  });
});

$('#deleteKR').on('click', function () {
  $.post($('#deleteKR').attr('data-url'), {}, function (data) {
    if (data) {
      var krId = $('#kr-manage-form').attr("data-id");
      $('#krs'+krId).remove();
    } else {
      alert('当前时间不可删除KR！');
    }
    var $form = $('#kr-manage-form');
    var $modal = $form.parents('.modal');
    $modal.modal('hide');
  });
});

$('#editNewKR').on('click', function () {
  var editKRName = $('#keyResultName').val();
  if (editKRName !== "") {
    $.post($('#editNewKR').attr('data-url'), {KRName: editKRName}, function (data) {
      if (data === false) {
        alert('当前时间不可修改KR！');
      } else {
        var krId = $('#kr-manage-form').attr("data-id");
        $('#krs'+krId).children('td#kr').html(data.name);
      }
      var $form = $('#kr-manage-form');
      var $modal = $form.parents('.modal');
      $modal.modal('hide');
    });
  }
});

$('#addKRButton').on('click', function () {
  let keyResultName = $('#keyResultName').val();
  $.post($('#addKRButton').attr('data-url'), {KRsName: keyResultName}, function (data) {
    if (data === false) {
      alert('当前时间不可添加KR！');
    } else {
      var cloneGoal = $('.krs').clone(true);
      cloneGoal.attr('class', 'copyKRs');
      cloneGoal.attr('id', 'krs'+data.id);
      cloneGoal.css("display", "");
      cloneGoal.children('td#kr').html(data.name);
      cloneGoal.find('a#editKR').attr('data-name', data.id);
      cloneGoal.find('a#editKR').attr('data-url', "editKR?KRId="+data.id);
      cloneGoal.find('a#adjusteditOKR').attr('data-name',data.id);
      $('#goalButton'+data.goalId).after(cloneGoal);
    }
    var $form = $('#kr-manage-form');
    var $modal = $form.parents('.modal');
    $modal.modal('hide');
  });
});