#------------------------------------------------------------------------------#
# Paleta de cores: Dominando as Cores dos Gráficos
#------------------------------------------------------------------------------#

# O R tem um sistema de cores muito poderoso, e escolher a paleta certa
# pode transformar um gráfico simples em uma visualização profissional.
# Vamos explorar as cores do R Base e algumas paletas de pacotes comuns.

data("penguins")
penguins_limpo <- na.omit(penguins)

#------------------------------------------------------------------------------#
# 1. Cores Básicas: Nomes e Códigos Hexadecimais
#------------------------------------------------------------------------------#

# O R reconhece centenas de nomes de cores em inglês.
# Mas a forma mais precisa e flexível é usar códigos hexadecimais (ex: "#FF5733").

# Vamos criar um gráfico de dispersão e testar algumas cores
plot(penguins_limpo$bill_len, penguins_limpo$bill_dep,
     main = "Cores com Nomes e Códigos Hexadecimais",
     xlab = "Comprimento do Bico (mm)",
     ylab = "Profundidade do Bico (mm)",
     col = "darkblue", # Usando um nome
     pch = 19)

# Podemos mudar a cor para um código hexadecimal
points(penguins_limpo$bill_len + 0.1, penguins_limpo$bill_dep - 0.1,
       col = "#FF6600", # Laranja
       pch = 17) # Triângulo


#------------------------------------------------------------------------------#
# 2. Paletas de Cores do R Base
#------------------------------------------------------------------------------#

# O R já vem com algumas funções para gerar paletas de cores.
# Essas paletas são ótimas para gráficos com múltiplos grupos.

# A função `rainbow()`
cores_rainbow <- rainbow(n = 3) # Gerando 3 cores
print(cores_rainbow)

boxplot(body_mass ~ species, data = penguins_limpo,
        main = "Boxplot com Paleta rainbow()",
        col = cores_rainbow)

# A função `heat.colors()` (cores para mapas de calor, do vermelho ao amarelo)
cores_heat <- heat.colors(n = 3)
print(cores_heat)

boxplot(body_mass ~ species, data = penguins_limpo,
        main = "Boxplot com Paleta heat.colors()",
        col = cores_heat)

#------------------------------------------------------------------------------#
# 3. Paletas de Cores do Pacote `RColorBrewer`
#------------------------------------------------------------------------------#

# O pacote `RColorBrewer` oferece paletas de cores cientificamente
# projetadas para visualização de dados. Elas são ótimas e muito usadas!
# Para usá-lo, você precisa instalá-lo primeiro.
#install.packages("RColorBrewer")

library(RColorBrewer)

# Ver as paletas disponíveis
# display.brewer.all() # Execute esta linha para ver todas as opções!

# Existem três tipos de paletas:
# - Sequenciais (para dados com valores contínuos)
# - Divergentes (para dados que variam de um ponto central)
# - Qualitativas (para dados categóricos)

# Vamos pegar uma paleta qualitativa ("Set1") com 3 cores
cores_qualitativas <- brewer.pal(n = 3, name = "Set1")
print(cores_qualitativas)

barplot(table(penguins_limpo$species),
        main = "Gráfico de Barras com RColorBrewer",
        col = cores_qualitativas)

# Vamos pegar uma paleta sequencial ("Blues") para dados de uma escala de valores
# Ex: Comprimento da nadadeira
num_nadadeira <- penguins_limpo$flipper_len
cores_sequenciais <- brewer.pal(n = length(num_nadadeira), name = "Blues")

plot(num_nadadeira,
     col = cores_sequenciais,
     main = "Cores Sequenciais com RColorBrewer",
     pch = 19,
     xlab = "Índice do Pinguim",
     ylab = "Comprimento da Nadadeira (mm)")

#------------------------------------------------------------------------------#
# 4. Combinando Cores com Variáveis Categóricas
#------------------------------------------------------------------------------#

# A forma mais elegante de usar cores é associá-las a uma variável do seu dataframe.
# O `as.numeric()` converte os níveis de um fator em números,
# que podem ser usados para indexar uma paleta de cores!

# Pegamos uma paleta qualitativa ("Set1") com 3 cores para as 3 espécies
cores_especies_brewer <- brewer.pal(n = 3, name = "Set1")

# Atribuindo cores a cada nível e plotando o scatter plot
plot(penguins_limpo$bill_len, penguins_limpo$bill_dep,
     main = "Gráfico de Dispersão Colorido por Espécie (RColorBrewer)",
     xlab = "Comprimento do Bico (mm)",
     ylab = "Profundidade do Bico (mm)",
     # Usamos as.numeric() para converter as espécies para 1, 2, 3
     # e usamos isso para indexar nossa paleta de 3 cores
     col = cores_especies_brewer[as.numeric(penguins_limpo$species)],
     pch = 16)

# Adicionando uma legenda
legend("topright", legend = levels(penguins_limpo$species),
       col = cores_especies_brewer, pch = 16)
#------------------------------------------------------------------------------#