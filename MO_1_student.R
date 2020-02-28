#################### Cwiczenia 1 - Wprowadzenie do R ####################

#Pomoc
help("plot")
?plot

#Wyszukanie słowa w pomocy
help.search('linear model')
??'linear model'

#Wyszukiwanie pomocy na stronie WWW
RSiteSearch('linear model') 

#instalowanie/ładowanie biblioteki
install.packages("ggplot2")
library('lubridate')

#################################################
#skalary
liczba<-145
liczba

liczba2<-359
liczba2
liczba2<-433
liczba2

kolejna.liczba<-liczba^2
kolejna.liczba
liczba3<-(liczba2*3 + 532)/5
liczba3

ls() #lista obiektow w pamieci
rm(liczba) #usuniecie obiektu z pamieci
rm(list=ls()) #usuwanie wszystkich objektów

#################################################
#wektory

wektor<-c(4,7,23.5,76.2,80)
wektor
length(wektor) #dlugosc wektora
mode(wektor) #typ obiektu

wektor.stringow<-c(4,7.5,25,72,80,"slowo")
wektor.stringow
wektor.stringow=as.numeric(wektor.stringow[1:4]) #konwertwanie wektora character do numeric
mode(wektor.stringow)
wektor.stringow[2]
wektor.stringow[1]<-'Witaj swiecie'
wektor.stringow

wektor.z.pusta.dana<-c(1,23,NA,444)
wektor.z.pusta.dana
mode(wektor.z.pusta.dana)
wektor.logiczny<-c(T,F,NA,TRUE,FALSE)
wektor.logiczny
mode(wektor.logiczny)

nowy.wektor<-vector(length=6) #utworzenie pustego wektora o dlugosci 6
nowy.wektor
length(nowy.wektor)
nowy.wektor[2]<-45
nowy.wektor


#operacje na wektorach
w<-c(4,36,6,2,6,5,6,2,4.6)
k<-sqrt(w) #pierwiastek kwadratowy
w
k
sort(w,decreasing =FALSE) #posortowanie wartosci wektora
unique(w) #wartosci unikatowe w wektorze
length(unique(w))
sort(unique(w))

w1<-c(5,5.5,2)
w2<-c(3,12,5.2)
w1+w2

w1<-c(1,2,3,4)
w2<-c(10,100)
w1+w2

w1<-c(1,2,3,4)
w2<-c(10,100,1000)
w1+w2


#czynniki
plec<-c('dz','ch','dz','dz','ch','ch','dz','ch','dz','dz')
plec

table(plec) #wyswietlenie danych w postaci tabelarycznej
prop.table(table(plec)) #czestosci

wiek<-c('>18','<18','<18','<18','<18','>18','>18','>18','>18','>18')
wiek
t<-table(plec,wiek)
t
prop.table(t)

margin.table(t,1)
margin.table(t,2)

prop.table(t,1)
prop.table(t,2)


#################################################
#ciagi arytmetyczne

licznik<-1:10
licznik
10:0

seq(-1,1,0.1) #poczatek, koniec, interwal

seq(from=-1,to=1,length=21)
seq(length=21,from=-1,by=0.1)

rep(1,5)
rep('Witaj',3)
rep(1:2,3)
rep(1:2,each=3)


#################################################
#indeksowanie

x<-c(40,0,-43,44,-61,465,9502,-56)
x>0
x[x>0]
x[x<=-52|x > 55]
x[x>33&x < 111]
x[c(7,4,6)]
x[1:5]
y<-c(1,3)
y
x[y]

x[-1] #usuniecie pierwszego wyrazu
x[-c(4,6)]
x[-(1:3)]

#################################################
#generowanie liczb pseudolosowych

set.seed(1) #ustawienie ziarna losowania
los<-rnorm(1000) #wygenerowanie 1000 liczb pseudolosowych
hist(los,freq=0) #narysowanie histogramu, freq=0 pokazuje czestosci a nie liczebnosci
lines(density(los),col="blue") #dodanie gestosci prawdopodobienstwa
mean(los) #srednia
sd(los) #odchylenie standardowe
x=seq(from=min(los),to=max(los),by=0.1)
wart.f.gestosci=dnorm(x,mean=mean(los),sd=sd(los)) #tworzy funkcje gestosci
lines(x,wart.f.gestosci,col="red") #dorysowanie linii do wykresu

los<-runif(10^6) #rozklad jednostajny
hist(los) #xlim ogranicza wartosci osi OX

###################################################
wiek<-c(18,20,33,22)
names(wiek)<-c('Ania','Adam','Karol','Franek') #nadanie nazw kolumn
wiek

wiek2<-c(Anna=18,Adam=20,Karol=33,Franek=22)
wiek2
wiek==wiek2
all(wiek==wiek2)

wiek['Adam']
wiek[c('Franek','Adam')]
wiek2['Anna']=19
wiek==wiek2
all(wiek==wiek2)
any(wiek==wiek2)
wiek!=wiek2
any(wiek!=wiek2)

#################################################
#macierze i tablice

ciag.liczb<-c(5,3,6,7,3,4,6,2,8,3)
ciag.liczb
length(ciag.liczb)
dim(ciag.liczb) #sprawdzanie wymiaru
dim(ciag.liczb)<-c(2,5) #nadawanie wymiaru
ciag.liczb

macierz<-matrix(c(5,3,6,7,3,4,6,2,8,3),2,5)
macierz

macierz2<-matrix(c(5,3,6,7,3,4,6,2,8,3),2,5,byrow=TRUE)
macierz2

macierz2[2,3]
macierz2[1,-3] #pierwszy wiersz bez trzeciej kolumny
macierz2[,-3] #macierz bez trzeciej kolumny

macierz<-matrix(c(4,2,6,7,3,4,5,1,7,2),2,5)
macierz
cbind(c(4,7),macierz[,4]) #laczenie kolumn
macierz2<-matrix(rep(1,20),4,5)
macierz2
macierz3<-rbind(macierz[1,],macierz2[3,])
macierz3

macierz
macierz2<-matrix(c(12,4,3,2,3,65,32,7,4,78),2,5)
macierz2
macierz+macierz2 #dodawanie macierzy
macierz*macierz2 #mnozenie odpowiadajacych wyrazow
t(macierz2) #transpozycja macierzy
macierz%*%t(macierz2) #mnozenie macierzy (standardowe)


#################################################
#Wykresy
x=seq(-pi,pi,length=10^5)
plot(x,sin(x), type="l", ylab="sin(x)",main="Wykres funkcji sinus",col="red",lwd=4)


#################################################
#Petla FOR
for (i in 1:10)
{
  print(i)
}

#Petla IF
predkosc=70
if(predkosc>50) {
  mandat=1000} else {
    mandat=0}
cat("mandat:",mandat)

#Funkcje
c.to.f<-function(c_temp){
  f_temp<-c_temp*1.8+32
  return(f_temp)
}

c.to.f(100)

#Zadanie 1
#Oblicz sume liczb naturalnych 0-100

#Zadanie 2
#Zmodyfikuj poniższy kod uwzgledniajac 4 progi mandatu 
#(wykorzystaj warunek else if):
#predkosc <= 50, mandat=0
#50<predkosc<=70, mandat=100
#70<predkosc<=90, mandat=200
#predkosc>90, mandat=300
predkosc=70
if(predkosc>50) {
  mandat=1000} else {
    mandat=0}
cat("mandat:",mandat)

#Zadanie 3 - Liczby Fibonacciego (kolejna liczba jest sumš dwóch poprzednich)
#Napisz funkcje ktora obliczy wartosc n-tej liczby Fibonacciego

#Zadanie 4
#Zsumuj wszystkie liczby podzielne przez 3 lub 5 w przedziale 1 do 1000; wykorzystaj operator '%%'

# Zadanie 5
#Napisz funkcje, ktora liczy roznice pomiedzy suma kwadratow pierwszych 100 
#liczb naturalnych oraz kwadratem sumy 100 liczb naturalnych.

# Zadanie 6*
#Napisz funkcję która wypisuje wszystkie liczby pierwsze w zakresie od 0 do n

#ROZWIAZANIA
#1
suma=0
for (i in 0:100) {
  suma=suma+i
}
print(suma)
#2

predkosc=100
if(predkosc<=50) {
  mandat=0
} else if (predkosc>50 && predkosc<=70) {
  mandat=100
} else if (predkosc>70 && predkosc<=90) {
  mandat=200
} else {
  mandat=300
}
cat("mandat:",mandat)

wartosc.mandatu<-function(predkosc){
  if(predkosc>90) {
    mandat<-300} else if(predkosc>70){
    mandat<-200} else if(predkosc>50){
    mandat<-100} else {
      mandat=0}
  cat("mandat:",mandat)
}
wartosc.mandatu(220)

#4
suma=0
for (i in 1:1000){
  if(i%%3|i%%5){
    suma=suma+i
  }
}
suma
#5
sum_of_squares=0
for (i in 1:100){
  sum_of_squares<-sum_of_squares+i^2
}
sum_of_squares

sum=0
for (i in 1:100){
  sum<-sum+i
}
square_of_sum<-sum^2

result<-sum_of_squares-square_of_sum
result

#alternatywnie
sum((1:100)^2)-sum(1:100)^2

#Praca domowa dla chętnych: rozwiąż zadanie 3 oraz 6
