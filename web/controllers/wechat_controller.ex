defmodule PhoenixPost.WechatController do
  use PhoenixPost.Web, :controller
  import Plug.Conn
  import Application
  require HTTPoison
  require Poison

  @app_id fetch_env!(:phoenix_post, :wechat_app_id)
  @secret fetch_env!(:phoenix_post, :wechat_app_secret)

  def index(conn, _params) do
    redirect_uri = '121.42.36.92/login'
    redirect_url = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=#{@app_id}&redirect_uri=#{redirect_uri}&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect"
    redirect conn, external: redirect_url
    # response = HTTPoison.get!("https://api.github.com")
    # {:ok, result} = Poison.decode(response.body)
    # render conn, "index.json", response: result
  end

  def login(conn, _params) do
    code = fetch_query_params(conn, "code")
    getAccessTokenUrl = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=#{@app_id}&secret=#{@secret}&code=CODE&grant_type=authorization_code"
    response = HTTPoison.get!(getAccessTokenUrl)
    {:ok, result} = Poison.decode(response.body)
    access_token = result["access_token"]
    openId = result["openId"]
    refresh_token = result["refresh_token"]

    getUserInfoUrl = "https://api.weixin.qq.com/sns/userinfo?access_token=#{@access_token}&openid=#{@openId}&lang=zh_CN"
    response = HTTPoison.get!(getUserInfoUrl)
    {:ok, result} = Poison.decode(response.body)
    render conn, "index.json", response: result
  end
end