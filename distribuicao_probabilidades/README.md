# Sprint 3 - Distribuição e Probabilidades

Este script em R realiza análises probabilísticas e testes de hipóteses para explorar a distribuição da variável `PRECO` em um conjunto de dados. Ele fornece insights relevantes para a tomada de decisão com base em evidências estatísticas.

---

## Objetivo

- Analisar probabilidades associadas à variável `PRECO` com base em sua distribuição.
- Realizar testes de hipóteses para validar suposições sobre a média amostral e populacional.
- Identificar padrões que possam orientar decisões estratégicas no contexto financeiro.

---

## Principais Funcionalidades

1. **Análise de Distribuição e Probabilidades**:
   - Probabilidade de `PRECO` ser menor que a média.
   - Probabilidade de `PRECO` ser maior que a mediana.
   - Probabilidade de `PRECO` estar dentro do intervalo [média - 2*SD, média + 2*SD].
   - **Insights**:
     - 50% dos valores estão abaixo da média (distribuição normal).
     - 56,55% dos valores estão acima da mediana, indicando leve assimetria.
     - 95,45% dos valores estão dentro de 2 desvios-padrão, confirmando a concentração em torno da média.

2. **Testes de Hipótese (Teste Z)**:
   - **Teste A**: Verifica se a média amostral é menor que a média populacional (nível de significância de 5%).
   - **Teste B**: Avalia se a média amostral é maior que a média populacional (nível de significância de 10%).
   - **Teste C**: Examina se a média amostral é diferente da média populacional (nível de significância de 1%).
   - **Insights**:
     - Permite identificar tendências de alta ou baixa nos preços.
     - Orienta decisões baseadas em variações significativas em relação à média populacional.

3. **Tomada de Decisão Baseada em Probabilidades e Testes**:
   - Probabilidades e testes estatísticos auxiliam gestores a prever comportamentos futuros, ajustar estratégias de investimento e gerenciar riscos.

---

## Como Executar

1. **Pré-requisitos**:
   - R instalado.
   - Pacote necessário: `readxl`.

2. **Passos**:
   - Certifique-se de que o arquivo `dataset.xlsx` está no mesmo diretório que o script.
   - Execute o script no RStudio ou terminal R.

3. **Comandos principais**:
   ```r
   # Instalar pacotes (se necessário)
   install.packages("readxl")

   # Carregar o script
   source("SPRINT_3.R")

