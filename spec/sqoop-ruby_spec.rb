require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Sqoop" do
  it "should test database connection" do
    sqoop = Sqoop.new("mysql", "mysql.company.com", "company_db", "dbuser", "dbpassword", "hdfs://name-node/path/to/dir")
    sqoop.test_db
  end
end
