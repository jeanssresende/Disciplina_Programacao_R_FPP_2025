#-------------------------------------------------------------------------------
# Prática Guiada - Estudo de Caso com o Dataset `msleep`
#
# Objetivo: Consolidar os conhecimentos das aulas anteriores em um único projeto.
#
# Tópicos abordados:
# - Carregamento e exploração de dados (Aula 11)
# - Medidas de tendência central e dispersão (Aula 11)
# - Manipulação de dados com `dplyr` (aulas anteriores)
# - Criação de gráficos com `ggplot2` (aulas anteriores)
# - Criação de funções personalizadas (aulas anteriores)
#
# Dataset: `msleep`
# Este dataset vem com o pacote `ggplot2` e contém dados sobre os padrões de
# sono de 83 espécies de mamíferos.
#-------------------------------------------------------------------------------

# 0. CONFIGURAÇÃO DO AMBIENTE
# ------------------------------------
# Vamos carregar o `tidyverse`, que inclui `dplyr`, `ggplot2` e outros pacotes úteis.
# Se ainda não tiver instalado: install.packages("tidyverse")
library(tidyverse)
library(skimr) # Usaremos para uma exploração mais rica

# O dataset `msleep` já está disponível após carregar o ggplot2 (via tidyverse).
# Para saber mais sobre ele, execute `?msleep` no console.
data(msleep)


# 1. EXPLORAÇÃO INICIAL (Revisão Aula 11)
# ------------------------------------
# Vamos ter uma primeira impressão do nosso dataset.

# Tarefa 1.1: Use as funções `glimpse()` e `head()` para inspecionar os dados.
# `glimpse()` é a versão do `tidyverse` para o `str()`.
# SEU CÓDIGO AQUI
glimpse(msleep)
head(msleep)

# Tarefa 1.2: Use a função `skim()` para obter um resumo estatístico completo.
# Pergunta: Quais colunas possuem dados faltantes (missing values)?
# SEU CÓDIGO AQUI
skim(msleep)
# RESPOSTA: As colunas `vore`, `conservation`, `sleep_rem`, `sleep_cycle`,
# e `brainwt` possuem dados faltantes (indicado por `n_missing > 0`).


# 2. LIMPEZA E MANIPULAÇÃO DE DADOS (Revisão `dplyr`)
# ------------------------------------
# Raramente os dados vêm prontos para análise. Vamos prepará-los.

# Tarefa 2.1: Crie uma nova variável chamada `rem_proportion` (proporção de sono REM),
# que seja a razão entre `sleep_rem` e `sleep_total`.
# Dica: use a função `mutate()`.
msleep_mod <- msleep %>%
  mutate(rem_proportion = sleep_rem / sleep_total)

# Verifique se a nova coluna foi criada
head(msleep_mod)


# Tarefa 2.2: Filtre o dataset para incluir apenas os animais carnívoros ('carni').
# Quantos animais são estritamente carnívoros neste dataset?
# Dica: use `filter()` e `drop_na()` para garantir que a coluna `vore` não tenha NAs.
carnivoros <- msleep %>%
  drop_na(vore) %>%
  filter(vore == "carni")

# Para contar, podemos usar a função `nrow()`
nrow(carnivoros)
# RESPOSTA: Existem 19 carnívoros no dataset (após remover os NAs da coluna `vore`).


# 3. ANÁLISE GUIADA COM GRÁFICOS (Revisão `ggplot2`)
# ------------------------------------
# Agora que os dados estão mais limpos, vamos fazer perguntas e respondê-las com gráficos.

# Pergunta 3.1: Como o tempo total de sono (`sleep_total`) se distribui?
# Tarefa: Crie um histograma de `sleep_total`. Adicione uma linha vertical para a média.
# Dica: `geom_histogram()` e `geom_vline()`.
ggplot(msleep, aes(x = sleep_total)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black", alpha = 0.7) +
  geom_vline(aes(xintercept = mean(sleep_total)), color = "red", linetype = "dashed", size = 1) +
  labs(
    title = "Distribuição do Tempo Total de Sono dos Mamíferos",
    x = "Tempo Total de Sono (horas)",
    y = "Frequência (Nº de Espécies)"
  )

# Pergunta 3.2: Existe relação entre o peso corporal (`bodywt`) e as horas de sono (`sleep_total`)?
# Tarefa: Crie um gráfico de dispersão (scatter plot) de `bodywt` vs `sleep_total`.
# O peso corporal tem uma distribuição muito ampla (de gramas a toneladas), então aplique
# uma escala logarítmica no eixo X para visualizar melhor a relação.
# Dica: `geom_point()` e `scale_x_log10()`.
ggplot(msleep, aes(x = bodywt, y = sleep_total)) +
  geom_point(aes(color = vore), alpha = 0.8, size = 3) +
  scale_x_log10() + # Essencial para visualizar a relação!
  geom_smooth(method = "lm", se = FALSE, color = "darkgrey") + # Adiciona uma linha de tendência
  labs(
    title = "Relação entre Peso Corporal e Tempo de Sono",
    x = "Peso Corporal (kg) - Escala Logarítmica",
    y = "Tempo Total de Sono (horas)",
    color = "Dieta"
  )
# INTERPRETAÇÃO: Parece haver uma leve tendência negativa. Animais maiores tendem a dormir um pouco menos.


# Pergunta 3.3: Como o tempo de sono varia entre as diferentes dietas (`vore`)?
# Tarefa: Crie um boxplot comparando `sleep_total` para cada categoria de `vore`.
# Dica: `geom_boxplot()`. Lembre-se de remover os NAs de `vore`.
msleep %>%
  drop_na(vore) %>%
  ggplot(aes(x = fct_reorder(vore, sleep_total, .fun = median, .desc = TRUE), y = sleep_total)) +
  geom_boxplot(aes(fill = vore), show.legend = FALSE) +
  labs(
    title = "Tempo Total de Sono por Dieta",
    x = "Dieta",
    y = "Tempo Total de Sono (horas)"
  ) +
  theme_minimal()


# 4. AGRUPAMENTO E SUMARIZAÇÃO (Revisão `group_by` + `summarise`)
# ------------------------------------
# Vamos calcular estatísticas para grupos específicos.

# Tarefa 4.1: Calcule a média, o desvio padrão e o número de espécies para o tempo total
# de sono (`sleep_total`), agrupado por dieta (`vore`). Ordene o resultado pela média de sono.
# Dica: `group_by()`, `summarise()` e `arrange()`.
resumo_por_dieta <- msleep %>%
  drop_na(vore) %>%
  group_by(vore) %>%
  summarise(
    media_sono = mean(sleep_total),
    desvio_padrao_sono = sd(sleep_total),
    n_especies = n()  # `n()` conta o número de observações no grupo
  ) %>%
  arrange(desc(media_sono))

print(resumo_por_dieta)


# 5. CRIANDO SUA PRÓPRIA FUNÇÃO (Revisão Funções)
# ------------------------------------
# Imagine que você precise calcular as estatísticas descritivas (min, max, media, mediana)
# para várias colunas numéricas diferentes. Criar uma função para isso economiza tempo.

# Tarefa 5.1: Crie uma função chamada `analise_rapida` que recebe um dataframe
# e o nome de uma coluna como argumentos, e retorna um resumo com mínimo, máximo,
# média e mediana para aquela coluna.
# Dica: Use a sintaxe `{{ }}` para passar nomes de colunas para funções do tidyverse.
analise_rapida <- function(df, nome_coluna) {
  df %>%
    summarise(
      minimo = min({{ nome_coluna }}, na.rm = TRUE),
      maximo = max({{ nome_coluna }}, na.rm = TRUE),
      media = mean({{ nome_coluna }}, na.rm = TRUE),
      mediana = median({{ nome_coluna }}, na.rm = TRUE)
    )
}

# Teste sua função com as colunas `sleep_total` e `brainwt` (peso do cérebro).
analise_rapida(msleep, sleep_total)
analise_rapida(msleep, brainwt)


# 6. DESAFIO FINAL (Opcional)
# ------------------------------------
# Pergunta Desafio: Qual o mamífero com a maior proporção de sono REM (`rem_proportion`)
# dentro de cada tipo de dieta (`vore`)?
#
# Passos sugeridos:
# 1. Use o dataset `msleep_mod` que você já criou.
# 2. Remova os NAs das colunas `vore` e `rem_proportion`.
# 3. Agrupe por `vore`.
# 4. Use `slice_max()` para encontrar a linha com o maior valor de `rem_proportion` em cada grupo.

desafio_final <- msleep_mod %>%
  drop_na(vore, rem_proportion) %>%
  group_by(vore) %>%
  slice_max(order_by = rem_proportion, n = 1) %>%
  select(name, vore, sleep_total, rem_proportion) # Seleciona colunas de interesse

print(desafio_final)
