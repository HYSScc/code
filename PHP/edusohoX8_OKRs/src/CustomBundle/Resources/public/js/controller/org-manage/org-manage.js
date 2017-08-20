define(function (require, exports, module) {
    var Validator = require('bootstrap.validator');
    require('common/validator-rules').inject(Validator);
    var Notify = require('common/bootstrap-notify');
    require('jquery.form');
    var Publisher = require('./publish');
    var ObserverTest = require('./observer');


    exports.run = function() {
      var $form = $('#org-manage-form');
      var $modal = $form.parents('.modal');

      var validator = new Validator({
        element: $form,
        autoSubmit: false,
        onFormValidated: function(error, results, $form) {
          if (error) {
            return;
          }
          $('#org-create-btn').button('submiting').addClass('disabled');

          $.post($form.attr('action'), $form.serialize(), function(html) {
            $modal.modal('hide');
            Notify.success(Translator.trans('保存组织机构成功！'));
            window.location.reload();
          }).fail(function() {
            Notify.danger(Translator.trans('添加组织机构失败，请重试！'));
          });

        }
      });


      validator.addItem({
        element: '#org-name-field',
        required: true,
        rule: 'chinese_english byte_maxlength{max:30} remote'
      });

      validator.addItem({
        element: '#org-code-field',
        required: true,
        rule: 'alpha_numeric not_all_digital remote maxlength{max:30}'
      });


      Validator.addRule("chinese_english", /^([\u4E00-\uFA29]|[a-zA-Z ])*$/i, "{{display}}必须是中文字、英文字母组成");
      Validator.addRule("alpha_numeric", /^[a-zA-Z0-9]+$/i, "{{display}}必须是英文字母、数字组成");

      $modal.find('.delete-org').on('click', function() {
        if (confirm(Translator.trans('真的要删除该组织机构及其辖下组织机构吗？'))) {
          $.post($(this).data('url'), function(response) {
            if (response && response.status == 'error') {
              var msg = Translator.trans("该织机构下含有数据 ");
              $.each(response.data, function($key) {
                msg += $key + ' : ' + response.data[$key] + Translator.trans('条') + "\t";
              });
              msg += Translator.trans('请先转移到其他组织机构再进行删除!');
              Notify.danger(msg, 8);
              return false;
            }
            Notify.success(Translator.trans('组织机构已删除'));
            $modal.modal('hide');
            window.location.reload();
          });
        }
      });

      var publisher = new Publisher();
      var observerTest = new ObserverTest();
      publisher.registerComp(observerTest);
      $("#admin-add").on('click', function() {
        show(publisher);
      });

      $(".delete-btn").on('click', function() {
        var li = this.parentNode;
        var ul = li.parentNode;
        ul.removeChild(li);
      });

      $("#admin-list-group li").each(function() {
        var text = this.children[0].innerText;
        var userId = this.children[2].value;
        var data = {name: text, userId: userId};
        publisher.setState(data);
      });

      $("#admin-input").on('input', function() {
        show(publisher);
      });
    };

    var show = function(publisher) {
      var url = $("#admin-input").data('url');
      var value = $("#admin-input").val();
      $.get(url, {name: value}, function(data) {
        $.each(data, function (index, user) {
          if (value.length > 0) {
            $("#admin-input-list-group").append('<li class="list-group-item" userId="' + user['id'] + '">' + user['nickname'] + '</li>');
          }

        });

        $('li').on('click', function() {
          var inputName = $(this).html();
          var userId = $(this).attr('userId');
          var data = {name: inputName, userId: userId};
          $("#admin-input").val(inputName);
          publisher.setState(data);
          $("#hidden-group").append('<input type="hidden" name="managerIds[]" nickname="' + inputName + '" value="' + data.userId + '" >');
          $("#admin-input-list-group").children().filter('li').remove();

        });
      });
      $("#admin-input-list-group").children().filter('li').hide();
    };
  }
);
