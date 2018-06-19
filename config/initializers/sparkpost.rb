SparkPostRails.configure do |c|
  c.track_opens = true
  c.track_clicks = true
  c.return_path = 'returned@bounces.whattheshift.online'
  c.transactional = true
  c.inline_css = true
end
