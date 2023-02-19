## AWS VPC
This terraform scripts aimed to provision AWS VPC.

## Architecture
![image](https://user-images.githubusercontent.com/111745208/219783744-6a8be600-47eb-4d09-8494-f211d6986921.png)

### Install 

```shell
terragrunt init
terraform plan
terraform apply
```

### Destroy
```shell
terraform destroy -auto-approve
```



> **_NOTE:_** 
> Before commit changes in scripts do not forget to format
> ```shell
> terraform fmt
> ```

## Requirements

1. Terraform
2. Terragrunt

## Providers

AWS

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2"></a> [ec2](#module\_ec2) | ./ec2/ | v4.55.0 |
| <a name="module_s3"></a> [s3](#module\_s3) | ./s3/ | v4.55.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./network/ | v4.55.0 |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acl"></a> [acl](#input\_acl) | The canned ACL to apply. | `string` | `"private"` | no |
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | The AMI to deploy. | `string` | `"ami-0c2b8ca1dad447f8a"` | no |
| <a name="input_auto_scaling_group_name"></a> [auto\_scaling\_group\_name](#input\_auto\_scaling\_group\_name) | The name of the auto scaling group. | `string` | n/a | yes |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | The availability zones to deploy into. | `list(any)` | n/a | yes |
| <a name="input_billing_mode"></a> [billing\_mode](#input\_billing\_mode) | Controls how you are charged for read and write throughput and how you manage capacity. | `string` | `"PAY_PER_REQUEST"` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the S3 bucket to store the Terraform state file. | `string` | `"tfstate-cloud-s3"` | no |
| <a name="input_desired_capacity"></a> [desired\_capacity](#input\_desired\_capacity) | The desired capacity of the auto scaling group. | `number` | `1` | no |
| <a name="input_dynamodb_table"></a> [dynamodb\_table](#input\_dynamodb\_table) | The name of the DynamoDB table to use for locking. | `string` | `"cloud-terraform-lock"` | no |
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | Enable DNS hostnames in the VPC. | `bool` | `true` | no |
| <a name="input_enable_dns_support"></a> [enable\_dns\_support](#input\_enable\_dns\_support) | Enable DNS support in the VPC. | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment to deploy into. | `string` | `"dev"` | no |
| <a name="input_hash_key"></a> [hash\_key](#input\_hash\_key) | The name of the hash key. | `string` | `"LockID"` | no |
| <a name="input_hash_key_type"></a> [hash\_key\_type](#input\_hash\_key\_type) | The type of the hash key. | `string` | `"S"` | no |
| <a name="input_inbound_cidr_blocks"></a> [inbound\_cidr\_blocks](#input\_inbound\_cidr\_blocks) | The CIDR blocks to allow inbound traffic from. | `list(any)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_inbound_port_from"></a> [inbound\_port\_from](#input\_inbound\_port\_from) | The port to allow inbound traffic from. | `number` | `22` | no |
| <a name="input_inbound_port_to"></a> [inbound\_port\_to](#input\_inbound\_port\_to) | The port to allow inbound traffic to. | `number` | `22` | no |
| <a name="input_inbound_protocol"></a> [inbound\_protocol](#input\_inbound\_protocol) | The protocol to allow inbound traffic. | `string` | `"tcp"` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | The name of the EC2 instance. | `string` | `"terraform-ec2-instance"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The instance type to deploy. | `string` | `"t2.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | The key name to deploy. | `string` | `"my-key"` | no |
| <a name="input_launch_configuration_name"></a> [launch\_configuration\_name](#input\_launch\_configuration\_name) | The name of the launch configuration. | `string` | n/a | yes |
| <a name="input_launch_template_name"></a> [launch\_template\_name](#input\_launch\_template\_name) | The name of the launch template. | `string` | `"terraform-ec2-lt"` | no |
| <a name="input_launch_template_version"></a> [launch\_template\_version](#input\_launch\_template\_version) | The version of the launch template. | `string` | `"$Latest"` | no |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | The maximum size of the auto scaling group. | `number` | `1` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | The minimum size of the auto scaling group. | `number` | `1` | no |
| <a name="input_private_subnet"></a> [private\_subnet](#input\_private\_subnet) | The CIDR block for the private subnet. | `list(any)` | n/a | yes |
| <a name="input_public_subnet"></a> [public\_subnet](#input\_public\_subnet) | The CIDR block for the public subnet. | `list(any)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to deploy into. | `string` | n/a | yes |
| <a name="input_security_group_description"></a> [security\_group\_description](#input\_security\_group\_description) | The description of the security group. | `string` | `"Security group for the EC2 instance."` | no |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | The name of the security group. | `string` | `"terraform-ec2-sg"` | no |
| <a name="input_sse_algorithm"></a> [sse\_algorithm](#input\_sse\_algorithm) | The server-side encryption algorithm to use. | `string` | `"AES256"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Default tags | `map(any)` | <pre>{<br>  "dynamodb_tag": "DynamoDB Terraform State Lock Table",<br>  "lt_name": "Launch template for EC2 instances",<br>  "s3_tag": "S3 Terraform State Bucket"<br>}</pre> | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | The user data to deploy. | `string` | `"echo 'Hello, World!' > index.html"` | no |
| <a name="input_versioning"></a> [versioning](#input\_versioning) | Enable versioning on the S3 bucket. | `bool` | `true` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | The CIDR block for the VPC. | `string` | n/a | yes |
