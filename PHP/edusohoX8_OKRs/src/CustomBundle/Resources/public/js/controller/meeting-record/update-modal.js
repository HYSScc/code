define(function (require, exports, module) {
  var Validator = require("bootstrap.validator");
  var Notify = require("common/bootstrap-notify");
  require("common/validator-rules").inject(Validator);
  require("jquery.bootstrap-datetimepicker");

  exports.run = function () {

    var $modal = $("#meeting-record-form").parents(".modal");
    var validator = new Validator({
      element: "#meeting-record-form",
      autoSubmit: false,
      onFormValidated: function (error, results, $form) {
        if (error) {
          return false;
        }

        $("#meeting-record-submit").button("submiting").addClass("disabled");

        $.post($form.attr("action"), $form.serialize(), function (html) {
          console.log($form.attr("action"));
          $modal.modal("hide");
          Notify.success(Translator.trans("会议记录更新成功"));
          window.location.reload();
        }).error(function () {
          Notify.danger(Translator.trans("会议记录更新失败"));
        });

      }
    });

    $("#startClock, #endClock").datetimepicker({
      autoclose: true,
      language: "zh",
      format: "hh:ii",
      minView: "hour",
      startView: 0,
      minuteStep: 30,
      maxView: 0
    });

    Validator.addRule("endClock_check", function () {
      var startDate = $("[name='startClock']").val();
      var endDate = $("[name='endClock']").val();
      return (startDate <= endDate);
    }, "结束时间大于或等于开始时间");

    Validator.addRule("startClock_check", function () {
        var timestrap = Date.parse(new Date());
        var startDate = $("[name='startClock']").val();
        var selectDate = $("#dateSelect").val();
        var myTime = selectDate + " " + startDate;
        myTime = new Date(myTime.replace(/-/g, "/"));
        return (timestrap <= myTime);
      }, "开始时间要大于当前时间"
    );
    Validator.addRule("confirm_time_check", function () {
        var flag = false;
        $.ajax({
          url: "/meetingRoom/record/check",
          data: {
            "categoryId": $("#categoryId").val(),
            "dateSelect": $("#dateSelect").val(),
            "startClock": $("#startClock").val(),
            "endClock": $("#endClock").val(),
            "meetingBrief": $("#meetingBrief").val(),
            "id": $("#meetingTitle").data("id")
          },
          type: "POST",
          async: false,
          success: function (res) {
            flag = (res === "success") ? true : false;
          },
          error: function (er) {
            BackErr(er);
          }
        });

        return flag;
      }, "该时间段已被占用"
    );

    validator.addItem({
      element: "[name='startClock']",
      rule: "startClock_check confirm_time_check"
    });

    validator.addItem({
      element: "[name='endClock']",
      rule: "endClock_check confirm_time_check"
    });

    validator.addItem({
      element: "[name='meetingTitle']",
      required: true,
      rule: "chinese_alphanumeric"
    });
  };
});
