class DatabaseConnection
  def self.setup(dbname)
    @connection = PG.connect(dbname: dbname)
    # Using a class instance variable to store the connection 
    # as the class is a 'SINGLETON OBJECT' - it will never be instantiated 
    # as there is only one DatabaseConnection in the application
  end

  def self.connection
    @connection
  end
end
