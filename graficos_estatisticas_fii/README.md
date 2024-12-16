# Sprint 2 - Análise Estatística e Visualização de Fundos FII

Este script realiza uma análise estatística detalhada e cria visualizações gráficas para compreender a distribuição de variáveis importantes relacionadas a fundos de investimento imobiliário (FII). Ele também inclui análises univariadas utilizando estatísticas descritivas para extrair insights significativos.

---

## Objetivo

- Criar gráficos intuitivos para explorar a distribuição de variáveis categóricas e numéricas.
- Utilizar estatísticas descritivas para analisar tendência central, dispersão e separatrizes das variáveis `PRECO` e `DY`.
- Identificar insights estratégicos a partir dos resultados.

---

## Principais Funcionalidades

1. **Gráficos e Visualizações**:
   - **Gráfico de Setores (Pie Chart)**:
     - Exibe a distribuição percentual de fundos por setor.
     - Insight: Setores como "Indefinido" (28,6%), "Papéis" (15,2%) e "Lajes Corporativas" (13,3%) dominam o mercado.
   - **Gráfico de Barras (Bar Chart)**:
     - Mostra a frequência de fundos por tipo de gestão (ativa/passiva).
     - Insight: A gestão ativa é amplamente preferida pelos investidores.
   - **Histograma**:
     - Analisa a distribuição de preços antes e após remover outliers.
     - Insight: A maioria dos preços está abaixo de 500, com picos próximos de zero.
   - **Boxplot**:
     - Explora a distribuição do Dividend Yield (`DY`) e identifica outliers extremos.
     - Insight: A mediana do DY está em 5%, enquanto alguns fundos oferecem yields muito altos.

2. **Análise Estatística Descritiva**:
   - **Variável `PRECO`**:
     - Média: R$236,83.
     - Mediana: R$69,84.
     - Alta variabilidade nos preços, com coeficiente de variação de 427,77%.
     - Quartis: 25% dos fundos têm preços até R$7,28, e 75% até R$101,69.
   - **Variável `DY` (Dividend Yield)**:
     - Média: 15,91%.
     - Mediana: 6,46%.
     - Alta variabilidade nos dividendos, com coeficiente de variação de 555,57%.
     - Moda: 0 (fundos sem dividendos são comuns, com 36 ocorrências).

---

## Como Executar

1. **Pré-requisitos**:
   - R instalado.
   - Pacotes necessários: `readxl`, `DescTools`.

2. **Passos**:
   - Certifique-se de que o arquivo `dataset_fundos_fii.xlsx` está no mesmo diretório que o script.
   - Execute o script no RStudio ou no terminal R.

3. **Comandos principais**:
   ```r
   # Instalar pacotes (se necessário)
   install.packages("readxl")
   install.packages("DescTools")

   # Carregar o script
   source("SPRINT_2.R")

