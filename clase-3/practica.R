library(tidyverse)

df <- read_csv('insurance.csv')

#################################################

df_men_smoking <- df %>% 
  filter(sex == 'male' & smoker == 'yes')

print(df_men_smoking)

plot_age_charges = ggplot(df_men_smoking, aes(x=age, y=charges))

plot_age_charges +
  geom_point() +
  labs (
    title = 'Scatterplot of Age vs Charges',
    subtitle = 'People (Men and Smoker)',
    x = 'Age (year)',
    y = 'Charges ($)'
  ) +
  theme_minimal()
  
ggplot(df_men_smoking, aes(x=age, y=charges)) +
       geom_point() +
       labs (
         title = 'Scatterplot of Age vs Charges',
         subtitle = 'People (Men and Smoker)',
         x = 'Age (year)',
         y = 'Charges ($)'
         ) +
        theme_minimal()
##################################################3

ggplot(df_men_smoking, aes(x=age, y=charges))+
  geom_jitter(width = 0.2, alpha = 0.5) +
  theme_minimal()

plot_age_charges +
  geom_jitter(width = 1)

####################################################

x_charges = ggplot(df, aes(x=charges, y=1))

x_charges + geom_jitter(width = 2, alpha = 0.5) + 
  geom_dotplot(binwidth = 1000, dotsize = 0.5)

###################################################
x_charges = ggplot(df_men_smoking, aes(x=charges))

x_charges + geom_histogram(bins = 20)

##################################################

df_charges = ggplot(df, aes(x=charges))

df_charges + geom_histogram(bins = 20)

#################################################

df_male <- df %>% filter(sex == 'male')

glimpse(df_male)

plot_male <- ggplot(df_male, aes(x=charges))
plot_male + geom_histogram(
  bins=20,
  aes(fill=smoker, y=..density..),
  alpha = 0.8,
  position = 'identity'
  )

plot_male <- ggplot(df_male, aes(x=charges))
plot_male + geom_histogram(
  bins=20,
  aes(fill=smoker, y=..density..),
  alpha = 0.8,
  position = 'dodge'
)

plot_male <- ggplot(df_male, aes(x=charges))
plot_male + geom_histogram(
  bins=20,
  aes(fill=smoker, y=..density..),
  alpha = 0.8,
  position = 'stack'
)

############################################

plot_male <- ggplot(df_male, aes(x=charges))
plot_male + 
  geom_histogram(
  bins=20,
  aes(fill=smoker, y=..density..),
  alpha = 0.8,
  position = 'identity'
  ) +
  geom_density(
    bw= 1000
  )

#############################################

df_female <- df %>% filter(sex=='female')
plot_female <- ggplot(df_female, aes(x=charges))

plot_female +
  geom_density(
    aes(fill=smoker),
    alpha = 0.5,
    bw = 2000
  )

plot_female +
  geom_histogram(
    aes(fill=smoker),
    alpha = 0.5,
    bins = 20,
    position = 'identity'
  )

##########################################

df_female <- df %>% filter(sex=='female')
plot_female <- ggplot(df_female, aes(x=charges))

plot_female +
  geom_density(
    aes(fill=region),
    alpha = 0.3,
    bw = 2000,
    position = 'identity'
  )

plot_female +
  geom_freqpoly(
    aes(fill=region),
    alpha = 0.3,
    bins = 20,
    position = 'identity'
  )
