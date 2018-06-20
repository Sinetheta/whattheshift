SparkPostRails.configure do |c|
  c.track_opens = true
  c.track_clicks = true
  c.return_path = 'returned@bounces.whattheshift.online'
  c.transactional = true
  c.inline_css = true
  c.html_content_only = true # devise sends html emails only https://github.com/plataformatec/devise/issues/2341
end
