require 'uri'
require 'net/http'

class ReurlsController < ApplicationController
  
  def index
  end

  def newurl
    receivedUrl = params[:originUrl]
    verifyResult = verifyUrl(receivedUrl)
    if verifyResult > 0
      newurlItem = Reurl.create(originUrl: receivedUrl)
      newurlItem.update(token: idToToken(newurlItem.id).rjust(6, '0'))
      @reurl = request.base_url + "/" + newurlItem.token
    else
      message = ["invalid url", "success", "url should start with http or https"]
      redirect_to "/", notice: message[verifyResult]
    end
  end

  def redirect
    redirectUrlItem = Reurl.find_by(token: params[:token])
    redirect_to redirectUrlItem ? redirectUrlItem.originUrl : "/"
  end
  private

  def map
    @map = ["0", *?a..?z, *?1..?9, *?A..?Z, "_", "-"]
  end

  def verifyUrl(url)
    regx = /^https?:\/\/(?:www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b(?:[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)$/
    return -1 if !url.match(regx)
    uri = URI(url)
    res = Net::HTTP.get_response(uri)
    return res.code === "200" ? 1 : 0
  end

  def idToToken(id)
    return id === 0 ? "" : idToToken(id >> 6) + map[id & 63] 
  end
end