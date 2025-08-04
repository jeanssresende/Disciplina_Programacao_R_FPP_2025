# ---- 3. Atividade Prática: Dataset `InsectSprays` ----
#
# Pergunta: Existe uma diferença na contagem de insetos (`count`) entre os
# diferentes tipos de spray (`spray`)? Siga o fluxo completo!

data(InsectSprays)
glimpse(InsectSprays)

# 3.1: Visualize os dados
# SEU CÓDIGO AQUI (Dica: ggplot com geom_boxplot)

# 3.2: Cheque as premissas da ANOVA (Homogeneidade e Normalidade dos Resíduos)
# SEU CÓDIGO AQUI (Dica: leveneTest e shapiro.test(residuals(aov(...))))

# 3.3: Com base nas premissas, qual teste você deve escolher? ANOVA ou Kruskal-Wallis?
# SUA RESPOSTA AQUI

# 3.4: Rode o teste principal que você escolheu.
# SEU CÓDIGO AQUI

# 3.5: Se o teste principal foi significativo, rode o teste post-hoc apropriado.
# SEU CÓDIGO AQUI

# 3.6: Escreva sua conclusão final. Quais sprays são diferentes de quais?
# SUA CONCLUSÃO AQUI