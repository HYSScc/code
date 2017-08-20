define(function (require, exports, module) {
  var Validator = require("bootstrap.validator");
  var Notify = require("common/bootstrap-notify");
  require("common/validator-rules").inject(Validator);
  require("jquery.bootstrap-datetimepicker");

  exports.run = function () {

    var $modal = $("#meeting-room-create-form").parents(".modal");
    var validator = new Validator({
      element: "#meeting-room-create-form",
      autoSubmit: false,
      onFormValidated: function (error, results, $form) {
        if (error) {
          return false;
        }

        $("#meeting-room-create-btn").button("submiting").addClass("disabled");

        $.post($form.attr("action"), $form.serialize(), function (html) {
          console.log($form.attr("action"));
          $modal.modal("hide");
          Notify.success(Translator.trans("会议室添加成功"));
          window.location.reload();
        }).error(function () {
          Notify.danger(Translator.trans("会议室添加失败"));
        });

      }
    });

    validator.addItem({
      element: '#name',
      required: true,
      rule: "chinese_alphanumeric remote"
    });
  };
});
