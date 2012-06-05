require 'custom_logger'

# Configure the customer logger here ROR4REAL
logfile = File.open(Rails.root.join('log/custom.log'), File::WRONLY|File::APPEND|File::CREAT, 0666)  #create log file/append mode
logfile.sync = true  #automatically flushes data to file
CUSTOM_LOGGER = CustomLogger.new(logfile)  #constant accessible anywhere
