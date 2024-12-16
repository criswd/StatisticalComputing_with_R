######################################################
### SPRINT2 - Challenge Sprint 2.                  ###
######################################################

getwd()

#se necessario instalar
#install.packages("readxl") 
library(readxl)

# Carregando dataset
df <- read_xlsx("dataset_fundos_fii.xlsx")

######################################################
##### EX 1                                          ##
### (A) Gráfico de Setores (Pie Chart)              ##
######################################################

# Tabela de frequências para uma variável categórica 'SETOR'
freq <- table(df$SETOR)
percent <- prop.table(freq) * 100

# Gráfico de setores
pie(percent, labels = paste(names(freq), round(percent, 1), "%"), col = rainbow(length(freq)),
    main = "Distribuição por Setor", cex=0.5)

# Legenda
par(cex = 0.4)  # Reduz o tamanho da fonte da legenda
legend("bottomright", legend = names(freq), fill = rainbow(length(freq)))



######################################################
### (B) Gráfico de Barras (Bar Chart)               ##
######################################################

# Tabela de frequências para uma variável categórica, 'GESTÃO'
freq_gestao <- table(df$GESTAO)

# Gráfico de barras
barplot(freq_gestao, main = "Frequência por Tipo de Gestão", xlab = "Gestão", ylab = "Frequência", 
        col = "blue", cex.main = 1.5)

# Legenda
legend("topright", legend = names(freq_gestao), fill = "blue", cex = 1.2)


######################################################
### (C) Histograma                                  ##
######################################################

# Histograma (contém valores extremos, ruim para visualização)
hist(df$PRECO, main = "Distribuição de Preços", xlab = "Preço", ylab = "Frequência",
     col = "green", border = "black")

# Removendo valores extremos para melhorar a visualização
df_limpo <- subset(df, PRECO <= 3000) 

# Histograma para a variável 'PRECO' após remover valores extremos
hist(df_limpo$PRECO, main = "Distribuição de Preços", xlab = "Preço", ylab = "Frequência",
     col = "green", border = "black", breaks = 20)



######################################################
### (D) Boxplot                                     ##
######################################################

# d) Boxplot
boxplot(df$DY, main = "Boxplot de Dividend Yield", ylab = "Dividend Yield", col = "red")

# Removendo outliers extremos
df_limpo <- subset(df, DY <= quantile(df$DY, 0.99))  # Removendo os valores acima do percentil 99

# Boxplot para a variável 'DY' após remover outliers extremos
boxplot(df_limpo$DY, main = "Boxplot de Dividend Yield", ylab = "Dividend Yield", col = "red",
        ylim = c(min(df_limpo$DY), max(df_limpo$DY))) 



######################################################
### (E) INSIGHTS                                    ##
######################################################

#Com base nos gráficos podemos extrair alguns insights.

#1.Distribuição por Setor: O Gráfico de setores revela que a maioria dos funcos imóbiliarios
#está classificado como "Indefinido"(28,6%), seguido por "Papéis" (15,2%) e "Lajes Corporativas"
#(13,3%). Esses três setores juntos compõem mais da metade do total, indicando uma predominância
#dessas categorias no mercado de FII.

#2.Frequência por Tipo de Gestão: O gráfico de barras mostra uma clara predominância de
#fundos com gestão ativa, que representam a grande maioria, em comparação com os fundos
#de gestão passiva. Isso sugere que os investidores podem preferir fundos onde os gestores
#tomam decisões ativas para tentar maximizar os retornos.

#3.Distribuição de Preços: O histograma dos preços dos fundos imobiliários indica que a 
#maioria dos fundos tem preços abaixo de 500, com um pico significativo perto de zero. Isso 
#sugere que há uma grande quantidade de fundos com preços relativamente baixos, enquanto 
#poucos fundos têm preços muito altos, possivelmente devido a características específicas ou 
#estratégias de investimento.

#4.Boxplot de Dividend Yield: O boxplot do Dividend Yield mostra que a maioria dos fundos tem 
#um yield que varia aproximadamente entre 0% e 10%, com alguns outliers que alcançam até 
#25%. Isso indica que a mediana do yield está em torno de 5%, sugerindo uma distribuição 
#relativamente concentrada, mas com algumas oportunidades de yields mais altos.

######################################################
### SPRINT2 - Challenge Sprint 2. PARTE II         ###
######################################################
#Análises univariadas com Estatística Descritiva
#####################################################
#se necessario instalar 
#install.packages("DescTools") 
library(DescTools)

#PRECO

#a) Medidas de Tendencia Central
mean(df$PRECO) #media
median((df$PRECO)) #mediana
Mode(df$PRECO) #moda

#b) Medidas de Dispersão
range(df$PRECO) #intervalo
diff(range(df$PRECO)) #amplitude total
var(df$PRECO) #variancia
sd(df$PRECO) #desvio padrÕ
sd(df$PRECO)/mean(df$PRECO)*100 #coeficiente de variacao

#c) Medidas Separatrizes
quantile(df$PRECO, probs = c(0.25, 0.50, 0.75)) #quartis
quantile(df$PRECO, probs = seq(0.10,0.90, by=0.10)) #decis
quantile(df$PRECO, probs = seq(0.02,0.99, by=0.01)) #percentis

#DY

#a) Medidas de Tendencia Central
mean(df$DY) #media
median((df$DY)) #mediana
Mode(df$DY) #moda

#b) Medidas de Dispersão
range(df$DY) #intervalo
diff(range(df$DY)) #amplitude total
var(df$DY) #variancia
sd(df$DY) #desvio padrão
sd(df$DY)/mean(df$DY)*100 #coeficiente de variacao

#c) Medidas Separatrizes
quantile(df$DY, probs = c(0.25, 0.50, 0.75)) #quartis
quantile(df$DY, probs = seq(0.10,0.90, by=0.10)) #decis
quantile(df$DY, probs = seq(0.02,0.99, by=0.01)) #percentis

# Interpretação dos resultados para a variável PRECO
# A média do preço dos fundos imobiliários é de R$236,83, indicando que, em média, os fundos têm 
#um preço moderado.
# A mediana, de R$69,84, sugere que metade dos fundos têm preços abaixo desse valor.
# A variância e o desvio padrão indicam uma grande dispersão dos preços, com um coeficiente de 
#variação de 427,77%, apontando alta variabilidade nos preços.
# Os quartis revelam que 25% dos fundos têm preços até R$7,28, 50% até R$69,84, e 75% até R$101,69, 
#evidenciando uma concentração de preços mais baixos.

# Interpretação dos resultados para a variável DY
# A média do Dividend Yield (DY) é de 15,91%, sugerindo um retorno médio atrativo.
# A mediana de 6,46% indica que metade dos fundos oferece um DY abaixo desse valor.
# A moda é 0, com 36 ocorrências, indicando que muitos fundos não oferecem dividendos.
# A variância e o desvio padrão altos refletem grande dispersão no DY, com um coeficiente de 
#variação de 555,57%, mostrando alta variabilidade nos dividendos.
# Os quartis mostram que 25% dos fundos têm DY até 0%, 50% até 6,46%, e 75% até 11,65%, 
#indicando que a maioria dos fundos tem DY abaixo de 11,65%.

