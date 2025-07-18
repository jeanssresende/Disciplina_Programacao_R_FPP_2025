#------------------------------------------------------------------------------#
# Aula 9: Gráficos com R Base
#------------------------------------------------------------------------------#

# 1. Introdução
# A visualização de dados é a melhor forma de explorar e comunicar.
# O R Base é ótimo para começar e para criar gráficos de forma rápida.

# O dataset é chamado 'penguins'
# Vamos dar uma olhada nele para nos familiarizarmos
head(penguins)
str(penguins)
summary(penguins)

# Note que ele já tem alguns NAs. O que faremos com eles?
# Para a aula de gráficos, vamos remover as linhas com NA para simplificar
# o que facilita a plotagem.
penguins_limpo <- na.omit(penguins)
summary(penguins_limpo)

# 2. Histograma: Para Distribuição de uma Variável Numérica
# Vamos visualizar a distribuição da massa corporal dos pinguins.
hist(penguins_limpo$body_mass, 
     main = "Distribuição da Massa Corporal dos Pinguins",
     xlab = "Massa Corporal (g)",
     ylab = "Frequência",
     col = "darkcyan",
     border = "black")

# O que essa distribuição nos diz? Parece que há um "pico"

# 3. Boxplot: Para Resumo e Comparação de Distribuição
# Agora, vamos comparar a massa corporal entre as diferentes espécies.
# Sintaxe: y ~ x (massa em função da espécie)
boxplot(body_mass ~ species, 
        data = penguins_limpo,
        main = "Massa Corporal por Espécie de Pinguim",
        xlab = "Espécie", 
        ylab = "Massa Corporal (g)",
        col = c("gold", "lightblue", "lightgreen"))

# O que esse gráfico nos revela?

# 4. Gráfico de Dispersão (Scatter Plot): Para Relação entre Duas Variáveis
# Vamos explorar a relação entre o comprimento e a profundidade do bico.
# O bico mais comprido tende a ser mais ou menos profundo?
plot(x = penguins_limpo$bill_len, 
     y = penguins_limpo$bill_dep,
     main = "Relação entre Comprimento e Profundidade do Bico",
     xlab = "Comprimento do Bico (mm)",
     ylab = "Profundidade do Bico (mm)",
     pch = 16, # Círculos sólidos
     col = penguins_limpo$species) # Usando a espécie como cor!

# Podemos adicionar uma legenda para as cores
legend("topright", legend = levels(penguins_limpo$species),
       col = 1:length(levels(penguins_limpo$species)),
       pch = 16)


# 5. Gráfico de Barras (Barplot): Para Frequências e Categorias
# Vamos contar quantos pinguins temos para cada espécie.
contagem_especies <- table(penguins_limpo$species)
print(contagem_especies)

# Agora, o gráfico de barras
barplot(contagem_especies,
        main = "Contagem de Pinguins por Espécie",
        xlab = "Espécie",
        ylab = "Contagem",
        col = c("gold", "lightblue", "lightgreen"))

# 6. Gráfico de Pizza (Setores): Para Partes de um Todo
# O gráfico de pizza é muito conhecido para mostrar proporções (partes de um todo).
# No entanto, em ciência de dados, é frequentemente criticado por ser difícil
# de comparar proporções entre fatias. É melhor usar um gráfico de barras para isso.
# Ainda assim, é uma visualização popular e útil em alguns casos.

# Vamos criar um gráfico de pizza para a contagem de pinguins por espécie
contagem_especies <- table(penguins_limpo$species)

pie(contagem_especies,
    main = "Proporção de Pinguins por Espécie",
    col = c("gold", "lightblue", "lightgreen"),
    labels = paste(names(contagem_especies), "\n(", contagem_especies, ")"))

# Os rótulos personalizados com paste() são úteis para incluir a contagem.

#------------------------------------------------------------------------------#

# 7. Gráfico de Correlação: Visualizando Relações Múltiplas
# O R Base tem uma função muito útil para criar uma matriz de gráficos de dispersão,
# que é perfeita para visualizar a relação entre VÁRIAS variáveis numéricas de uma vez.
# Isso ajuda a identificar rapidamente quais variáveis podem estar correlacionadas.

# Vamos selecionar algumas variáveis numéricas do dataset 'penguins_limpo'
# para explorar suas correlações.
variaveis_para_cor <- penguins_limpo[ , c("bill_len", "bill_dep", "flipper_len", 
                                          "body_mass")]

# A função `pairs()` é a sua ferramenta aqui!
pairs(variaveis_para_cor,
      main = "Gráfico de Correlação de Pares (penguins)",
      pch = 19, # Tipo de ponto
      col = as.numeric(penguins_limpo$species) # Usando a espécie para colorir
)

# O que esse gráfico nos diz?
# Olhando a diagonal inferior, você pode ver que 'flipper_length_mm' e 'body_mass_g'
# parecem ter uma forte relação positiva (os pontos formam uma linha inclinada).
# Isso faz sentido, pinguins maiores (maior massa corporal) tendem a ter nadadeiras maiores!
