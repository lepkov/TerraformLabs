resource "aws_key_pair" "generated_key" {
  key_name   = var.aws_keypair_name
  public_key = var.ssh_key

  tags = {
    Project = var.project_name
    ID      = var.project_id
  }
}