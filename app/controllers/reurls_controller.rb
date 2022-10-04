class ReurlsController < ApplicationController
  
  def index
  end
  def newurl 
    newurl = Reurl.create(originUrl: params[:originUrl])
    # newurl.save
    # newurl.token = idToToken(newurl.id).rjust(6, '0')
    newurl.update(token: idToToken(newurl.id).rjust(6, '0'))
    render json: {newurl: "localhost/" + newurl.token}
  end
  private
  def map
    @map = ["0", *?a..?z, *?1..?9, *?A..?Z, "_", "-"]
  end
  def idToToken(id)
    return "" if id === 0
    return idToToken(id >> 6) + map[id & 63] 
  end
end