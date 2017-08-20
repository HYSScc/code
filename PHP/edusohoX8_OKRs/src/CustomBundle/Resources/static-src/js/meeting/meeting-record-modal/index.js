import notify from 'common/notify';

let $form = $('#meeting-record-form');
let $modal = $form.parents('.modal');
let $btn = $('#meeting-record-submit');

let validator = $form.validate({
  onkeyup: false,
  rules: {
    meetingTitle: {
      required: true,
    },
    startClock: {
      startClock_check: true,
      required: true,
    },
    endClock: {
      endClock_check: true,
      confirm_time_check: true,
      required: true
    }

  },
  messages: {
    meetingTitle: {
      required: Translator.trans('请输入会议标题')
    },
    startClock: {
      required: Translator.trans('请输入开始时间')
    },
    endClock: {
      confirm_time_check: Translator.trans("该时间段已被占用"),
      required: Translator.trans('请输入结束时间')
    }
  }
});

$btn.click(() => {
  validator.form();
  if (validator.form()) {
    $form.submit();
  }
});

$('#startClock, #endClock').datetimepicker({
  autoclose: true,
  language: 'zh',
  format: 'hh:ii',
  minView: 'hour',
  startView: 0,
  minuteStep: 30,
  maxView: 0
});
jQuery.validator.addMethod("endClock_check", function() {
  var startDate = $('[name="startClock"]').val();
  var endDate = $('[name="endClock"]').val();
  return (startDate <= endDate);
}, "结束时间大于或等于开始时间");

jQuery.validator.addMethod("startClock_check", function() {
  var timestrap = Date.parse(new Date());
  var startDate = $('[name="startClock"]').val();
  var selectDate = $('#dateSelect').val();
  var myTime = selectDate + ' ' + startDate;
  myTime = new Date(myTime.replace(/-/g, '/'));
  return (timestrap <= myTime);
}, "开始时间要大于当前时间");
jQuery.validator.addMethod("confirm_time_check", function() {
  var flag = false;
  $.ajax({
    url: '/meetingRoom/record/check',
    data: {'categoryId': $('#categoryId').val(), 'dateSelect': $('#dateSelect').val(), 'startClock': $('#startClock').val(), 'endClock': $('#endClock').val(), 'meetingBrief': $('#meetingBrief').val(), 'id': $('#meetingTitle').data('id')},
    type: 'POST',
    async: false,
    success: function(res) {
      flag = (res === 'success') ? true : false;
    },
    error:function(er) {
      BackErr(er);
    }
  });
  return flag;
});