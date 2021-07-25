#variable jenkins_ecr_repository_name {
 # type        = string
  #description = "Name for Jenkins controller ECR repository"
  #default     = "serverless-jenkins-controller"
#}

variable name_prefix {
  type    = string
  default = "serverless-jenkins"
}

variable vpc_id {
  type = string
}

// EFS
variable efs_enable_encryption {
  type    = bool
  default = true
}

variable efs_kms_key_arn {
  type    = string
  default = null // Defaults to aws/elasticfilesystem
}

variable efs_performance_mode {
  type    = string
  default = "generalPurpose" // alternative is maxIO
}

variable efs_throughput_mode {
  type    = string
  default = "bursting" // alternative is provisioned
}

variable efs_provisioned_throughput_in_mibps {
  type    = number
  default = null // might need to be 0
}

variable efs_ia_lifecycle_policy {
  type    = string
  #default = null // Valid values are AFTER_7_DAYS AFTER_14_DAYS AFTER_30_DAYS AFTER_60_DAYS AFTER_90_DAYS
  default = "AFTER_30_DAYS"
}

variable efs_subnet_ids {
  type        = list(string)
  description = "A list of subnets to attach to the EFS mountpoint"
  default     = null
}

#variable efs_access_point_uid {
 # type        = number
  #description = "The uid number to associate with the EFS access point" // Jenkins 1000
  #default     = 1000
#}

#variable efs_access_point_gid {
 # type        = number
  #description = "The gid number to associate with the EFS access point" // Jenkins 1000
  #default     = 1000
#}

#variable efs_enable_backup {
 # type    = bool
  #default = true
#}

#variable efs_backup_schedule {
 # type    = string
  #default = "cron(0 00 * * ? *)"
#}

#variable efs_backup_start_window {
 # type        = number
  #default     = 60
  #description = <<EOF
#A value in minutes after a backup is scheduled before a job will be
#canceled if it doesn't start successfully
#EOF
#}

#variable efs_backup_completion_window {
 # type        = number
  #default     = 120
  #description = <<EOF
#A value in minutes after a backup job is successfully started before
#it must be completed or it will be canceled by AWS Backup
#EOF
#}

#variable efs_backup_cold_storage_after_days {
 # type        = number
  #default     = 30
  #description = "Number of days until backup is moved to cold storage"
#}

#variable efs_backup_delete_after_days {
 # type        = number
  #default     = 120
  #description = <<EOF
#Number of days until backup is deleted. If cold storage transition
#'efs_backup_cold_storage_after_days' is declared, the delete value must
#be 90 days greater
#EOF
#}

variable tags {
  type        = map(any)
  description = "An object of tag key value pairs"
  default     = {}
}