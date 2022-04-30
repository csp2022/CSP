##############################################  Security Modules ########################
resource "aws_kms_key" "ebs_kms_key" {
  name        = "websg"
  description = "KMS key for ebs encryption"
  deletion_window_in_days = 15
 policy = <<EOF
{
  "Version": "2012-10-17",
  "Id": "key-default-1",
  "Statement": [
    {
      "Sid": "Enable IAM User Permissions",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_kms_alias" "ebs_kms_key" {
  name = "alias/webapp_ebs_kms_key"
  target_key_id = "${aws_kms_key.ebs_kms_key.key_id}"
}



}

