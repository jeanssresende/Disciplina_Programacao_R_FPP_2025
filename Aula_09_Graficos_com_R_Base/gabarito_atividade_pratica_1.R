#--------------------------------------------------------------------------------
# Atividade Prática 9.1: Gráficos com o Dataset 'iris'
#--------------------------------------------------------------------------------

# O dataset 'iris' já está no R por padrão.
# Ele contém medidas de 150 flores de três espécies diferentes.
# Rode 'head(iris)' e 'str(iris)' para se familiarizar com os dados.
head(iris)
str(iris)

# 1. Crie um histograma para a variável 'Sepal.Length'.
# Adicione um título e rótulos de eixos.
hist(iris$Sepal.Length,
     main = "Histograma do Comprimento da Sépala",
     xlab = "Comprimento da Sépala (cm)",
     ylab = "Frequência")


# 2. Crie um boxplot para a variável 'Petal.Length', mas compare a distribuição
# entre as diferentes espécies ('Species').
# Use a notação y ~ x: Petal.Length ~ Species
boxplot(Petal.Length ~ Species,
        data = iris,
        main = "Comprimento da Pétala por Espécie",
        xlab = "Espécie",
        ylab = "Comprimento da Pétala (cm)",
        col = c("orange", "lightblue", "lightgreen"))


# 3. Crie um gráfico de dispersão para explorar a relação entre
# 'Petal.Length' e 'Sepal.Length'.
# Adicione títulos e rótulos de eixos.
plot(x = iris$Petal.Length, y = iris$Sepal.Length,
     main = "Relação entre Comprimento da Pétala e da Sépala",
     xlab = "Comprimento da Pétala (cm)",
     ylab = "Comprimento da Sépala (cm)",
     pch = 16,
     col = as.numeric(iris$Species)) # Colorindo por espécie!


# 4. Crie um gráfico de barras mostrando a contagem de flores para cada espécie.
contagem_especies_iris <- table(iris$Species)
barplot(contagem_especies_iris,
        main = "Contagem de Flores por Espécie",
        xlab = "Espécie",
        ylab = "Contagem",
        col = c("pink", "purple", "lightgray"))
