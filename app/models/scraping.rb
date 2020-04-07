require 'mechanize'

class Scraping
  def self.lodestone_url(url)
    agent = Mechanize.new
    page = agent.get(url)
    blog_url = url.sub(/blog.*/m, "")
    # puts "URL:#{blog_url}"
    blog_password = page.search('.txt_selfintroduction').inner_text
    # puts "パスワード：#{blog_password}"
    chara_name = page.search('.frame__chara__name').inner_text
    # puts "ユーザー名：#{chara_name}"
    server_and_dc = page.search('.frame__chara__world')
    server = server_and_dc.inner_text.sub(/.\(.*/m, "")
    # puts "サーバー名：#{server}"
    dc = server_and_dc.inner_text.match(/(?<=\().*?(?=\))/)
    # puts "dc：#{dc}"
    return blog_url, blog_password, chara_name, server, dc
  end
end

# class Scraping
#   def self.movie_urls
#     agent = Mechanize.new
#     puts "urlの入力"
#     url = gets.chomp
#     puts "日記タイトルの入力"
#     title = gets.chomp
#     puts "日記本文の入力"
#     sentence = gets.chomp
#     page = agent.get(url)
#     blog_title = page.search('.entry__blog__box__area h2')
#     puts "タイトル：#{blog_title.inner_text}"
#     blog_sentence = page.search('.txt_selfintroduction')
#     puts "内容：#{blog_sentence.inner_text}"
#     chara_name = page.search('.frame__chara__name')
#     puts "ユーザー名：#{chara_name.inner_text}"
#     server_name = page.search('.frame__chara__world')
#     puts "サーバー名：#{server_name.inner_text}"
#   end
# end