<?php

namespace app\sdlcadmin\controller;

use think\Controller;
use app\sdlcadmin\logic\GetViewMenuPermission;
use app\sdlcadmin\model\Links as LinksModel;

class Links extends Common{

    public function linksList(){
        $links = new LinksModel();

        $username = input('get.username');

        if($username){

            $info = $links->where('title','like','%'.$username.'%')
                        ->order('sort asc')
                        ->paginate(20,false,[
                        'type'     => 'bootstrap',
                        'var_page' => 'page',
            ]);

        }else{
            $info = $links  ->order('sort asc')
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

    public function linksSave($id = 0, $title = '', $status = '',$sort = 0,$link = ''){

        $links = new LinksModel();
        if(request()->isPost()){

            if($id != 0){
                $links = $links::get($id);
            }

            $data = [
                'title'          => input('post.title'),
                'sort'           => input('post.sort'),
                'link'           => input('post.link'),
                'user_id'        => session('user.id')
            ];
            if(input('post.status') == 'on'){
                $data['status']     = 'on';
            }else{
                $data['status']     = 'off';
            }

            if($links->save($data) == 1){
                return success('保存成功',url('linksList'));
            }

        }else{
            $data = [
                'id'            => $id,
                'title'         => $title,
                'status'        => $status,
                'sort'          => $sort,
                'link'          => $link
            ];
            $this->assign('getInfo',$data);
            return view();
        }

    }

    public function delLinks(){

        $id = input('post.id');

        // 软删除
        $links = new LinksModel();
        $res = $links::destroy($id);
        if($res == 1){
            echo json_encode(['status'=>'success','code'=>200,'msg'=>'删除成功']);
        }else{
            echo json_encode(['status'=>'error','code'=>201,'msg'=>'删除失败']);
        }
    }
}
