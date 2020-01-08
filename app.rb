require 'sinatra'

get '/' do
  # ここにコードを入力してください。
  datas = [["哺乳類", ["有袋目", ["コアラ", "カンガルー"]], ["クジラ目", ["イルカ"]], ["食肉目", ["シロクマ", "パンダ"]]], ["鳥類", ["カモ目", ["アヒル"]], ["フクロウ目", ["フクロウ"]]]]
  @datas = {}
  @families = datas.map{|data| data[0]}.unshift("")
  
  @datas[datas[0][0]] = Hash[*datas[0][1]]
  @datas[datas[0][0]].merge!(Hash[*datas[0][2]])
  @datas[datas[0][0]].merge!(Hash[*datas[0][3]])
  @datas[datas[1][0]] = Hash[*datas[1][1]]
  @datas[datas[1][0]].merge!(Hash[*datas[1][2]])

  @datas = {params[:family] => @datas[params[:family]]} if !params[:family].nil? && !params[:family].empty?
  # ここまでコードを入力して下さい。
  erb :index
end
