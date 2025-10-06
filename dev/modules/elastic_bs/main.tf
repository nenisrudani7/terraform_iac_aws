

    resource "aws_s3_object" "app_source_bundle" {
      bucket = var.bucket_id
      key    = var.key # Or a dynamic key using uuid()
      source = var.app_zip_path # Path to your local ZIP file
    }

# ELASTIC BEANSTALK APPLICATION


resource "aws_elastic_beanstalk_application" "tf_test" {
  name        = var.ebs_name
}
 resource "aws_elastic_beanstalk_application_version" "my_app_version" {
      application = aws_elastic_beanstalk_application.tf_test.name
      name        = var.version_name
      bucket      = var.bucket_id
      key         = aws_s3_object.app_source_bundle.key
    }

# ELASTIC BEANSTALK ENVIRONMENT

resource "aws_elastic_beanstalk_environment" "tf_test_env" {
  name                = var.environment_name
  application         = aws_elastic_beanstalk_application.tf_test.name
  solution_stack_name = var.solution_stack_name
  version_label       = aws_elastic_beanstalk_application_version.my_app_version.name
  tier                = var.tier

  setting {
    namespace = var.autoscaling_namespace
    name      = var.autoscaling_name
    value     = aws_iam_instance_profile.tf-ellb.name
  }

  setting {
    namespace = var.vpc_name_space
    name      = "VPCID"
    value     = var.vpc_id
  }

  setting {
    namespace = var.vpc_name_space
    name      = "Subnets"
    value     = var.subnet_id
  }

  setting {
    namespace = var.instance_type
    name      = "InstanceTypes"
    value     = var.ebs_instance_type
  }

  setting {
    namespace = var.vpc_name_space
    name      = "AssociatePublicIpAddress"
    value     = var.public_access
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBScheme"
    value     = "public"
  }
}

