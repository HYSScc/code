define(function (require, exports, module) {
  var Validator = require("bootstrap.validator");
  var Notify = require("common/bootstrap-notify");
  require("common/validator-rules").inject(Validator);
  require("jquery.bootstrap-datetimepicker");

  exports.run = function () {

    var $modal = $("#section-goal-create-form").parents(".modal");
    var validator = new Validator({
      element: "#section-goal-create-form",
      autoSubmit: false,
      onFormValidated: function (error, results, $form) {
        if (error) {
          return false;
        }

        $("#section-goal-create-btn").button("submiting").addClass("disabled");

        $.post($form.attr("action"), $form.serialize(), function (html) {
          console.log($form.attr("action"));
          $modal.modal("hide");
          Notify.success(Translator.trans("阶段目标添加成功"));
          window.location.reload();
        }).error(function () {
          Notify.danger(Translator.trans("阶段目标添加失败"));
        });

      }
    });

    Validator.addRule('judge_adjust_time',
      function () {
        var adjustStartTime = $('[name=adjustStartTime]').val();
        var adjustEndTime = $('[name=adjustEndTime]').val();
        if (adjustStartTime <= adjustEndTime) {
          return true;
        } else {
          return false;
        }
      },Translator.trans('调整开始时间小于结束时间')
    );
    Validator.addRule('judge_Rating_time',
      function () {
        var selfRatingEndTime = $('[name=selfRatingEndTime]').val();
        var othersRatingEndTime = $('[name=othersRatingEndTime]').val();
        if (selfRatingEndTime <= othersRatingEndTime) {
          return true;
        } else {
          return false;
        }
      },Translator.trans('他评时间大于自评时间')
    );
    validator.addItem({
      element: '[name="othersRatingEndTime"]',
      rule: "judge_Rating_time"
    });
    validator.addItem({
      element: '[name="adjustEndTime"]',
      rule: 'judge_adjust_time'
    });
    validator.addItem({
      element: '#name',
      required: true,
      rule: "chinese_alphanumeric remote"
    });
    initDatePicker("#startTime");
    initDatePicker("#confirmEndTime");
    initDatePicker("#adjustStartTime");
    initDatePicker("#adjustEndTime");
    initDatePicker("#selfRatingEndTime");
    initDatePicker("#othersRatingEndTime");
  };

  function initDatePicker($id) {
    let $picker = $($id);
    $picker.datetimepicker({
      format: "yyyy-mm-dd hh:ii",
      language: "zh",
      minView: 0, //month
      autoclose: true,
      endDate: new Date(Date.now() + 86400 * 365 * 10 * 1000)
    });
    $picker.datetimepicker("setStartDate", new Date());
  }

});

