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
      super_long_name = "dkgjdsklgjlsdkjgklsdjgkldsjglksdjgklsdjlkgsdjlkgjsdklgjlksdjglksdjgklsdjgklsdjklgjsdklgjklsdjglksdjglksdjgljriowjoituger90s 9sdug90dsug9usd90gusd90 gu90sd u90ud890s7g 8 ugiugjipoujgi ujiogj iojh iohj oihjg oi"

      members = [for target in tolist(["read", "write"]) : "hello-${target}"]

      names = [
        { name = "test1" },
        { name = "test2" },
        { name = "test3" },
        { noname = "test4" },
      ]
    }
  }

  workspace = local.env[terraform.workspace]
}
