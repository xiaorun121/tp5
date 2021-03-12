<?php

namespace app\sdlcadmin\controller;

use think\Controller;
use app\sdlcadmin\logic\GetViewMenuPermission;
use app\sdlcadmin\model\News as NewsModel;

class News extends Common{

    public function newsList(){
        $news = new NewsModel();

        $username = input('get.username');

        if($username){

            $info = $news->where('title','like','%'.$username.'%')
                        ->paginate(50,false,[
                        'type'     => 'bootstrap',
                        'var_page' => 'page',
            ]);

        }else{
            $info = $news  ->paginate(50,false,[
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

    public function newsSave($id = 0, $title = '', $keywords = '', $description = '', $status = '',$content = '',$type = ''){

        $news = new NewsModel();
        if(request()->isPost()){

            if($id != 0){
                $news = $news::get($id);
            }


            $data = [
                'title'          => input('post.title'),
                'keywords'       => input('post.keywords'),
                'description'    => input('post.description'),
                'type'           => input('post.type'),
                'content'        => input('post.content'),
                'user_id'        => session('user.id')
            ];
            if(input('post.status') == 'on'){
                $data['status']     = 'on';
            }else{
                $data['status']     = 'off';
            }

            if($news->save($data) == 1){
                return success('保存成功',url('newsList'));
            }

        }else{
            $data = [
                'id'            => $id,
                'title'         => $title,
                'keywords'      => $keywords,
                'description'   => $description,
                'status'        => $status,
                'type'          => $type
            ];
            $data['content'] = $news->where('id',$id)->value('content');
            $this->assign('getInfo',$data);
            return view();
        }

    }

    public function delNews(){

        $id = input('post.id');

        // 软删除
        $news = new NewsModel();
        $res = $news::destroy($id);
        if($res == 1){
            echo json_encode(['status'=>'success','code'=>200,'msg'=>'删除成功']);
        }else{
            echo json_encode(['status'=>'error','code'=>201,'msg'=>'删除失败']);
        }
    }

}
