<?php
namespace app\sdlcadmin\controller;

use think\Controller;
use think\Request;
use think\Db;
use app\sdlcadmin\model\Menu;
use app\sdlcadmin\model\Website;

class Index extends Common{

		public function index(){
				$role_id   = session('user.role_id');

				$menu = Db::view('Permission p','role_id,menu_id')
										->view('Menu m','id,name,module_name,controller_name,view_name,parent_id,is_menu,sort','p.menu_id = m.id')
										->where('p.role_id','=',$role_id)
										->where('m.is_menu','=',1)
										->where('m.delete_time is null')
									->order('m.sort asc')
									->select();
				$treeArr = get_tree_left($menu);


				$this->assign('menu',$treeArr);


				$website = new Website();
				$website = $website->where('id',1)->find();
				$this->assign('website',$website);

				return view();
		}

		public function content(){
				$website = new Website();
				$website = $website->where('id',1)->find();
				$this->assign('website',$website);
				return view();
		}

}
