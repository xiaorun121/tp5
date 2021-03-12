<?php
namespace app\index\controller;
use think\Controller;
use think\Db;
use app\sdlcadmin\model\Product;
use app\sdlcadmin\model\ProductClassify;
use app\sdlcadmin\model\Picture;
use app\sdlcadmin\model\News;
use app\sdlcadmin\model\Links;
class Index extends Controller
{
    public function _initialize(){

        // 获取后台配置文件的信息
        $config = Db::name('website')->where('id',1)->find();
        $config['logo'] = '/public/uploads/'.$config['logo'];

        $this->assign('config',$config);

        $product = new ProductClassify();
        $product = $product::all(function($query){
            $query->order('id asc');
        });

        $productArr = get_tree($product);
        $this->assign('productArr',$productArr);
    }

    public function index(){
        $banner = new Picture();
        $product = new Product();
        $news = new News();
        $links = new Links();
        // banner 轮播
        $bannerInfo = $banner->order('sort asc')->where('status','=','on')->select();
        $this->assign('bannerInfo',$bannerInfo);

        // 产品
        $productInfo = $product->where('status','=','on')->limit('0,24')->order('click desc')->select();
        $this->assign('productInfo',$productInfo);

        //
        $productFirstInfo = $product->where('status','=','on')->limit('0,24')->order('create_time desc')->select();
        $this->assign('productFirstInfo',$productFirstInfo);

        // 新闻 热门
        $hotNews = $news->where('type','=','热门')->where('status','=','on')->limit('0,8')->select();
        $this->assign('hotNews',$hotNews);

        // 新闻 最新
        $firstNews = $news->where('type','=','最新')->where('status','=','on')->limit('0,8')->select();
        $this->assign('firstNews',$firstNews);

        // 友情链接
        $linksInfo = $links->where('status','=','on')->order('sort asc')->select();
        $this->assign('linksInfo',$linksInfo);
        return view();
    }

    public function about(){
        return view();
    }

    public function contact(){
        return view();
    }

    // 新闻中心
    public function news($type = ''){
        $news = new News();
        if($type == ''){
            $newsinfo = $news->where('status','=','on')->paginate(12,false,[
                'type'     => 'bootstrap',
                'var_page' => 'page',
            ]);
        }else{
            $newsinfo = $news->where('type',$type)->where('status','=','on')->paginate(12,false,[
                'type'     => 'bootstrap',
                'var_page' => 'page',
            ]);
        }

        $this->assign('newsinfo',$newsinfo);
        $this->assign('type',$type);
        return view();
    }

    // 产品中心
    public function product($id = 0){
        $product = new Product();
        $productClassify = new ProductClassify();
        if($id == 0){
            $productInfo = $product->where('status','=','on')->paginate(9,false,[
                'type'     => 'bootstrap',
                'var_page' => 'page',
            ]);
        }else{
            $productInfo = $product->where('product_classify_id',$id)->where('status','=','on')->paginate(9,false,[
                'type'     => 'bootstrap',
                'var_page' => 'page',
            ]);
            $productClassifyToName = $productClassify->where('id',$id)->value('name');

            $productClassifyToParentId = $productClassify->where('id',$id)->value('parent_id');
            if($productClassifyToParentId == 0){
                $html = "<a href='/'>首页</a> >  <a class='' href='/product?id=".$id."'>".$productClassifyToName."</a>";
            }else{
                $productClassifyToOne = $productClassify->where('id',$id)->field('parent_id,id,name')->find();
                $productClassifyToTwo = $productClassify->where('id',$productClassifyToOne['parent_id'])->field('parent_id,id,name')->find();
                $html = "<a href='/'>首页</a> >  <a class='' href='/product?id=".$productClassifyToTwo['id']."'>".$productClassifyToTwo['name']."</a> > <a class='' href='/product?id=".$id."'>".$productClassifyToName."</a>";
            }
        }
        $this->assign('html',$html);
        $this->assign('productInfo',$productInfo);
        $this->assign('productClassifyToName',$productClassifyToName);


        return view();
    }

    //产品详情页
    public function productArticle($id = 0){
        $product = new Product();
        $productClassify = new ProductClassify();
        $info = $product->where('id',$id)->find();
        $this->assign('info',$info);

        $product->where('id',$id)->setInc('click');

        $prv = $product->where('id','>',$id)->where('product_classify_id',$info['product_classify_id'])->order('id asc')->limit('1')->find();

        $this->assign('prv',$prv);
        //列表是按照根据id降序排列的，所以下一篇
        $next = $product->where('id','<',$id)->order('id desc')->where('product_classify_id',$info['product_classify_id'])->limit('1')->find();
        $this->assign('next',$next);

        // 当前位置
        $productClassify = $productClassify->where('id',$info['product_classify_id'])->find();
        if($productClassify['parent_id'] == 0){
            $html = "<a href='/'>首页</a> >  <a class='' href='/product?id=".$productClassify['id']."'>".$productClassify['name']."</a>";
        }else{
            $productClassifyToTwo = $productClassify->where('id',$productClassify['parent_id'])->field('parent_id,id,name')->find();
            $html = "<a href='/'>首页</a> >  <a class='' href='/product?id=".$productClassifyToTwo['id']."'>".$productClassifyToTwo['name']."</a> > <a class='' href='/product?id=".$productClassify['id']."'>".$productClassify['name']."</a>";
        }
        $this->assign('html',$html);

        // 相关新闻
        $news = new News();
        $newsInfo = $news->where('status','=','on')->limit('0,10')->order('rand()')->select();
        $this->assign('productClassify',$productClassify);
        $this->assign('newsInfo',$newsInfo);
        return view();
    }

    //新闻详情页
    public function newsArticle($id = 0){
        $news = new News();
        $info = $news->where('id',$id)->find();
        $this->assign('info',$info);

        $news->where('id',$id)->setInc('click');
        //
        $prv = $news->where('id','>',$id)->where('type',$info['type'])->order('id asc')->limit('1')->find();

        $this->assign('prv',$prv);
        //列表是按照根据id降序排列的，所以下一篇
        $next = $news->where('id','<',$id)->order('id desc')->where('type',$info['type'])->limit('1')->find();
        $this->assign('next',$next);
        //
        // 相关新闻
        $newsInfo = $news->where('status','=','on')->limit('0,10')->order('rand()')->select();
        $this->assign('newsInfo',$newsInfo);

        // 相关产品
        $product = new Product();
        $productInfo = $product->where('status','=','on')->limit('0,10')->order('rand()')->select();
        $this->assign('productInfo',$productInfo);
        return view();
    }
}
