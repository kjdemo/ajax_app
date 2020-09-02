class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: "DESC")#DESC は降順。昇順はABC
    # すべてのレコードを@postsに代入
  end

  def create
    Post.create(content: params[:detail])
    #detaol はビューファイindex.htmlに書いてあるtextfieldの後ろ。textフィールドに入力された値をdetailと紐付けてparamsで取得。
    #content: は、マイグレーションファイルで決めたカラム名のcontent。IDとかcontent とかcreated_atとかある内のcontent だけとってるという意味
    redirect_to action: :index
    redirect_to action: :index
  end
end
