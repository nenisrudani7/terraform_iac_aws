
# -------------------------------------------------------------------
# here we specifie this for key and source of object
resource "aws_s3_object" "app_source_bundle" {
  bucket = var.bucket_id
  key    = var.key
  source = var.app_zip_path
}


resource "aws_elastic_beanstalk_application" "this" {
  name = var.ebs_name
}

# Create Elastic Beanstalk Application Version
resource "aws_elastic_beanstalk_application_version" "this" {
  application = aws_elastic_beanstalk_application.this.name
  name        = var.version_name
  bucket      = var.bucket_id
  key         = aws_s3_object.app_source_bundle.key
}

# Create Elastic Beanstalk Environment
resource "aws_elastic_beanstalk_environment" "this" {
  name                = var.environment_name
  application         = aws_elastic_beanstalk_application.this.name
  solution_stack_name = var.solution_stack_name
  version_label       = aws_elastic_beanstalk_application_version.this.name
  tier                = var.tier

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = var.instance_profile_name
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = var.vpc_id
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = join(",", var.subnets)
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.ebs_instance_type
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    value     = var.public_access
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBScheme"
    value     = "public"
  }
}
