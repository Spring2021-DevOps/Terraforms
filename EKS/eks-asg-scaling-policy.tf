

resource "aws_autoscaling_policy" "scaleUp" {
  name                   = "Autoscaling-Scaleup-Policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 60
  autoscaling_group_name = aws_autoscaling_group.demo.name
}

resource "aws_autoscaling_policy" "scaleDown" {
  name                   = "Autoscaling-ScaleDown-Policy"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 60
  autoscaling_group_name = aws_autoscaling_group.demo.name
}