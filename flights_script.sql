#Transformation fichiers .rda en .csv

- Méthode A :

write_csv(flights, "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/nycflights/flights.csv", NA ="NULL")
write_csv(airports, "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/nycflights/airports.csv",NA ="NULL")
write_csv(airlines, "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/nycflights/airlines.csv",NA ="NULL")
write_csv(planes,  "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/nycflights/planes.csv",NA ="NULL")
write_csv(weather,  "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/nycflights/weather.csv",NA ="NULL")


Étape 2 :  Transformer les fichiers RDA en CSV. Il y a 2 méthodes :





Créer au préalable un dossier nycflights dans : C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\nycflights

Et dans ce dossier, créer des fichiers .txt et les renommer en .csv  --> ces fichiers ne contiennent aucune info  et la formule write_csv() permettra de les remplir avec les données converties.


- Méthode B :


mes_rda<- c("flights", "airlines", "airports", "planes", "weather")
rep_cible<-"C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/nycflights/"

for (df in mes_rda) {
write_csv(get(df),paste0(rep_cible, df, ".csv"), na = "NULL")
}

# --1 = Vectoriser le chemin vers le dossier en rep_cible pour simplifier le code
# --2 = Fonction paste0 permet d'ajouter .csv à la fin
# --3 = utiliser get() pour définir dataframe






# Autre possibilité : faire des boucles fortes :




# Soit on prend tous les df sauf 2, dans ce cas écrire:

work_space <- ls()
work_space [-c (df1, df2...)]

# soit taper à la main les df souhaités




# transformation fichiers rda en csv

## si on veux supprimer de memoire un tibble

rm(flights_airtime)

pour voir tous les fichiers 
ls()


write_csv(flights, "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/nycflights/flights.csv" )

mes_rda <- ls()
rep_cible <- "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/nycflights"
mes_rda <- ls()
for (i in mes_rda){
	print(i)
}

for (df in mes_rda {
	write_csv(df,rep_cible/df.csv)
	})


rep_cible <- "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/nycflights/"
for (df in mes_rda {
	write_csv(df,rep_cible/df.csv)
	})

paste0(rep_cible, "flights", ".csv")

for (df in mes_rda) {
	write_csv(df,paste0(rep_cible, df, ".csv"))
	}
write_delim
get("flights")  # transforme en dataframe


mes_rda <- c("flights","airports","airlines","planes","weather")
rep_cible <- "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/nycflights/"
for (df in mes_rda) {
	write_csv(get(df),paste0(rep_cible, df, ".csv"), na = "NULL")
	}

full_path <- paste(rep_cible, df.csv, sep="/")