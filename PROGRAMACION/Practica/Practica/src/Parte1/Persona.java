package Parte1;

import java.time.LocalDate;

public class Persona {
    private String nombreCompleto;
    private LocalDate fechaNacimiento;

    public Persona(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    // Constructor completo
    public Persona(String nombreCompleto, LocalDate fechaNacimiento) {
        this.nombreCompleto = nombreCompleto;
        this.fechaNacimiento = fechaNacimiento;
    }

    // Getters
    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public LocalDate getFechaNacimiento() {
        return fechaNacimiento;
    }

    // Setter
    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public void setFechaNacimiento(LocalDate fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

}