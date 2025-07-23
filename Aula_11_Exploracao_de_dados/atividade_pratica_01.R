#------------------------------------------------------------------
# Aula 11: Exploração de Dados
# Script 3: Atividade Prática com o dataset `mtcars`
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
# SEU CÓDIGO AQUI
data("mtcars")

# 1.2. Visualize as primeiras linhas do dataset.
# SEU CÓDIGO AQUI
head(mtcars)

# 1.3. Use a função `str()` para inspecionar a estrutura do dataset.
# Pergunta: Quantos carros (observações) e quantas variáveis estão no dataset?
str(mtcars)
# tem 32 ...............




# 1.4. Use a função `summary()` para obter um resumo estatístico completo.
# SEU CÓDIGO AQUI
summary(mtcars)

# 1.5. Use a função `skimr::skim()` para um resumo alternativo.
# Não se esqueça de carregar o pacote primeiro!
# SEU CÓDIGO AQUI
skimr::skim(mtcars)

# ----- Tarefa 2: Perguntas Específicas -----

# 2.1. Qual é a média de consumo de combustível (milhas por galão - `mpg`)?
# SEU CÓDIGO AQUI
# SUA RESPOSTA AQUI
mean(mtcars$mpg)

# 2.2. A média de `mpg` é maior ou menor que a mediana? O que isso pode sugerir
# sobre a distribuição dos dados de consumo?
# SEU CÓDIGO AQUI (calcule a mediana)
# SUA RESPOSTA AQUI
median(mtcars$mpg)

# 2.3. Qual é o desvio padrão da potência do motor (`hp`)?
# O que esse valor nos diz sobre a variação da potência entre os carros?
# SEU CÓDIGO AQUI
# SUA RESPOSTA AQUI
sd(mtcars$hp)
mean(mtcars$hp)

# 2.4. Quais são os quartis para o peso do carro (`wt`) em milhares de libras?
# SEU CÓDIGO AQUI
# SUA RESPOSTA AQUI
quantile(mtcars$wt)

# 2.5. Qual o carro mais pesado e o mais leve do dataset?
# Dica: use as funções min() e max() ou olhe o summary().
# Para descobrir o nome do carro, você pode usar a função which.max().
# Exemplo: rownames(mtcars)[which.max(mtcars$wt)]
# SEU CÓDIGO AQUI
# SUA RESPOSTA AQUI


rownames(mtcars)[which.min(mtcars$wt)]     
rownames(mtcars)[which.max(mtcars$wt)]     

