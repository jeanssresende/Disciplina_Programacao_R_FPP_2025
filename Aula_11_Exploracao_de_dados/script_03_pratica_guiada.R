#------------------------------------------------------------------
# Aula 11: Exploração de Dados
# Script 4: GABARITO da Atividade Prática com `mtcars`
#------------------------------------------------------------------

# O dataset `mtcars` contém dados sobre o consumo de combustível e
# outras 10 características de 32 automóveis (modelos de 1973-74).

# ----- INSTRUÇÕES -----
# 1. Carregue o dataset `mtcars`.
# 2. Use as funções aprendidas na aula para responder às perguntas abaixo.
# 3. Escreva o código R necessário para encontrar a resposta.
# 4. Escreva a resposta como um comentário logo abaixo do seu código.
#------------------------------------------------------------------


# ----- Tarefa 1: Exploração Inicial -----

# 1.1. Carregue o dataset `mtcars`.
# Dica: use a função data()
data(mtcars)

# 1.2. Visualize as primeiras linhas do dataset.
head(mtcars)

# 1.3. Use a função `str()` para inspecionar a estrutura do dataset.
# Pergunta: Quantos carros (observações) e quantas variáveis estão no dataset?
str(mtcars)
# Resposta: O dataset tem 32 observações (carros) e 11 variáveis.

# 1.4. Use a função `summary()` para obter um resumo estatístico completo.
summary(mtcars)

# 1.5. Use a função `skimr::skim()` para um resumo alternativo.
# Não se esqueça de carregar o pacote primeiro!
library(skimr)
skim(mtcars)


# ----- Tarefa 2: Perguntas Específicas -----

# 2.1. Qual é a média de consumo de combustível (milhas por galão - `mpg`)?
mean(mtcars$mpg)
# Resposta: A média de consumo é de 20.09 milhas por galão.

# 2.2. A média de `mpg` é maior ou menor que a mediana? O que isso pode sugerir
# sobre a distribuição dos dados de consumo?
median(mtcars$mpg)
# Resposta: A média (20.09) é um pouco maior que a mediana (19.2). Isso sugere
# uma leve assimetria à direita (positive skew), ou seja, existem alguns carros
# com um consumo muito alto (muito eficientes) que "puxam" a média para cima.

# 2.3. Qual é o desvio padrão da potência do motor (`hp`)?
# O que esse valor nos diz sobre a variação da potência entre os carros?
sd(mtcars$hp)
# Resposta: O desvio padrão é de 68.56. Este é um valor relativamente alto
# comparado à média (146.69), indicando que há uma grande variação na potência
# dos motores dos carros presentes no dataset.

# 2.4. Quais são os quartis para o peso do carro (`wt`) em milhares de libras?
quantile(mtcars$wt)
# Resposta:
# 0% (mínimo): 1.513
# 25% (Q1): 2.581
# 50% (mediana): 3.325
# 75% (Q3): 3.610
# 100% (máximo): 5.424

# 2.5. Qual o carro mais pesado e o mais leve do dataset?
# Dica: use as funções min() e max() ou olhe o summary().
# Para descobrir o nome do carro, você pode usar a função which.max().
rownames(mtcars)[which.min(mtcars$wt)] # Carro mais leve
rownames(mtcars)[which.max(mtcars$wt)] # Carro mais pesado

# Resposta: O carro mais leve é o "Lotus Europa" e o mais pesado é o "Lincoln Continental".