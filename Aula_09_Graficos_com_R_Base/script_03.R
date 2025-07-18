#------------------------------------------------------------------------------#
# Tópico Adicional: Paletas de Cores de Filmes e Revistas Científicas
#------------------------------------------------------------------------------#

# Se você ainda não instalou os pacotes, remova o '#' e execute as linhas abaixo:
# install.packages("wesanderson")
# install.packages("ggsci")

# Carregando os pacotes
library(wesanderson)
library(ggsci)

# Usando o dataset penguins_limpo
penguins_limpo <- na.omit(penguins)

#--------------------------------------------------------------------------------
# 1. Paletas Inspiradas em Filmes (Pacote `wesanderson`)
#--------------------------------------------------------------------------------

# O pacote 'wesanderson' é uma coleção de paletas de cores inspiradas nos filmes do diretor
# Wes Anderson, como "Moonrise Kingdom" e "The Life Aquatic".

# Para ver as paletas disponíveis, execute:
# names(wes_palettes)

# Exemplo: Usando a paleta de cores do filme "Grand Budapest Hotel"
# Essa paleta é perfeita para gráficos com vários grupos, como a espécie de pinguim.
cores_budapest <- wes_palette("GrandBudapest1", type = "discrete")

print(cores_budapest)

# Gráfico de Dispersão com as Cores de Wes Anderson
# Usamos a paleta que acabamos de definir, indexando-a com as espécies.
plot(penguins_limpo$bill_len, penguins_limpo$bill_dep,
     main = "Pinguins em Estilo 'Grand Budapest Hotel'",
     xlab = "Comprimento do Bico (mm)",
     ylab = "Profundidade do Bico (mm)",
     col = cores_budapest[as.numeric(penguins_limpo$species)],
     pch = 16,
     cex = 1.2) # cex aumenta o tamanho dos pontos

# Adicionando legenda
legend("topright", legend = levels(penguins_limpo$species),
       col = cores_budapest, pch = 16)


# Exemplo 2: Usando a paleta do filme "Isle of Dogs"
cores_dogs <- wes_palette("IsleofDogs1", type = "discrete")

# Boxplot com as cores da "Isle of Dogs"
boxplot(body_mass ~ species, data = penguins_limpo,
        main = "Massa Corporal com Paleta 'Isle of Dogs'",
        xlab = "Espécie", 
        ylab = "Massa Corporal (g)",
        col = cores_dogs)

#--------------------------------------------------------------------------------
# 2. Paletas Inspiradas em Revistas Científicas (Pacote `ggsci`)
#--------------------------------------------------------------------------------

# O pacote 'ggsci' oferece paletas de cores inspiradas em revistas científicas
# como Nature, Science e Cell. Isso dá um toque de seriedade e padronização.

# Exemplo: Usando a paleta da revista "Nature"
cores_nature <- pal_npg("nrc")(3)

print(cores_nature)

# Gráfico de Barras com as cores da Nature
barplot(table(penguins_limpo$species),
        main = "Contagem de Pinguins com Paleta da Nature",
        xlab = "Espécie",
        ylab = "Contagem",
        col = cores_nature)


# Exemplo 2: Usando a paleta da revista "Science"
cores_science <- pal_aaas("default")(3)

# Scatter Plot com as cores da "Science"
plot(penguins_limpo$flipper_len, penguins_limpo$body_mass,
     main = "Relação com Cores da Science",
     xlab = "Comprimento da Nadadeira (mm)",
     ylab = "Massa Corporal (g)",
     col = cores_science[as.numeric(penguins_limpo$species)],
     pch = 19)

# Adicionando legenda
legend("topleft", legend = levels(penguins_limpo$species),
       col = cores_science, pch = 19)
#------------------------------------------------------------------------------#