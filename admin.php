<?php
// +----------------------------------------------------------------------
// | ShopXO 国内领先企业级B2C免费开源电商系统
// +----------------------------------------------------------------------
// | Copyright (c) 2011~2099 http://shopxo.net All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( https://opensource.org/licenses/mit-license.php )
// +----------------------------------------------------------------------
// | Author: Devil
// +----------------------------------------------------------------------

// [ 后台入口文件 ]
namespace think;

// 加载基础文件
require __DIR__ . '/thinkphp/base.php';

// 根目录入口
define('IS_ROOT_ACCESS', true);

// 引入公共入口文件
require __DIR__.'/public/core.php';

// 执行应用并响应
Container::get('app')->bind('admin')->run()->send();
?>