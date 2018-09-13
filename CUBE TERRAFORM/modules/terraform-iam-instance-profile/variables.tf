variable "role_name" {
  default     = "BASE_POLICY"
  description = "The name that will be used both for role and instance profile. Should be downcase, with words separated by dashes, i.e. 'gitlab-runner'."
}

variable "assume_role_policy" {
  default     = ""
  description = "In case specific assume role policy is needed, it can be provided via this variables. Otherwise default is picked from the module repo."
}

variable "role_policy" {
  default     = ""
  description = "Policy document to be attached as inline policy to the new role. Should be valid policy json."
}

variable "number_of_extra_policies" {
  default = "6"
}

variable "extra_policies" {
  type        = "list"
  description = "List of extra policies to be attached to the role. This is in case not everything is covered by role_policy and some policies were created in other place."
}
