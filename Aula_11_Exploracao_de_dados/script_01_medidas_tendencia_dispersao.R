#------------------------------------------------------------------
# Aula 11: Exploração de Dados
# Script 1: Medidas de Tendência Central e Dispersão
#------------------------------------------------------------------

# Vamos criar um vetor de dados simples para nossos exemplos.
# Imagine que estas são as idades de um grupo de 10 pessoas.
idades <- c(25, 30, 22, 45, 30, 28, 33, 60, 22, 30)

# ----- 1. Medidas de Tendência Central -----

# Média (Mean): A soma de todos os valores dividida pelo número de valores.
# É sensível a valores extremos (outliers).
media_idades <- mean(idades)
print(paste("A média de idade é:", media_idades))

# Mediana (Median): O valor central de um conjunto de dados ordenado.
# Se o número de observações for par, é a média dos dois valores centrais.
# É uma medida mais robusta a outliers.
mediana_idades <- median(idades)
print(paste("A mediana de idade é:", mediana_idades))

# Moda (Mode): O valor que aparece com mais frequência.
# O R base não tem uma função direta como `mode()`. Precisamos criá-la!
# Uma maneira simples é usar as funções table() e which.max().
calcula_moda <- function(vetor) {
  tabela <- table(vetor)
  moda <- names(tabela)[which.max(tabela)]
  return(as.numeric(moda))
}

moda_idades <- calcula_moda(idades)
print(paste("A moda de idade é:", moda_idades))


# ----- 2. Medidas de Dispersão -----

# Variância (Variance): Mede o quão dispersos os dados estão em relação à média.
# É calculada como a média dos quadrados das diferenças entre cada valor e a média.
# Unidade de medida está ao quadrado (ex: idades ao quadrado), o que dificulta a interpretação.
variancia_idades <- var(idades)
print(paste("A variância das idades é:", round(variancia_idades, 2)))

# Desvio Padrão (Standard Deviation): É a raiz quadrada da variância.
# É a medida de dispersão mais comum, pois está na mesma unidade dos dados originais.
# Um desvio padrão baixo indica que os pontos de dados tendem a estar próximos da média.
# Um desvio padrão alto indica que os pontos de dados estão espalhados por uma ampla gama de valores.
desvio_padrao_idades <- sd(idades)
print(paste("O desvio padrão das idades é:", round(desvio_padrao_idades, 2)))

# Quartis e Percentis (Quantiles): Dividem os dados em partes iguais.
# Quartis dividem os dados em 4 partes.
# 0%   (mínimo)
# 25%  (Primeiro Quartil - Q1)
# 50%  (Segundo Quartil - Q2, que é a Mediana)
# 75%  (Terceiro Quartil - Q3)
# 100% (máximo)
quartis_idades <- quantile(idades)
print("Os quartis das idades são:")
print(quartis_idades)

# Você pode pedir percentis específicos também
percentil_90 <- quantile(idades, probs = 0.90)
print(paste("O percentil 90 das idades é:", percentil_90))

# Intervalo Interquartil (Interquartile Range - IQR): É a diferença entre o Q3 e o Q1.
# Representa a dispersão dos 50% centrais dos dados, sendo muito resistente a outliers.
iqr_idades <- IQR(idades)
print(paste("O intervalo interquartil (IQR) das idades é:", iqr_idades))

# Podemos calcular na mão também:
# Q3 <- quantile(idades, 0.75)
# Q1 <- quantile(idades, 0.25)
# iqr_manual <- Q3 - Q1