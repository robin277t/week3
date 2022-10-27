class Post
    attr_accessor :id, :title, :contents, :views, :account_id
end

class PostsRepo

    def all
        DatabaseConnection.exec_params("select * from posts",[])
    end


    def find(pst_id)
        result = DatabaseConnection.exec_params("select * from posts where account_id = $1",[pst_id])
        #fail "no record found" unless result[0] = true
    end


    def create(title,contents,views,account_id)
        sql = "INSERT INTO posts (title, contents, views, account_id) VALUES ($1, $2, $3, $4)"
        DatabaseConnection.exec_params(sql,[title,contents,views,account_id])
    end


    def delete(pst_title)
            sql = "DELETE FROM posts where title = $1"
            results = DatabaseConnection.exec_params(sql, [pst_title])
    end

    
    def update(oldviews, newviews)
        sql = "UPDATE posts SET views = $2  WHERE views = $1" 
        results = DatabaseConnection.exec_params(sql, [oldval, newval])
    end

end
