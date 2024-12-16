# Análise de Distribuição de Frequências - Fundos de Investimento Imobiliário (FII)

Este script realiza uma análise estatística detalhada de dados relacionados a fundos de investimento imobiliário (FII). O objetivo é compreender a distribuição de frequências de variáveis como número de cotistas, cotas, preços e patrimônio, oferecendo insights estratégicos com base nos resultados.

---

## Objetivo

- Analisar a distribuição de frequências das variáveis principais do dataset.
- Identificar padrões e insights relacionados ao comportamento de cotistas, cotas, preços e patrimônio dos fundos.
- Visualizar as distribuições através de gráficos e tabelas, facilitando a interpretação dos dados.

---

## Principais Funcionalidades

1. **Carregamento e Pré-processamento do Dataset**:
   - Remoção de vírgulas em valores numéricos.
   - Conversão de dados para o tipo numérico.
   - Tratamento de valores ausentes (NA).

2. **Análise de Número de Cotistas (`N_COTISTAS`)**:
   - Criação de tabelas de frequência absoluta, acumulada, relativa e relativa acumulada.
   - Geração de gráficos de barras e histogramas para visualizar a distribuição.
   - Insights:
     - Fundos com exatamente 1 cotista são raros (apenas 10,34% dos casos).
     - Apenas 6,9% dos fundos possuem 2 cotistas, destacando a baixa repetição de números exatos.

3. **Análise de Número de Cotas (`N_COTAS`)**:
   - Mesma abordagem utilizada para `N_COTISTAS`.
   - Insights:
     - Valores únicos de cotas são dominantes (95,96% dos fundos possuem 1 cota).
     - Fundos com 2 ou mais cotas são muito raros.

4. **Análise de Preço das Cotas (`PRECO`)**:
   - Segmentação de preços em categorias (quantis) para melhor distribuição.
   - Geração de tabelas de frequência e gráficos.
   - Insights:
     - A distribuição de preços é equilibrada, com frequências próximas entre as categorias.
     - 70,59% das cotações estão abaixo de 95,1 unidades, indicando um foco em faixas de preço mais acessíveis.

5. **Análise de Patrimônio dos Fundos (`PATRIMONIO`)**:
   - Mesma abordagem de categorias por quantis.
   - Insights:
     - Distribuição uniforme entre categorias.
     - Fundos de grande porte representam uma porção relevante (11,76% dos fundos possuem patrimônios muito elevados).

6. **Cálculo de Correlação**:
   - Análise da relação entre o número de cotistas e cotas.

---

## Como Executar

1. **Pré-requisitos**:
   - R instalado em sua máquina.
   - Pacotes necessários: `readxl`.

2. **Passos para execução**:
   - Certifique-se de que o arquivo `dataset_fundos_fii.xlsx` está na mesma pasta que o script.
   - Execute o script no RStudio ou no terminal R.

3. **Comandos principais**:
   ```r
   # Carregar o dataset
   df <- read_xlsx("dataset_fundos_fii.xlsx")
   
   # Executar as análises
   source("SPRINT_1.R")

