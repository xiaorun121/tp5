<?php
namespace app\sdlcadmin\controller;
use think\Controller;
use think\Session;
use think\Db;
use think\Request;
use app\sdlcadmin\model\Permission;
use app\sdlcadmin\model\Menu;

use PHPExcel_IOFactory;
use PHPExcel;


class Common extends Controller
{
		public function _initialize(){
	        // 先假设存在session
	        if(session('user.name')==null){
	            session(null);
	            $this->redirect('login/index');
	        }

					//请求的URL
	        $url = $this->request->baseUrl();

	        //判断是否以.html结尾
	        if (strrpos($url, '.html') > 0) {
	            $url = substr($url, 0, strrpos($url, '.html'));
	        }

					$id = session('user.id');
	        $permission = new Permission();
	        $permissions = $permission->get_login_user_permissions($id);

					array_push($permissions,'/sdlcadmin/index/index','/sdlcadmin/index/content','/sdlcadmin/index/info','/sdlcadmin/common/upload_image');

	        if (!in_array($url, $permissions)) {
	            if ($this->request->isAjax()) {
	                $array = array(
	                    'status' => false,
	                    'msg' => '没有权限访问该模块:' . $url,
	                );
	                exit(json_encode($array));
	            } else {

	                $u = url('/sdlcadmin/index/index');
	                exit("<script type='text/javascript'>alert('没有权限访问该模块');history.go(-1);</script>");
	            }
	        }

	        return view();
	    }

			/* 生成二维码 */
	    public function getQrcode(Request $request){
	        if($request->isPost()){
	            $xh = $request->param('xh');

	            // $pathname = APP_PATH . '/../Public/upload/';
	            // if(!is_dir($pathname)) { //若目录不存在则创建之
	            //     mkdir($pathname);
	            // }

	            vendor('phpqrcode.phpqrcode');//引入类库
	            $value = $this->loginurl.'?xh='.$xh;         //二维码内容
	            $errorCorrectionLevel = 'L';  //容错级别
	            $matrixPointSize = 10;      //生成图片大小
	            //生成二维码图片

	            //设置二维码文件名
	            $filename = 'public/qrcode/'.date('YmdHis',time()).rand(10000,9999999).$xh.'.png';
	            //生成二维码
	            \QRcode::png($value,$filename , $errorCorrectionLevel, $matrixPointSize, 2);

	            $request = Request::instance();
	            $domain = $request->domain(); //根据自己的项目路径适当修改

	            $img = $domain.'/'. $filename;
	            echo json_encode(['img'=>$img,'code'=>200]);
	        }
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
