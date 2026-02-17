package Parte1;

import java.time.LocalDate;

public class main {
    public static void main(String[] args) {

        // Crear 3 jugadores
        Jugador j1 = new Jugador("juan perez garcia", "J001",
                LocalDate.of(2000, 5, 15),
                Posicion.BASE, 5, 10, 3);

        Jugador j2 = new Jugador("maria lopez sanchez", "J002",
                LocalDate.of(1998, 8, 22),
                Posicion.ESCOLTA, 3, 8, 2);

        Jugador j3 = new Jugador("carlos ruiz");

        System.out.println("PUNTOS INDIVIDUALES");
        System.out.println(j1.getNombreCompleto() + ": " + j1.calcularPuntos() + " puntos");
        System.out.println(j2.getNombreCompleto() + ": " + j2.calcularPuntos() + " puntos");
        System.out.println(j3.getNombreCompleto() + ": " + j3.calcularPuntos() + " puntos");

        // Probar puntos globales
        System.out.println("PUNTOS GLOBALES");
        System.out.println("Total de todos los jugadores: " + Jugador.getPuntosTotales());

        // Probar capitalizar nombre
        System.out.println("CAPITALIZAR NOMBRES");
        System.out.println("Antes: " + j1.getNombreCompleto());
        j1.toApperCase();
        System.out.println("Después: " + j1.getNombreCompleto());

        // Probar calcular edad
        System.out.println("EDADES");
        System.out.println(j1.getNombreCompleto() + " tiene " + j1.calcularEdad() + " años");
        System.out.println(j2.getNombreCompleto() + " tiene " + j2.calcularEdad() + " años");
    }
}