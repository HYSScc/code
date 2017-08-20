define(function (require, exports, module) {
  let Notify = require("common/bootstrap-notify");
  $(".btn-meeting-record-delete").on("click", function () {
    if (!confirm(Translator.trans("确认要删除会议记录吗？"))) return false;
    let $btn = $(this);
    $.post($btn.data("url"), function () {
      Notify.success(Translator.trans("删除会议记录成功！"));
      window.location.reload();
    }).error(function () {
      Notify.danger(Translator.trans("删除会议记录失败！"));
    });
  });
});
