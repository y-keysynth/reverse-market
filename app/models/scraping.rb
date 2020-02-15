require 'mechanize'

class Scraping
  def self.lodestone_url
    agent = Mechanize.new
    # puts "URLを入力"
    # url = gets.chomp
    # page = agent.get(url)
    page = agent.get("https://jp.finalfantasyxiv.com/lodestone/character/28815431/blog/4345570/")
    blog_sentence = page.search('.txt_selfintroduction')
    puts "内容：#{blog_sentence.inner_text}"
    chara_name = page.search('.frame__chara__name')
    puts "ユーザー名：#{chara_name.inner_text}"
    server_name = page.search('.frame__chara__world')
    puts "サーバー名：#{server_name.inner_text}"

    
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