locals {
  a            = "a"
  b            = "b"
  c            = "c"
  default_name = join("-", [local.a, local.b, local.c, terraform.workspace])

  env = {
    default = {
      default_name = "default"
    }
    dev = {
      default_name    = "dev"
      super_long_name = "dkgjdsklgjlsdkjgklsdjgkldsjglksdjgklsdjlkgsdjlkgjsdklgjlksdjglksdjgklsdjgklsdjklgjsdklgjklsdjglksdjglksdjgljriowjoituger90s"

      members       = [for target in tolist(["read", "write"]) : "hello-${target}"]
      members_again = join(",", [for target in tolist(["read", "write"]) : "\"hello-${target}\""])
      names = [
        { name = "test1" },
        { name = "test2" },
        { name = "test3" },
        { noname = "test4" },
      ]

      source_destination_list = flatten([
        for src in ["a", "b", "c"] : [
          for dest in ["a", "b", "c"] : {
            src  = src
            dest = dest
          }
        ]
      ])
    }
  }

  workspace = local.env[terraform.workspace]
}

locals {

}
