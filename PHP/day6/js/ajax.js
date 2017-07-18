$(document).ready(function(){
	// 渲染表格(根据返回的users)
	var renderTable = function (data) {
		$('#demo-table').find('tbody tr').remove();
		var str = '';
		for (var i = 0; i < data.length; i++){
			var delbtn = '<button class="del-user-btn" data-id="' + data[i].id + '">删除</button>';
			var editbtn = '<button class="edit-user-btn" data-toggle="modal" data-target="#e-myModal" data-id="' + data[i].id + '">修改</button>';
			str += '<tr><td>'+ data[i].name +'</td><td>' + data[i].gender + '</td><td>' + data[i].age + '</td><td>' + data[i].info + '</td><td>' + delbtn + editbtn + '</td></tr>';
		}
		$('#demo-table').find('tbody').append(str);
	};

	

	// 获取表格数据
	var fetchTable = function (userName, page) {
		$.get( "index.php?controller=user&action=page", {userName: userName, page: page}, function(data){
			// 调用page方法，返回属性
			var pageCount = data.pageCount;
			var pageNow = data.pageNow;
			var users = data.users;

			renderTable(users);

			$('#page-now').text(pageNow);
			$('#page-count').text(pageCount);

		}, "json");
	};

	// 上一页
	$('#pre-page').on('click', function(){

		var now = parseInt($('#page-now').text());
		var total = parseInt($('#page-count').text());

		var prePage = now - 1;
		if (prePage == 0) {return}
		var userName = $('#keyword').val() || null;
		fetchTable(userName, prePage);

	});

	// 下一页
	$('#next-page').on('click', function(){

		var now = parseInt($('#page-now').text());
		var total = parseInt($('#page-count').text());

		var nextPage = now + 1;
		if (nextPage == total + 1) {return}
		var userName = $('#keyword').val() || null;
		fetchTable(userName, nextPage);
	});

	// 查询
	$("#searchbtn").on("click",function(){
		var userName = $('#keyword').val() || null;
		fetchTable(userName, 1);
	});




	// 显示新增表单
	// $("#addbtn").on("click",function(){
	// 	// window.location.href = 'http://baidu.com';

	// 	// 点击添加按钮显示父级div
	// 	$('#add-user-container').show();
	// });

	// // 关闭表单
	// $("#close-add-user").on("click",function(){

	// 	// 点击关闭按钮隐藏父级div
	// 	$('#add-user-container').hide();
	// });

	// 新增
	$('#submit-add-user').on("click", function () {

		// 通过表单id取得数据
		var username = $('#username').val();
		var gender = $('#gender').val();
		var age = $('#age').val();
		var info = $('#info').val();
		// 封装成键值对
		var data = {
			username: username,
			sex: gender,
			age: age,
			info: info
		};
		// 同时调用控制器add方法
		$.post('index.php?controller=user&action=add', data, function(data){
			// renderTable(data);
			// 获取当前页
			var now = parseInt($('#page-now').text());
			var userName = $('#keyword').val() || null;

			fetchTable(userName, now);

			// $('#add-user-container').hide();
			// 模拟事件
			$('#close-add-user').click().trigger('click');

		}, 'json');

	});



	// 删除
	$(document).on('click', '.del-user-btn', function () {

		var id = $(this).data('id');

		var tr = $(this).parent().parent();

		$.get( "index.php?controller=user&action=del", {id:id}, function(data){
			
			// text() 方法方法设置或返回被选元素的文本内容
			// val() 方法返回或设置被选元素的值。
			var now = parseInt($('#page-now').text());
			var userName = $('#keyword').val() || null;
			
			// 如果当前页的长度为零，则页数减一
			var trLength = $('#demo-table').find('tbody tr').length;
			
			if (trLength - 1 == 0) {
				now = now - 1;
			}

			fetchTable(userName, now);

		}, "json");

	});



	// 显示编辑
	$(document).on('click', '.edit-user-btn', function () {
		var id = $(this).data('id');
		// $('#edit-user-container').show();

		$.get( "index.php?controller=user&action=modify", {id:id}, function(data){

			// 通过表单id，将数据赋值
			$('#e-username').val(data.name);
			$('#e-gender').val(data.gender);
			$('#e-age').val(data.age);
			$('#e-info').val(data.info);
			$('#e-id').val(data.id);

		}, "json");
	});
	// 关闭编辑
	$("#close-edit-user").on("click",function(){
		// $('#edit-user-container').hide();
	})

	// 编辑
	$('#submit-edit-user').on("click", function () {
		var username = $('#e-username').val();
		var gender = $('#e-gender').val();
		var age = $('#e-age').val();
		var info = $('#e-info').val();
		var id = $('#e-id').val();

		var data = {
			username: username,
			sex: gender,
			age: age,
			info: info,
			id: id
		};

		$.post('index.php?controller=user&action=modify', data, function(data){
			// renderTable(data);
			var now = parseInt($('#page-now').text());
			var userName = $('#keyword').val() || null;
			
			fetchTable(userName, now);

			// $('#edit-user-container').hide();
		}, 'json');
	});

});
