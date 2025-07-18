# Gabarito do Exercício: Análise Exploratória de Dados de Carros

# O dataset mtcars já está carregado. Para ter certeza, você pode rodar:
data(mtcars)

#--------------------------------------------------------------------------------
# 1. Pergunta: Como o consumo de combustível (mpg) está distribuído?
#--------------------------------------------------------------------------------
# O gráfico mais adequado para a distribuição de uma única variável numérica
# é o HISTOGRAMA.

hist(mtcars$mpg,
     main = "Distribuição do Consumo de Combustível (mpg)",
     xlab = "Consumo (milhas por galão)",
     ylab = "Frequência",
     col = "lightblue",
     border = "black")


#--------------------------------------------------------------------------------
# 2. Pergunta: Existe uma relação entre o peso (wt) e a potência (hp)?
#--------------------------------------------------------------------------------
# O gráfico mais adequado para explorar a relação entre duas variáveis numéricas
# é o GRÁFICO DE DISPERSÃO (scatter plot).

plot(x = mtcars$wt, y = mtcars$hp,
     main = "Relação entre Peso e Potência",
     xlab = "Peso (milhares de lbs)",
     ylab = "Potência (cavalos)",
     pch = 19,
     col = "darkgreen")

# O que o gráfico nos mostra? Que a relação é positiva: carros mais pesados
# tendem a ter mais cavalos de potência.

#--------------------------------------------------------------------------------
# 3. Pergunta: A transmissão manual (am=1) tem um consumo (mpg) diferente
# da automática (am=0)?
#--------------------------------------------------------------------------------
# O gráfico mais adequado para comparar a distribuição de uma variável numérica
# entre dois grupos é o BOXPLOT.

# A notação y ~ x (mpg em função de am) é perfeita para isso.
boxplot(mpg ~ am, data = mtcars,
        main = "Consumo por Tipo de Transmissão",
        xlab = "Tipo de Transmissão (0=Auto, 1=Manual)",
        ylab = "Consumo (mpg)",
        col = c("coral", "lightseagreen"))

# O que o gráfico nos mostra? A mediana e a caixa do grupo "1" (manual)
# estão visivelmente mais altas, indicando que a transmissão manual tende
# a ter um consumo de combustível maior.

#--------------------------------------------------------------------------------
# 4. Pergunta: Qual o número de cilindros mais comum?
#--------------------------------------------------------------------------------
# O gráfico mais adequado para mostrar a contagem de cada categoria
# (variável 'cyl' que é categórica aqui) é o GRÁFICO DE BARRAS.

# Primeiro, precisamos de uma tabela de frequências
contagem_cilindros <- table(mtcars$cyl)
print(contagem_cilindros)

# Agora, usamos a tabela para criar o gráfico de barras
barplot(contagem_cilindros,
        main = "Número de Carros por Cilindros",
        xlab = "Número de Cilindros",
        ylab = "Contagem",
        col = c("purple", "orange", "gray"))
#------------------------------------------------------------------------------#