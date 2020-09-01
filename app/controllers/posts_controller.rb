class PostsController < ApplicationController
  def index
    @posts = Post.all  # すべてのレコードを@postsに代入
  end

  def new
  end

  def create
    Post.create(content: params[:detail])　
    #detaol はビューファイルnew.htmlに書いてあるtextfieldの後ろ。textフィールドに入力された値をdetailと紐付けてparamsで取得。
    #content: は、マイグレーションファイルで決めたカラム名のcontent。IDとかcontent とかcreated_atとかある内のcontent だけとってるという意味
  end
end
