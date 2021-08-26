class TopController < ApplicationController

  before_action :login_required,except: :index

  def index
    @chart = {"食べ物・飲み物" => 10, "交通" => 20, "学校で使う道具" => 30, "もらったお金" => 40, "その他" => 40}
  end
end
