#Sanity checks, check if Mongo Shell tool was installed and if connection string was supplied
if ! command -v mongo
  then
    echo "Mongo Shell could not be found, please install the tool"
    exit
fi

usr= $1
pass= $2
server= $3


mongo --host $server --authenticationDatabase admin --ssl --username $usr --password $pass <field_conversion.js