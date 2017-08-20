define(function(require, exports, module) {
  var Publisher = function() {
    this.observers = [];
    var state = {};     //让该内容不能直接访问

    //新增两个对于state的操作 获取/更新
    this.getState = function() {
      return state;
    };

    this.setState = function(value) {
      state = value;
      this.notifyComp();
    }

  };

  Publisher.prototype.registerComp = function(observer) {
    var flag = false;
    for (var i = this.observers.length - 1; i >= 0; i--) {
      if (this.observers[i] === observer) {
        flag = true;
      }
    }
    if (!flag) {
      this.observers.push(observer);
    }
    return this;
  };

  Publisher.prototype.deleteComp = function(observer) {
    var observers = this.observers;
    for (var i = 0; i < observers.length; i++) {
      if (observers[i] === observer) {
        observers.splice(i, 1);
      }
    }
    return this;
  };

  Publisher.prototype.notifyComp = function() {
    var observers = this.observers;
    for (var i = 0; i < observers.length; i++) {
      observers[i].update(this.getState());
    }
  };

  module.exports = Publisher;
});
