require 'mysql2'

module AmarokDataCommon

  class Database
    attr_accessor :database, :username, :password

    def connect_to_db
      @connect_to_db ||= Mysql2::Client.new host: host, database: database, username: username, password: password
    rescue Mysql2::Error
      nil
    end

    def connect_to_dbms
      @connect_to_dbms ||= Mysql2::Client.new host: :localhost, username: username, password: password
    rescue Mysql2::Error
      nil
    end

    def credentials_valid?
      !connect_to_dbms.nil?
    end

    def have_access_to_db?
      !connect_to_db.nil?
    end

    def have_tables?
      fail unless have_access_to_db? # todo

      connect_to_db.query('SHOW TABLES').count > 0
    end

    def host
      :localhost
    end

    def to_config
      [:host, :database, :username, :password].each_with_object({}) { |memo, p| memo[p] = send(p); memo }
    end
  end

end
