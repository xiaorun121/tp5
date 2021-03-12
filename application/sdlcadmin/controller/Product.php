<?php

namespace app\sdlcadmin\controller;

use think\Controller;
use app\sdlcadmin\logic\GetViewMenuPermission;
use app\sdlcadmin\model\Product as ProductModel;
use app\sdlcadmin\model\ProductClassify;

class Product extends Common{

    public function productList(){
        $product = new ProductModel();
        $name = input('get.name');
        $product_classify_id = input('get.product_classify_id');


        if($product_classify_id == 0){
            if($name){

                $info = $product->where('title','like','%'.$name.'%')
                        ->order('id asc')
                        ->paginate(200,false,[
                        'type'     => 'bootstrap',
                        'var_page' => 'page',
                ]);

            }else{
                $info = $product
                        ->order('id asc')
                        ->paginate(200,false,[
                        'type'     => 'bootstrap',
                        'var_page' => 'page',
                ]);
            }
        }else{
            if($name){

                $info = $product->where('title','like','%'.$name.'%')
                        ->where('product_classify_id',$product_classify_id)
                        ->order('id asc')
                        ->paginate(200,false,[
                        'type'     => 'bootstrap',
                        'var_page' => 'page',
                ]);

            }else{
                $info = $product->where('product_classify_id',$product_classify_id)
                        ->order('id asc')
                        ->paginate(200,false,[
                        'type'     => 'bootstrap',
                        'var_page' => 'page',
                ]);
            }
        }



        $get = new GetViewMenuPermission();

        $viewMenu = $get->getViewMeun();

        $this->assign('viewMenu',$viewMenu);
        $this->assign('info',$info);
        $this->assign('product_classify_id',$product_classify_id);

        $productClassify = new ProductClassify();
        $productClassifyInfo = $productClassify->order('id asc')->select();
        $this->assign('productClassifyInfo',$productClassifyInfo);


        return view();
    }

    public function productSave($id = 0, $title = '', $status = '', $product_classify_id = 0, $picimg = ''){
        $product = new ProductModel();
        if(request()->isPost()){
            if($id != 0){
                $product = $product::get($id);
            }

            $data = [
                'title'                  => input('post.title'),
                'product_classify_id'    => input('post.product_classify_id'),
                'picimg'                 => input('post.picimg'),
                'user_id'                => session('user.id')
            ];
            if(input('post.status') == 'on'){
                $data['status']     = 'on';
            }else{
                $data['status']     = 'off';
            }

            if($product->save($data) == 1){
                return success('保存成功',url('productList'));
            }

        }else{
            $data = [
                'id'                    => $id,
                'title'                 => $title,
                'status'                => $status,
                'picimg'                => $picimg,
                'product_classify_id'   => $product_classify_id,
            ];
            $this->assign('getInfo',$data);

            $classify = new ProductClassify();
            $classify = $classify::all(function($query){
                $query->order('id asc');
            });

            $classifyArr = get_tree($classify);
            $this->assign('classifyArr',$classifyArr);
            return view();
        }

    }

    public function delProduct(){

        $id = input('post.id');

        // 软删除
        $product = new ProductModel();
        $res = $product::destroy($id);
        if($res == 1){
            echo json_encode(['status'=>'success','code'=>200,'msg'=>'删除成功']);
        }else{
            echo json_encode(['status'=>'error','code'=>201,'msg'=>'删除失败']);
        }
    }

}
