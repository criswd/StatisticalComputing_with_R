######################################################
### SPRINT 3 - DISTRIBUIÇÃO & PROBABILIDADES       ###
######################################################

# Carregando bibliotecas necessárias
install.packages("readxl")
library(readxl).

############################################################################################
## EXERCÍCIO 01 ##
############################################################################################

# Carregando os dados
dados <- read_excel("dataset.xlsx")

# Análise da variável 'PRECO'
media_preco <- mean(dados$PRECO)
mediana_preco <- median(dados$PRECO)
sd_preco <- sd(dados$PRECO)

# a) Probabilidade de 'PRECO' ser menor que a média
prob_menor_media <- pnorm(media_preco, mean = media_preco, sd = sd_preco, lower.tail = TRUE)

# b) Probabilidade de 'PRECO' ser maior que a mediana
prob_maior_mediana <- pnorm(mediana_preco, mean = media_preco, sd = sd_preco, lower.tail = FALSE)

# c) Probabilidade de 'PRECO' estar entre média - 2*SD e média + 2*SD
prob_intervalo <- pnorm(media_preco + 2 * sd_preco, mean = media_preco, sd = sd_preco) - 
  pnorm(media_preco - 2 * sd_preco, mean = media_preco, sd = sd_preco)

# Imprimindo resultados
cat("RESPOSTA A) Probabilidade de PRECO ser menor que a média: ", prob_menor_media, ".Há uma probabilidade de 50%, ou seja, é um EVENTO PROVÁVEL \n")
cat("RESPOSTA B) Probabilidade de PRECO ser maior que a mediana: ", prob_maior_mediana, "Há uma probalidade de 56.55%, é um  evento MUITO PROVÁVEL \n")
cat("RESPOSTA C) Probabilidade de PRECO estar no intervalo [média-2*SD, média+2*SD]: ", prob_intervalo, "Há uma probabilidade de 95.45% é um evento MUITO PROVÁVEL \n")

############################################################################################
## EXERCÍCIO 02 ##
############################################################################################

# Comentário sobre a utilização dos resultados probabilísticos para tomada de decisão

# A análise da variável PRECO mostrou que a probabilidade de ser menor que a média é de 50%,
# o que indica que a variável segue uma distribuição normal. Esse conhecimento é crucial
# para a modelagem de riscos e previsões, pois permite assumir que metade dos valores
# estará abaixo da média e a outra metade, acima, facilitando a criação de modelos preditivos equilibrados.

# A probabilidade de o PRECO ser maior que a mediana é de aproximadamente 56.55%,
# sugerindo uma leve assimetria à direita. Em contextos financeiros, isso pode indicar
# uma tendência de aumento no preço, sendo uma informação valiosa para investidores
# e gestores que buscam maximizar retornos ou ajustar suas estratégias de investimento.

# A alta probabilidade (aprox. 95.45%) de o PRECO estar dentro do intervalo de média ± 2*SD
# confirma que a maior parte dos dados se concentra próximo à média, com poucos valores extremos.
# Este resultado ajuda em decisões de precificação, controle de qualidade ou qualquer outro
# processo onde entender a variação padrão dos dados é fundamental para minimizar riscos e otimizar resultados.

# Esses insights não apenas orientam decisões operacionais e estratégicas mas também
# fundamentam análises mais profundas, como a identificação de outliers, a avaliação de condições de mercado
# e a gestão de portfólio, entre outras aplicações.

# Em resumo, entender as distribuições probabilísticas dos dados permite a adoção de abordagens
# mais informadas e fundamentadas, reduzindo incertezas e apoiando a tomada de decisão com base em evidências.


############################################################################################
## EXERCÍCIO 03 ##
############################################################################################


# Calculando a média e o desvio padrão da população para a variável PRECO
media_pop <- mean(dados$PRECO)
sd_pop <- sd(dados$PRECO)

# Função para realizar o teste Z
teste_z <- function(media_amostral, n, media_pop, sd_pop, alpha, alternativa) {
  z <- (media_amostral - media_pop) / (sd_pop / sqrt(n))
  p_valor <- switch(alternativa,
                    "menor" = pnorm(z),
                    "maior" = pnorm(z, lower.tail = FALSE),
                    "diferente" = 2 * pnorm(-abs(z))
  )
  list(z = z, p_valor = p_valor)
}

# a) Teste para a média amostral ser menor que a média populacional
resultado_a <- teste_z(media_amostral = mean(sample(dados$PRECO, 20)), n = 20, 
                       media_pop = media_pop, sd_pop = sd_pop, alpha = 0.05, alternativa = "menor")

# b) Teste para a média amostral ser maior que a média populacional
resultado_b <- teste_z(media_amostral = mean(sample(dados$PRECO, 25)), n = 25,
                       media_pop = media_pop, sd_pop = sd_pop, alpha = 0.10, alternativa = "maior")

# c) Teste para a média amostral ser diferente da média populacional
resultado_c <- teste_z(media_amostral = mean(sample(dados$PRECO, 15)), n = 15,
                       media_pop = media_pop, sd_pop = sd_pop, alpha = 0.01, alternativa = "diferente")

# Imprimindo os resultados
cat("Resultado do Teste a: Z =", resultado_a$z, "P-valor =", resultado_a$p_valor, "\n")
cat("Resultado do Teste b: Z =", resultado_b$z, "P-valor =", resultado_b$p_valor, "\n")
cat("Resultado do Teste c: Z =", resultado_c$z, "P-valor =", resultado_c$p_valor, "\n")

############################################################################################
## EXERCÍCIO 04 ##
############################################################################################

# Comentários sobre os resultados dos testes de hipótese para a tomada de decisão

# Os testes de hipótese realizados para a variável PRECO oferecem insights valiosos para a tomada de decisão. 
# Por exemplo, o teste a) mostrou se a média amostral é estatisticamente menor que a média populacional com um nível de significância de 5%.
# Se o p-valor deste teste for baixo, podemos rejeitar a hipótese nula, indicando que a média dos preços amostrais é significativamente menor,
# o que pode sinalizar uma tendência de queda nos preços que precisa ser investigada ou confirmada por tendências de mercado.

# O teste b), com um nível de significância de 10%, avalia se os preços são estatisticamente maiores. 
# Um resultado significativo aqui pode apoiar decisões de investimento ou revisões de preços, especialmente em contextos onde os preços são esperados para subir.

# O teste c) é ainda mais rigoroso com um nível de significância de 1%, buscando diferenças em qualquer direção da média populacional.
# Resultados significativos neste teste indicam mudanças claras no comportamento de preço que podem justificar ajustes estratégicos importantes.

# Esses testes, portanto, não apenas informam sobre condições atuais, mas também podem orientar estratégias futuras baseadas em evidências estatísticas.
# Utilizando esses dados, gestores e analistas podem tomar decisões mais informadas, seja para ajustar preços, alinhar estratégias de marketing ou gerenciar estoques.

# Em resumo, o entendimento profundo fornecido pelos testes de hipótese para a média permite aos decisores agir com confiança, respaldados por análise estatística rigorosa.

