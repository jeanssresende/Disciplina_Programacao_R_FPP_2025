#--------------------------------------------------------------------------------
# Tópico Adicional: Formato e Layout de Gráficos com R Base
#--------------------------------------------------------------------------------

# Se você ainda não o instalou, remova o '#' da linha abaixo e execute-a:
# install.packages("palmerpenguins")

# Carregando os pacotes necessários

# Usando o dataset penguins_limpo
penguins_limpo <- na.omit(penguins)

#--------------------------------------------------------------------------------
# 1. Margens do Gráfico (par())
#--------------------------------------------------------------------------------

# As margens controlam o espaço vazio ao redor do gráfico.
# A função `par()` é usada para definir parâmetros gráficos que afetam todos os plots
# subsequentes. 'mar' é o parâmetro para as margens.
# A ordem é: inferior, esquerda, superior, direita.

# Margens padrão do R
# Valores padrão: c(5.1, 4.1, 4.1, 2.1)
par(mar = c(5.1, 4.1, 4.1, 2.1)) 
plot(penguins_limpo$bill_len, 
     penguins_limpo$bill_dep,
     main = "Margens Padrão")

# Margens maiores para acomodar rótulos longos
# Ex: Aumentando a margem inferior (para o eixo X)
par(mar = c(8, 4.1, 4.1, 2.1))
plot(penguins_limpo$bill_len, 
     penguins_limpo$bill_dep,
     main = "Margens Maiores (Inferior)",
     xlab = "Comprimento do Bico do Pinguim em Milímetros",
     cex.lab = 1.2) # Aumentando o tamanho do texto do rótulo

par(mar = c(5.1, 4.1, 4.1, 2.1))

# 2. Múltiplos Gráficos em uma Mesma Janela (par())
#--------------------------------------------------------------------------------

# A função `par(mfrow)` é uma das mais úteis! Ela permite dividir a janela
# de plotagem em uma grade para exibir múltiplos gráficos.
# A sintaxe é `mfrow = c(linhas, colunas)`.

# Dividindo a janela em 1 linha e 2 colunas
par(mfrow = c(1, 2))

# Plot 1: Relação entre peso e comprimento da nadadeira
plot(penguins_limpo$flipper_len, penguins_limpo$body_mass,
     main = "Peso vs. Nadadeira",
     xlab = "Comprimento da Nadadeira",
     ylab = "Massa Corporal")

# Plot 2: Relação entre comprimento e profundidade do bico
plot(penguins_limpo$bill_len, penguins_limpo$bill_dep,
     main = "Bico: Comprimento vs. Profundidade",
     xlab = "Comprimento do Bico",
     ylab = "Profundidade do Bico")

# Volte para o layout padrão (1,1) para o próximo plot!
par(mfrow = c(1, 1)) 

# 3. Adicionando Títulos e Rótulos (title())
#--------------------------------------------------------------------------------

# A função `title()` é útil para adicionar um título principal, subtítulo
# e rótulos de eixos de forma mais flexível.
plot(penguins_limpo$bill_len, penguins_limpo$bill_dep)
title(main = "Relação entre as dimensões do bico",
      sub = "Dados de pinguins, ilhas Palmer",
      xlab = "Comprimento do Bico (mm)",
      ylab = "Profundidade do Bico (mm)")

# 4. Ajustando o Espaçamento e a Orientação do Texto (par())
#--------------------------------------------------------------------------------

# Espaçamento entre os rótulos e os eixos
# 'mgp' controla a posição do título, rótulo e linha do eixo.
# A ordem é c(título, rótulo, linha do eixo). O padrão é c(3, 1, 0).
par(mgp = c(3, 1.5, 0)) # Aumentando o espaçamento para os rótulos
plot(penguins_limpo$species, penguins_limpo$body_mass,
     main = "Espaçamento do Eixo Y Ajustado",
     ylab = "Massa Corporal (g)")
par(mgp = c(3, 1, 0)) # Voltando ao padrão

# Orientação do texto nos eixos
# O parâmetro `las` controla a orientação dos rótulos dos eixos.
# 0: paralelo aos eixos (padrão)
# 1: horizontal
# 2: perpendicular aos eixos
# 3: vertical
barplot(table(penguins_limpo$species), main = "Orientação do Texto", las = 2)
