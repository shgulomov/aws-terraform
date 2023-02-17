output "launch_template" {
  value = {
    launch_template = aws_launch_template.launch_template.id
  }
}
output "launch_template_version" {
  value = {
    launch_template_version = aws_launch_template.launch_template.latest_version
  }
}
output "security_group" {
  value = {
    security_group = aws_security_group.sg.id
  }
}
output "auto_scaling_group" {
  value = {
    auto_scaling_group = aws_autoscaling_group.asg.id
  }
}
output "auto_scaling_group_arn" {
  value = {
    auto_scaling_group_arn = aws_autoscaling_group.asg.arn
  }
}