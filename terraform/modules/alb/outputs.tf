output "alb_arn" {
  description = "The ARN of the Application Load Balancer"
  value       = aws_lb.alb.arn
}

output "target_group_arn" {
  value = aws_lb_target_group.target_group.arn
}

output "listener_arn" {
  value = aws_lb_listener.listener.arn
}

output "listener_https_arn" {
  value = aws_lb_listener.listener_https.arn
}
output "alb_dns" {
  description = "The DNS name of the ALB"
  value       = aws_lb.alb.dns_name
}

output "alb_zone_id" {
  description = "The zone ID of the ALB"
  value       = aws_lb.alb.zone_id
}


