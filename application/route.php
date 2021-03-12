<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

use think\Route;

Route::get('/about','index/index/about');
Route::get('/contact','index/index/contact');
Route::get('/news','index/index/news');
Route::get('/product','index/index/product');
Route::get('/productarticle','index/index/productArticle');
Route::get('/newsarticle','index/index/newsArticle');


return [
    '__pattern__' => [
        'name' => '\w+',
    ],
];
