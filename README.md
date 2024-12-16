# Análises Estatísticas de Fundos Imobiliários (FII)

Este repositório contém uma série de análises estatísticas aplicadas a dados de Fundos de Investimento Imobiliário (FII). Os scripts foram desenvolvidos como parte das atividades da disciplina de **Statistical Computing with R**, no curso de **Tecnologia em Inteligência Artificial**, durante o primeiro e segundo semestre da graduação. O objetivo dessas atividades foi aplicar conceitos de estatística descritiva, distribuição de frequências, probabilidades e análise multivariada, desenvolvendo habilidades práticas que podem ser aplicadas em projetos reais no mercado de trabalho.

Além de cumprir os requisitos acadêmicos, este portfólio demonstra minha capacidade de realizar análises estatísticas detalhadas, criar visualizações intuitivas e construir modelos preditivos.

---

## Estrutura do Projeto

As análises estão organizadas em pastas separadas, cada uma contendo scripts específicos e seus respectivos **README.md** detalhados:

1. **[Análise de Distribuição de Frequências](./analise_distribuicao_frequencias)**
   - Exploração da frequência absoluta, acumulada, relativa e relativa acumulada de variáveis como número de cotistas e cotas.
   - Gráficos de barras e histogramas para visualizar distribuições.
   - **Insights**:
     - Valores exatos de cotistas e cotas são raros, indicando baixa repetição nos fundos.

2. **[Gráficos e Estatísticas Descritivas](./graficos_estatisticas_fii)**
   - Geração de gráficos de setores, barras, histogramas e boxplots.
   - Análise descritiva de medidas como média, mediana, variância e quartis.
   - **Insights**:
     - A gestão ativa predomina entre os fundos.
     - A maioria dos preços está concentrada abaixo de 500.

3. **[Distribuição e Probabilidades](./distribuicao_probabilidades)**
   - Cálculo de probabilidades relacionadas à variável `PRECO`.
   - Testes de hipótese (Teste Z) para validar suposições sobre médias amostrais e populacionais.
   - **Insights**:
     - Alta probabilidade (95,45%) de valores estarem próximos da média.
     - Testes estatísticos indicam relações significativas para decisões estratégicas.

4. **[Análise Bivariada e Multivariada](./analise_bivariada_multivariada)**
   - Exploração das relações entre `PRECO`, `ULTIMO_DIVIDENDO` e `PATRIMONIO`.
   - Construção de modelos de regressão linear simples e múltipla.
   - **Insights**:
     - Relação forte e positiva entre preço e dividendos.
     - Modelos preditivos com alta precisão (R² ajustado ~97,64%).

---

## Pré-requisitos

1. **Ambiente**:
   - R instalado em sua máquina.

2. **Pacotes Necessários**:
   - `readxl`, `ggplot2`, `dplyr`, `plotly`, `GGally`.

3. **Dataset**:
   - O arquivo `dataset.xlsx` deve estar na raiz do repositório.
