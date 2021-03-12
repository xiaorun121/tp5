<?php
namespace app\sdlcadmin\controller;

use think\Controller;
use app\sdlcadmin\model\Role;
use app\sdlcadmin\model\User;
use app\sdlcadmin\model\Menu;
use app\sdlcadmin\model\Website;

class Admin extends Controller{

    public function website(){

        if(request()->isPost()){
            $con                           = Website::get(1);
            $data['name']                  = input('post.name');
            $data['url']                   = input('post.url');
            $data['title']                 = input('post.title');
            $data['keywords']              = input('post.keywords');
            $data['description']           = input('post.description');
            $data['copyright']             = input('post.copyright');
            $data['logo']                  = input('post.logo');
            $data['contacts']              = input('post.contacts');
            $data['contact_information']   = input('post.contact_information');
            $data['landline']              = input('post.landline');
            $data['wechat']                = input('post.wechat');
            $data['qq']                    = input('post.qq');
            $data['factory_address']       = input('post.factory_address');
            $data['address']               = input('post.address');
            $data['about']                 = input('post.about');
            $data['contact_us']            = input('post.contact_us');

            if($con->save($data) == 1){
                return success('保存成功',url('website'));
            }else{
                return error('请做完修改之后在执行保存操作');
            }

        }
        else{
            $info = Website::get(1);
            // $info = $con->where('id',1)->find();
            $this->assign('info',$info);
        }
        return view();
    }

    // 单图片或文件异步上传
    public function upload_image(){
        $file = request()->file(input('name'));
        $info = $file->validate(['ext'=>'jpg,png,gif'])->move(ROOT_PATH . 'public/uploads');
        if($info){
            $fileName = str_replace('\\', '/', $info->getSaveName());
            return json_encode($fileName); //文件名
        }
    }

}

?>
