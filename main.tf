data "external" "minio_bucket" {
  program = ["sh", "-c", "kubectl get deployment pet2cattle -n pet2cattle -o jsonpath='{\"{\"}\"minio-bucket\": \"{.spec.template.spec.containers[0].env[?(@.name == \"MINIO_BUCKET\")].value}\"}'"]
}

output "minio_bucket" {
  value = data.external.minio_bucket.result
}
