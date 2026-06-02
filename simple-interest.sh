#!/bin/bash

# --- Kalkulator Odsetek Prostych ---

echo "========================================="
echo "   Kalkulator Odsetek Prostych (Bash)   "
echo "========================================="

# 1. Pobieranie danych od użytkownika
read -p "Podaj kwotę główną (kapitał / Principal): " principal
read -p "Podaj roczną stopę procentową w % (np. 5..5 lub 6): " rate
read -p "Podaj okres czasu w latach (Time period): " time

# Walidacja: Sprawdzenie, czy użytkownik nie podał pustych wartości
if [[ -z "$principal" || -z "$rate" || -z "$time" ]]; then
    echo -e "\n[Błąd]: Wszystkie pola muszą być wypełnione!"
    exit 1
fi

# 2. Obliczenia za pomocą narzędzia 'bc'
# Wzór: Odsetki = (Kapitał * Stopa * Czas) / 100
interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Obliczenie łącznej sumy (Kapitał + Odsetki)
total=$(echo "scale=2; $principal + $interest" | bc)

# 3. Wyświetlenie wyników
echo "-----------------------------------------"
echo "Podsumowanie kalkulacji:"
echo "-----------------------------------------"
echo "Kwota główna (P):  $principal"
echo "Stopa procentowa (R): $rate%"
echo "Okres czasu (T):      $time lat(a)"
echo "-----------------------------------------"
echo "Wypracowane odsetki:  $interest"
echo "Łączna kwota (P + I): $total"
echo "========================================="
