
resource "aws_security_group" "worker_group_a" {
  name_prefix = "${var.cluster_name}_worker_group_a"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      var.worker_a_cidr_blocks,
    ]
  }
}

resource "aws_security_group" "worker_group_b" {
  name_prefix = "${var.cluster_name}_worker_group_b"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      var.worker_b_cidr_blocks,
    ]
  }
}

resource "aws_security_group" "all_worker" {
  name_prefix = "all_worker_management"
  vpc_id      = var.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = var.all_cidr_blocks
  }
}
