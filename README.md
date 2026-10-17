# Interactive Cloud Architecture

Biblioteca de arquiteturas interativas para **AWS, Google Cloud e Azure**, voltada a estudos, apresentações e certificações.

## Estrutura

```text
aws/
  README.md
  assets/category-backgrounds/    # 16 PNG astronômicos originais
  saa-c03/
    README.md
    gateway-endpoints/index.html  # arquitetura existente (preservada)
    aws-backup/index.html         # nova arquitetura
azure/
gcp/
index.html                       # catálogo gerado
update-catalog.sh                # indexação automática
```

## AWS SAA-C03

- [Gateway Endpoints](aws/saa-c03/gateway-endpoints/): VPC Gateway Endpoints.
- [AWS Backup](aws/saa-c03/aws-backup/): EBS, EC2, Aurora, planos, cofres, KMS, políticas, fluxos e quiz.

Acesse as demonstrações pelo [catálogo](index.html).

## Identidade visual

O acervo de 16 fundos astronômicos foi fornecido pelo autor em 17/10/2026. Cada categoria utiliza o arquivo original correspondente, conforme o [mapeamento e as somas SHA-256](aws/assets/category-backgrounds/README.md). Não são usadas imagens substitutas.

## Como adicionar arquiteturas

1. Crie `aws/saa-c03/nova-arquitetura/index.html` (ou a categoria desejada em GCP/Azure).
2. Reutilize os ativos compartilhados em `aws/assets/category-backgrounds/`.
3. Execute `chmod +x update-catalog.sh && ./update-catalog.sh`.
4. Faça `git add . && git commit -m "Add new interactive architecture" && git push`.

O script `update-catalog.sh` existente descobre automaticamente todos os arquivos `index.html` dentro de `aws/`, `gcp/` e `azure/`.

As arquiteturas são materiais didáticos, não substituem a documentação oficial do provedor.
