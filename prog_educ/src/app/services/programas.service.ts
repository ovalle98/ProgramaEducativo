import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { ProgramaModel } from '../models/programas.model';
import { Observable } from 'rxjs';

@Injectable({
    providedIn: 'root'
})

export class ProgramaService {
    private apiURL = 'http://localhost:3000/programas';

    constructor(private http: HttpClient) {}

    //Obtener todos los programas
    getAllProgramas(): Observable<ProgramaModel[]> {
        return this.http.get<ProgramaModel[]>(this.apiURL)
    }
}
