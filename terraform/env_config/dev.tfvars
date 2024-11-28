# Network
vpc_cidr = "172.31.0.0/16"

vpc_id     = "vpc-078f74d4f4f9620b9"
subnet_ids = ["subnet-01cc79af9a3599a09", "subnet-023fc2a47841d0f2f"] # Public Subnets us-east-1a and us-east-1b

# RDS Instance
engine            = "sqlserver-ex"
engine_version    = "15.00.4410.1.v1"
instance_class    = "db.t3.medium"
db_name           = "db01"
username          = "admin"
allocated_storage = 30
availability_zone = "us-east-1a"
