terraform {
  backend "gcs" {
    bucket = "katyabilokur-terraform-state"
    prefix = "tfstate/nextjs-vercel-supabase-boilerplate"
  }
}
