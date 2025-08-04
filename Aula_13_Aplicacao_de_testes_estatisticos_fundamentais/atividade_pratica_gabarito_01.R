#-------------------------------------------------------------------------------
# Aula 13: Aplicação de Testes de Hipótese
# Script 4: GABARITO da Atividade Prática com `airquality`
#-------------------------------------------------------------------------------
library(tidyverse)
data("airquality")

# ----- Tarefa 1: Comparando Grupos -----
#
# Pergunta: A concentração de Ozônio (`Ozone`) no mês de Maio (Mês 5)
# é diferente da concentração no mês de Agosto (Mês 8)?

# 1.1. Vetores
ozone_maio <- airquality %>% filter(Month == 5) %>% pull(Ozone) %>% na.omit()
ozone_agosto <- airquality %>% filter(Month == 8) %>% pull(Ozone) %>% na.omit()

# 1.2. Checagem de normalidade
shapiro.test(ozone_maio)   
shapiro.test(ozone_agosto) 

# 1.3. Escolha do teste
# (X) Teste de Wilcoxon-Mann-Whitney

# 1.4. Execução do teste
wilcox.test(ozone_maio, ozone_agosto)

# 1.5. Interpretação
# O p-valor (< 0.05). Portanto, rejeitamos a hipótese nula.
# Conclusão: Existe uma diferença estatisticamente significativa na distribuição
# da concentração de ozônio entre os meses de Maio e Agosto.

# ----- Tarefa 2: Teste de Correlação -----
#
# Pergunta: Existe uma correlação entre a Velocidade do Vento (`Wind`) e a
# Temperatura (`Temp`)?

# 2.1. Visualização
ggplot(airquality, aes(x = Wind, y = Temp)) +
  geom_point() +
  geom_smooth() +
  labs(title = "Temperatura vs. Velocidade do Vento")

# 2.2. Justificativa
# A relação visual parece razoavelmente linear e sem outliers extremos.
 shapiro.test(airquality$Wind) #-> p = 0.1178
 shapiro.test(airquality$Temp) #-> p = 0.009319
# O teste de Spearman é a
# escolha tecnicamente mais correta e segura.

# 2.3. Execução do teste
cor.test(~ Wind + Temp, data = airquality, method = "spearman")

# 2.4. Interpretação
# O coeficiente de correlação (rho) é -0.45. Isso indica uma correlação
# NEGATIVA e MODERADA. O p-valor é muito baixo, o que significa que
# a correlação é estatisticamente significativa.
# Conclusão prática: À medida que a velocidade do vento aumenta, a temperatura
# tende a diminuir.