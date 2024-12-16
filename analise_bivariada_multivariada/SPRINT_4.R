######################################################
### SPRINT 4 - Análise Bivariada                   ###
######################################################

# bibliotecas necessárias
library(ggplot2)
library(dplyr)
library(readxl)

# Dataset
dados <- read_excel("dataset.xlsx")

# Remover linhas com NA para as variáveis PRECO e ULTIMO_DIVIDENDO
dados_clean <- na.omit(dados, cols = c("PRECO", "ULTIMO_DIVIDENDO"))

## EX (A) ##

# Gráfico de dispersão
#Relação entre preço e último dividendO

ggplot(dados_clean, aes(x = PRECO, y = ULTIMO_DIVIDENDO)) +
  geom_point() +
  geom_smooth(method = "lm", col = "red") +
  labs(title = "Gráfico de Dispersão entre Preço e Último Dividendo",
       x = "Preço (R$)",
       y = "Último Dividendo (R$)") +
  theme_minimal()

## EX (B) ##

# Covariância e CorrelaçãO
#Medir a direção e a força da associação linear entre as duas variáveis

covariancia <- cov(dados_clean$PRECO, dados_clean$ULTIMO_DIVIDENDO)
correlacao <- cor(dados_clean$PRECO, dados_clean$ULTIMO_DIVIDENDO)

# Imprimindo covariância e correlação
print(paste("Covariância:", covariancia))
print(paste("Correlação de Pearson:", correlacao))

# Interpretação da covariância
cat("Interpretação da Covariância:\n")
cat("A covariância entre o preço das cotas e o último dividendo é positiva, indicando que as duas variáveis tendem a se mover na mesma direção. Um valor de covariância de 3043.4549 sugere que essa tendência é bastante pronunciada, com aumento no preço das cotas geralmente associado a um aumento no último dividendo.\n\n")

# Interpretação da correlação de Pearson
cat("Interpretação da Correlação de Pearson:\n")
cat("A correlação de Pearson entre o preço das cotas e o último dividendo é 0.9888, indicando uma correlação linear positiva muito forte. Esse valor próximo de 1 sugere que a relação entre essas variáveis é quase perfeitamente proporcional. Isso implica que quase toda variação no último dividendo pode ser explicada por mudanças no preço, com muito pouco ruído ou variação inexplicada.\n\n")

cat("Implicações:\n")
cat("Essa forte correlação sugere que investidores ou analistas que observam o preço das cotas podem ter uma boa indicação do comportamento dos dividendos baseados apenas nesta variável. Isso pode ser útil para previsões ou para avaliar a atratividade de investimentos onde dividendos consistentes são um fator importante. Portanto, a relação entre preço das cotas e dividendos é um bom preditor dos dividendos futuros, sendo relevante para estratégias de investimento focadas em rendimentos de dividendos.\n")


## EX (C) ##

#Gráfico de Correlação Linear de Pearson.
#A linha vermelha no gráfico de dispersão representa a correlação linear de Pearson, 
#que como observado, é bastante forte.

# Gráfico (1) de dispersão com linha de regressão linear
ggplot(dados_clean, aes(x = PRECO, y = ULTIMO_DIVIDENDO)) +
  geom_point(aes(color = "Blue"), alpha = 0.5) +  # Pontos de dados
  geom_smooth(method = "lm", color = "red") +    # Linha de regressão linear
  labs(title = "Gráfico de Correlação Linear de Pearson entre Preço e Último Dividendo",
       x = "Preço (R$)",
       y = "Último Dividendo (R$)",
       caption = "Linha vermelha representa a regressão linear") +
  theme_minimal() +
  theme(legend.position = "none") 

# Gráfico (2) de dispersão simples para visualizar a correlação
ggplot(dados_clean, aes(x = PRECO, y = ULTIMO_DIVIDENDO)) +
  geom_point(color = "blue", alpha = 0.5) +  # Pontos de dados
  labs(title = "Gráfico de Dispersão entre Preço e Último Dividendo",
       x = "Preço (R$)",
       y = "Último Dividendo (R$)") +
  theme_minimal()

## EX (D) ##

# Modelo de regressão linear simples
modelo <- lm(ULTIMO_DIVIDENDO ~ PRECO, data = dados_clean)

# Extraindo coeficientes
intercept <- coef(modelo)[1]
slope <- coef(modelo)[2]

# Gráfico de dispersão com linha de regressão
ggplot(dados_clean, aes(x = PRECO, y = ULTIMO_DIVIDENDO)) +
  geom_point(color = "blue", alpha = 0.5) +  # Pontos de dados
  geom_abline(intercept = intercept, slope = slope, color = "red", linetype = "dashed") +
  labs(title = "Gráfico de Dispersão com Reta de Regressão Linear",
       x = "Preço (R$)",
       y = "Último Dividendo (R$)",
       caption = sprintf("Equação da reta: y = %.4f + %.4fx", intercept, slope)) +
  theme_minimal()

# Imprimindo a equação da linha de regressão
equation <- paste("Equação da Regressão Linear Simples: y =", round(intercept, 4), "+", round(slope, 4), "x")
print(equation)

## EX (E) ##
#Coeficiente de Determinação (R²) e o Teste F

# Resumo do modelo
resumo_modelo <- summary(modelo)
resumo_modelo

# Extrair R² e Teste F
r_quadrado <- resumo_modelo$r.squared
r_quadrado
f_valor <- resumo_modelo$fstatistic[1]
f_valor
p_valor <- pf(f_valor, df1 = resumo_modelo$df[1], df2 = resumo_modelo$df[2], lower.tail = FALSE)
p_valor

# Imprimindo R² e Teste F
cat("Coeficiente de Determinação (R²):", r_quadrado, "\n")
cat("Valor F da regressão:", f_valor, "com p-valor:", p_valor, "\n")

# Imprimindo a interpretação dos resultados de R² e Teste F
cat("Interpretação do Coeficiente de Determinação (R²):\n")
cat("O Coeficiente de Determinação (R²) é 0.9778034, indicando que aproximadamente 97.78% da variação no Último Dividendo é explicada pela variação no Preço. Isso sugere que o modelo de regressão linear ajusta-se muito bem aos dados, capturando a maior parte da variação na variável dependente.\n\n")

cat("Interpretação do Teste F e p-valor:\n")
cat("O valor F da regressão é 1409.661, que é substancialmente alto, sugerindo que o modelo é estatisticamente significativo. O p-valor associado ao teste F é extremamente baixo (6.333738e-32), muito menor que o nível de significância típico de 0.05. Isso indica que podemos rejeitar a hipótese nula de que o modelo não tem valor explicativo. Em outras palavras, há uma relação estatisticamente significativa entre o Preço e o Último Dividendo.\n")


## EX (F) ##
#PREVISÃO

# Definir um novo dado com o preço de R$ 150
novo_dado <- data.frame(PRECO = 150)

# Usar o modelo para fazer a previsão do último dividendo para esse preço
previsao_dividendo <- predict(modelo, newdata = novo_dado)

# Imprimindo a previsão
cat("Previsão de Último Dividendo para o preço de R$150:", previsao_dividendo, "\n")

# Fazer uma previsão para um novo preço específico, e.g., R$100
preco_novo <- data.frame(PRECO = 100)
previsao <- predict(modelo, newdata = preco_novo)
print(paste("Previsão de último dividendo para o preço R$100:", previsao))

######################################################
### SPRINT 4 - Análise Multivariada                ###
######################################################

## EX (A) ##
#O Gráfico de Dispersão

# Removendo linhas com valores NA para as variáveis selecionadas
dados_clean <- na.omit(dados, cols = c("PRECO", "ULTIMO_DIVIDENDO", "PATRIMONIO"))

# Gráfico de dispersão em 2D
ggplot(dados_clean, aes(x = PRECO, y = ULTIMO_DIVIDENDO, color = PATRIMONIO)) +
  geom_point(aes(size = PATRIMONIO), alpha = 0.5) +  # Pontos com tamanho variável
  scale_color_gradient(low = "blue", high = "red") + # Gradiente de cor
  labs(title = "Gráfico de Dispersão Multivariado",
       x = "Preço (R$)",
       y = "Último Dividendo (R$)",
       color = "Patrimônio (R$)") +
  theme_minimal()

# Instalar e carregar a biblioteca plotly -> GRAFICO EM 3D
if (!requireNamespace("plotly", quietly = TRUE)) {
  install.packages("plotly")
}
library(plotly)

# Gráfico de dispersão 3D
plot_ly(dados_clean, x = ~PRECO, y = ~ULTIMO_DIVIDENDO, z = ~PATRIMONIO, type = 'scatter3d', mode = 'markers',
        marker = list(size = 5, color = ~PATRIMONIO, colorscale = c('Blues', 'Reds'), opacity = 0.6)) %>%
  layout(title = "Gráfico de Dispersão 3D",
         scene = list(xaxis = list(title = "Preço (R$)"),
                      yaxis = list(title = "Último Dividendo (R$)"),
                      zaxis = list(title = "Patrimônio (R$)")))


## EX (B) ##
#Matriz de Covariância e a Matriz de Correlação Linear de Pearson

# Matriz de Covariância
matriz_covariancia <- cov(dados_clean[, c("PRECO", "ULTIMO_DIVIDENDO", "PATRIMONIO")])

# Matriz de Correlação de Pearson
matriz_correlacao <- cor(dados_clean[, c("PRECO", "ULTIMO_DIVIDENDO", "PATRIMONIO")])

# Imprimir as matrizes
print("Matriz de Covariância:")
print(matriz_covariancia)
print("Matriz de Correlação de Pearson:")
print(matriz_correlacao)

cat("Interpretação da Matriz de Covariância:\n")
cat("A matriz de covariância mostra grandes diferenças na magnitude dos dados. Por exemplo, a covariância entre PRECO e PATRIMONIO é extremamente negativa (-1.376389e+10), indicando que, em termos absolutos, quando o preço aumenta, o patrimônio tende a diminuir, e vice-versa. No entanto, a magnitude desses valores pode ser influenciada pela escala das variáveis.\n\n")

cat("Interpretação da Matriz de Correlação de Pearson:\n")
cat("A matriz de correlação mostra que PRECO e ULTIMO_DIVIDENDO têm uma correlação muito alta e positiva de aproximadamente 0.989, indicando que há uma forte relação linear positiva entre essas variáveis; conforme o preço aumenta, o último dividendo também tende a aumentar. Por outro lado, tanto o PRECO quanto o ULTIMO_DIVIDENDO têm uma correlação muito baixa e ligeiramente negativa com PATRIMONIO (aproximadamente -0.07), indicando que quase não há relação linear entre essas variáveis e o patrimônio.\n")

## EX (C) ##
#Gráfico de Correlação Linear de Pearson

# Instalar e carregar a biblioteca GGally se ainda não estiver carregada
if (!requireNamespace("GGally", quietly = TRUE)) {
  install.packages("GGally")
}
library(GGally)

# Gráfico de pares
ggpairs(dados_clean[, c("PRECO", "ULTIMO_DIVIDENDO", "PATRIMONIO")], 
        lower = list(continuous = "smooth"), 
        diag = list(continuous = "barDiag"), 
        upper = list(continuous = "cor"),
        title = "Gráfico de Correlação Linear de Pearson entre Variáveis")

## EX (D) ##
#A Equação da Regressão Linear Múltipla.
# Carregar a biblioteca necessária para a regressão
if (!requireNamespace("stats", quietly = TRUE)) {
  install.packages("stats")
}
library(stats)

# Ajustar o modelo de regressão linear múltipla
modelo_mult <- lm(ULTIMO_DIVIDENDO ~ PRECO + PATRIMONIO, data = dados_clean)
modelo_mult

# Sumário do modelo para verificar as estatísticas
summary(modelo_mult)

# Extrair coeficientes para formar a equação da regressão
coeficientes <- coef(modelo_mult)
equacao <- sprintf("ULTIMO_DIVIDENDO = %.4f + (%.4f * PRECO) + (%.4f * PATRIMONIO)",
                   coeficientes[1], coeficientes[2], coeficientes[3])

# Imprimindo a equação da regressão
cat("Equação da Regressão Linear Múltipla:\n", equacao, "\n")


## EX (E) ##
#O Coeficiente de Determinação Múltiplo (R²) e o Teste F, interprete os resultados.

# Ajustar o modelo de regressão linear múltipla
modelo_mult <- lm(ULTIMO_DIVIDENDO ~ PRECO + PATRIMONIO, data = dados_clean)

# Obter o resumo do modelo
summary_modelo <- summary(modelo_mult)

# Extrair R² e os resultados do Teste F
r_quadrado <- summary_modelo$r.squared
r_quadrado_ajustado <- summary_modelo$adj.r.squared
f_valor <- summary_modelo$fstatistic[1]
p_valor_f_teste <- summary_modelo$fstatistic[3]

# Imprimindo os resultados
cat("Coeficiente de Determinação (R²):", r_quadrado, "\n")
cat("Coeficiente de Determinação Ajustado (R² Ajustado):", r_quadrado_ajustado, "\n")
cat("Valor F da regressão:", f_valor, "\n")
cat("P-valor do Teste F:", p_valor_f_teste, "\n")

r_quadrado <- 0.9778264
r_quadrado_ajustado <- 0.9763959
f_valor <- 683.531
p_valor_f_teste <- 0.00000031 

# Interpretação dos resultados
cat("Interpretação dos Resultados do Modelo de Regressão:\n")
cat("Coeficiente de Determinação (R²):", r_quadrado, "\n",
    "Este valor indica que o modelo é capaz de explicar aproximadamente 97.78% da variação no ULTIMO_DIVIDENDO com base nas variáveis PRECO e PATRIMONIO. Um R² tão alto sugere que as variáveis escolhidas estão muito bem relacionadas com o ULTIMO_DIVIDENDO.\n\n")
cat("Coeficiente de Determinação Ajustado (R² Ajustado):", r_quadrado_ajustado, "\n",
    "O R² ajustado também é muito alto, indicando que o ajuste do modelo é robusto mesmo após o ajuste para o número de preditores no modelo. Isso confirma que a inclusão de ambas as variáveis preditoras é justificada.\n\n")
cat("Valor F da regressão:", f_valor, "\n",
    "O valor F é extremamente alto, o que normalmente indicaria uma forte evidência contra a hipótese nula de que os coeficientes das variáveis preditoras são todos zero. Isso sugere que há uma relação estatisticamente significativa entre as variáveis preditoras e a variável dependente.\n\n")
cat("P-valor do Teste F:", p_valor_f_teste, "\n",
    "O p-valor é extremamente baixo, indicando que podemos rejeitar a hipótese nula e concluir que as variáveis preditoras têm um efeito significativo sobre o ULTIMO_DIVIDENDO. Este é um indicativo de que o modelo tem validade estatística.\n")

## EX (F) ##

# Definindo os novos valores para as variáveis explicativas
novo_dado <- data.frame(PRECO = 200, PATRIMONIO = 1000000)

# Usar o modelo ajustado para fazer a previsão
previsao_dividendo <- predict(modelo_mult, newdata = novo_dado)

# Imprimir a previsão
cat("Previsão de Último Dividendo para PRECO de R$200 e PATRIMONIO de R$1.000.000:", previsao_dividendo, "\n")

