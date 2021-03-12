<?php

namespace app\sdlcadmin\controller;

use think\Controller;
use app\sdlcadmin\logic\GetViewMenuPermission;
use app\sdlcadmin\model\ProductClassify;

class Classify extends Common{

    public function productClassifyList(){
        $classify = new ProductClassify();

        $name = input('get.name');

        if($name){

            $classifyInfo = $classify->where('name','like','%'.$name.'%')
                    ->order('id asc')
                    ->paginate(200,false,[
                    'type'     => 'bootstrap',
                    'var_page' => 'page',
            ]);

        }else{
            $classifyInfo = $classify
                    ->order('id asc')
                    ->paginate(200,false,[
                    'type'     => 'bootstrap',
                    'var_page' => 'page',
            ]);
        }



        $get = new GetViewMenuPermission();

        $viewMenu = $get->getViewMeun();

        $this->assign('viewMenu',$viewMenu);
        $this->assign('name',$name);
        $this->assign('classifyInfo',$classifyInfo);
        return view();
    }

    public function productClassifySave($id = 0, $name = '', $parent_id = 0, $status = ''){
        $classify = new ProductClassify();
        if(request()->isPost()){

            if($id != 0){
                $classify = $classify::get($id);
            }
            $data = [
                'name'         => input('post.name'),
                'parent_id'    => input('post.parent_id'),
                'user_id'      => session('user.id')
            ];

            if(input('post.status') == 'on'){
                $data['status']     = 'on';
            }else{
                $data['status']     = 'off';
            }

            if($classify->save($data) == 1){
                return success('保存成功',url('productClassifyList'));
            }
        }else{
            $data = [
                'id'               => $id,
                'name'             => $name,
                'status'           => $status,
                'parent_id'        => $parent_id,
            ];
            $this->assign('getInfo',$data);

            $classify = $classify::all(function($query){
                $query->order('id asc');
            });

            $classifyArr = get_tree($classify);
            $this->assign('classifyArr',$classifyArr);
            return view();
        }


    }

    public function delProductClassify(){

        $id = input('post.id');

        // 软删除
        $productClassify = new ProductClassifyModel();
        $res = $productClassify::destroy($id);
        if($res == 1){
            echo json_encode(['status'=>'success','code'=>200,'msg'=>'删除成功']);
        }else{
            echo json_encode(['status'=>'error','code'=>201,'msg'=>'删除失败']);
        }
    }

}
