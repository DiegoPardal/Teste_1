usethis::use_git()
usethis::use_git_remote("origin", url = NULL, overwrite = TRUE)
usethis::use_github()
usethis::use_readme_md()


# SITES GUIA DO SCRIPT
# https://www.r-graph-gallery.com/index.html
# http://www.sthda.com/english/wiki/ggplot2-barplots-quick-start-guide-r-software-and-data-visualization
################################################################################
## SCRIPT DE DADOS ROBERTA ANNUNCIATO
## BARPLOT GUILDAS TR?FICA
## LEVANTAMENTO DE AVES EM VEGETA??O MISTA
################################################################################
################################################################################
library(openxlsx) ## ativa o package
#rowNames = T caso tenha que usar linhas como nome
dados<- read.xlsx(file.choose(), sheet = 1, colNames = T) # ABRE O ARQUIVO
# NOME DO ARQUIVIO: Guilda tr?fica.xlsx
# SHEET = 1
#View(dados) #veja o arquivo em uma aba no script
str(dados) #mostra a SRTructure "estrutura dos dadosM"
names(dados) # NOME DAS VARI?VEIS DAS COLUNAS
dados$g_t<-as.factor(dados$g_t) # Guildas tr?ficas como fator
str(dados) #mostra a SRTructure "estrutura dos dados"
################################################################################
install.packages("ggplot2")
library(ggplot2) # Preciso carregar o pacote GGPLOT2
library(tidyverse) ## NECESS?RIO PARA USAR A FUN??O fct_reorder ##
gq<-ggplot(data=dados, aes(x=g_t, y=perc)) +
  geom_bar(stat="identity",fill="lightblue") +
  theme(text=element_text(size=20)) +
  ylab("") +
  xlab("")

gq #plota o barplot criado

# Horizontal bar plot: barplot na horizontal
gq + coord_flip()
gq + theme_classic(20)
gq + coord_flip() + theme_classic(20) +
  #barplot na horizontal sem a parte cinza do fundo
  theme(text=element_text(size=20))

#library(tidyverse) ## NECESS?RIO PARA USAR A FUN??O fct_reorder ##
dados %>%
  mutate(g_t = fct_reorder(g_t, perc)) %>%
  ggplot( aes(x=g_t, y=perc, fill = g_t)) +
  geom_bar(stat="identity", alpha=.6, width=.8) +
  coord_flip() + theme_bw(base_size = 32) +
  #barplot na horizontal sem a parte cinza do fundo
  theme(axis.title   = element_text(face  = "bold"), axis.text.x = element_text
        (face = "bold", size = 36, color = "black"),
        axis.text.y = element_text (face = "bold", size = 36,
                                    color = "black")) +
  ylab("Porcentagem (%)") +
  xlab("") +
  scale_y_continuous(limits=c(0, 50),
                     breaks=c(0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50)) +
  theme(legend.position="none")
################################################################################
## OUTRA FORMA
#library(tidyverse) ## NECESS?RIO PARA USAR A FUN??O fct_reorder ##
dados %>%
  mutate(g_t = fct_reorder(g_t, perc)) %>%
  ggplot( aes(x=g_t, y=perc)) +
  geom_bar(stat="identity", fill="#f68060", alpha=.6, width=.8) +
  coord_flip() + theme_bw(base_size = 32) +
  #barplot na horizontal sem a parte cinza do fundo
  theme(axis.title   = element_text(face  = "bold"), axis.text.x = element_text
        (face = "bold", size = 36, color = "black"),
        axis.text.y = element_text (face = "bold", size = 36,
                                    color = "black")) +
  ylab("Porcentagem (%)") +
  xlab("") +
  scale_y_continuous(limits=c(0, 50),
                     breaks=c(0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50))
################################################################################
## BARPLOT DAS PRINCIPAIS FAMILIAS
################################################################################
library(openxlsx) ## ativa o package
#rowNames = T caso tenha que usar linhas como nome
dados2<- read.xlsx(file.choose(), sheet = 2, colNames = T) # ABRE O ARQUIVO
# NOME DO ARQUIVIO: Guilda tr?fica.xlsx
# SHEET = 2
#View(dados2) #veja o arquivo em uma aba no script
str(dados2) #mostra a SRTructure "estrutura dos dadosM"
names(dados2) # NOME DAS VARI?VEIS DAS COLUNAS
dados2$Fam?lias<-as.factor(dados2$Fam?lias) # Fam?lias como fator
str(dados2) #mostra a SRTructure "estrutura dos dados2"
################################################################################
library(ggplot2) # Preciso carregar o pacote GGPLOT2
library(tidyverse) ## NECESS?RIO PARA USAR A FUN??O fct_reorder ##
gq<-ggplot(data=dados2, aes(x=Fam?lias, y=perc)) +
  geom_bar(stat="identity",fill="lightblue") +
  theme(text=element_text(size=20)) +
  ylab("") +
  xlab("")

gq #plota o barplot criado

# Horizontal bar plot: barplot na horizontal
gq + coord_flip()
gq + theme_classic(20)
gq + coord_flip() + theme_classic(20) +
  #barplot na horizontal sem a parte cinza do fundo
  theme(text=element_text(size=20))

#library(tidyverse) ## NECESS?RIO PARA USAR A FUN??O fct_reorder ##
dados2 %>%
  mutate(Fam?lias = fct_reorder(Fam?lias, perc)) %>%
  ggplot( aes(x=Fam?lias, y=perc, fill = Fam?lias)) +
  geom_bar(stat="identity", alpha=.6, width=.8) +
  coord_flip() + theme_bw(base_size = 32) +
  #barplot na horizontal sem a parte cinza do fundo
  theme(axis.title   = element_text(face  = "bold"), axis.text.x = element_text
        (face = "bold", size = 36, color = "black"),
        axis.text.y = element_text (face = "bold", size = 36,
                                    color = "black")) +
  ylab("Porcentagem (%)") +
  xlab("") +
  scale_y_continuous(limits=c(0, 15),
                     breaks=c(0, 3, 6, 9, 12, 15)) +
  theme(legend.position="none")
################################################################################

################################################################################
## BARPLOT ORDEM X FAM?LIA
################################################################################
library(openxlsx) ## ativa o package
#rowNames = T caso tenha que usar linhas como nome
dados3<- read.xlsx(file.choose(), sheet = 4, colNames = T) # ABRE O ARQUIVO
# NOME DO ARQUIVIO: Guilda tr?fica.xlsx
# SHEET = 4
#View(dados3) #veja o arquivo em uma aba no script
str(dados3) #mostra a SRTructure "estrutura dos dados3"
names(dados3) # NOME DAS VARI?VEIS DAS COLUNAS
dados3$Ordens<-as.factor(dados3$Ordens) # Ordens como fator
str(dados3) #mostra a SRTructure "estrutura dos dados3"
################################################################################
library(ggplot2) # Preciso carregar o pacote GGPLOT2
library(tidyverse) ## NECESS?RIO PARA USAR A FUN??O fct_reorder ##
gq<-ggplot(data=dados3, aes(x=Ordens, y=perc)) +
  geom_bar(stat="identity",fill="lightblue") +
  theme(text=element_text(size=20)) +
  ylab("") +
  xlab("")

gq #plota o barplot criado

# Horizontal bar plot: barplot na horizontal
gq + coord_flip()
gq + theme_classic(20)
gq + coord_flip() + theme_classic(20) +
  #barplot na horizontal sem a parte cinza do fundo
  theme(text=element_text(size=20))

#library(tidyverse) ## NECESS?RIO PARA USAR A FUN??O fct_reorder ##
dados3 %>%
  mutate(Ordens = fct_reorder(Ordens, perc)) %>%
  ggplot( aes(x=Ordens, y=perc, fill = Ordens)) +
  geom_bar(stat="identity", alpha=.6, width=.8) +
  coord_flip() + theme_bw(base_size = 32) +
  #barplot na horizontal sem a parte cinza do fundo
  theme(axis.title   = element_text(face  = "bold"), axis.text.x = element_text
        (face = "bold", size = 36, color = "black"),
        axis.text.y = element_text (face = "bold", size = 36,
                                    color = "black")) +
  ylab("Porcentagem (%)") +
  xlab("") +
  scale_y_continuous(limits=c(0, 50),
                     breaks=c(0, 10, 20, 30, 40, 50)) +
  theme(legend.position="none")
################################################################################
