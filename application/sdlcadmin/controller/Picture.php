<?php

namespace app\sdlcadmin\controller;

use think\Controller;
use app\sdlcadmin\logic\GetViewMenuPermission;
use app\sdlcadmin\model\Picture as PictureModel;

class Picture extends Common{
    public function pictureList(){
        $picture = new PictureModel();

        $username = input('get.username');

        if($username){

            $info = $picture->where('title','like','%'.$username.'%')
                        ->order('sort asc')
                        ->paginate(20,false,[
                        'type'     => 'bootstrap',
                        'var_page' => 'page',
            ]);

        }else{
            $info = $picture  ->order('sort asc')
                              ->paginate(20,false,[
                    'type'     => 'bootstrap',
                    'var_page' => 'page',
            ]);
        }


        $this->assign('username',$username);

        $this->assign('info',$info);

        $get = new GetViewMenuPermission();

        $viewMenu = $get->getViewMeun();

        $this->assign('viewMenu',$viewMenu);
        return view();
    }

    public function pictureSave($id = 0, $title = '',  $description = '', $status = '',$sort = 0,  $picimg = ''){

        $picture = new PictureModel();
        if(request()->isPost()){

            if($id != 0){
                $picture = $picture::get($id);
            }

            $data = [
                'title'          => input('post.title'),
                'description'    => input('post.description'),
                'sort'           => input('post.sort'),
                'picimg'         => input('post.picimg'),
                'user_id'        => session('user.id')
            ];
            if(input('post.status') == 'on'){
                $data['status']     = 'on';
            }else{
                $data['status']     = 'off';
            }

            if($picture->save($data) == 1){
                return success('保存成功',url('pictureList'));
            }

        }else{
            $data = [
                'id'            => $id,
                'title'         => $title,
                'description'   => $description,
                'status'        => $status,
                'sort'          => $sort,
                'picimg'        => $picimg
            ];
            $this->assign('getInfo',$data);
            return view();
        }

    }

    public function delPicture(){

        $id = input('post.id');

        // 软删除
        $picture = new PictureModel();
        $res = $picture::destroy($id);
        if($res == 1){
            echo json_encode(['status'=>'success','code'=>200,'msg'=>'删除成功']);
        }else{
            echo json_encode(['status'=>'error','code'=>201,'msg'=>'删除失败']);
        }
    }
}
