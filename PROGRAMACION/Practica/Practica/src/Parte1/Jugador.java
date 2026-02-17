package Parte1;

import java.time.LocalDate;
import java.time.Period;


// enum para guardar las posiciones de los jugadores;
enum Posicion { BASE, ESCOLTA, ALERO, ALA_PIVOT, PIVOT }

public class Jugador extends Persona {
    private String codigo;
    private Posicion posicion;
    private int deUno = 0;
    private int deDos = 0;
    private int deTres = 0;

    private static int puntosTotales;

    //constructor solo con el nombre
    public Jugador(String nombreCompleto) {
        super(nombreCompleto);
        this.deUno = 0;
        this.deDos = 0;
        this.deTres = 0;
    }

    // Constructor al completo
    public Jugador(String nombreCompleto, String codigo, LocalDate fechaNacimiento,
                   Posicion posicion, int deUno, int deDos, int deTres) {
        super(nombreCompleto, fechaNacimiento);
        this.codigo = codigo;
        this.posicion = posicion;
        this.deUno = deUno;
        this.deDos = deDos;
        this.deTres = deTres;

        puntosTotales += calcularPuntos();
    }

    //metodo para calcular los puntos del jugador
    public int calcularPuntos(){
        return (deUno) + (deDos*2) + (deTres*3);
    }

    //metodo para poner las cosas en mayusculas
    public void toApperCase(){
    String palabras[] = getNombreCompleto().toLowerCase().split(" ");
    StringBuilder resultado = new StringBuilder();
    for (String p : palabras){
        resultado.append(p.substring(0,1).toUpperCase()).
        append(p.substring(1)).
        append(" ");
    }
        setNombreCompleto(resultado.toString().trim());
    }

    public int calcularEdad (){
        return Period.between(getFechaNacimiento(), LocalDate.now()).getYears();
        }


    public String getCodigo() {
        return codigo;
    }

    public Posicion getPosicion() {
        return posicion;
    }

    public int getDeUno() {
        return deUno;
    }

    public int getDeDos() {
        return deDos;
    }

    public int getDeTres() {
        return deTres;
    }

    public static int getPuntosTotales() {
        return puntosTotales;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public void setPosicion(Posicion posicion) {
        this.posicion = posicion;
    }

    public void setDeUno(int deUno) {
        this.deUno = deUno;
    }

    public void setDeDos(int deDos) {
        this.deDos = deDos;
    }

    public void setDeTres(int deTres) {
        this.deTres = deTres;
    }

    public static void setPuntosTotales(int puntosTotales) {
        Jugador.puntosTotales = puntosTotales;
    }
}


