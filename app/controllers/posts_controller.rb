class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: "DESC")#DESC は降順。昇順はABC
    # postテーブル内のすべてのレコードを@postsに代入
  end

  def create
    Post.create(content: params[:detail], checked: false)
    #detaol はビューファイindex.htmlに書いてあるtextfieldの後ろ。textフィールドに入力された値をdetailと紐付けてparamsで取得。
    #content: は、マイグレーションファイルで決めたカラム名のcontent。IDとかcontent とかcreated_atとかある内のcontent だけとってるという意味
    #checked: falseはクリエイト時点では未読のため
    render json:{ post: post }
  end

  def checked
    post = Post.find(params[:id])
    #post(小文字の)に指定されたidの情報（レコード）を１つ（findだから)取って代入
    if post.checked then
      post.update(checked: false)
    else
      post.update(checked: true)
    end

    item = Post.find(params[:id])
    render json: { post: item }
  end
end