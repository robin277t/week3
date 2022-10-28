require 'database_connection'

class Account
    attr_accessor :id, :username, :email
end

class AccountsRepo

    def all
      ##VERSION WORKING FROM PAIRING###  
      results = DatabaseConnection.exec_params('SELECT * FROM accounts', [])
      accounts = []
      results.each do |record|
        account = Account.new
        account.id = record['id']
        account.username = record['username']
        account.email = record['email']  
        accounts << account
      end
      return accounts
    end  

    def all2
        ##VERSION THAT USES .MAP
        results = DatabaseConnection.exec_params('SELECT * FROM accounts', [])
        results_array = results.map {|dataline| dataline}
    end  

    def all3
        ##VERSION THAT JUST RETURNS THE RESULT SET 
        DatabaseConnection.exec_params('SELECT * FROM accounts', [])
    end  



    def find(acc)
        results = DatabaseConnection.exec_params('SELECT * FROM accounts WHERE id = $1', [acc])
        fail "no record!!!!" unless results.ntuples > 0
        accounts = []
        results.each do |record|
            account = Account.new
            account.id = record['id']
            account.username = record['username']
            account.email = record['email'] 
            accounts << account
          end
        return accounts
    end

    def find2(acc_username)
        results = DatabaseConnection.exec_params("select * from accounts where username = $1",[acc_username])
        fail "no record!" unless results.ntuples > 0 
        results.values
        
    end


    def create(username, email)
        sql = "INSERT INTO accounts (username, email) VALUES ($1, $2)"
        results = DatabaseConnection.exec_params(sql, [username, email])
    end


    def delete(username)
        sql = "DELETE FROM accounts where username = $1"
        results = DatabaseConnection.exec_params(sql, [username])
    end


    def update(oldval, newval)
        sql = "UPDATE accounts SET email = $2  WHERE email = $1" 
        results = DatabaseConnection.exec_params(sql, [oldval, newval])
    end

end

