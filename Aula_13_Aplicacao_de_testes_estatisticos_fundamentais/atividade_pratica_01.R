#-------------------------------------------------------------------------------
# Aula 13: Aplicação de Testes de Hipótese
# Script 3: Atividade Prática com o dataset `airquality`
#-------------------------------------------------------------------------------
library(tidyverse)
data("airquality")

# ----- Tarefa 1: Comparando Grupos -----
#
# Pergunta: A concentração de Ozônio (`Ozone`) no mês de Maio (Mês 5)
# é diferente da concentração no mês de Agosto (Mês 8)?

# 1.1. Crie os vetores de dados para o Ozônio em Maio e Agosto, removendo os NAs.
ozone_maio <- airquality %>% filter(Month == 5) %>% pull(Ozone) %>% na.omit()
ozone_agosto <- airquality %>% filter(Month == 8) %>% pull(Ozone) %>% na.omit()

# 1.2. Cheque a premissa de normalidade para cada grupo.
# Dica: use shapiro.test().
# SEU CÓDIGO AQUI (um teste para cada mês)


# 1.3. Com base nos resultados da normalidade, qual teste você deve usar?
# (  ) Teste t de Student
# (  ) Teste de Wilcoxon-Mann-Whitney
# SUA ESCOLHA AQUI

# 1.4. Execute o teste que você escolheu.
# SEU CÓDIGO AQUI


# 1.5. Interprete o resultado final. Há uma diferença significativa?
# SUA INTERPRETAÇÃO AQUI


# ----- Tarefa 2: Teste de Correlação -----
#
# Pergunta: Existe uma correlação entre a Velocidade do Vento (`Wind`) e a
# Temperatura (`Temp`)?

# 2.1. Visualize a relação entre `Wind` e `Temp` com um gráfico de dispersão.
# SEU CÓDIGO AQUI


# 2.2. Baseado na visualização e (opcionalmente) em testes de normalidade,
# qual método de correlação parece mais apropriado ou seguro? Pearson ou Spearman?
# SUA JUSTIFICATIVA AQUI


# 2.3. Execute o teste de correlação que você escolheu.
# SEU CÓDIGO AQUI


# 2.4. Interprete o resultado: força, direção e significância da correlação.
# SUA INTERPRETAÇÃO AQUI