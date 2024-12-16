# Sprint 4 - Análise Bivariada e Multivariada

Este script realiza uma análise bivariada e multivariada detalhada de dados financeiros relacionados a fundos imobiliários. Ele utiliza técnicas estatísticas e de visualização para explorar as relações entre variáveis como `PRECO`, `ULTIMO_DIVIDENDO` e `PATRIMONIO`.

---

## Objetivo

- **Análise Bivariada**: Identificar e explorar a relação entre duas variáveis, como `PRECO` e `ULTIMO_DIVIDENDO`, por meio de gráficos, correlações e regressões.
- **Análise Multivariada**: Examinar a interação entre múltiplas variáveis e construir um modelo de regressão linear múltipla para prever `ULTIMO_DIVIDENDO` com base em `PRECO` e `PATRIMONIO`.

---

## Principais Funcionalidades

### 1. **Análise Bivariada**
   - **Gráficos de Dispersão**:
     - Visualização da relação entre `PRECO` e `ULTIMO_DIVIDENDO`.
     - Inclusão de uma linha de regressão linear para destacar a tendência.
   - **Covariância e Correlação**:
     - Covariância positiva sugere que `PRECO` e `ULTIMO_DIVIDENDO` tendem a aumentar juntos.
     - Correlação de Pearson (~0.989) indica uma relação linear forte e positiva.
   - **Modelo de Regressão Linear Simples**:
     - Construção de uma equação para prever `ULTIMO_DIVIDENDO` com base em `PRECO`.
     - Coeficiente de Determinação (R² ~ 97,78%) mostra que o modelo ajusta-se muito bem aos dados.

### 2. **Análise Multivariada**
   - **Gráficos de Dispersão Multivariada**:
     - Gráficos em 2D e 3D mostrando as relações entre `PRECO`, `ULTIMO_DIVIDENDO` e `PATRIMONIO`.
   - **Matriz de Covariância e Correlação**:
     - Identificação de relações positivas e negativas entre as variáveis.
     - Correlação baixa entre `PATRIMONIO` e as outras variáveis, indicando pouca influência direta.
   - **Modelo de Regressão Linear Múltipla**:
     - Construção de um modelo para prever `ULTIMO_DIVIDENDO` com base em `PRECO` e `PATRIMONIO`.
     - Coeficiente de Determinação (R² ~ 97,78%) confirma um ajuste robusto do modelo.
   - **Previsões**:
     - Previsão de `ULTIMO_DIVIDENDO` com base em valores específicos de `PRECO` e `PATRIMONIO`.

---

## Como Executar

1. **Pré-requisitos**:
   - R instalado.
   - Pacotes necessários: `readxl`, `ggplot2`, `dplyr`, `plotly`, `GGally`.

2. **Passos**:
   - Certifique-se de que o arquivo `dataset.xlsx` está no mesmo diretório que o script.
   - Execute o script no RStudio ou terminal R.

3. **Comandos principais**:
   ```r
   # Instalar pacotes (se necessário)
   install.packages(c("readxl", "ggplot2", "dplyr", "plotly", "GGally"))

   # Carregar o script
   source("SPRINT_4.R")

