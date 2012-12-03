class ResponseTimer
  def initialize(app, message)
    @app = app
    @message = message
  end

  def call(env)
    @start = Time.now
    status, headers, response = @app.call(env)
    if (headers && (headers["Content-Type"].include? "text/html"))
      @stop = Time.now
      [status, headers, ["<!-- #{@message}: #{@stop - @start} -->\n" + response.body]]
    else
      [status, headers,[response]]
    end

  end
end
