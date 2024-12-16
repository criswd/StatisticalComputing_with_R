######################################################
### SPRINT - DISTRIBUIÇÃO DE FREQUÊNCIAS           ###
######################################################

getwd()

# Carregando dataset
df <- read_xlsx("dataset_fundos_fii.xlsx")

# Removendo possíveis vírgulas e converter para numérico
df$N_COTISTAS <- as.numeric(gsub(",", "", df$N_COTISTAS))

# Verificar se ainda há NAs
sum(is.na(df$N_COTISTAS))

# Ignorando NAs ao contar cotistas
sum(df$N_COTISTAS == 1, na.rm = TRUE)

# Recalculando o número de fundos com exatamente 1 cotista, ignorando NAs
sum(df$N_COTISTAS == 1, na.rm = TRUE)

# Ver algumas linhas onde N_COTISTAS é igual a 1
df[df$N_COTISTAS == 1, ]


# Criando tabela de frequência para N_Cotistas
freq_cotistas <- table(df$N_COTISTAS)
View(freq_cotistas)
print(freq_cotistas)

# Criando um gráfico de barras da tabela de frequência
barplot(freq_cotistas, main="Frequência de N_COTISTAS", xlab="Nº de Cotistas", ylab="Frequência", las=2, col="blue")

#Frequência Absoluta (fi) frequência que cada elemento se repetiu da variável
fi <- table(freq_cotistas)
fi

#Frequência Absoluta Acumulada (fia) soma acumulativa da frequência absoluta
fia <- cumsum(fi)
fia

#Frequência Relativa - porcentagem de ocorrência da frequência absoluta, também vista como chance
fr <-100*prop.table(fi)
fr

#Frequência Relativa Acumulada - oma acumulativa da frequência relativa, também vista como chance.
fra <- cumsum(fr)
fra

#total das Colunas
nfi <- c(fi, sum(fi))
nfia <- c(fia,"-")
nfr <- c(fr, sum(fr))
nfra <- c(fra, "-")

#Adicionando nome "Total" na última linha:
names(nfi)[length(nfi)] <- "Total"
nfi
names(nfia)[length(nfia)] <- "Total"
nfia
names(nfr)[length(nfr)] <- "Total"
nfr
names(nfra)[length(nfra)] <- "Total" 
nfra
names(nfi)[4] <- "Total"
nfi

t_dist_freq_cotistas <- data.frame(
  Frequencia_Absoluta = nfi, 
  Frequencia_Absoluta_Acumulada = nfia, 
  Frequencia_Relativa = nfr, 
  Frequencia_Relativa_Acumulada = nfra
)
##############################
######### INSIGHTS ##########
#############################

#NA TABELA DE DISTRIBUIÇÃO - PODEMOS FAZER ALGUMAS OBSERVAÇÕES
#1. O valor (1) se repete 78x na tabela, indicando que o mesmo número de cotista é muito dificil de se repetir
#em outro fundo, existem números próximos, mas com a mesma quantidade exata de investidores é bem raro. 
#em 89.66% dos casos não irá se ter a mesma quantidade exata de investidores.

#2. O valor (2) que se repete 6x na tabela, ocorre em cerca de 6.90% dos casos. Isso 
#indica uma pequena porcentagem que os mesmo numeros de cotista pode se repetir em outro fundo.

#3. O valor (3) que se repete 3 vezes na tabela, ocorre em aproximadamente 3.45% dos casos.
#Isso mostra que é ainda menos comum fundos terem oos mesmos numero de cotistas.
t_dist_freq_cotistas
View(t_dist_freq_cotistas)

# Histograma para visualizar a distribuição de freq_cotistas
hist(freq_cotistas, main="Histograma de freq_cotistas", xlab="Valores", ylab="Frequência", breaks=10)
##########

# Criando tabela de frequência para N_Cotas
freq_cotas <- table(df$N_COTAS)
print(freq_cotas)

#Frequência Absoluta (fi1) frequência que cada elemento se repetiu da variável
fi1 <- table(freq_cotas)
fi1
#O número 1 aparece 95 vezes em freq_cotas.
#O número 2 aparece 3 vezes.
#O número 4 aparece 1 vez.

#Frequência Absoluta Acumulada (fia) soma acumulativa da frequência absoluta
fia1 <- cumsum(fi1)
fia1

#Frequência Relativa - porcentagem de ocorrência da frequência absoluta, também vista como chance
fr1 <-100*prop.table(fi1)
fr1
#95.96% das ocorrências são do valor 1 
#3.03% das ocorrências são do valor 2.
#1.01% das ocorrências são do valor 4. 

#Frequência Relativa Acumulada - oma acumulativa da frequência relativa, também vista como chance.
fra1 <- cumsum(fr1)
fra1

#total das Colunas N_COTAS
nfi1 <- c(fi1, sum(fi1))
nfia1 <- c(fia1,"-")
nfr1 <- c(fr1, sum(fr1))
nfra1 <- c(fra1, "-")

#Adicionando nome "Total" na última linha:
names(nfi1)[length(nfi1)] <- "Total"
nfi1
names(nfia1)[length(nfia1)] <- "Total"
nfia1
names(nfr1)[length(nfr1)] <- "Total"
nfr1
names(nfra1)[length(nfra1)] <- "Total" 
nfra1
names(nfi1)[4] <- "Total"
nfi1

t_dist_freq_cotas <- data.frame(
  Frequencia_Absoluta = nfi1, 
  Frequencia_Absoluta_Acumulada = nfia1, 
  Frequencia_Relativa = nfr1, 
  Frequencia_Relativa_Acumulada = nfra1
)

##############################
######### INSIGHTS ##########
#############################

#NA TABELA DE DISTRIBUIÇÃO - PODEMOS FAZER ALGUMAS OBSERVAÇÕES
#1. O valor (1) se repete 95x na tabela, indicando que o mesmo número de cotas é muito dificil de se repetir
#em outro fundo, existem números próximos, mas com a mesma quantidade exata de COTAS é bem raro. 
#em 95.96% dos casos não irá se ter a mesma quantidade exata de COTAS.

#2. O valor (2) que se repete 3x na tabela, ocorre em cerca de 3.03% dos casos. Isso 
#indica uma pequena porcentagem que os mesmo numeros de cotas pode se repetir em outro fundo.

#3. O valor (4) que se repete 1 vezes na tabela, ocorre em aproximadamente 1% dos casos.
#Isso mostra que é ainda menos comum fundos terem oos mesmos numero de cotas.
#Neste caso se repetiu no n.0 onde não havia nenhuma cota
t_dist_freq_cotas 
View(t_dist_freq_cotas)

# Histograma para visualizar a distribuição de freq_cotistas
hist(freq_cotas, main="Histograma de freq_cotas", xlab="Valores", ylab="Frequência", breaks=10)

# Insight Relação entre Número de Cotistas e Cotas
correlacao <- cor(df$N_COTISTAS, df$N_COTAS, use="complete.obs")
print(correlacao)

######################################################
### SPRINT PARTE II - DISTRIBUIÇÃO DE FREQUÊNCIAS  ###
######################################################

#1 Preparação dos Dados
# Assegurar que os dados são numéricos
df$PRECO <- as.numeric(gsub(",", "", df$PRECO))
df$PATRIMONIO <- as.numeric(gsub(",", "", df$PATRIMONIO))

# Remover possíveis valores NA 
df <- na.omit(df)  # Remove linhas com valores NA

# Usando a função cut para criar categorias baseadas em quantis para melhor distribuição
df$Categoria_PRECO <- cut(df$PRECO, 
                          breaks=quantile(df$PRECO, probs=seq(0, 1, by=0.1), na.rm=TRUE), 
                          include.lowest=TRUE)
freq_preco_bins <- table(df$Categoria_PRECO)
print(freq_preco_bins)
View(freq_preco_bins)

# Convertendo a tabela de frequência em data frame e nomeando as colunas
freq_preco_bins <- as.data.frame(freq_preco_bins)
names(freq_preco_bins) <- c("Categoria", "Frequência")
freq_preco_bins
View(freq_preco_bins)

# Adicionando a coluna de Frequência Absoluta Acumulada
freq_preco_bins$Frequencia_Acumulada <- cumsum(freq_preco_bins$Frequência)
print(freq_preco_bins)

# Calculando a frequência total
total_frequencia <- sum(freq_preco_bins$Frequência)
total_frequencia

# Adicionando a coluna de Frequência Relativa
freq_preco_bins$Frequencia_Relativa <- freq_preco_bins$Frequência / total_frequencia

# Convertendo a frequência relativa para porcentagem
freq_preco_bins$Frequencia_Relativa_Pct <- 100 * freq_preco_bins$Frequencia_Relativa

# DataFrame atualizado
print(freq_preco_bins)
View(freq_preco_bins)

# Calculando a Frequência Relativa Acumulada
freq_preco_bins$Frequencia_Relativa_Acumulada <- cumsum(freq_preco_bins$Frequencia_Relativa)

# Convertendo a frequência relativa acumulada para porcentagem, para melhor interpretação
freq_preco_bins$Frequencia_Relativa_Acumulada_Pct <- 100 * freq_preco_bins$Frequencia_Relativa_Acumulada

# Visualizando o DataFrame atualizado
print(freq_preco_bins)
View(freq_preco_bins)

##############################
######### INSIGHTS ##########
#############################
#1. Distribuição Uniforme de Preços
#Observando as frequências relativas e suas porcentagens, a distribuição dos preços 
#nas diferentes categorias é relativamente uniforme. As categorias têm frequências 
#relativas muito próximas, variando entre 8.82% e 11.76%. Esse equilíbrio na distribuição
#de frequência sugere que não há uma predominância significativa de preços em nenhuma 
#faixa específica, o que pode indicar um mercado com variações de preços bem distribuídas 
#ou uma estratégia de precificação diversificada.

#2.Identificação de Faixas de Preços Críticas
#As categorias com as maiores frequências individuais (categorias 1, 4, 7 e 10 com 11.76% cada) 
#destacam faixas de preços onde ocorrem picos na distribuição de preços. Essas faixas podem 
#representar níveis de preço psicológicos para os consumidores ou refletir limites de preços 
#estratégicos para valor de cota.

#3.Planejamento Estratégico para Marketing e Vendas
#Com o entendimento de que 70.59% dos preços estão abaixo de 95.1 unidades e apenas 29.41% estão acima, 
#gestores de COTAS e estrategistas de marketing podem desenvolver campanhas ou promover COTAS  que 
#se enquadram nas faixas de preço mais populares para maximizar a penetração no mercado.

# Usando a função cut para criar categorias baseadas em quantis para melhor distribuição
df$Categoria_PATRIMONIO <- cut(df$PATRIMONIO, 
                               breaks=quantile(df$PATRIMONIO, probs=seq(0, 1, by=0.1), na.rm=TRUE), 
                               include.lowest=TRUE)

# Criando a tabela de frequência para a variável PATRIMONIO
freq_patrimonio_bins <- table(df$Categoria_PATRIMONIO)
print(freq_patrimonio_bins)
View(freq_patrimonio_bins)

# Convertendo a tabela de frequência em um dataframe para melhor manipulação e adicionando nomes às colunas
freq_patrimonio_bins <- as.data.frame(freq_patrimonio_bins)
names(freq_patrimonio_bins) <- c("Categoria", "Frequência")
View(freq_patrimonio_bins)

# Adicionando a coluna de Frequência Absoluta Acumulada
freq_patrimonio_bins$Frequencia_Acumulada <- cumsum(freq_patrimonio_bins$Frequência)
View(freq_patrimonio_bins)

# Calculando a Frequência Relativa
total_frequencia_patrimonio <- sum(freq_patrimonio_bins$Frequência)
freq_patrimonio_bins$Frequencia_Relativa <- freq_patrimonio_bins$Frequência / total_frequencia_patrimonio
View(freq_patrimonio_bins)

# Convertendo a Frequência Relativa para Porcentagem
freq_patrimonio_bins$Frequencia_Relativa_Pct <- 100 * freq_patrimonio_bins$Frequencia_Relativa
View(freq_patrimonio_bins)

# Calculando a Frequência Relativa Acumulada
freq_patrimonio_bins$Frequencia_Relativa_Acumulada <- cumsum(freq_patrimonio_bins$Frequencia_Relativa)
View(freq_patrimonio_bins)

# Convertendo a Frequência Relativa Acumulada para Porcentagem
freq_patrimonio_bins$Frequencia_Relativa_Acumulada_Pct <- 100 * freq_patrimonio_bins$Frequencia_Relativa_Acumulada
View(freq_patrimonio_bins)

# Imprimindo o DataFrame final
print(freq_patrimonio_bins)

##############################
######### INSIGHTS ##########
#############################
#1. Distribuição Equitativa Entre as Categorias
#Observando as frequências relativas, vemos que cada categoria (intervalo de patrimônio) 
#tem uma distribuição bastante equitativa, com a maioria das categorias apresentando 
#frequências relativas de aproximadamente 8.82% ou 11.76%. Isso sugere que o patrimônio 
#dos fundos está distribuído de forma bastante uniforme ao longo das diversas faixas de valor,
# sem uma concentração excessiva em nenhuma faixa específica de patrimônio.

# Faixas de Patrimônio Mais Altas
#Os intervalos mais altos, especialmente a última categoria (1.93e+09 a 4.33e+09), que também 
#alcança uma frequência relativa de 11.76%, mostram que há um número significativo de fundos com 
#patrimônios muito grandes. Isso pode indicar a presença de fundos gigantes ou altamente bem-sucedidos
#no mercado, o que poderia ser uma área de interesse para investidores que buscam estabilidade e longo prazo.
#
#