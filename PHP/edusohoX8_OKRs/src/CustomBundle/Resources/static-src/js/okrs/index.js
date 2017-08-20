var $isSelfRated = $('#isSelfRated');
var $postName = $("#postName");
var $orgId = $('#orgId');
var isSelfRated = null;
var postNamevalue = null;
var orgIdvalue = null;
var keywordvalue = null;

function GetQueryString(name)//查找url参数内容
{
  var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
  var r = window.location.search.substr(1).match(reg);
  if (r != null) {
    return decodeURIComponent(r[2]);
  }
  return null;
}

$(document).ready(function () {
  $.get('findsearchboxinfo', {}, function (data) {
    for (var i = 0; i < data.posts.length; i++) {
      $('#postName').append("<option value='" + data.posts[i].id + "'>" + data.posts[i].name + "</option>");
    }
    for (var i = 0; i < data.orgs.length; i++) {
      $('#orgId').append("<option value='" + data.orgs[i].id + "'>" + data.orgs[i].name + "</option>");
    }
  }, 'json');

  if (GetQueryString('postName') != null) {
    $postName.val(GetQueryString('postName'));
  }

  if (GetQueryString('orgId') != null) {
    $orgId.val(GetQueryString('orgId'));
  }

  if (GetQueryString('isSelfRated') != null) {
    $isSelfRated.val(GetQueryString('orgisSelfRatedId'));
  }
});
