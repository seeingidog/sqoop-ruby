class Sqoop

  def initialize(jdbc_conn, db_host, db_name, db_user, password, hdfs_url)
    raise "HDFS URL must be a hdfs or s3 resource" unless ['hdfs','s3'].include?(hdfs_url.split(':')[0].downcase)
    @hdfs_url = hdfs_url
    @db_options = " --connect jdbc:#{jdbc_conn.downcase}://#{db_host}/#{db_name} --username #{db_user} --password #{password}"
  end
  
  def test_db
    output = system("sqoop list-databases" + @db_options)
    raise "Database connection failed" if output.nil?
    output
  end
  
  def import(*table)
    if table != []
      sqoop_command = "sqoop import" + @db_options + " --table #{table}"
    else
      sqoop_command = "sqoop import-all-tables " + @db_options
    end
    sqoop_command += " --target-dir #{@hdfs_url}"
    output = system(sqoop_command)
    raise "Sqoop import failed" if output.nil?
    output
  end

  def export(table)
    sqoop_command = "sqoop export" + @db_options + " --table #{table} --export-dir #{@hdfs_url}"
    output = system(sqoop_command)
    raise "Sqoop export failed" if output.nil?
    output  
  end
  
end
