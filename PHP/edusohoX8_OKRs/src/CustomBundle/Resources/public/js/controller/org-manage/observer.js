define(function (require, exports, module) {

  var ObserverTest = function() {
    this.update = function(data) {
      $("#admin-input").val("");
      var container = document.getElementById("#admin-list-group");
      var li = document.createElement('li');
      li.classList.add('list-group-item');
      li.classList.add('clearfix');
      li.setAttribute('data-role', 'item');

      var spans = document.createElement('span');
      spans.setAttribute('class', 'truename');
      spans.innerHTML = data.name;

      var btn = document.createElement('button');
      btn.classList.add('close');
      btn.classList.add('delete-btn');
      btn.setAttribute('data-role', 'item-delete');
      btn.setAttribute('type', 'button');
      btn.setAttribute('title', '删除');
      btn.innerHTML = 'x';

      li.appendChild(spans);
      li.appendChild(btn);
      $("#admin-list-group").append(li);

      var valuesLi = $("#admin-list-group li").map(function() {
        return this.children[0].innerText;
      }).get();
      $.unique(valuesLi);
      $("#admin-list-group li").remove();
      $.each(valuesLi, function(index, val) {
        $("#admin-list-group").append('<li class="list-group-item clearfix" data-role="item"><span class="truename">' + val+ '</span><button class="close delete-btn" data-role="item-delete" type="button" title="删除">x</button></li>')
      });

      $(".delete-btn").on('click', function() {
        var li = this.parentNode;
        var ul = li.parentNode;
        var div = ul.parentNode;
        var value = li.children[0].innerText;
        ul.removeChild(li);
        $('input[nickname="' + value + '"]').remove();
      });
    };
  };
  module.exports = ObserverTest;
});