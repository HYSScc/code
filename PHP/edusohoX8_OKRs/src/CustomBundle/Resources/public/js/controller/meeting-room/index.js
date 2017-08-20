define(function(require, exports, module) {
  var Notify = require('common/bootstrap-notify');
  $(".btn-meeting-room-delete").on('click', function () {
    if (!confirm(Translator.trans('确认要删除会议室吗？'))) return false;
    var $btn = $(this);
    $.post($btn.data('url'), function () {
      Notify.success(Translator.trans('删除会议室成功！'));
      window.location.reload();
    }).error(function () {
      Notify.danger(Translator.trans('删除会议室失败！'));
    });
  });
});
