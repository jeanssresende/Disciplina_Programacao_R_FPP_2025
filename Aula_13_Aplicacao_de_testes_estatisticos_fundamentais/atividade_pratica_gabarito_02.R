# ---- 4. Gabarito da Atividade Prática ----

# 3.1: Visualização
ggplot(InsectSprays, aes(x = spray, y = count, fill = spray)) +
  geom_boxplot() + labs(title = "Eficácia dos Inseticidas")

# 3.2: Checagem de premissas
leveneTest(count ~ spray, data = InsectSprays)
# p = 0.004223. Variâncias NÃO são homogêneas.

# 3.3: Escolha do teste
# Resposta: Como a premissa de homogeneidade de variâncias foi violada,
# o Teste de Kruskal-Wallis é a escolha mais segura e apropriada.

# 3.4: Teste Kruskal-Wallis
kruskal.test(count ~ spray, data = InsectSprays)
# p = 1.511e-10. O resultado é altamente significativo.

# 3.5: Teste Post-Hoc de Dunn
dunn.test(InsectSprays$count, g = InsectSprays$spray, method = "bonferroni")

# 3.6: Conclusão Final
# Olhando a tabela de p-valores ajustados do teste de Dunn, podemos ver que os
# sprays C, D e E não são significativamente diferentes do spray F (o menos eficaz),
# mas são todos significativamente mais eficazes que os sprays A e B.
# Os sprays A e B são os menos eficazes e não são significativamente diferentes entre si.