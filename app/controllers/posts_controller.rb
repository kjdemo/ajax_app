class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: "DESC")#DESC は降順。昇順はABC
    # postテーブル内のすべてのレコードを@postsに代入
  end

  def create
    Post.create(content: params[:detail])
    #detaol はビューファイindex.htmlに書いてあるtextfieldの後ろ。textフィールドに入力された値をdetailと紐付けてparamsで取得。
    #content: は、マイグレーションファイルで決めたカラム名のcontent。IDとかcontent とかcreated_atとかある内のcontent だけとってるという意味
    #Post.createでPostテーブルにcontent だけ保存してる
    redirect_to action: :index
    redirect_to action: :index
  end

  def checked
    post = Post.find(params[:id])
    #post(小文字の)に指定されたidの情報（レコード）を１つ（findだから)取って代入
    if post.checked 
      post.update(checked: false)
    else
      post.update(checked: true)
    end

    item = Post.find(params[:id])
    render json: { post: item }
  end
end