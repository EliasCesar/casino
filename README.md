```md
# Infraestructura Casino Online — Terraform (ca-central-1)


Este proyecto crea:
- 2 VPC (Apps + DW) con subredes públicas/privadas en múltiples AZs
- VPC Peering, IGW, NAT GW (con EIP)
- ALB con certificado ACM
- 4 Grupos de Auto Scaling (frontsite, backoffice, webapi, gameapi) en subredes privadas
- RDS (PostgreSQL) en la VPC de DW
- ElastiCache Redis en la VPC de Apps
- S3 (estático) + CloudFront (CDN) con OAC
- Grupos de seguridad por capa y rutas específicas


## Requisitos
- Terraform >= 1.5
- Credenciales AWS con permisos para los servicios usados


## Cómo usar
1. Copia `terraform.tfvars.example` a `terraform.tfvars` y ajusta valores.
2. `terraform init`
3. `terraform plan`
4. `terraform apply`



## Nomenclatura
`<recurso>-<proyecto>-<operacion>-<num>-<region>`; por ejemplo:
- `ec2-promarketing-casino-online-ab12-ca-central-1`


## Limpieza
`terraform destroy` (esto eliminará EIP, NAT, etc.).
```


---