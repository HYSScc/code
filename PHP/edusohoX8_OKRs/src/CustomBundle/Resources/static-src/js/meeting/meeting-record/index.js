import notify from 'common/notify';
$(".js-delete-button").on('click', function () {
  if (!confirm(Translator.trans('确认要删除目标吗？'))) return false;
  var $btn = $(this);
  $.post($btn.data('url'), function () {
    notify('success', '删除目标成功');
    window.location.reload();
  }).error(function () {
    notify('warning', '删除目标失败');
  });
});