import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { AlumnoModel } from '../models/alumnos.model';
import { Observable, Subject } from 'rxjs';

@Injectable({
    providedIn: 'root'
})

export class AlumnoService {
    private apiURL = 'http://localhost:3000/alumnos';
    private refresh$ = new Subject<void>();

    constructor(private http: HttpClient) {}

    get getRefresh$() {
        return this.refresh$
    }

    //Obtener todos los Alumno
    getAllAlumno(nombre: string): Observable<AlumnoModel[]> {
        return this.http.get<AlumnoModel[]>(`${this.apiURL}?nombre=${nombre}`)
    }

    getAlumnoByProgEst(id_programa: number, id_estatus: number, nombre: string): Observable<AlumnoModel[]> {
        return this.http.get<AlumnoModel[]>
        (`${this.apiURL}?id_programa=${id_programa}&id_estatus=${id_estatus}&nombre=${nombre}`)
    }

    getAlumnoByPrograma(id_programa: number, nombre: string): Observable<AlumnoModel[]> {
        return this.http.get<AlumnoModel[]>
        (`${this.apiURL}?id_programa=${id_programa}&nombre=${nombre}`)
    }

    getAlumnoByEstatus(id_estatus: number, nombre: string): Observable<AlumnoModel[]> {
        return this.http.get<AlumnoModel[]>
        (`${this.apiURL}?id_estatus=${id_estatus}&nombre=${nombre}`)
    }
}
