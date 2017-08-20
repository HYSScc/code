define(function (require, exports, module) {
  var Validator = require('bootstrap.validator');
  require('common/validator-rules').inject(Validator);
  var Notify = require('common/bootstrap-notify');
  require('jquery.form');

  exports.run = function () {
    var $form = $('#goal-approval-form');
    var $modal = $form.parents('.modal');
    
    $("button#goal-approval-btn").click(function(){
      if ($("#reply").val() == 'reject') {
        if($("#rejectReason").val() == '') {
          alert("原因不能为空");
        } else {
          $.get($form.attr('action'), $form.serialize(), function (html) {
            $modal.modal('hide');
            Notify.success(Translator.trans('更新成功！'));
            window.location.reload();
          }).fail(function () {
              Notify.danger(Translator.trans('更新失败，请重试！'));
          });
        }
      } else {
        $.get($form.attr('action'), $form.serialize(), function (html) {
          $modal.modal('hide');
          Notify.success(Translator.trans('更新成功！'));
          window.location.reload();
        }).fail(function () {
          Notify.danger(Translator.trans('更新失败，请重试！'));
        });     
      }
    });

  
  };


});