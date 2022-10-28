require 'posts'
require 'pg'

RSpec.describe PostsRepo do

    def reset_socials
        seed_sql = File.read('spec/seeds.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'socials_test' })
        connection.exec(seed_sql)
    end

    before(:each) do 
        reset_socials
    end

    it "tests all posts method" do
        post = PostsRepo.new
        expect(post.all[2]['title']).to eq "A response to whatever" 
    end

    it "tests find posts method" do
        post = PostsRepo.new
        expect(post.find(2)[1]['title']).to eq "My thoughts"
    end

    it "tests create posts method" do
        post = PostsRepo.new
        post.create("Help me", "blank", 2000, 2)
        expect(post.find(2)[2]['title']).to eq "Help me"
    end

    it "tests delete 1 post method" do
        post = PostsRepo.new
        post.delete("My thoughts")
        expect(post.find(2)[0]['title']).to eq "A response to whatever"
    end

    it "tests delete 2 posts method" do
        post = PostsRepo.new
        post.delete("My thoughts")
        post.delete("A response to whatever")
        expect{post.find(2)[1]}.to raise_error "no record"
    end


end