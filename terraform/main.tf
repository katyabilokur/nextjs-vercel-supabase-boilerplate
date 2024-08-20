resource "vercel_project_domain" "default" {
  project_id = vercel_project.this.id
  domain     = "katya-terraform.vercel.app"
}

resource "vercel_project" "this" {
  name      = "terraform-project"
  framework = "nextjs"

  git_repository = {
    type = "github"
    repo = "katyabilokur/nextjs-vercel-supabase-boilerplate"
  }
}

data "vercel_project_directory" "this" {
  path = "../"
}

resource "vercel_deployment" "this" {
  project_id  = vercel_project.this.id
  files       = data.vercel_project_directory.this.files
  path_prefix = data.vercel_project_directory.this.path
  production  = true
}
