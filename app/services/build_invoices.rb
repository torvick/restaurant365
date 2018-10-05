class BuildInvoices

  def self.build!(*args)
    new(*args).build
  end

  def initialize(args)
    @batch_id   = args[:batch_id]
    @user_id    = args[:user_id]
    @invoices   = args[:invoices]
  end

  def build
    url = URI(build_url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Post.new(url)
    request["content-type"] = 'application/json'
    request.body = build_body.to_json
    response = http.request(request)
    response.read_body
  end

  def build_body
    {
        BatchId:    @batch_id,
        userId:     @user_id,
        apInvoices: @invoices
    }
  end

  def build_url
    ENV['URL_RESTAURANT'] + '.restaurant365.net/APIv1/APInvoices'
  end
end