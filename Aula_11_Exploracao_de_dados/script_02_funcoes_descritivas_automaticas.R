#------------------------------------------------------------------
# Aula 11: Exploração de Dados
# Script 2: Funções Descritivas Automáticas
#------------------------------------------------------------------

# Para esta parte, vamos usar um dos datasets mais famosos do R: iris.
# O dataset `iris` contém medidas de 3 espécies de flores.
data(iris)

# ----- 1. Conhecendo a Estrutura do Dataset -----

# head(): Mostra as 6 primeiras linhas do dataframe.
head(iris)

# str(): Mostra a "estrutura" (structure) do objeto.
# É uma das funções mais úteis para ter uma visão geral rápida.
# Informa o número de observações, número de variáveis, e o tipo de cada variável.
str(iris)
# Note:
# 'data.frame': Tipo do objeto.
# 150 obs. of  5 variables: 150 linhas e 5 colunas.
# $ Sepal.Length: num  -> Variável numérica (números com casas decimais).
# $ Species     : Factor w/ 3 levels -> Variável categórica com 3 níveis (categorias).

# ----- 2. A Função `summary()` -----

# summary(): A função mais clássica do R para estatísticas descritivas.
# Para colunas numéricas, ela retorna: Mínimo, Q1, Mediana, Média, Q3 e Máximo.
# Para colunas de fatores (categóricas), ela retorna a contagem de cada categoria.
summary(iris)


# ----- 3. Uma Alternativa Moderna: `skimr::skim()` -----

# Pacotes em R estendem suas funcionalidades. O `skimr` oferece um sumário mais rico.
# Primeiro, precisamos instalar o pacote (só precisa fazer isso uma vez).
#install.packages("skimr")

# Depois de instalado, carregamos o pacote na nossa sessão R.
library(skimr)

# Agora, usamos a função skim() no nosso dataset.
skim(iris)

# Vantagens do skim():
# - Agrupa as variáveis por tipo (numérica, fator).
# - Fornece mais estatísticas (desvio padrão, histograma em texto).
# - É mais legível e organizado que o summary().
# - Mostra contagem de valores faltantes (n_missing).

# O skim() é excelente para a primeira "olhada" em qualquer novo conjunto de dados!