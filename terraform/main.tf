resource "aws_instance" "my-machine" {
  # Creates four identical aws ec2 instances
  count = 3

  # All four instances will have the same ami and instance_type
  ami           = lookup(var.ec2_ami, var.region)
  key_name = "devopss"
  instance_type = var.instance_type # 
  tags = {
    # The count.index allows you to launch a resource 
    # starting with the distinct index number 0 and corresponding to this instance.
    Name = "my-machine-${count.index}"
  }
}

output "ec2_global_ips" {
  value = ["${aws_instance.my-machine.*.public_ip}"]
}
